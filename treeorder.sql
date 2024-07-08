-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2020 at 11:58 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `treeorder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Name` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Mobile` varchar(250) NOT NULL,
  `Subject` varchar(250) NOT NULL,
  `Message` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `fullname` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `contact` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `fullname`, `email`, `contact`, `address`, `password`) VALUES
('tahmida_risha', 'Tahmida Khair Risha', 'tahmida123@gmail.com', '01673456238', '453,nayapara, Dania, Dhaka', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `gardens`
--

CREATE TABLE `gardens` (
  `G_ID` int(30) NOT NULL,
  `name` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `contact` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `S_ID` varchar(30) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` int(30) NOT NULL,
  `T_ID` int(30) NOT NULL,
  `treename` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `price` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `order_date` date NOT NULL,
  `username` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `G_ID` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `username` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `fullname` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `contact` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`username`, `fullname`, `email`, `contact`, `address`, `password`) VALUES
('najnin_jahan', 'Najnin Jahan', 'najninjahan03@gmail.com', '01909234565', '453,nayapara, Dania, Dhaka', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tree`
--

CREATE TABLE `tree` (
  `T_ID` int(30) NOT NULL,
  `name` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `price` int(30) NOT NULL,
  `description` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `G_ID` int(30) NOT NULL,
  `images_path` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `options` varchar(10) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data for table `tree`
--

INSERT INTO `tree` (`T_ID`, `name`, `price`, `description`, `G_ID`, `images_path`, `options`) VALUES
(0, 'Rosemary', 150, 'Rosemary is a woody perennial herb with fragrant', 0, 'images/rosemary.jpg', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `gardens`
--
ALTER TABLE `gardens`
  ADD PRIMARY KEY (`G_ID`),
  ADD UNIQUE KEY `S_ID` (`S_ID`),
  ADD KEY `S_ID_2` (`S_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `T_ID` (`T_ID`,`username`),
  ADD KEY `G_ID` (`G_ID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`T_ID`,`G_ID`),
  ADD KEY `G_ID` (`G_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
