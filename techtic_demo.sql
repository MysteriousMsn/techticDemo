-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2021 at 03:43 AM
-- Server version: 10.4.13-MariaDB-log
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techtic_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `custom_sessions_table_name`
--

CREATE TABLE `custom_sessions_table_name` (
  `custom_session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_expires_column_name` int(11) UNSIGNED NOT NULL,
  `custom_data_column_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_sessions_table_name`
--

INSERT INTO `custom_sessions_table_name` (`custom_session_id`, `custom_expires_column_name`, `custom_data_column_name`) VALUES
('2IjEHzk8y-TbX4cSs9S1zyflOy15zmj5', 1634224818, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"employee_id\":1,\"company_id\":1,\"is_company\":1,\"role\":1}}'),
('2UVePLHgBw7kU_NqDp1NAyt16a_yGFX7', 1634226801, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"id\":1,\"first_name\":\"Administrator\",\"last_name\":\"\",\"email\":\"eMORo6bLyJPgqJsQWgmBPg==\",\"password\":\"/FNv7sPPtiEqfReK5KE5kw==\",\"salary\":0,\"created_date\":\"2021-09-16T11:01:05.000Z\"}}'),
('UaFDDWtMfiGmvYY5K2NS7DrOkW7-SaEu', 1634226677, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"id\":1,\"first_name\":\"Administrator\",\"last_name\":\"\",\"email\":\"eMORo6bLyJPgqJsQWgmBPg==\",\"password\":\"/FNv7sPPtiEqfReK5KE5kw==\",\"salary\":0,\"created_date\":\"2021-09-16T11:01:05.000Z\"}}'),
('mssvWSDCL2QocmsmZB_flvp_aHejFk5-', 1634237471, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"id\":1,\"first_name\":\"Administrator\",\"last_name\":\"Admin\",\"email\":\"eMORo6bLyJPgqJsQWgmBPg==\",\"password\":\"/FNv7sPPtiEqfReK5KE5kw==\",\"salary\":20000,\"created_date\":\"2021-09-16T11:01:05.000Z\"}}'),
('qJfDwerQji4vQqWGOjGP8i4MzHIeMZUt', 1634213716, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"user\":{\"employee_id\":1,\"company_id\":1,\"is_company\":1,\"role\":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `salary` int(50) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`id`, `first_name`, `last_name`, `email`, `password`, `salary`, `created_date`) VALUES
(1, 'Administrator', 'Admin', 'eMORo6bLyJPgqJsQWgmBPg==', '/FNv7sPPtiEqfReK5KE5kw==', 20000, '2021-09-16 16:31:05'),
(44, 'Mohsin', 'Sunasara', 'vfzzO+Q6/BueKDs48wKEpc4GonlOobzfMlA95yXDjJI=', '', 30000, '0000-00-00 00:00:00'),
(45, 'testsas', 'estsas', 'e6alfdRSY3VC4oZJg5WL8g==', '', 123, '0000-00-00 00:00:00'),
(46, 'tetetet', 'tetetet', 'upfqD8q74iMelYYHdcoO/g==', '', 123434, '0000-00-00 00:00:00'),
(47, 'Kaushik', 'Joshi', 'rFJHdBkmE6SiSTkBx/B5v+TW+Yf1PZIzqsfYVMCuBvk=', '', 12000, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave`
--

CREATE TABLE `tbl_leave` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` int(11) NOT NULL COMMENT '1 = Half, 2 = Full',
  `leave_date` date NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_leave`
--

INSERT INTO `tbl_leave` (`id`, `employee_id`, `leave_type`, `leave_date`, `reason`) VALUES
(1, 1, 1, '2021-10-14', 'Personal Reason'),
(4, 44, 1, '2021-10-15', 'Personal Reason'),
(5, 46, 2, '2021-10-16', 'Personal Reason'),
(6, 44, 2, '2021-10-15', 'Personal Reason');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `custom_sessions_table_name`
--
ALTER TABLE `custom_sessions_table_name`
  ADD PRIMARY KEY (`custom_session_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
