-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2026 at 09:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abizerwa`
--

-- --------------------------------------------------------

--
-- Table structure for table `abonizera`
--

CREATE TABLE `abonizera` (
  `id` int(11) NOT NULL,
  `amazina` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `igicuruzwa` varchar(255) DEFAULT 'Nta bicuruzwa',
  `amafaranga` varchar(100) DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `creator_telephone` varchar(20) NOT NULL,
  `creator_name` varchar(255) DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_paid` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `abonizera`
--

INSERT INTO `abonizera` (`id`, `amazina`, `telephone`, `igicuruzwa`, `amafaranga`, `created_by`, `creator_telephone`, `creator_name`, `created_at`, `updated_at`, `total_paid`) VALUES
(26, 'MANIRUMVA Olivier', '0788888888', 'amavuta', '2000', 4, '0795926508', 'ISINGIZWE Bonheur', '2026-01-19 19:11:26', '2026-01-19 19:11:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `telephone`, `password`) VALUES
(1, 'ibonheur@gmail.com', 799308939, 'Bonheur'),
(2, 'isingizwebonheur@gmail.com', 795926508, '$2b$12$YQljJzWq/d4gw2Qp3HZymepDRDN5oExkmo5wfA.9.i6IfcvsRTtui'),
(3, 'isingizwebonheur122@gmail.com', 788585858, '$2b$12$W1tE5qoXRTHVyKPik.ZMTOFa2fMfq5bHGzBP/DQoFz.HMpbcrV7q2'),
(4, 'ibonheur122@gmail.com', 783185142, '$2b$12$roML13v4qbDbWrPAaOb3weUF.ZzrrmWXgH11LgAyZyhDsD2MWoc1q'),
(5, 'manirumvaolivier@gmail.com', 799999999, '$2b$12$q4l7YuZZlQ9h3/WKg0oce.CzV68jX.mOLqj7jA.n4VKb8frd4vFY.');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `abonizera_id` int(11) NOT NULL,
  `amazina` varchar(255) NOT NULL,
  `amafaranga` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) NOT NULL,
  `history_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `abonizera_id`, `amazina`, `amafaranga`, `telephone`, `history_date`) VALUES
(9, 26, 'MANIRUMVA Olivier', '10000', '0788888888', '2026-01-19 19:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(255) NOT NULL,
  `amazina` varchar(255) NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `amazina` varchar(255) NOT NULL,
  `ref_telephone` varchar(255) DEFAULT NULL,
  `aho_uherereye` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `reset_token` varchar(6) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(255) DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `amazina`, `ref_telephone`, `aho_uherereye`, `telephone`, `pin`, `reset_token`, `reset_token_expiry`, `created_at`, `updated_at`, `status`) VALUES
(4, 'ISINGIZWE Bonheur', '0799308939', 'Huye', '0795926508', '$2b$10$BnMgfF9O7oh9K5FLxe9wYe46UqJA7yTGzbsSArbaRkbbsem3hktOO', NULL, NULL, '2026-01-19 19:09:42', '2026-01-19 19:09:42', 'inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abonizera`
--
ALTER TABLE `abonizera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_abonizera_telephone` (`telephone`),
  ADD KEY `idx_abonizera_created_by` (`created_by`),
  ADD KEY `idx_abonizera_creator_telephone` (`creator_telephone`),
  ADD KEY `idx_abonizera_created_at` (`created_at`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abonizera_id` (`abonizera_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `idx_users_telephone` (`telephone`),
  ADD KEY `idx_users_reset_token` (`reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abonizera`
--
ALTER TABLE `abonizera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`abonizera_id`) REFERENCES `abonizera` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
