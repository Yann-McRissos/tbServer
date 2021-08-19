--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--
CREATE TABLE `wp_users` (
  `ID` bigint(20) DEFAULT NULL,
  `user_login` varchar(60) NOT NULL,
  `user_pass` varchar(64) NOT NULL,
  `user_nicename` varchar(50) DEFAULT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_url` varchar(100) NOT NULL,
  `user_activation_key` varchar(60) NOT NULL,
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL,
  `user_registered` datetime NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY `wp_users_user_email_uindex` (`user_email`),
  UNIQUE KEY `wp_users_user_login_uindex` (`user_login`),
  UNIQUE KEY `wp_users_user_nicename_uindex` (`user_nicename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

-- --------------------------------------------------------

--
-- Table structure for table `wp_twinings`
--
CREATE TABLE `wp_twinings` (
  `ID` bigint(20) auto_increment PRIMARY KEY,
  `academy_1` bigint(20) DEFAULT NULL,
  `academy_2` bigint(20) DEFAULT NULL,
  approved boolean
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
