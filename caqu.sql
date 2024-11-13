-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2024 at 05:09 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caqu`
--

-- --------------------------------------------------------

--
-- Table structure for table `careerrecommendations`
--

CREATE TABLE `careerrecommendations` (
  `id_carrRec` int NOT NULL,
  `user_id` int NOT NULL,
  `recommended_career` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `email`, `username`, `password`, `refresh_token`, `created_at`, `updated_at`) VALUES
(1, 'testuser@example.com', 'testuser', '$2b$10$d1iHtJD6SuIE3yfW686kQ.v.uoQAQwtrdcXub5vugeGOv6u9hijP6', NULL, '2024-11-07 19:50:40', '2024-11-07 19:50:40'),
(2, 'testuser2@example.com', 'testuser2', '$2b$10$2zAhYw.FscgzIso6St2XEOYFDx.G3ZAP7tRyjGRKEAherzhuD1O4u', NULL, '2024-11-07 19:52:20', '2024-11-07 19:52:20'),
(3, 'testuser3@example.com', 'testuser3', '$2b$10$TCO3LmH2WQ/dUrmP90Th9u3NjgduIUQbFKZIy0tGnmEocTjFPe23O', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3R1c2VyMyIsImlhdCI6MTczMTEyNTA3NywiZXhwIjoxNzMzNzE3MDc3fQ.VWLUUaNv1ZtVkv5duYPjBouQQirgTJPFYJtNeOA7yxo', '2024-11-07 20:06:57', '2024-11-09 04:04:37'),
(4, 'testuser4@example.com', 'testuser4', '$2b$10$tc4lpz09c1XGyrjN4l9wee5O4CmthNoiZDx0PL1LiUL13La8eplEu', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3R1c2VyNCIsImlhdCI6MTczMTEyNTI0MiwiZXhwIjoxNzMzNzE3MjQyfQ.XSCLrXI0hCjJeQDB-xjouC-JhdWgJuyz_gTISqxcU0A', '2024-11-07 20:11:50', '2024-11-09 04:07:22'),
(5, 'testuser5@example.com', 'testuser5', '$2b$10$5.vuDX5gR0a4YhHUVZyZO.3ntUVd4WwoDH1lyrHV3LDorBu/m9qk6', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3R1c2VyNSIsImlhdCI6MTczMTE0NTQzNywiZXhwIjoxNzMzNzM3NDM3fQ.71T91MP1HCkVgncq1zm_UVvqjTFBl-7s0mKWOiKaRhA', '2024-11-08 01:10:21', '2024-11-09 09:43:57'),
(6, 'testuser6@example.com', 'testuser6', '$2b$10$b7cWvFN86Sj4taccTY7g9.F.0GlsrJsLIv.wGIBQPTHEvYi2Z9kGe', NULL, '2024-11-08 01:28:37', '2024-11-08 01:28:37'),
(7, 'testuser7@example.com', 'testuser7', '$2b$10$iggjTkeO0gKQvLcqKfDPCe/gCaeKzYSae.Fcbod2KpjCQ8g3gVTdC', NULL, '2024-11-08 01:31:26', '2024-11-08 01:31:26'),
(8, 'testuser9@example.com', 'testuser9', '$2b$10$sPXQRPaMqlEbnHOluTizIef0dAalVw2pRnhfMeQzxkbogms415BDe', NULL, '2024-11-08 08:52:55', '2024-11-09 04:27:15'),
(9, 'testuserr9@example.com', 'testuserr9', '$2b$10$y/yAIhC1m6cBr8vqy0lDpeF/9ieSi6hwDHCj10Dqwq7J4nvXudMEK', NULL, '2024-11-08 16:27:26', '2024-11-08 16:27:26'),
(10, 'ayusuningsih20@gmail.com', 'ayusuningsih', '$2b$10$3i0u542JqxTkoWb0k.kJPe77q04lpKLbbkr/3vwc16mWdVALDg5ry', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImF5dXN1bmluZ3NpaCIsImlhdCI6MTczMTQ3MTcyOSwiZXhwIjoxNzM0MDYzNzI5fQ.ph5OAXZr76XRPQqf-IYddfJbfO9Ubk5--XWeKDXLVjE', '2024-11-09 11:22:36', '2024-11-13 11:20:10'),
(11, 'cutrifasalsabil@gmail.com', 'cutrifa', '$2b$10$Yto03fryhC/.z9nU/xuN6O2MwGgbgG.nkfbZkxI3Q3vN8hO.4ZRcO', NULL, '2024-11-11 05:13:43', '2024-11-11 05:13:43'),
(15, 'ayuusuningsih20@gmail.com', 'ayeaye', '$2b$10$BCKUvLcE5s0VNAkBXWPJqeNFQ1nOwUPPeUIE.MDFZSeK9REUtzUZK', NULL, '2024-11-13 16:22:18', '2024-11-13 16:22:18'),
(16, 'cutrifas@gmail.com', 'rifa', '$2b$10$7gF.ryS5xUgF8.CpMf5dZ.oJkAxhYQbAJcFPvwraT4zsgcB4gbztW', NULL, '2024-11-13 16:24:40', '2024-11-13 16:24:40'),
(17, 'viralestari03@gmail.com', 'vira', '$2b$10$ds/VLH3piWrKgA3GIE3tYe8qysUA4I7Ca.cQgEjA6leFnRAZ1YlPa', NULL, '2024-11-13 17:02:47', '2024-11-13 17:02:47'),
(18, 'lestarivira751@gmail.com', 'lestari', '$2b$10$ulv5tOTTkGY9JwRCWdtwser62PldP/awSsxfIUqmKER0SyXxUoFmy', NULL, '2024-11-13 17:04:33', '2024-11-13 17:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `quizquestions`
--

CREATE TABLE `quizquestions` (
  `id_questions` int NOT NULL,
  `question_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quizquestions`
--

INSERT INTO `quizquestions` (`id_questions`, `question_text`) VALUES
(1, 'Apakah kamu menikmati bekerja di dalam tim?'),
(2, 'Apakah kamu suka matematika?');

-- --------------------------------------------------------

--
-- Table structure for table `useranswers`
--

CREATE TABLE `useranswers` (
  `id_answer` int NOT NULL,
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  `answer` enum('ya','tidak') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `useranswers`
--

INSERT INTO `useranswers` (`id_answer`, `user_id`, `question_id`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ya', '2024-11-12 09:09:26', '2024-11-12 09:09:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `careerrecommendations`
--
ALTER TABLE `careerrecommendations`
  ADD PRIMARY KEY (`id_carrRec`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `quizquestions`
--
ALTER TABLE `quizquestions`
  ADD PRIMARY KEY (`id_questions`);

--
-- Indexes for table `useranswers`
--
ALTER TABLE `useranswers`
  ADD PRIMARY KEY (`id_answer`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `careerrecommendations`
--
ALTER TABLE `careerrecommendations`
  MODIFY `id_carrRec` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `quizquestions`
--
ALTER TABLE `quizquestions`
  MODIFY `id_questions` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `useranswers`
--
ALTER TABLE `useranswers`
  MODIFY `id_answer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `careerrecommendations`
--
ALTER TABLE `careerrecommendations`
  ADD CONSTRAINT `careerrecommendations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id_login`);

--
-- Constraints for table `useranswers`
--
ALTER TABLE `useranswers`
  ADD CONSTRAINT `useranswers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `login` (`id_login`),
  ADD CONSTRAINT `useranswers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `quizquestions` (`id_questions`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
