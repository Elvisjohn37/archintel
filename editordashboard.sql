-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 12:51 AM
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
-- Database: `editordashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` text NOT NULL,
  `link` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '[For Edit = 0, Published = 1]',
  `writer` int(11) DEFAULT NULL,
  `editor` int(11) DEFAULT NULL,
  `company` text NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `image`, `title`, `link`, `date`, `content`, `status`, `writer`, `editor`, `company`, `updated_at`, `created_at`) VALUES
(6, 'sample image', 'Sample Title', 'https://www.google.com/', '2023-12-10 15:45:33', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eius, rerum cum deleniti esse vel expedita. Veniam repellendus explicabo labore magnam nulla necessitatibus blanditiis nemo, quos quisquam similique dolores eum adipisci!', 0, 8, 8, 'Archintel', '2023-12-10 15:45:33', '2023-12-10 15:45:33'),
(7, 'sample image', 'Vue JS', 'https://vuejs.org/', '2023-12-10 23:48:24', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eius, rerum cum deleniti esse vel expedita. Veniam repellendus explicabo labore magnam nulla necessitatibus blanditiis nemo, quos quisquam similique dolores eum adipisci!', 1, 8, 8, 'Vue JS', '2023-12-10 15:48:06', '2023-12-10 15:48:06'),
(8, 'sample image', 'Sample Title', 'https://archintel.com', '2023-12-10 15:49:39', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odit alias sunt quos cum itaque delectus quae libero reiciendis ipsam cumque suscipit ducimus eveniet vitae quibusdam quam minus hic, laudantium doloremque!', 0, 7, 7, 'Archintel', '2023-12-10 15:49:39', '2023-12-10 15:49:39'),
(9, 'sample image', 'React JS', 'https://react.dev/', '2023-12-10 23:50:22', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odit alias sunt quos cum itaque delectus quae libero reiciendis ipsam cumque suscipit ducimus eveniet vitae quibusdam quam minus hic, laudantium doloremque!', 1, 7, 7, 'React JS', '2023-12-10 15:50:08', '2023-12-10 15:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '[Active = 1,Inactive = 0]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `type` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '[Active = 1,Inactive = 0]',
  `username` varchar(20) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `type`, `status`, `username`, `password`, `created_at`, `updated_at`) VALUES
(7, 'Elvis', 'Cayetano', 'Writer', 1, 'elvis', '$2y$12$GseC9HhUMvBKCGKDowuO7OgbXLvrvYn.tAsGRF38w6sVu1Jmg3qS2', '2023-12-10 05:55:31', '2023-12-10 05:55:31'),
(8, 'John', 'Reyes', 'Editor', 1, 'john', '$2y$12$QWegKBrp5Sev2gLAA3mO2.UBh0lTqyZ6dPsOxEL/52jw7SS4JeM.i', '2023-12-10 05:59:33', '2023-12-10 05:59:33'),
(9, 'James', 'Garcia', 'Editor', 0, 'james', '$2y$12$pIMcV3PKYDNs4GbYfhhc6eIvc9rBCfMxvSomswa3FEhVBAfkaFNIG', '2023-12-10 06:00:15', '2023-12-10 06:00:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
