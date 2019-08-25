-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2019 at 09:47 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qliner`
--

-- --------------------------------------------------------

--
-- Table structure for table `accidents_emergencies`
--

CREATE TABLE `accidents_emergencies` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accidents_emergencies`
--

INSERT INTO `accidents_emergencies` (`index_ID`, `ticket_no`, `service_ID`) VALUES
(1, 'Ae001', 5),
(2, 'Ae002', 5),
(3, 'Ae003', 5),
(4, 'Ae004', 5),
(5, 'Ae005', 5),
(6, 'Ae006', 5),
(7, 'Ae007', 5),
(8, 'Ae008', 5),
(9, 'Ae009', 5),
(10, 'Ae010', 5),
(11, 'Ae011', 5),
(12, 'Ae012', 5),
(13, 'Ae013', 5),
(14, 'Ae014', 5),
(15, 'Ae015', 5),
(16, 'Ae016', 5),
(17, 'Ae017', 5),
(18, 'Ae018', 5),
(19, 'Ae019', 5),
(20, 'Ae020', 5),
(21, 'Ae021', 5);

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

CREATE TABLE `consultation` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`index_ID`, `ticket_no`, `service_ID`) VALUES
(1, 'Co001', 2),
(2, 'Co002', 2),
(3, 'Co003', 2),
(4, 'Co004', 2),
(5, 'Co005', 2),
(6, 'Co006', 2),
(7, 'Co007', 2),
(8, 'Co008', 2),
(9, 'Co009', 2),
(10, 'Co010', 2),
(11, 'Co011', 2),
(12, 'Co012', 2),
(13, 'Co013', 2),
(14, 'Co014', 2),
(15, 'Co015', 2),
(16, 'Co016', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `arrival_time` time NOT NULL,
  `server_id` varchar(255) NOT NULL,
  `service_start_time` time NOT NULL,
  `service_completion_time` time NOT NULL,
  `service_id` int(10) NOT NULL,
  `status_id` int(10) NOT NULL,
  `priority_level` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`index_ID`, `ticket_no`, `mobile_no`, `date`, `arrival_time`, `server_id`, `service_start_time`, `service_completion_time`, `service_id`, `status_id`, `priority_level`) VALUES
