-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 12:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `konten` varchar(255) DEFAULT NULL,
  `iktisar` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `konten`, `iktisar`) VALUES
(1, 'Pemrograman Python', 'John Smith', 'Elex Media Komputindo', 2015, 'Pengenalan Python, Tipe Data, Operator', 'Buku ini membahas tentang dasar-dasar pemrograman Python.'),
(2, 'Analisis Data dengan Python', 'Jane Doe', 'Gramedia Pustaka Utama', 2018, 'Pengenalan Analisis Data, Mengimport Library, Mengolah Data', 'Buku ini membahas tentang cara menganalisis data menggunakan Python.'),
(3, 'Machine Learning dengan Python', 'Bob Johnson', 'Andi Offset', 2020, 'Pengenalan Machine Learning, Mengenal Scikit-learn, Membuat Model', 'Buku ini membahas tentang cara membuat model machine learning menggunakan Python.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
