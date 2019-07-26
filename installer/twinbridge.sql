-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2019 at 09:02 PM
-- Server version: 10.1.40-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twinbridge`
--
CREATE DATABASE IF NOT EXISTS `twinbridge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `twinbridge`;

-- --------------------------------------------------------

--
-- Table structure for table `connected_clients`
--

CREATE TABLE `connected_clients` (
  `ID` bigint(20) NOT NULL,
  `connection_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `virt_ip` varchar(15) NOT NULL,
  `real_ip` varchar(15) NOT NULL,
  `real_port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `laborations`
--

CREATE TABLE `laborations` (
  `ID` int(11) NOT NULL,
  `pin` varchar(10) NOT NULL,
  `init_academy` int(11) NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invited_academy` int(11) DEFAULT NULL,
  `over` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connected_clients`
--
ALTER TABLE `connected_clients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `laborations`
--
ALTER TABLE `laborations`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `PIN` (`pin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laborations`
--
ALTER TABLE `laborations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

