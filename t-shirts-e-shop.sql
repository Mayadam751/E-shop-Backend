-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 01:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `t-shirts-e-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `A.name` varchar(100) NOT NULL,
  `A.email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `userID`) VALUES
(1, 'T-Shirt-Lilac', 'Round T-Shirt-Lilac', 500, NULL),
(2, 'T-shirt White', 'Round T-Shirt White', 550, NULL),
(3, 'T-shirt Black', 'Round T-shirt Black', 550, NULL),
(4, 'Polo T-Shirt Beige', 'Polo T-Shirt Beige', 550, NULL),
(5, 'Round T-shirt Beige', 'Round T-shirt Beige', 500, NULL),
(6, 'Polo T-shirt Dark Blue', 'Polo T-shirt Dark Blue', 550, NULL),
(7, 'White Classic T-Shirt', 'White polo t-shirt with beige texture', 550, NULL),
(8, 'Beige T-shirt', 'T-shirt with black line', 600, NULL),
(9, 'White Polo T-shirt', 'Polo T-shirt White X Dark Blue', 600, NULL),
(13, 'T-shirt Black', 'Round T-shirt Black', 550, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Re-passwrord` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `Password`, `Re-passwrord`) VALUES
(1, 'user1', 'user1@gmail.com', '234', '234'),
(2, 'user2', 'user2@gmail.com', '\'123\'', '\'123\''),
(3, 'user3', 'user3@gmail.com', '123', '123'),
(8, 'user4', 'user4@gmail.com', '123', ''),
(10, 'user5', 'user5@gmail.com', '123', ''),
(11, 'user6', 'user6@gmail.com', '123', ''),
(13, 'user7', 'user7@gmail.com', '123', ''),
(16, 'user7', 'user8@gmail.com', '123', ''),
(18, 'user7', 'user9@gmail.com', '123', ''),
(19, 'Mayada ', 'mayadam751@gmail.com', '123456', ''),
(31, 'mayada', 'mayadam751@gmail.commm', '1gholm', ''),
(33, 'mayada', 'mayadam751@gmail.cmmm', '1gholm', ''),
(41, 'aliiii', 'user@gmail.com', '234567', ''),
(65, 'mlkhfy', 'aliii@gmail.com', 'ngyhsd', ''),
(66, 'allmmm', 'mmm@m.com', 'mnbvcx', ''),
(70, 'allmmm', 'mmm@m.commmmmm', 'mnbvcx', ''),
(71, 'newuser', 'new@gmail.comm', 'newuser', ''),
(73, 'mkjhsss', 'nene@gmail.com', 'kklkjhh', ''),
(84, 'mostafa', 'mostafa@gmail.com', 'mostafa', ''),
(90, 'mostafa11', 'mostafa1@gmail.com', 'mostafa11', ''),
(92, 'mariem', 'mariem@gmail.com', '123456', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_U_P` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_U_P` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
