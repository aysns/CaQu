const bcrypt = require('bcrypt');
const User = require('../models/User');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const { generateAccessToken, generateRefreshToken } = require('./tokenController');
const REFRESH_TOKEN_SECRET = process.env.REFRESH_TOKEN_SECRET;

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASS,
  },
});

const sendWelcomeEmail = (email) => {
  const mailOptions = {
      from: process.env.EMAIL_USER,
      to: email,
      subject: 'Selamat Datang di Aplikasi Kami!',
      text: 'Terima kasih telah mendaftar. Selamat datang di aplikasi kami, kami senang Anda bergabung!',
  };

  return transporter.sendMail(mailOptions);
};

// REGISTER
const registerUser = async (req, res) => {
  const { username, email, password } = req.body;

  if (!username || !email || !password) {
    return res.status(400).send('Semua field harus diisi.');
  }

  try {
    const existingUser = await User.findOne({
      where: { username }
    });

    if (existingUser) {
      return res.status(400).send('Username sudah digunakan, coba yang lain.');
    }

    const existingEmail = await User.findOne({
      where: { email }
    });

    if (existingEmail) {
      return res.status(400).send('Email sudah terdaftar.');
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    await User.create({ username, email, password: hashedPassword });

    await sendWelcomeEmail(email);

    res.status(201).send('Registrasi berhasil!');
  } catch (error) {
    console.error('Error saat registrasi:', error);
    res.status(500).send('Terjadi kesalahan pada server.');
  }
};

// LOGIN
const loginUser = async (req, res) => {
  const { username, password } = req.body;

  try {
    const user = await User.findOne({ where: { username } });
    if (!user) return res.status(400).send('Username atau password salah.');

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) return res.status(400).send('Username atau password salah.');

    // Hanya data yang diperlukan dikirim sebagai payload
    const payload = { id: user.id, username: user.username };
    const accessToken = generateAccessToken(payload);
    const refreshToken = generateRefreshToken(payload);

    user.set('refresh_token', refreshToken);
    await user.save();

    res.status(200).json({
      message: 'Login berhasil',
      success: true,
      accessToken,
      refreshToken,
    });
  } catch (error) {
    console.error('Error saat login:', error);
    res.status(500).send('Terjadi kesalahan pada server.');
  }
};


//LOGOUT
const logoutUser = async (req, res) => {
  const { username } = req.body;

  try {
    const user = await User.findOne({ where: { username } });
    if (!user) return res.status(400).send('User tidak ditemukan.');

    user.refresh_token = null;
    await user.save();

    res.status(200).send('Logout berhasil.');
  } catch (error) {
    console.error('Error saat logout:', error);
    res.status(500).send('Terjadi kesalahan pada server.');
  }
};

//REFRESH TOKEN
const refreshToken = async (req, res) => {
  const { refresh_token } = req.body;  // Ambil refresh token dari body

  if (!refresh_token) return res.sendStatus(401);

  try {
    // Cari user berdasarkan refresh token yang ada di database
    const user = await User.findOne({ where: { refresh_token } });
    if (!user) return res.status(403).send('Token tidak valid'); 

    // Verifikasi refresh token menggunakan jwt.verify
    jwt.verify(refresh_token, REFRESH_TOKEN_SECRET, (err, decoded) => {
      if (err) return res.sendStatus(403); 

      // Jika token valid, buat access token baru
      const accessToken = generateAccessToken({ username: decoded.username });

      res.status(200).json({
        message: 'Token berhasil diperbarui',
        success: true,
        accessToken,
      });
    });
  } catch (error) {
    console.error('Error saat refresh token:', error);
    res.status(500).send('Terjadi kesalahan pada server.');
  }
};


module.exports = { registerUser, loginUser, logoutUser, refreshToken }
