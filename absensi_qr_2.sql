-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysqlContainer2
-- Generation Time: Dec 22, 2024 at 10:12 AM
-- Server version: 8.4.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_qr_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `id` int NOT NULL,
  `absenceDate` datetime NOT NULL,
  `status` enum('present','pending') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  `classId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `absences`
--

INSERT INTO `absences` (`id`, `absenceDate`, `status`, `createdAt`, `updatedAt`, `userId`, `classId`) VALUES
(3, '2024-12-21 00:00:00', 'present', '2024-12-21 01:04:14', '2024-12-21 01:04:14', 2, 3),
(4, '2024-12-21 00:00:00', 'present', '2024-12-21 10:50:20', '2024-12-21 10:50:20', 4, 6),
(5, '2024-12-21 00:00:00', 'present', '2024-12-21 11:01:49', '2024-12-21 11:01:49', 3, 6),
(6, '2024-12-22 00:00:00', 'present', '2024-12-22 07:04:51', '2024-12-22 07:04:51', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int NOT NULL,
  `namaDosen` varchar(255) NOT NULL,
  `mataKuliah` varchar(255) NOT NULL,
  `namaKelas` varchar(255) NOT NULL,
  `pertemuan` int NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL DEFAULT 'user',
  `updatedBy` varchar(255) NOT NULL DEFAULT 'user',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `namaDosen`, `mataKuliah`, `namaKelas`, `pertemuan`, `startTime`, `endTime`, `duration`, `createdBy`, `updatedBy`, `createdAt`, `updatedAt`) VALUES
(1, 'Dr. John Doe', 'Computer Science 101', 'CS101 - A', 15, '08:00 AM', '10:00 AM', '2 hours', 'user', 'user', '2024-12-20 16:02:28', '2024-12-20 16:02:28'),
(2, 'Dr. John Doe', 'Computer Science 101', 'CS101 - A', 15, '08:00 AM', '10:00 AM', '2 hours', 'user', 'user', '2024-12-21 01:03:45', '2024-12-21 01:03:45'),
(3, 'Dr. John Doe', 'Computer Science 101', 'CS101 - A', 15, '08:00 AM', '10:00 AM', '2 hours', 'user', 'user', '2024-12-21 01:03:52', '2024-12-21 01:03:52'),
(4, 'Dr. John Doe', 'Computer Science 101', 'CS101 - A', 15, '08:00 AM', '10:00 AM', '2 hours', 'user', 'user', '2024-12-21 02:39:55', '2024-12-21 02:39:55'),
(5, 'user', 'Matkul D', 'Class 10C', 2, '12:45', '14:45', '2', 'user', 'user', '2024-12-21 02:42:48', '2024-12-21 02:42:48'),
(6, 'dev', 'DevC 2024', 'DevC 10', 2, '19:30', '22:30', '2', 'user', 'user', '2024-12-21 10:19:10', '2024-12-21 10:19:10'),
(7, 'dev', 'Developer 2024', 'DevC 111', 3, '14:45', '15:45', '2', 'user', 'user', '2024-12-22 06:42:01', '2024-12-22 06:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `userClasses`
--

CREATE TABLE `userClasses` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int NOT NULL,
  `classId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userClasses`
--

INSERT INTO `userClasses` (`createdAt`, `updatedAt`, `userId`, `classId`) VALUES
('2024-12-20 16:10:57', '2024-12-20 16:10:57', 2, 1),
('2024-12-21 02:42:49', '2024-12-21 02:42:49', 2, 5),
('2024-12-21 10:19:11', '2024-12-21 10:19:11', 3, 6),
('2024-12-22 06:42:03', '2024-12-22 06:42:03', 3, 7),
('2024-12-21 10:34:50', '2024-12-21 10:34:50', 4, 5),
('2024-12-21 10:38:19', '2024-12-21 10:38:19', 4, 6),
('2024-12-21 11:03:31', '2024-12-21 11:03:31', 5, 6),
('2024-12-22 07:03:40', '2024-12-22 07:03:40', 6, 6),
('2024-12-22 07:41:56', '2024-12-22 07:41:56', 6, 7),
('2024-12-22 07:42:11', '2024-12-22 07:42:11', 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `absence` enum('tidak hadir','hadir','belum absen') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `nim`, `program`, `absence`, `createdAt`, `updatedAt`) VALUES
(2, 'user', 'user@gmail.com', '$2b$10$glSMr1AKpPgbcZGC1xX66.E2Ct.bX5ncVZPIP.Kl9spcAQGLo7D/G', 'user', NULL, NULL, NULL, '2024-12-20 16:08:48', '2024-12-20 16:08:48'),
(3, 'dev', 'dev@gmail.com', '$2b$10$JrI1ZZs8yWF4f/d2.mvRJesBsYc/3p4QXvTYeOfP53O5FPhDqZ.We', 'dosen', NULL, NULL, NULL, '2024-12-21 10:17:31', '2024-12-21 10:17:31'),
(4, 'john_doe', 'john.doe@example.com', 'password123', 'user', '123456789', 'Computer Science', NULL, '2024-12-21 10:34:29', '2024-12-21 10:34:29'),
(5, 'john_doe 2', 'john.doe2@example.com', 'password123', 'user', '123456789', 'Computer Science', NULL, '2024-12-21 11:03:23', '2024-12-21 11:03:23'),
(6, 'jon', 'jon@gmail.com', '$2b$10$d6ac.SalQo156weMzUt2H.dnUdFomnA2AhMV9tkWApzcQYGIsNRzi', 'user', '0212314213', 'Informatika', NULL, '2024-12-22 07:01:18', '2024-12-22 07:03:06'),
(7, 'pop', 'pop@gmail.com', '$2b$10$7W99vy5LNgk6kixHY2VOnuHYgNPMDpCQJ8ImGF/qAbHY1Fg9O2sD6', 'dosen', '3123143242', 'Informatika', NULL, '2024-12-22 07:06:29', '2024-12-22 07:07:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `classId` (`classId`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userClasses`
--
ALTER TABLE `userClasses`
  ADD PRIMARY KEY (`userId`,`classId`),
  ADD KEY `classId` (`classId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `absences_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `absences_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `userClasses`
--
ALTER TABLE `userClasses`
  ADD CONSTRAINT `userClasses_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userClasses_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;