-- --------------------------------------------------------
-- Host:                         172.18.0.1
-- Server version:               5.7.32 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.1.0.6116
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
/*!40000 ALTER TABLE `login_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_data` ENABLE KEYS */;

-- Dumping structure for table otp-form.sms_sent
DROP TABLE IF EXISTS `sms_sent`;
CREATE TABLE IF NOT EXISTS `sms_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` text NOT NULL,
  `message` text NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table otp-form.sms_sent: ~25 rows (approximately)
/*!40000 ALTER TABLE `sms_sent` DISABLE KEYS */;
INSERT INTO `sms_sent` (`id`, `mobile`, `user_id`, `otp`, `message`, `date_sent`) VALUES
	(1, 121212121, 10, 'Your OTP is: 4520', '', '2022-06-16 02:00:43'),
	(2, 121212121, 10, 'Your OTP is: 8222', '', '2022-06-16 02:01:32'),
	(3, 121212121, 10, 'Your OTP is: 4721', '', '2022-06-16 02:02:01'),
	(4, 121212121, 10, 'Your OTP is: 6030', '', '2022-06-16 02:02:44'),
	(5, 121212121, 10, 'Your OTP is: 1886', '', '2022-06-16 02:04:44'),
	(6, 121212121, 10, 'Your OTP is: 5733', '', '2022-06-16 02:07:08'),
	(7, 121212121, 10, 'Your OTP is: 9796', '', '2022-06-16 02:07:21'),
	(8, 121212121, 10, 'Your OTP is: 6614', '', '2022-06-16 02:08:12'),
	(9, 121212121, 10, 'Your OTP is: 7555', '', '2022-06-16 02:11:13'),
	(10, 121212121, 10, 'Your OTP is: 7976', '', '2022-06-16 02:13:19'),
	(11, 121212121, 10, 'Your OTP is: 1382', '', '2022-06-15 23:57:47'),
	(12, 121212121, 10, 'Your OTP is: 5727', '', '2022-06-15 23:58:01'),
	(13, 121212121, 10, '5780', 'Your OTP is: 5780', '2022-06-16 00:01:26'),
	(14, 121212121, 10, '3180', 'Your OTP is: 3180', '2022-06-16 00:02:49'),
	(15, 121212121, 10, '7608', 'Your OTP is: 7608', '2022-06-16 00:08:11'),
	(16, 121212121, 10, '3258', 'Your OTP is: 3258', '2022-06-16 00:08:51'),
	(17, 121212121, 10, '8344', 'Your OTP is: 8344', '2022-06-16 00:09:54'),
	(18, 121212121, 10, '1199', 'Your OTP is: 1199', '2022-06-16 00:10:29'),
	(19, 121212121, 10, '8523', 'Your OTP is: 8523', '2022-06-16 00:11:25'),
	(20, 121212121, 10, '5419', 'Your OTP is: 5419', '2022-06-16 00:12:50'),
	(21, 121212121, 10, '1803', 'Your OTP is: 1803', '2022-06-16 00:13:17'),
	(22, 121212121, 10, '6708', 'Your OTP is: 6708', '2022-06-16 00:14:21'),
	(23, 121212121, 10, '7793', 'Your OTP is: 7793', '2022-06-16 00:15:04'),
	(24, 121212121, 10, '3674', 'Your OTP is: 3674', '2022-06-16 00:15:58'),
	(25, 121212121, 10, '7055', 'Your OTP is: 7055', '2022-06-16 00:16:50'),
	(26, 121212121, 10, '7501', 'Your OTP is: 7501', '2022-06-16 00:19:43'),
	(27, 2147483647, 20, '7617', 'Your OTP is: 7617', '2022-06-16 00:32:57'),
	(28, 2147483647, 20, '4095', 'Your OTP is: 4095', '2022-06-16 00:37:23'),
	(29, 121212121, 10, '8023', 'Your OTP is: 8023', '2022-06-16 01:11:44'),
	(30, 2147483647, 30, '4239', 'Your OTP is: 4239', '2022-06-16 02:26:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table otp-form.users: ~5 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `email`, `mobile`, `password`, `otp`, `otp_expires`, `number_of_atempts`, `created_at`) VALUES
	(1, 'assendk@gmail.com', '0888', '123', NULL, NULL, NULL, '2022-06-15 23:19:18'),
	(6, 'aaa@aaaa.com', '088888888', '1111111', '8421', NULL, NULL, NULL),
	(8, 'bbbb@aaaa.com', '088888888', '1111111222', '4222', NULL, NULL, NULL),
	(9, 'dddd@ssss.sss', '08888888811', '22222222', '5967', NULL, NULL, NULL),
	(10, 'arr@11111.com', '121212121', '1111111111', '', NULL, NULL, NULL),
	(20, 'aaa@bbb.com', '3454365635', '12345', '', NULL, NULL, NULL),
	(21, 'Errrr', '45677899', '$2y$10$M9Egq1N/69JuZxnR2dnm0efdpPR97elavdhgZIaX3aR', NULL, NULL, NULL, NULL),
	(27, 'aaa@ssss.com', '359771899000', '$2y$10$dAw7CjzIGYOs4b7Xp0dXCuY5bLMeX1K1S.L5Ei65w9T', NULL, NULL, NULL, NULL),
	(28, 'ttt@sssss.ttt', '359771899001', '$2y$10$9Da6YNJSzXGWy3LZAj5vaOiXlX8gTUNCP978VcfELbs', NULL, NULL, NULL, NULL),
	(29, 'aaa@bbb.com', '359771899001', '$2y$10$U6zgfVisVvqXieELe/LG5OyC3hQs8M56L9fwPg6m73/', NULL, NULL, NULL, NULL),
	(30, 'aaa111@bbb.com', '359771899033', '$2y$10$t1/M6uCfoFmTV5sYaEEcWOdB3YebGjTllzt0nd0rGty', '', NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
