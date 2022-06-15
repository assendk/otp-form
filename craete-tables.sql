-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for otp-form
CREATE DATABASE IF NOT EXISTS `otp-form` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `otp-form`;

-- Dumping structure for table otp-form.login_data
DROP TABLE IF EXISTS `login_data`;
CREATE TABLE IF NOT EXISTS `login_data` (
  `login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_otp` int(6) NOT NULL,
  `last_activity` datetime NOT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table otp-form.login_data: ~0 rows (approximately)
DELETE FROM `login_data`;
/*!40000 ALTER TABLE `login_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_data` ENABLE KEYS */;

-- Dumping structure for table otp-form.sms_sent
DROP TABLE IF EXISTS `sms_sent`;
CREATE TABLE IF NOT EXISTS `sms_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` text NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table otp-form.sms_sent: ~0 rows (approximately)
DELETE FROM `sms_sent`;
/*!40000 ALTER TABLE `sms_sent` DISABLE KEYS */;
INSERT INTO `sms_sent` (`id`, `mobile`, `user_id`, `otp`, `date_sent`) VALUES
	(1, 121212121, 10, 'Your OTP is: 4520', '2022-06-16 02:00:43'),
	(2, 121212121, 10, 'Your OTP is: 8222', '2022-06-16 02:01:32'),
	(3, 121212121, 10, 'Your OTP is: 4721', '2022-06-16 02:02:01'),
	(4, 121212121, 10, 'Your OTP is: 6030', '2022-06-16 02:02:44'),
	(5, 121212121, 10, 'Your OTP is: 1886', '2022-06-16 02:04:44'),
	(6, 121212121, 10, 'Your OTP is: 5733', '2022-06-16 02:07:08'),
	(7, 121212121, 10, 'Your OTP is: 9796', '2022-06-16 02:07:21'),
	(8, 121212121, 10, 'Your OTP is: 6614', '2022-06-16 02:08:12'),
	(9, 121212121, 10, 'Your OTP is: 7555', '2022-06-16 02:11:13'),
	(10, 121212121, 10, 'Your OTP is: 7976', '2022-06-16 02:13:19');
/*!40000 ALTER TABLE `sms_sent` ENABLE KEYS */;

-- Dumping structure for table otp-form.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `otp_expires` datetime DEFAULT NULL,
  `number_of_atempts` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table otp-form.users: ~5 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `email`, `mobile`, `password`, `otp`, `otp_expires`, `number_of_atempts`, `created_at`) VALUES
	(1, 'assendk@gmail.com', '0888', '123', NULL, NULL, NULL, '2022-06-15 23:19:18'),
	(6, 'aaa@aaaa.com', '088888888', '1111111', '8421', NULL, NULL, NULL),
	(8, 'bbbb@aaaa.com', '088888888', '1111111222', '4222', NULL, NULL, NULL),
	(9, 'dddd@ssss.sss', '08888888811', '22222222', '5967', NULL, NULL, NULL),
	(10, 'arr@11111.com', '121212121', '1111111111', '7976', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
