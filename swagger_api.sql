-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2018 at 03:10 PM
-- Server version: 5.5.61-0ubuntu0.14.04.1
-- PHP Version: 7.2.9-1+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `swagger_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `MY_TODO_LIST`
--

CREATE TABLE IF NOT EXISTS `MY_TODO_LIST` (
  `LIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LIST_NAME` varchar(20) DEFAULT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `STATUS_CD` varchar(25) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `TASK_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LIST_ID`),
  KEY `IX_Relationship1` (`STATUS_CD`),
  KEY `IX_Relationship3` (`USER_ID`),
  KEY `TASK - MYTODOLIST` (`TASK_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `MY_TODO_LIST`
--

INSERT INTO `MY_TODO_LIST` (`LIST_ID`, `LIST_NAME`, `CREATE_DATE`, `UPDATED_DATE`, `START_DATE`, `END_DATE`, `STATUS_CD`, `USER_ID`, `TASK_ID`) VALUES
(1, 'New list', '2018-11-30 12:04:55', '2018-12-02 09:37:00', '2018-11-29 14:30:00', '2018-11-30 14:30:00', 'STARTED', 1, 1),
(2, 'New list', '2018-11-30 12:25:26', '2018-11-30 12:25:26', '2018-11-29 14:30:00', '2018-11-30 14:30:00', 'STARTED', 1, 2),
(3, 'New list', '2018-11-30 12:25:27', '2018-11-30 12:25:27', '2018-11-29 14:30:00', '2018-11-30 14:30:00', 'NOT-STARTED', 1, 3),
(4, 'New list', '2018-11-30 12:25:29', '2018-11-30 12:25:29', '2018-11-29 14:30:00', '2018-11-30 14:30:00', 'STARTED', 1, 4),
(5, 'New list', '2018-12-02 09:37:08', '2018-12-02 09:37:08', '2018-11-29 14:30:00', '2018-11-30 14:30:00', NULL, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `PERMISSION`
--

CREATE TABLE IF NOT EXISTS `PERMISSION` (
  `PERM_ID` int(11) NOT NULL,
  `PERM_TYPE` varchar(10) DEFAULT NULL,
  `PERM_DESC` varchar(25) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `UPDATED_DATE` date DEFAULT NULL,
  PRIMARY KEY (`PERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `STATUS`
--

CREATE TABLE IF NOT EXISTS `STATUS` (
  `STATUS_CD` varchar(25) NOT NULL COMMENT 'NOT-STARTED\r\nSTARTED\r\nIN-PROGRESS\r\nCANCELED \r\nCOMPLETE',
  `STSTUS_DESC` varchar(100) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`STATUS_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `STATUS`
--

INSERT INTO `STATUS` (`STATUS_CD`, `STSTUS_DESC`, `CREATE_DATE`, `UPDATED_DATE`) VALUES
('CANCELED', 'Task is cancelled', '2018-12-02 00:00:00', '2018-12-02 00:00:00'),
('COMPLETE', 'Task is completed', '2018-12-02 00:00:00', '2018-12-02 00:00:00'),
('IN-PROGRESS', 'Task is in progress', '2018-12-02 00:00:00', '2018-12-02 00:00:00'),
('NOT-STARTED', 'The task has not been started yet', '2018-11-30 00:00:00', NULL),
('STARTED', 'The task is in progress', '2018-11-30 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `TASK_REF`
--

CREATE TABLE IF NOT EXISTS `TASK_REF` (
  `TASK_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'LIST ID UNIQUE ID/ RANDOM GENERATOR ',
  `TASK_NAME` varchar(50) NOT NULL COMMENT 'TODO LIST NAME',
  `TASK_DES` varchar(100) NOT NULL COMMENT 'LIST DESCRIPTION',
  `CREATE_DATE` datetime NOT NULL COMMENT 'ENTRY CREATE DATE',
  `UPDATED_DATE` datetime DEFAULT NULL COMMENT 'ENTRY UPDATED DATE ',
  PRIMARY KEY (`TASK_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `TASK_REF`
--

INSERT INTO `TASK_REF` (`TASK_ID`, `TASK_NAME`, `TASK_DES`, `CREATE_DATE`, `UPDATED_DATE`) VALUES
(1, 'New task', 'This is test description', '2018-11-30 12:04:55', '2018-11-30 12:04:55'),
(2, 'New task', 'This is test description', '2018-11-30 12:25:26', '2018-11-30 12:25:26'),
(3, 'New task', 'This is test description', '2018-11-30 12:25:27', '2018-11-30 12:25:27'),
(4, 'New task', 'This is test description', '2018-11-30 12:25:29', '2018-11-30 12:25:29'),
(5, 'New task', 'This is test description', '2018-12-02 09:37:08', '2018-12-02 09:37:08');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE IF NOT EXISTS `USER` (
  `USER_ID` int(11) NOT NULL COMMENT 'UNIQUE ID',
  `USER_NAME` varchar(10) NOT NULL COMMENT 'UNIQUE USERNAME',
  `PASSWORD` varchar(15) NOT NULL COMMENT 'PASSWORD',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT 'USER EMAIL',
  `PERMISSIONS` char(20) DEFAULT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
