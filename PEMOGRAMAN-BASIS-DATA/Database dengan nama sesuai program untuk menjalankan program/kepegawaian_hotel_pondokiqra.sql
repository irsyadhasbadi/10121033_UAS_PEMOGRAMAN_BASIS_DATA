-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2025 at 09:39 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kepegawaian_hotel_pondokiqra`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `TotalGajiPegawai` (IN `pegawai_id` INT)   BEGIN
    SELECT SUM(jumlah_gaji) AS total_gaji 
    FROM gaji 
    WHERE id_pegawai = pegawai_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id_departemen`, `nama_departemen`) VALUES
(1, 'Resepsionis'),
(2, 'Housekeeping'),
(3, 'Keamanan'),
(4, 'F&B Service'),
(5, 'Teknisi'),
(6, 'CEO');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `status` enum('Hadir','Izin','Sakit','Alpha') NOT NULL,
  `total_hadir` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_kehadiran`, `id_pegawai`, `tanggal`, `status`, `total_hadir`) VALUES
(106, 51, '2025-02-01', 'Hadir', 1),
(107, 51, '2025-02-03', 'Hadir', 1),
(108, 51, '2025-01-31', 'Hadir', 1),
(109, 51, '2024-12-31', 'Hadir', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `gaji` decimal(10,2) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `total_hadir` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `jabatan`, `gaji`, `tanggal_masuk`, `id_departemen`, `total_hadir`) VALUES
(51, 'Rizky Dwi', 'Bartender', 4000000.00, '0000-00-00', 4, 0),
(52, 'Agus Hermanto', 'Maintenance Technician', 4500000.00, '0000-00-00', 5, 0),
(54, 'Handoko Wijaya', 'Laundry Staff', 3300000.00, '0000-00-00', 2, 0),
(55, 'Anton Rahman', 'CCTV Operator', 3900000.00, '0000-00-00', 3, 0),
(56, 'Yuliana Devi', 'Food Server', 3700000.00, '0000-00-00', 4, 0),
(57, 'Samsul Arifin', 'Electrician', 4800000.00, '0000-00-00', 5, 0),
(58, 'Dewi Sartika', 'Night Auditor', 4100000.00, '0000-00-00', 1, 0),
(59, 'Hadi Kusumo', 'Housekeeping Supervisor', 4500000.00, '0000-00-00', 2, 0),
(60, 'Johan Pratama', 'Parking Security', 3600000.00, '0000-00-00', 3, 0),
(61, 'Mirza Saputra', 'Chef de Partie', 5500000.00, '0000-00-00', 4, 0),
(62, 'Wawan Setiadi', 'Plumber', 4200000.00, '0000-00-00', 5, 0),
(63, 'Nina Pertiwi', 'Front Desk Officer', 4000000.00, '0000-00-00', 1, 0),
(64, 'Farhan Maulana', 'Public Area Cleaner', 3400000.00, '0000-00-00', 2, 0),
(65, 'Bambang Supriadi', 'Security Supervisor', 4800000.00, '0000-00-00', 3, 0),
(66, 'Ratna Puspitasari', 'Barista', 3800000.00, '0000-00-00', 4, 0),
(67, 'Syarifudin Nasir', 'HVAC Technician', 4600000.00, '0000-00-00', 5, 0),
(68, 'Melati Wijaya', 'Receptionist', 3900000.00, '0000-00-00', 1, 0),
(69, 'Julianto Basri', 'Housekeeping Staff', 3600000.00, '0000-00-00', 2, 0),
(70, 'Endang Setyowati', 'Security Guard', 3750000.00, '0000-00-00', 3, 0),
(71, 'Firman Hidayat', 'Waitress', 3500000.00, '0000-00-00', 4, 0),
(75, 'ANGEL', 'Leader Resepsionis', 99999999.99, '0000-00-00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama`, `email`, `password`, `id_pegawai`) VALUES
(8, 'admin', 'admin1@gmail.com', '$2y$10$SR4Lw7cEeke5U.faiDbJmOiWs0TvkEaxEZERSVEXPWyP513SDqyvy', NULL),
(9, 'irsyad', 'irsyad@gmail.com', '$2y$10$qmtuAo7ry6OgMbM4rhWRqO8vjrPv6I1H1xXbHwMGIZRie86UsXPJa', NULL),
(10, 'admin', 'admin@gmail.com', '$2y$10$4yNwpZuLWaIOOn7HOdbUgu0LiL0kgSpDrh3mkyrlpmBP2ZdxYYm.i', NULL),
(12, 'irsyadhasbadi', 'hasbadi@gmail.com', '$2y$10$zWHMGl9P25XmNLdJhZ/r2.U63JCjJYFzowIFJOafiYXDX1kP48PmK', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_departemen` (`id_departemen`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD CONSTRAINT `kehadiran_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`) ON DELETE SET NULL;

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
