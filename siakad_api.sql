-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2023 at 02:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosenmatkuls`
--

CREATE TABLE `dosenmatkuls` (
  `id` int(11) NOT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_matkul` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosenmatkuls`
--

INSERT INTO `dosenmatkuls` (`id`, `id_dosen`, `id_matkul`, `createdAt`, `updatedAt`) VALUES
(3, 3, 7, '2023-10-31 22:52:26', '2023-11-01 00:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `dosens`
--

CREATE TABLE `dosens` (
  `id` int(11) NOT NULL,
  `nidn` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosens`
--

INSERT INTO `dosens` (`id`, `nidn`, `nama`, `alamat`, `createdAt`, `updatedAt`) VALUES
(2, 'F609101211', 'Ayu Tyas', 'Samarinda', '2023-10-31 01:03:34', '2023-10-31 01:03:34'),
(3, 'F609101212', 'Rahardian', 'Malang', '2023-10-31 01:04:01', '2023-10-31 09:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `jadwalmatkuls`
--

CREATE TABLE `jadwalmatkuls` (
  `id` int(11) NOT NULL,
  `id_matkul` int(11) DEFAULT NULL,
  `hari` varchar(255) DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwalmatkuls`
--

INSERT INTO `jadwalmatkuls` (`id`, `id_matkul`, `hari`, `jam`, `createdAt`, `updatedAt`) VALUES
(2, 4, 'Jumat', '09:00:00', '2023-11-01 03:54:19', '2023-11-01 03:54:19'),
(3, 4, 'Kamis', '06:00:00', '2023-11-01 10:08:07', '2023-11-01 10:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswabimbingans`
--

CREATE TABLE `mahasiswabimbingans` (
  `id` int(11) NOT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `id_mahasiswa` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswabimbingans`
--

INSERT INTO `mahasiswabimbingans` (`id`, `id_dosen`, `id_mahasiswa`, `createdAt`, `updatedAt`) VALUES
(2, 2, 1, '2023-11-01 12:13:47', '2023-11-01 12:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` int(11) NOT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `nim`, `nama`, `alamat`, `createdAt`, `updatedAt`) VALUES
(1, 'F809189123', 'Budi Hartanto', 'Surabaya', '2023-10-30 05:53:58', '2023-10-30 10:29:25'),
(3, 'F809189123', 'Andre', 'Jakarta', '2023-10-30 10:36:50', '2023-10-30 10:36:50'),
(4, 'F809189124', 'Dimas', 'Jakarta Selatan', '2023-10-30 10:37:21', '2023-10-30 10:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliahs`
--

CREATE TABLE `matakuliahs` (
  `id` int(11) NOT NULL,
  `kode_matkul` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliahs`
--

INSERT INTO `matakuliahs` (`id`, `kode_matkul`, `nama`, `sks`, `createdAt`, `updatedAt`) VALUES
(4, 'MK002', 'OOP', 4, '2023-10-31 09:51:08', '2023-10-31 09:51:08'),
(6, 'MK003', 'Machine Learning', 3, '2023-10-31 22:51:15', '2023-10-31 22:51:15'),
(7, 'MK004', 'Algoritma & Pemrograman', 3, '2023-10-31 22:51:33', '2023-10-31 22:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20231022054855-create-user.js'),
('20231029130552-create-mahasiswa.js'),
('20231029130554-create-dosen.js'),
('20231029130556-create-mata-kuliah.js'),
('20231029130558-create-dosen-matkul.js'),
('20231101025622-create-jadwal-matkul.js'),
('20231101114244-create-mahasiswa-bimbingan.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosenmatkuls`
--
ALTER TABLE `dosenmatkuls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `dosens`
--
ALTER TABLE `dosens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwalmatkuls`
--
ALTER TABLE `jadwalmatkuls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `mahasiswabimbingans`
--
ALTER TABLE `mahasiswabimbingans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matakuliahs`
--
ALTER TABLE `matakuliahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosenmatkuls`
--
ALTER TABLE `dosenmatkuls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dosens`
--
ALTER TABLE `dosens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jadwalmatkuls`
--
ALTER TABLE `jadwalmatkuls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mahasiswabimbingans`
--
ALTER TABLE `mahasiswabimbingans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matakuliahs`
--
ALTER TABLE `matakuliahs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosenmatkuls`
--
ALTER TABLE `dosenmatkuls`
  ADD CONSTRAINT `dosenmatkuls_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  ADD CONSTRAINT `dosenmatkuls_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matakuliahs` (`id`);

--
-- Constraints for table `jadwalmatkuls`
--
ALTER TABLE `jadwalmatkuls`
  ADD CONSTRAINT `jadwalmatkuls_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `matakuliahs` (`id`);

--
-- Constraints for table `mahasiswabimbingans`
--
ALTER TABLE `mahasiswabimbingans`
  ADD CONSTRAINT `mahasiswabimbingans_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  ADD CONSTRAINT `mahasiswabimbingans_ibfk_2` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
