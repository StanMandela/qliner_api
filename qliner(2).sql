-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2019 at 10:54 AM
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
(2, 'Ae002', 5);

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
(1, 'Co001', 2);

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
(29, 'Pd021', '0791811781', '2019-07-23', '12:59:21', '', '00:00:00', '00:00:00', 3, 2, 2),
(30, 'Pd000', '0791811781', '2019-07-23', '13:15:18', '', '00:00:00', '00:00:00', 3, 2, 2),
(31, 'Pd001', '0791811781', '2019-07-23', '13:16:06', '', '00:00:00', '00:00:00', 3, 2, 2),
(32, 'En000', '0791811781', '2019-07-23', '13:22:12', '', '00:00:00', '00:00:00', 1, 2, 2),
(33, 'Co001', '0791811781', '2019-07-23', '13:25:38', '', '00:00:00', '00:00:00', 2, 2, 2),
(34, 'Ae001', '0791811781', '2019-07-23', '13:29:02', '', '00:00:00', '00:00:00', 5, 2, 1),
(35, 'Pd003', '0791811781', '2019-07-23', '15:14:27', '', '00:00:00', '00:00:00', 3, 2, 2),
(36, 'Pd004', '0791911781', '2019-07-23', '15:22:27', '', '00:00:00', '00:00:00', 3, 2, 2),
(37, 'Pd005', '0791811781', '2019-07-23', '15:24:36', '', '00:00:00', '00:00:00', 3, 2, 2),
(38, 'Pd006', '0791811781', '2019-07-23', '15:31:22', '', '00:00:00', '00:00:00', 3, 2, 2),
(39, 'Pd007', '0791811781', '2019-07-23', '15:35:17', '', '00:00:00', '00:00:00', 3, 2, 2),
(40, 'Pd008', '0791811781', '2019-07-23', '15:39:14', '', '00:00:00', '00:00:00', 3, 2, 2),
(41, 'Pd009', '0791811781', '2019-07-23', '15:42:05', '', '00:00:00', '00:00:00', 3, 2, 2),
(42, 'Pd010', '0791925222', '2019-07-23', '15:43:15', '', '00:00:00', '00:00:00', 3, 2, 2),
(43, 'Pd011', '0791925222', '2019-07-23', '15:43:21', '', '00:00:00', '00:00:00', 3, 2, 2),
(44, 'Pd012', '0791811781', '2019-07-23', '15:44:27', '', '00:00:00', '00:00:00', 3, 2, 2),
(45, 'Pd013', '0791811781', '2019-07-23', '15:45:35', '', '00:00:00', '00:00:00', 3, 2, 2),
(46, 'Pd014', '0791811781', '2019-07-23', '15:48:41', '', '00:00:00', '00:00:00', 3, 2, 2),
(47, 'Pd015', '0791811781', '2019-07-23', '15:51:30', '', '00:00:00', '00:00:00', 3, 2, 2),
(48, 'Pd016', '0784455854', '2019-07-23', '15:56:29', '', '00:00:00', '00:00:00', 3, 2, 2),
(49, 'Pd017', '0791811781', '2019-07-23', '15:57:18', '', '00:00:00', '00:00:00', 3, 2, 2),
(50, 'Pd018', '0791811781', '2019-07-23', '15:58:49', '', '00:00:00', '00:00:00', 3, 2, 2),
(51, 'Pd019', '0791811781', '2019-07-23', '16:05:14', '', '00:00:00', '00:00:00', 3, 2, 2),
(52, 'Pd020', '0791811781', '2019-07-23', '16:05:21', '', '00:00:00', '00:00:00', 3, 2, 2),
(53, 'Pd021', '0791811781', '2019-07-23', '16:07:39', '', '00:00:00', '00:00:00', 3, 2, 2),
(54, 'Pd022', '0791811781', '2019-07-23', '16:08:54', '', '00:00:00', '00:00:00', 3, 2, 2),
(55, 'Pd023', '0791811781', '2019-07-23', '16:09:26', '', '00:00:00', '00:00:00', 3, 2, 2),
(56, 'Pd024', '0791811781', '2019-07-23', '16:15:39', '', '00:00:00', '00:00:00', 3, 2, 2),
(57, 'Pd025', '0791811781', '2019-07-23', '16:16:44', '', '00:00:00', '00:00:00', 3, 2, 2),
(58, 'Pd026', '0788888888', '2019-07-23', '16:19:37', '', '00:00:00', '00:00:00', 3, 2, 2),
(59, 'Pd027', '0791811781', '2019-07-23', '16:20:06', '', '00:00:00', '00:00:00', 3, 2, 2),
(60, 'Pd028', '0791811781', '2019-07-23', '16:21:01', '', '00:00:00', '00:00:00', 3, 2, 2),
(61, 'Pd029', '0788525258', '2019-07-23', '16:21:46', '', '00:00:00', '00:00:00', 3, 2, 2),
(62, 'Pd030', '0785258258', '2019-07-23', '16:22:51', '', '00:00:00', '00:00:00', 3, 2, 2),
(63, 'Pd031', '0702052586', '2019-07-23', '20:00:54', '', '00:00:00', '00:00:00', 3, 2, 2),
(64, 'Pd032', '0791811781', '2019-07-23', '20:23:51', '', '00:00:00', '00:00:00', 3, 2, 2),
(65, 'Pd033', '0785258852', '2019-07-23', '20:24:59', '', '00:00:00', '00:00:00', 3, 2, 2),
(66, 'Pd034', '0702602489', '2019-07-24', '17:53:32', '', '00:00:00', '00:00:00', 3, 2, 2),
(67, 'Pd035', '0702602489', '2019-07-24', '17:53:33', '', '00:00:00', '00:00:00', 3, 2, 2),
(68, 'Pd036', '0702602489', '2019-07-24', '17:53:49', '', '00:00:00', '00:00:00', 3, 2, 2),
(69, 'Pd037', '0791811781', '2019-07-24', '18:01:18', '', '00:00:00', '00:00:00', 3, 2, 2),
(70, 'Pd038', '0791811781', '2019-07-24', '18:09:26', '', '00:00:00', '00:00:00', 3, 2, 2),
(71, 'Pd039', '0702602489', '2019-07-24', '18:10:56', '', '00:00:00', '00:00:00', 3, 2, 2),
(72, 'Pd040', '014456665', '2019-07-24', '18:11:30', '', '00:00:00', '00:00:00', 3, 2, 2),
(73, 'En002', '081145', '2019-07-25', '21:35:26', '', '00:00:00', '00:00:00', 1, 2, 2),
(74, 'Lb001', '0791811781', '2019-07-25', '21:35:50', '', '00:00:00', '00:00:00', 6, 2, 2),
(75, 'En003', '577554078', '2019-07-25', '21:39:00', '', '00:00:00', '00:00:00', 1, 2, 2),
(76, 'En004', '0791811781', '2019-07-25', '21:39:19', '', '00:00:00', '00:00:00', 1, 2, 2),
(77, 'En005', '0791881781', '2019-07-25', '21:40:11', '', '00:00:00', '00:00:00', 1, 2, 2),
(78, 'En006', '0791811785', '2019-07-25', '21:40:42', '', '00:00:00', '00:00:00', 1, 2, 2),
(79, 'Ae002', '0702602789', '2019-07-25', '21:41:32', '', '00:00:00', '00:00:00', 5, 2, 1);

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
(1, 'En000', 1),
(2, 'En002', 1),
(3, 'En003', 1),
(4, 'En004', 1),
(5, 'En005', 1),
(6, 'En006', 1);

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
(1, 'Lb001', 6);

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
(1, 'Pd000', 3),
(2, 'Pd001', 3),
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
(20, 'Pd020', 3),
(21, 'Pd021', 3),
(22, 'Pd022', 3),
(23, 'Pd023', 3),
(24, 'Pd024', 3),
(25, 'Pd025', 3),
(26, 'Pd026', 3),
(27, 'Pd027', 3),
(28, 'Pd028', 3),
(29, 'Pd029', 3),
(30, 'Pd030', 3),
(31, 'Pd031', 3),
(32, 'Pd032', 3),
(33, 'Pd033', 3),
(34, 'Pd034', 3),
(35, 'Pd035', 3),
(36, 'Pd036', 3),
(37, 'Pd037', 3),
(38, 'Pd038', 3),
(39, 'Pd039', 3),
(40, 'Pd040', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `index_ID` int(10) NOT NULL,
  `ticket_no` varchar(255) NOT NULL,
  `service_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

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
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laboratory`
--
ALTER TABLE `laboratory`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paediatrics`
--
ALTER TABLE `paediatrics`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `index_ID` int(10) NOT NULL AUTO_INCREMENT;

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
