-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 11:05 AM
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
-- Database: `coursework2`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `contact`, `password`) VALUES
(1, 'test', 'test@gmail.com', '7896547485', '1234'),
(2, 'jack', 'jack@gmail.com', '4578965412', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `videocomment`
--

CREATE TABLE `videocomment` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videocomment`
--

INSERT INTO `videocomment` (`id`, `uid`, `vid`, `review`, `rate`) VALUES
(1, 1, 5, 'demo 1234', 3),
(2, 1, 5, 'testing...', 4),
(3, 1, 5, 'abc xyz', 1),
(4, 1, 5, 'aaa', 5),
(5, 1, 5, 'bbb', 3),
(6, 1, 5, 'ttt', 4),
(17, 2, 3, 'Nice Video', 4),
(18, 1, 3, 'Good', 5),
(19, 2, 1, 'test comment', 4);

-- --------------------------------------------------------

--
-- Table structure for table `videofile`
--

CREATE TABLE `videofile` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videofile`
--

INSERT INTO `videofile` (`id`, `name`, `path`) VALUES
(1, 'vecteezy_cartoon-background-camping-mountain-night', '/uploads/vecteezy_cartoon-background-camping-mountain-night_3439680.mp4'),
(2, 'vecteezy_cartoon-background-city-park-playground-w', '/uploads/vecteezy_cartoon-background-city-park-playground-with-kids_3320990.mp4'),
(3, 'vecteezy_cartoon-background-african-savanna-sunset', '/uploads/vecteezy_cartoon-background-african-savanna-sunset_3320986.mp4'),
(6, 'vecteezy_day-to-night-cartoon-animation-effect-car', '/uploads/vecteezy_day-to-night-cartoon-animation-effect-cartoon-sky-view_13005620.mp4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videocomment`
--
ALTER TABLE `videocomment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videofile`
--
ALTER TABLE `videofile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videocomment`
--
ALTER TABLE `videocomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `videofile`
--
ALTER TABLE `videofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