(1, 'En001', '0791455855', '2019-08-13', '14:13:33', '', '14:19:22', '14:19:25', 1, 1, 2),
(2, 'En002', '0791455855', '2019-08-13', '14:13:37', '', '14:19:34', '14:19:36', 1, 1, 2),
(3, 'En003', '0791455855', '2019-08-13', '14:14:41', '', '14:19:43', '14:19:46', 1, 1, 2),
(4, 'En004', '0791811781', '2019-08-13', '14:20:27', '', '14:25:58', '14:26:02', 1, 1, 2),
(5, 'En005', '0791811781', '2019-08-13', '14:20:30', '', '14:26:04', '14:26:04', 1, 1, 2),
(6, 'En006', '0791811781', '2019-08-13', '14:20:33', '', '14:26:07', '14:26:07', 1, 1, 2),
(7, 'En007', '0791811781', '2019-08-13', '14:21:00', '', '14:26:10', '14:26:11', 1, 1, 2),
(8, 'En008', '0791811781', '2019-08-13', '14:23:02', '', '14:26:11', '14:26:13', 1, 1, 2),
(9, 'En009', '0791811781', '2019-08-13', '14:23:42', '', '14:26:13', '14:26:15', 1, 1, 2),
(10, 'En010', '0791811781', '2019-08-13', '14:24:58', '', '14:26:16', '14:26:17', 1, 1, 2),
(11, 'En011', '0791811781', '2019-08-13', '14:28:44', '', '15:10:58', '15:11:01', 1, 1, 2),
(12, 'En012', '0791811781', '2019-08-13', '14:28:46', '', '15:11:01', '15:11:03', 1, 1, 2),
(13, 'En013', '0791811781', '2019-08-13', '14:28:53', '', '15:11:04', '15:11:05', 1, 1, 2),
(14, 'En014', '0791811781', '2019-08-13', '14:31:41', '', '15:11:05', '15:11:06', 1, 1, 2),
(15, 'En015', '0791811781', '2019-08-13', '14:34:27', '', '15:11:07', '15:11:08', 1, 1, 2),
(16, 'En016', '0791811781', '2019-08-13', '14:35:32', '', '15:11:08', '15:11:10', 1, 1, 2),
(17, 'En017', '0791811781', '2019-08-13', '14:36:03', '', '15:11:10', '15:11:11', 1, 1, 2),
(18, 'En018', '0791811781', '2019-08-13', '14:36:08', '', '15:11:11', '15:11:13', 1, 1, 2),
(19, 'En019', '0791811781', '2019-08-13', '14:38:43', '', '15:11:13', '15:11:14', 1, 1, 2),
(20, 'En020', '0791811781', '2019-08-13', '14:40:03', '', '15:11:15', '15:11:16', 1, 1, 2),
(21, 'En021', '0791811781', '2019-08-13', '14:40:22', '', '15:11:16', '15:11:18', 1, 1, 2),
(22, 'En022', '0791811781', '2019-08-13', '14:40:52', '', '15:11:19', '15:11:19', 1, 1, 2),
(23, 'En023', '0791811781', '2019-08-13', '14:43:16', '', '15:11:19', '15:11:21', 1, 1, 2),
(24, 'En024', '0791811781', '2019-08-13', '14:46:36', '', '15:11:22', '15:11:23', 1, 1, 2),
(25, 'En025', '0791811781', '2019-08-13', '14:48:29', '', '15:11:23', '15:11:24', 1, 1, 2),
(26, 'En026', '0791811781', '2019-08-13', '14:48:47', '', '15:11:25', '15:11:26', 1, 1, 2),
(27, 'En027', '0791811781', '2019-08-13', '14:49:59', '', '15:11:26', '15:11:28', 1, 1, 2),
(28, 'En028', '0791811781', '2019-08-13', '14:50:51', '', '15:11:28', '15:11:29', 1, 1, 2),
(29, 'En029', '0791811781', '2019-08-13', '14:51:40', '', '15:11:29', '15:11:31', 1, 1, 2),
(30, 'En030', '0791811781', '2019-08-13', '14:52:28', '', '15:11:31', '15:11:33', 1, 1, 2),
(31, 'En031', '0791811781', '2019-08-13', '14:55:02', '', '15:11:34', '15:11:34', 1, 1, 2),
(32, 'En032', '0791811781', '2019-08-13', '14:58:56', '', '15:11:34', '15:11:36', 1, 1, 2),
(33, 'En033', '0791811781', '2019-08-13', '14:59:43', '', '15:11:37', '15:11:37', 1, 1, 2),
(34, 'En034', '0791811781', '2019-08-13', '15:01:20', '', '15:11:37', '15:11:39', 1, 1, 2),
(35, 'En035', '0791811781', '2019-08-13', '15:07:31', '', '15:11:49', '15:11:51', 1, 1, 2),
(36, 'En036', '0791811781', '2019-08-13', '15:08:18', '', '15:11:52', '15:11:52', 1, 1, 2),
(37, 'En037', '0791811781', '2019-08-13', '15:09:16', '', '15:11:55', '15:11:57', 1, 1, 2),
(38, 'En038', '0791811781', '2019-08-13', '15:09:50', '', '15:11:58', '15:11:59', 1, 1, 2),
(39, 'En039', '0791811781', '2019-08-13', '15:10:26', '', '15:12:01', '15:12:01', 1, 1, 2),
(40, 'En040', '0791811781', '2019-08-13', '15:10:36', '', '15:12:01', '15:12:02', 1, 1, 2),
(41, 'En041', '0791811781', '2019-08-13', '15:10:42', '', '15:12:04', '15:12:05', 1, 1, 2),
(42, 'En042', '0791811781', '2019-08-13', '15:28:33', '', '17:29:19', '17:29:20', 1, 1, 2),
(43, 'Lb001', '079822587', '2019-08-13', '15:29:55', '', '17:27:40', '17:27:45', 6, 1, 2),
(44, 'Lb002', '079822587', '2019-08-13', '15:29:58', '', '17:27:49', '17:27:50', 6, 1, 2),
(45, 'En043', '0791811781', '2019-08-13', '15:32:11', '', '17:29:16', '17:29:18', 1, 1, 1),
(46, 'Ae001', '0791811781', '2019-08-13', '15:43:31', '', '15:58:40', '15:58:43', 5, 1, 2),
(47, 'Ae002', '0791811781', '2019-08-13', '15:44:18', '', '15:58:44', '15:58:45', 5, 1, 2),
(48, 'Ae003', '079181171', '2019-08-13', '15:45:53', '', '15:58:46', '15:58:47', 5, 1, 2),
(49, 'Ae004', '0791811781', '2019-08-13', '15:49:38', '', '15:58:47', '15:58:48', 5, 1, 2),
(50, 'Ae005', '0791811781', '2019-08-13', '15:49:44', '', '15:54:50', '15:54:51', 5, 1, 1),
(51, 'Ae006', '079181171', '2019-08-13', '15:50:51', '', '15:58:50', '15:58:50', 5, 1, 2),
(52, 'Ae007', '0791811781', '2019-08-13', '15:51:44', '', '15:54:53', '15:54:54', 5, 1, 1),
(53, 'Ae008', '0791811781', '2019-08-13', '15:54:31', '', '15:58:50', '15:58:52', 5, 1, 2),
(54, 'Ae009', '0791811781', '2019-08-13', '15:54:40', '', '15:54:55', '15:54:56', 5, 1, 1),
(55, 'Ae010', '0791811781', '2019-08-13', '15:55:02', '', '15:58:38', '15:58:40', 5, 1, 1),
(56, 'Lb003', '0702555555', '2019-08-13', '17:04:55', '', '17:27:55', '17:27:56', 6, 1, 2),
(57, 'Lb004', '653132078224', '2019-08-13', '17:20:14', '', '17:27:37', '17:27:39', 6, 1, 1),
(58, 'Lb005', '0125888255', '2019-08-13', '17:22:06', '', '17:28:04', '17:28:05', 6, 1, 2),
(59, 'En044', '0702602489', '2019-08-14', '07:22:52', '', '07:25:41', '07:25:43', 1, 1, 2),
(60, 'En045', '0702602489', '2019-08-14', '07:22:54', '', '07:25:47', '07:25:50', 1, 1, 2),
(61, 'En046', '0702602489', '2019-08-14', '07:23:26', '', '07:26:38', '07:26:39', 1, 1, 2),
(62, 'En047', '0702602489', '2019-08-14', '07:24:52', '', '07:26:44', '07:26:44', 1, 1, 2),
(67, 'Lb007', '0785255852', '2019-08-15', '12:14:47', '', '12:15:27', '12:15:29', 6, 1, 2),
(68, 'Lb008', '0785255851', '2019-08-15', '12:15:16', '', '12:15:42', '12:15:45', 6, 1, 2),
(69, 'En048', '04874515915', '2019-08-15', '12:28:27', '', '12:38:51', '12:38:51', 1, 1, 2),
(70, 'En049', '04874515915', '2019-08-15', '12:28:28', '', '12:40:32', '12:40:33', 1, 1, 2),
(72, 'En050', '04874515915', '2019-08-15', '12:28:28', '', '12:40:35', '12:40:36', 1, 1, 2),
(73, 'En052', '04874515954', '2019-08-15', '12:28:34', '', '12:40:36', '12:40:37', 1, 1, 2),
(74, 'Co004', '87547845', '2019-08-15', '12:28:47', '', '12:39:00', '12:39:02', 2, 1, 2),
(75, 'Co005', '87547845', '2019-08-15', '12:28:50', '', '12:39:02', '12:39:03', 2, 1, 2),
(76, 'Ae011', '545574', '2019-08-15', '12:28:54', '', '12:38:28', '12:38:30', 5, 1, 2),
(77, 'Ae012', '5455747\\4', '2019-08-15', '12:28:54', '', '12:38:30', '12:38:31', 5, 1, 2),
(78, 'Ae013', '545574722', '2019-08-15', '12:28:57', '', '12:38:31', '12:38:32', 5, 1, 2),
(79, 'Ph001', '474554', '2019-08-15', '12:29:04', '', '12:39:13', '12:39:15', 4, 1, 2),
(80, 'Ph002', '474554545', '2019-08-15', '12:29:05', '', '12:39:15', '12:39:18', 4, 1, 2),
(81, 'Pd001', '5445454', '2019-08-15', '12:29:13', '', '12:39:23', '12:39:26', 3, 1, 2),
(82, 'Pd002', '54454543', '2019-08-15', '12:29:18', '', '12:39:26', '12:39:27', 3, 1, 2),
(83, 'Lb009', '2222222225', '2019-08-15', '12:36:46', '', '12:38:38', '12:38:40', 6, 1, 2),
(84, 'En053', '56789087', '2019-08-15', '18:01:47', '', '18:02:17', '18:02:20', 1, 1, 2),
(85, 'En054', '9516545', '2019-08-17', '10:36:43', '', '10:36:55', '10:36:56', 1, 1, 2),
(86, 'En055', '9516545', '2019-08-17', '10:36:48', '', '10:36:56', '10:36:57', 1, 1, 2),
(87, 'Lb010', '98652336548', '2019-08-17', '11:05:35', '', '11:06:02', '11:06:03', 6, 1, 2),
(88, 'Lb011', '98652336548', '2019-08-17', '11:05:37', '', '11:06:03', '11:06:03', 6, 1, 2),
(89, 'Ae014', '865231568', '2019-08-17', '11:05:44', '', '11:06:08', '11:06:09', 5, 1, 2),
(90, 'Pd003', '9658658', '2019-08-17', '11:05:51', '', '11:06:14', '11:06:15', 3, 1, 2),
(91, 'Pd004', '9658658', '2019-08-17', '11:05:52', '', '11:06:20', '11:06:22', 3, 1, 2),
(97, 'Pd010', '9658658', '2019-08-17', '11:05:53', '', '11:06:26', '11:06:26', 3, 1, 2),
(98, 'Pd011', '9658658', '2019-08-17', '11:05:53', '', '11:06:26', '11:06:27', 3, 1, 2),
(99, 'Pd012', '9658658', '2019-08-17', '11:05:53', '', '11:06:27', '11:06:28', 3, 1, 2),
(100, 'Lb012', '0702602489', '2019-08-18', '14:42:50', '', '14:54:31', '14:54:32', 6, 1, 2),
(101, 'Lb013', '0702602489', '2019-08-18', '14:54:14', '', '14:54:55', '14:54:55', 6, 1, 2),
(102, 'En056', '025851', '2019-08-18', '22:35:04', '', '22:39:49', '22:39:50', 1, 1, 2),
(103, 'En057', '025851', '2019-08-18', '22:35:10', '', '22:45:13', '22:45:16', 1, 1, 2),
(104, 'Co006', '56454313', '2019-08-18', '22:35:19', '', '22:46:12', '22:46:13', 2, 1, 2),
(105, 'Ph003', '34343564654', '2019-08-18', '22:35:32', '', '22:45:47', '22:45:49', 4, 1, 2),
(106, 'Ph004', '34343564654', '2019-08-18', '22:35:35', '', '01:58:27', '01:58:29', 4, 1, 2),
(108, 'Ae015', '321354', '2019-08-18', '22:35:45', '', '22:46:00', '22:46:00', 5, 1, 2),
(109, 'Pd013', '4554658', '2019-08-18', '22:38:37', '', '22:46:20', '22:46:20', 3, 1, 2),
(110, 'Pd014', '4554658', '2019-08-18', '22:38:41', '', '22:48:24', '22:48:26', 3, 1, 2),
(111, 'Pd015', '4554658', '2019-08-18', '22:38:42', '', '22:48:43', '22:48:44', 3, 1, 2),
(113, 'Pd016', '4554658', '2019-08-18', '22:38:44', '', '01:53:47', '01:53:50', 3, 1, 2),
(115, 'Lb014', '0791811781', '2019-08-19', '00:09:57', '', '01:29:29', '01:29:31', 6, 1, 2),
(116, 'Lb015', '0791811781', '2019-08-19', '00:12:53', '', '01:30:26', '01:30:29', 6, 1, 2),
(117, 'Lb016', '0791811781', '2019-08-19', '00:15:39', '', '01:30:29', '01:30:31', 6, 1, 2),
(118, 'Lb017', '0702602489', '2019-08-19', '00:17:28', '', '01:30:32', '01:30:33', 6, 1, 2),
(119, 'Ae016', '0738028645', '2019-08-19', '00:19:08', '', '02:25:01', '02:25:04', 5, 1, 2),
(120, 'Ae017', '0738028645', '2019-08-19', '00:19:11', '', '02:25:10', '02:25:12', 5, 1, 2),
(121, 'Co007', '0791811781', '2019-08-19', '01:28:22', '', '01:50:26', '01:50:29', 2, 1, 2),
(122, 'Co008', '0791811781', '2019-08-19', '01:28:25', '', '02:25:22', '02:25:24', 2, 1, 2),
(123, 'Co009', '0702602489', '2019-08-19', '01:28:42', '', '02:25:25', '02:25:26', 2, 1, 2),
(124, 'Co010', '0738028645', '2019-08-19', '01:28:49', '', '02:25:31', '02:25:31', 2, 1, 2),
(125, 'Co011', '0725558272', '2019-08-19', '01:29:02', '', '02:25:31', '02:25:33', 2, 1, 2),
(126, 'Co012', '0721628013', '2019-08-19', '01:29:10', '', '02:25:34', '02:25:34', 2, 1, 2),
(127, 'Pd019', '0792222222', '2019-08-19', '01:51:58', '', '01:52:29', '01:52:32', 3, 1, 2),
(128, 'Pd020', '0792222222', '2019-08-19', '01:52:01', '', '01:52:32', '01:52:33', 3, 1, 2),
(129, 'Ae018', '0702602489', '2019-08-19', '11:47:42', '', '11:58:40', '11:58:43', 5, 1, 1),
(130, 'Ae019', '0702602489', '2019-08-19', '11:49:04', '', '11:58:43', '11:58:45', 5, 1, 2),
(131, 'Ae020', '0702602489', '2019-08-19', '11:49:45', '', '11:58:46', '11:58:48', 5, 1, 1),
(132, 'Co013', '0791811781', '2019-08-19', '11:51:45', '', '11:59:15', '11:59:17', 2, 1, 1),
(133, 'Co014', '0791811781', '2019-08-19', '11:57:40', '', '11:59:17', '11:59:18', 2, 1, 2),
(134, 'Co015', '0791811781', '2019-08-19', '11:57:40', '', '11:59:18', '11:59:20', 2, 1, 2),
(136, 'En059', '0702602489', '2019-08-19', '13:46:46', '', '13:49:10', '13:49:11', 1, 1, 2),
(137, 'En060', '0702602489', '2019-08-19', '13:47:17', '', '15:08:24', '00:00:00', 1, 3, 2),
(138, 'En061', '0702602489', '2019-08-19', '13:47:37', '', '00:00:00', '00:00:00', 1, 2, 2),
(139, 'Ae021', '0702602489', '2019-08-19', '13:48:06', '', '00:00:00', '00:00:00', 5, 2, 2),
(140, 'En062', '0702602489', '2019-08-19', '13:49:42', '', '00:00:00', '00:00:00', 1, 2, 2),
(141, 'Ph006', '0702602489', '2019-08-19', '15:09:36', '', '00:00:00', '00:00:00', 4, 2, 2),
(142, 'Co016', '0702602489', '2019-08-19', '15:54:28', '', '15:58:11', '15:58:13', 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_priority_level`
--

CREATE TABLE `customer_priority_level` (
  `index_ID` int(10) NOT NULL,
  `priority_level` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_priority_level`
--

INSERT INTO `customer_priority_level` (`index_ID`, `priority_level`, `Name`) VALUES
(1, 1, 'HIGH_PRIORITY'),
(2, 2, 'NORMAL_PRIORITY');

-- --------------------------------------------------------

--
-- Table structure for table `customer_status`
--

CREATE TABLE `customer_status` (
  `index_ID` int(10) NOT NULL,
  `status_ID` varchar(255) NOT NULL,
  `status_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_status`
--

INSERT INTO `customer_status` (`index_ID`, `status_ID`, `status_Name`) VALUES
(1, '1', 'SERVED'),
(2, '2', 'PENDING'),
(3, '3', 'RECEIVING_SERVICE');

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`index_ID`, `ticket_no`, `service_ID`) VALUES
(1, 'En001', 1),
(2, 'En002', 1),
(3, 'En003', 1),
(4, 'En004', 1),
(5, 'En005', 1),
(6, 'En006', 1),
(7, 'En007', 1),
(8, 'En008', 1),
(9, 'En009', 1),
(10, 'En010', 1),
(11, 'En011', 1),
(12, 'En012', 1),
(13, 'En013', 1),
(14, 'En014', 1),
(15, 'En015', 1),
(16, 'En016', 1),
(17, 'En017', 1),
(18, 'En018', 1),
(19, 'En019', 1),
(20, 'En020', 1),
(21, 'En021', 1),
(22, 'En022', 1),
(23, 'En023', 1),
(24, 'En024', 1),
(25, 'En025', 1),
(26, 'En026', 1),
(27, 'En027', 1),
(28, 'En028', 1),
(29, 'En029', 1),
(30, 'En030', 1),
(31, 'En031', 1),
(32, 'En032', 1),
(33, 'En033', 1),
(34, 'En034', 1),
(35, 'En035', 1),
(36, 'En036', 1),
(37, 'En037', 1),
(38, 'En038', 1),
(39, 'En039', 1),
(40, 'En040', 1),
(41, 'En041', 1),
(42, 'En042', 1),
(43, 'En043', 1),
(44, 'En044', 1),
(45, 'En045', 1),
(46, 'En046', 1),
(47, 'En047', 1),
(48, 'En048', 1),
(49, 'En049', 1),
(50, 'En049', 1),
(51, 'En050', 1),
(52, 'En052', 1),
(53, 'En053', 1),
(54, 'En054', 1),
(55, 'En055', 1),
(56, 'En056', 1),
(57, 'En057', 1),
(58, 'En058', 1),
(59, 'En059', 1),
(60, 'En060', 1),
(61, 'En061', 1),
(62, 'En062', 1);

-- --------------------------------------------------------

--
-- Table structure for table `laboratory`
--

CREATE TABLE `laboratory` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratory`
--

INSERT INTO `laboratory` (`index_ID`, `ticket_no`, `service_ID`) VALUES
(1, 'Lb001', 6),
(2, 'Lb002', 6),
(3, 'Lb003', 6),
(4, 'Lb004', 6),
(5, 'Lb005', 6),
(6, 'Lb006', 6),
(7, 'Lb007', 6),
(8, 'Lb008', 6),
(9, 'Lb009', 6),
(10, 'Lb010', 6),
(11, 'Lb011', 6),
(12, 'Lb012', 6),
(13, 'Lb013', 6),
(14, 'Lb014', 6),
(15, 'Lb015', 6),
(16, 'Lb016', 6),
(17, 'Lb017', 6);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `index_ID` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`index_ID`, `email`, `password`) VALUES
(1, 'hsb@gmail.com', '@hsb123');

-- --------------------------------------------------------

--
-- Table structure for table `paediatrics`
--

CREATE TABLE `paediatrics` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paediatrics`
--

INSERT INTO `paediatrics` (`index_ID`, `ticket_no`, `service_ID`) VALUES
(1, 'Pd001', 3),
(2, 'Pd002', 3),
(3, 'Pd003', 3),
(4, 'Pd004', 3),
(5, 'Pd005', 3),
(6, 'Pd006', 3),
(7, 'Pd007', 3),
(8, 'Pd008', 3),
(9, 'Pd009', 3),
(10, 'Pd010', 3),
(11, 'Pd011', 3),
(12, 'Pd012', 3),
(13, 'Pd013', 3),
(14, 'Pd014', 3),
(15, 'Pd015', 3),
(16, 'Pd016', 3),
(17, 'Pd017', 3),
(18, 'Pd018', 3),
(19, 'Pd019', 3),
(20, 'Pd020', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`index_ID`, `ticket_no`, `service_ID`) VALUES
(1, 'Ph001', 4),
(2, 'Ph002', 4),
(3, 'Ph003', 4),
(4, 'Ph004', 4),
(5, 'Ph005', 4),
(6, 'Ph006', 4);

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `index_ID` int(10) NOT NULL,
  `server_ID` varchar(255) NOT NULL,
  `server_name` varchar(255) NOT NULL,
  `server_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `index_ID` int(10) NOT NULL,
  `service_ID` int(10) NOT NULL,
  `service_Name` varchar(255) NOT NULL,
  `abbrev` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`index_ID`, `service_ID`, `service_Name`, `abbrev`) VALUES
(1, 1, 'enquiries', 'En'),
(2, 2, 'consultation', 'Co'),
(3, 3, 'paediatrics', 'Pd'),
(4, 4, 'pharmacy', 'Ph'),
(5, 5, 'accidents_emergencies', 'Ae'),
(6, 6, 'laboratory', 'Lb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accidents_emergencies`
--
ALTER TABLE `accidents_emergencies`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`index_ID`),
  ADD UNIQUE KEY `index` (`index_ID`);

--
-- Indexes for table `customer_priority_level`
--
ALTER TABLE `customer_priority_level`
  ADD PRIMARY KEY (`priority_level`),
  ADD UNIQUE KEY `index_ID` (`index_ID`);

--
-- Indexes for table `customer_status`
--
ALTER TABLE `customer_status`
  ADD PRIMARY KEY (`status_ID`),
  ADD UNIQUE KEY `index_ID` (`index_ID`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `laboratory`
--
ALTER TABLE `laboratory`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `paediatrics`
--
ALTER TABLE `paediatrics`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`index_ID`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`server_ID`),
  ADD UNIQUE KEY `index_ID` (`index_ID`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`service_ID`),
  ADD UNIQUE KEY `index_ID` (`index_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accidents_emergencies`
--
ALTER TABLE `accidents_emergencies`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `customer_priority_level`
--
ALTER TABLE `customer_priority_level`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_status`
--
ALTER TABLE `customer_status`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paediatrics`
--
ALTER TABLE `paediatrics`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
