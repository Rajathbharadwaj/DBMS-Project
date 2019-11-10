-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 10, 2019 at 08:24 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `present_roll_id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `faculty_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `c_code` varchar(20) CHARACTER SET utf8 NOT NULL,
  `date_time` varchar(36) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`present_roll_id`,`faculty_id`,`c_code`,`date_time`),
  KEY `faculty_id` (`faculty_id`),
  KEY `c_code` (`c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`present_roll_id`, `faculty_id`, `c_code`, `date_time`) VALUES
('061', 'SD12', '17CS52', '2019-11-06 19:50:10.944253'),
('061', 'SD12', '17CS52', '2019-11-07 01:38:37.156434');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `c_code` varchar(20) NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_credits` varchar(5) NOT NULL,
  `c_sem` varchar(5) NOT NULL,
  PRIMARY KEY (`c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_code`, `c_name`, `c_credits`, `c_sem`) VALUES
('17CS51', 'M&E', '4', '5'),
('17CS52', 'CN', '4', '5'),
('17CS53', 'DBMS', '4', '5');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fdept` varchar(20) NOT NULL,
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `fname`, `email`, `fdept`) VALUES
('0', '0', '0', '0'),
('SD12', 'sandeep', 'sand@gmail.com', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `faculty_id` varchar(20) NOT NULL,
  `username` varchar(16) NOT NULL,
  `role` varchar(1) NOT NULL DEFAULT 'F',
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`faculty_id`, `username`, `role`, `password`) VALUES
('0', 'admin', 'A', 'admin'),
('SD12', 'sandeep', 'F', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE IF NOT EXISTS `marks` (
  `c_code` varchar(20) CHARACTER SET utf8 NOT NULL,
  `roll_id` varchar(32) CHARACTER SET utf8 NOT NULL,
  `ia1` int(2) NOT NULL,
  `ia2` int(2) NOT NULL,
  `ia3` int(2) NOT NULL,
  `final_marks` int(3) DEFAULT NULL,
  PRIMARY KEY (`c_code`,`roll_id`),
  KEY `roll_id` (`roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`c_code`, `roll_id`, `ia1`, `ia2`, `ia3`, `final_marks`) VALUES
('17CS51', '061', 26, 29, 30, NULL),
('17CS52', '061', 27, 29, 30, NULL),
('17CS53', '061', 30, 30, 30, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `username` varchar(16) NOT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `roll_id` varchar(32) NOT NULL,
  `branch` varchar(32) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`roll_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`username`, `student_email`, `roll_id`, `branch`, `phone`, `create_time`) VALUES
('Rajath', 'raja@gmail.com', '061', 'CSE', '8095552163', '2019-11-06 14:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
CREATE TABLE IF NOT EXISTS `teach` (
  `faculty_id` varchar(20) NOT NULL,
  `c_code` varchar(20) NOT NULL,
  `sec` varchar(5) NOT NULL,
  `acd_yr` varchar(5) NOT NULL,
  `datetime` varchar(32) NOT NULL,
  PRIMARY KEY (`faculty_id`,`c_code`,`sec`,`datetime`) USING BTREE,
  KEY `c_code` (`c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teach`
--

INSERT INTO `teach` (`faculty_id`, `c_code`, `sec`, `acd_yr`, `datetime`) VALUES
('SD12', '17CS51', 'B', '2019', '2019-11-07 01:31:58.018867'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 00:47:06.715921'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 00:49:02.995767'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 00:51:46.753211'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 00:53:59.033744'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 00:56:05.514935'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:12:01.014358'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:17:02.498392'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:18:00.371614'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:22:16.443255'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:23:07.948641'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:24:10.298726'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:24:19.329729'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:27:06.286377'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:28:14.892488'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:35:14.987940'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:36:27.682224'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:37:33.006921'),
('SD12', '17CS52', 'B', '2019', '2019-11-07 01:47:57.828244');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student` ADD FULLTEXT KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`present_roll_id`) REFERENCES `student` (`roll_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`c_code`) REFERENCES `course` (`c_code`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`);

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`c_code`) REFERENCES `course` (`c_code`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`roll_id`) REFERENCES `student` (`roll_id`);

--
-- Constraints for table `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibfk_1` FOREIGN KEY (`c_code`) REFERENCES `course` (`c_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teach_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
