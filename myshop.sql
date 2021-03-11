-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 11, 2021 at 10:58 AM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `uname` varchar(30) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`uname`, `pwd`) VALUES
('yash', 'babiya'),
('admin', 'admin'),
('yashbabiya', 'babiya');

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `des` varchar(10000) NOT NULL,
  `price` int NOT NULL,
  `image` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`id`, `name`, `des`, `price`, `image`) VALUES
(1, 'Samsung s21', 'Get Galaxy Buds Live. Additional HDFC cashback upto ₹7000. T&C Apply. 8K Video Recording, 5G Ready smartphone, 120 Hz Display & Intelligent Battery. 4800mAH Battery. 8K Video. Inetlligent Battery. Bright Night. Samsung Knox Security. Eye Comfort Shield.', 65000, 'static/img/p/1.jpeg\r\n\r\n'),
(2, 'Iphone 12', 'Blast past fast.\r\nA14 Bionic, the fastest chip in a smartphone.\r\nAn edge-to-edge OLED display. Ceramic Shield with four times better drop performance. And Night mode on every camera. iPhone 12 has it all — in two perfect sizes.', 140000, 'static/img/p/2.jpeg'),
(3, 'One plus Nord', 'OnePlus Nord is getting OxygenOS 11, based on Android 11. The company shared the development through a forum post. It is an incremental rollout and will reach all users in a few days.', 30000, 'static/img/p/3.jpeg'),
(4, 'Mi 10T', ' Xiaomi Mi 10T 5G is powered by an octa-core Qualcomm Snapdragon 865 processor.', 51000, 'static/img/p/4.jpeg'),
(5, 'Rog Phone 3', 'The ultimate gaming .\r\nImmersive Front-firing Loudspeakers, Console-like gaming with AirTriggers 3. 144Hz/ 1ms 10-bit HDR AMOLED Display, AirTriggers 3 & Gamecool 3.', 50000, 'static/img/p/5.jpeg'),
(6, 'Samsung F62', '7000mAh battery, 25W Fast Charging, sAMOLED+, 64MP Quad Cam. ', 25000, 'static/img/p/6.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `yashbabiya`
--

CREATE TABLE `yashbabiya` (
  `sno` int NOT NULL,
  `p_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `yashbabiya`
--

INSERT INTO `yashbabiya` (`sno`, `p_id`, `name`, `price`, `qty`) VALUES
(10, 1, 'Samsung s21', 65000, 1),
(13, 2, 'Iphone 12', 140000, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yashbabiya`
--
ALTER TABLE `yashbabiya`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `yashbabiya`
--
ALTER TABLE `yashbabiya`
  MODIFY `sno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
