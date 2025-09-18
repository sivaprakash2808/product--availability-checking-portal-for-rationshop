-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 24, 2024 at 11:07 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ration`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(50) NOT NULL,
  `psw` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `psw`) VALUES
('admin', '11');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `age` varchar(50) NOT NULL,
  `family` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `rno` varchar(50) NOT NULL,
  `adhar` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `name` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--


-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL auto_increment,
  `date` varchar(50) NOT NULL,
  `mon` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `qty` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stocks`
--

