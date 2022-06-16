-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.31 - MySQL Community Server (GPL)
-- Server OS:                    Linux
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
  `login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table otp-form.login_data: ~0 rows (approximately)
DELETE FROM `login_data`;
/*!40000 ALTER TABLE `login_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_data` ENABLE KEYS */;

-- Dumping structure for table otp-form.sms_sent
DROP TABLE IF EXISTS `sms_sent`;
CREATE TABLE IF NOT EXISTS `sms_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(128) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  `otp` text NOT NULL,
  `message` text NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table otp-form.sms_sent: ~10 rows (approximately)
DELETE FROM `sms_sent`;
/*!40000 ALTER TABLE `sms_sent` DISABLE KEYS */;
INSERT INTO `sms_sent` (`id`, `mobile`, `user_id`, `otp`, `message`, `date_sent`) VALUES
	(31, '359771899002', 31, '4145', 'Your OTP is: 4145', '2022-06-16 06:30:19'),
	(32, '359771899004', 34, '6325', 'Your OTP is: 6325', '2022-06-16 06:45:56'),
	(33, '359771899004', 34, '8374', 'Your OTP is: 8374', '2022-06-16 06:46:46'),
	(34, '359771899004', 34, '4969', 'Your OTP is: 4969', '2022-06-16 06:47:37'),
	(35, '359771899004', 34, '5164', 'Your OTP is: 5164', '2022-06-16 06:50:40'),
	(36, '359771899004', 34, '9282', 'Your OTP is: 9282', '2022-06-16 06:57:58'),
	(37, '359771899005', 35, '9759', 'Your OTP is: 9759', '2022-06-16 06:59:02'),
	(38, '3454365635', 20, '5530', 'Your OTP is: 5530', '2022-06-16 07:01:03'),
	(39, '359771899004', 34, '8786', 'Your OTP is: 8786', '2022-06-16 07:02:15'),
	(40, '359771899003', 32, '2423', 'Your OTP is: 2423', '2022-06-16 07:03:36');
/*!40000 ALTER TABLE `sms_sent` ENABLE KEYS */;

-- Dumping structure for table otp-form.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `password` varchar(1024) NOT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `otp_expires` datetime DEFAULT NULL,
  `number_of_atempts` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table otp-form.users: ~15 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `email`, `mobile`, `password`, `otp`, `otp_expires`, `number_of_atempts`, `created_at`) VALUES
	(1, 'assendk@gmail.com', '0888', '123', NULL, NULL, NULL, '2022-06-15 23:19:18'),
	(6, 'aaa@aaaa.com', '088888888', '1111111', '8421', NULL, NULL, NULL),
	(8, 'bbbb@aaaa.com', '088888888', '1111111222', '4222', NULL, NULL, NULL),
	(9, 'dddd@ssss.sss', '08888888811', '22222222', '5967', NULL, NULL, NULL),
	(10, 'arr@11111.com', '121212121', '1111111111', '', NULL, NULL, NULL),
	(20, 'aaa@bbb.com', '3454365635', '12345', '5530', NULL, NULL, NULL),
	(21, 'Errrr', '45677899', '$2y$10$M9Egq1N/69JuZxnR2dnm0efdpPR97elavdhgZIaX3aR', NULL, NULL, NULL, NULL),
	(27, 'aaa@ssss.com', '359771899000', '$2y$10$dAw7CjzIGYOs4b7Xp0dXCuY5bLMeX1K1S.L5Ei65w9T', NULL, NULL, NULL, NULL),
	(28, 'ttt@sssss.ttt', '359771899001', '$2y$10$9Da6YNJSzXGWy3LZAj5vaOiXlX8gTUNCP978VcfELbs', NULL, NULL, NULL, NULL),
	(29, 'aaa@bbb.com', '359771899001', '$2y$10$U6zgfVisVvqXieELe/LG5OyC3hQs8M56L9fwPg6m73/', '5530', NULL, NULL, NULL),
	(30, 'aaa111@bbb.com', '359771899033', '$2y$10$t1/M6uCfoFmTV5sYaEEcWOdB3YebGjTllzt0nd0rGty', '', NULL, NULL, NULL),
	(31, 'yyy@yyyy.com', '359771899002', '$2y$10$Z5x2evIY8jpBU3uuvMuBjeEvYYyTzBP4ZKx1pL/AArjzahz4WFzWC', NULL, NULL, NULL, NULL),
	(32, 'uuuuu@uuuu.vvvv', '359771899003', '$2y$10$9.9ONfZ3t42MnwpBmO2RbOHRpm0o/EqdR1dvXdiyKYar9AkIxHKNG', '2423', NULL, NULL, NULL),
	(34, 'qqq@qqqqq.www', '359771899004', '$2y$10$x1Svd6V0Pq8KZPm9ZgL0xu7Dv4Z9MlkFAs2qP1Xdw4Ewi2GPy8wU2', '8786', NULL, NULL, NULL),
	(35, 'hhhh@gfgfg.ggg', '359771899005', '$2y$10$W5gp1gqdF8T0HUpph8J/HuVrGtzHJaA4kxfp7JM97I5kntGRc9U3.', '9759', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
