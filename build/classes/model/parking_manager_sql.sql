-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2020 at 11:35 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parking_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `parkingId` int(11) NOT NULL,
  `carId` int(11) NOT NULL,
  `datePlaced` date NOT NULL,
  `timePlaced` time NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT 0,
  `payment` tinyint(1) NOT NULL DEFAULT 0,
  `hour` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingId`, `userId`, `parkingId`, `carId`, `datePlaced`, `timePlaced`, `price`, `completion`, `payment`, `hour`) VALUES
(1, 1, 1, 1, '2020-09-12', '15:52:49', '50.00', 1, 0, 1),
(2, 2, 1, 2, '2020-09-12', '18:11:47', '2500.00', 1, 0, 50),
(3, 2, 1, 3, '2020-09-12', '18:12:52', '50.00', 1, 0, 1),
(4, 2, 1, 2, '2020-09-12', '18:13:04', '50.00', 1, 0, 1),
(5, 2, 1, 2, '2020-09-12', '18:13:18', '50.00', 1, 0, 1),
(6, 1, 1, 4, '2020-09-12', '19:03:19', '250.00', 1, 0, 5),
(7, 5, 1, 5, '2020-09-13', '13:49:19', '250.00', 1, 0, 5),
(8, 5, 2, 5, '2020-09-13', '19:24:26', '400.00', 0, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `carId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numberPlate` varchar(255) NOT NULL,
  `image` varchar(10000) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`carId`, `name`, `numberPlate`, `image`, `userId`) VALUES
(1, 'my car', 'kulu547', 'C:\\Users\\HP\\Desktop\\New folder\\index_252154733.jpg', 1),
(2, 'Sowmik\'s car', 's0wm1k', 'C:\\Users\\HP\\Desktop\\New folder\\index_1061053525.jpg', 2),
(3, 'Sowmik\'s car 2', 's0wm1k2', 'C:\\Users\\HP\\Desktop\\New folder\\index_1155850542.jpg', 2),
(4, 'my car 2', 'kulu5478', 'C:\\Users\\HP\\Desktop\\New folder\\index_74393577.jpg', 1),
(5, 'yokko car', 'yokko876', 'C:\\Users\\HP\\Desktop\\New folder\\index_594655890.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cityId` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cityId`, `city`, `state`, `address`, `pincode`) VALUES
(1, 'uttara', 'dhaka', 'dakkhinkhan2tala basa', '1102'),
(2, 'Banashree', 'dhaka', 'kisu akta hbe6 tola basa, garage', '1102');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `dateAdded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `firstName`, `lastName`, `email`, `message`, `dateAdded`) VALUES
(1, 'thearft', 'kulu', 'kulukulu@gmail.com', 'kulukulkulkulkul', '1970-01-01'),
(2, 'thearft', 'kulu', 'kulukulu@gmail.com', 'kulkulkulkulukulu', '2020-09-12'),
(3, 'himi', 'vai', 'himivai@gmail.com', 'kulukulukulkulkulukulu', '2020-09-12'),
(4, 'jisan', 'uday', 'kulukulu@gmail.com', 'uday is the best', '2020-09-13');

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `parkingId` int(11) NOT NULL,
  `placeName` varchar(255) NOT NULL,
  `ownerName` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `spots` int(11) NOT NULL,
  `fare` decimal(15,2) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parking`
--

INSERT INTO `parking` (`parkingId`, `placeName`, `ownerName`, `userId`, `cityId`, `spots`, `fare`, `contact`, `image`) VALUES
(1, 'arafat er basa', 'thearft', 1, 1, 1, '50.00', '12345678', 'C:\\Users\\HP\\Desktop\\New folder\\index_1358552159.jpg'),
(2, 'Sowmik er basa', 'sowmik', 5, 2, 5, '100.00', '0173576', 'C:\\Users\\HP\\Desktop\\New folder\\index1_15798496.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `name`, `city`, `contact`, `email`, `password`, `image`) VALUES
(1, 'arafat', 'Dhaka', '1234567', 'kulu@gmail.com', 'kulukulu', 'C:\\Users\\HP\\Desktop\\New folder\\53ebfb56f6258bceba2914eaae7a9fc3-boy-cartoon-head-3-by-vexels_1157682186.png'),
(2, 'sowmik', 'banashree', '01735867676', 'sowmik@gmail.com', 'sowmik', 'C:\\Users\\HP\\Desktop\\New folder\\53ebfb56f6258bceba2914eaae7a9fc3-boy-cartoon-head-3-by-vexels_965806097.png'),
(3, 'himi', 'uttara', '757957575', 'himivai@gmail.com', 'kululu', 'C:\\Users\\HP\\Desktop\\New folder\\53ebfb56f6258bceba2914eaae7a9fc3-boy-cartoon-head-3-by-vexels_486048929.png'),
(4, 'thearft', 'uttara', '123456789', 'kulukulu4@gmail.com', 'arafat', 'C:\\Users\\HP\\Desktop\\New folder\\53ebfb56f6258bceba2914eaae7a9fc3-boy-cartoon-head-3-by-vexels_705004673.png'),
(5, 'yokko', 'uttara', '1234567', 'kulukulu@gmail.com', '123', 'C:\\Users\\HP\\Desktop\\New folder\\53ebfb56f6258bceba2914eaae7a9fc3-boy-cartoon-head-3-by-vexels_1323135668.png'),
(6, 'thearft2', 'uttara', '01735867676', 'kulukulu5@gmail.com', 'kulkulkul', 'C:\\Users\\HP\\Desktop\\New folder\\profile_900876039.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `parkingId` (`parkingId`),
  ADD KEY `carId` (`carId`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cityId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`parkingId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `cityId` (`cityId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `carId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parking`
--
ALTER TABLE `parking`
  MODIFY `parkingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`parkingId`) REFERENCES `parking` (`parkingId`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`carId`) REFERENCES `car` (`carId`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `parking`
--
ALTER TABLE `parking`
  ADD CONSTRAINT `parking_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  ADD CONSTRAINT `parking_ibfk_2` FOREIGN KEY (`cityId`) REFERENCES `city` (`cityId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
