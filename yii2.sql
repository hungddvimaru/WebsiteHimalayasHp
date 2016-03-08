-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2016 at 07:10 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yii2`
--

-- --------------------------------------------------------

--
-- Table structure for table `yii2_hanghoa`
--

CREATE TABLE IF NOT EXISTS `yii2_hanghoa` (
  `id` int(11) NOT NULL,
  `tenhang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `duongdan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tinhtrang` enum('conhang','hethang') COLLATE utf8_unicode_ci DEFAULT NULL,
  `giaban` float DEFAULT NULL,
  `giacanhtranh` float DEFAULT NULL,
  `tomtat` text COLLATE utf8_unicode_ci,
  `mota` text COLLATE utf8_unicode_ci,
  `loaihang_id` int(11) NOT NULL,
  `mahang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thuonghieu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_yii2_hanghoa_yii2_loaihang_idx` (`loaihang_id`),
  KEY `fk_yii2_hanghoa_yii2_thuonghieu1_idx` (`thuonghieu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yii2_hinhanh`
--

CREATE TABLE IF NOT EXISTS `yii2_hinhanh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hanghoa_id` int(11) NOT NULL,
  `path` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_yii2_hanghoa1_idx` (`hanghoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yii2_loaihang`
--

CREATE TABLE IF NOT EXISTS `yii2_loaihang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenloai` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `duongdan` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nhomloaihang` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_yii2_loaihang_yii2_loaihang1_idx` (`nhomloaihang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `yii2_loaihang`
--

INSERT INTO `yii2_loaihang` (`id`, `tenloai`, `duongdan`, `nhomloaihang`) VALUES
(1, 'Trà nepal', 'tra-nepal', NULL),
(2, 'Ảnh Nepal', 'anh-nepal', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yii2_thuonghieu`
--

CREATE TABLE IF NOT EXISTS `yii2_thuonghieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `duongdan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yii2_user`
--

CREATE TABLE IF NOT EXISTS `yii2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Họ tên',
  `password_hash` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mật khẩu',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email',
  `password_reset_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '10',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `yii2_user`
--

INSERT INTO `yii2_user` (`id`, `username`, `password_hash`, `email`, `password_reset_token`, `auth_key`, `status`, `created_at`, `updated_at`) VALUES
(7, 'admin', '$2y$13$.uqTwcKASyYjxrz7IlF5fe8PJYC/leZsphrl4UlDShmk2e6KKASnu', 'ad@g.c', NULL, '90J9QEPBCXVev-pzLh05bJWuOH5hLfeM', 10, 1457323974, 1457323974);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `yii2_hanghoa`
--
ALTER TABLE `yii2_hanghoa`
  ADD CONSTRAINT `fk_yii2_hanghoa_yii2_loaihang` FOREIGN KEY (`loaihang_id`) REFERENCES `yii2_loaihang` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_yii2_hanghoa_yii2_thuonghieu1` FOREIGN KEY (`thuonghieu_id`) REFERENCES `yii2_thuonghieu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `yii2_hinhanh`
--
ALTER TABLE `yii2_hinhanh`
  ADD CONSTRAINT `fk_table1_yii2_hanghoa1` FOREIGN KEY (`hanghoa_id`) REFERENCES `yii2_hanghoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `yii2_loaihang`
--
ALTER TABLE `yii2_loaihang`
  ADD CONSTRAINT `fk_yii2_loaihang_yii2_loaihang1` FOREIGN KEY (`nhomloaihang`) REFERENCES `yii2_loaihang` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
