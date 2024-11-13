require('dotenv').config();
const express = require('express');
const authRoutes = require('./authentication/routes/authRoutes');
const protectedRoute = require('./authentication/routes/protectedRoute');
const resetPasswordRoutes = require('./authentication/routes/resetPasswordRoutes');
const homeRoutes = require('./homepage/routes/homeRoutes');
const app = express();

app.use(express.json());
app.use('/api/auth', authRoutes);
app.use('/api', protectedRoute);
app.use('/api', resetPasswordRoutes);
app.use('/api', homeRoutes);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
});

