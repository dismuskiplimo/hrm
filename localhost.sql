-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2018 at 10:57 AM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `essayhub_hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset_histories`
--

CREATE TABLE IF NOT EXISTS `asset_histories` (
  `id` int(10) unsigned NOT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `condition_before` text COLLATE utf8mb4_unicode_ci,
  `condition_after` text COLLATE utf8mb4_unicode_ci,
  `cleared` tinyint(1) NOT NULL DEFAULT '0',
  `cleared_by` int(11) DEFAULT NULL,
  `cleared_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_histories`
--

INSERT INTO `asset_histories` (`id`, `asset_id`, `user_id`, `assigned_by`, `condition_before`, `condition_after`, `cleared`, `cleared_by`, `cleared_at`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 1, 'Great', 'Great', 1, 1, '2018-06-04 03:50:49', '2018-06-04 03:47:16', '2018-06-04 03:50:49'),
(2, 1, 11, 1, 'Good', 'Marvelous', 1, 1, '2018-06-04 04:02:23', '2018-06-04 03:52:37', '2018-06-04 04:02:23'),
(3, 1, 11, 1, 'Good', NULL, 0, NULL, NULL, '2018-06-04 04:17:34', '2018-06-04 04:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(10) unsigned NOT NULL,
  `asset_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `assigned` tinyint(1) NOT NULL DEFAULT '0',
  `assigned_to` int(11) DEFAULT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `disposed` tinyint(1) NOT NULL DEFAULT '0',
  `disposed_by` int(11) DEFAULT NULL,
  `disposed_reason` text COLLATE utf8mb4_unicode_ci,
  `deletion_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `previous_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_type`, `brand`, `model`, `serial_number`, `description`, `assigned`, `assigned_to`, `assigned_by`, `assigned_at`, `disposed`, `disposed_by`, `disposed_reason`, `deletion_status`, `created_by`, `previous_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Television', 'Samsung', '32D6', 'ccddeee09', '<p>32 Inch TV</p>', 1, 11, 1, '2018-06-04 04:17:34', 0, NULL, NULL, 0, 1, 3, '2018-06-04 03:46:58', '2018-06-04 04:34:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE IF NOT EXISTS `attendances` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_status` tinyint(4) DEFAULT NULL,
  `leave_category_id` int(11) DEFAULT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `award_categories`
--

CREATE TABLE IF NOT EXISTS `award_categories` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `award_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE IF NOT EXISTS `bonuses` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bonus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_month` date NOT NULL,
  `bonus_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_types`
--

CREATE TABLE IF NOT EXISTS `client_types` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `client_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_types`
--

INSERT INTO `client_types` (`id`, `created_by`, `client_type`, `client_type_description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'sed', 'Repellendus voluptatem distinctio atque voluptas veritatis. Et amet non sapiente enim voluptates ut reprehenderit. Id ipsum ut nam magnam quaerat sequi praesentium. Occaecati dolore sapiente consequatur esse. Et tempore neque ipsam perferendis facere et.', 0, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:19'),
(2, 1, 'repellat', 'Voluptas vero quasi quam et sed. Maxime voluptatibus molestias non in veniam magni magnam. Quidem temporibus molestiae ipsam sint voluptatem. In architecto numquam quis aut ut.', 1, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:22'),
(3, 1, 'earum', 'Qui similique ea quisquam. Omnis qui molestiae totam ex omnis doloremque et. Ea doloribus ipsam corrupti accusantium id voluptas harum.', 0, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:07'),
(4, 1, 'qui', 'Autem autem dolorem quis sed iure. Exercitationem magnam illum eos ullam fugit. Unde quo tenetur omnis voluptatem qui minima.', 1, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:30'),
(5, 1, 'corporis', 'Minima voluptatem iusto unde aliquid in. Natus enim ad aut cum reprehenderit ex fugiat. Architecto est in cumque quia veniam dignissimos.', 1, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:00'),
(6, 1, 'est', 'Accusamus quae quisquam non doloribus nemo quisquam sunt. Nostrum a non perferendis consequuntur. Commodi et non aut earum autem molestiae veniam.', 0, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:38'),
(7, 1, 'quia', 'Dolorem porro est dicta eveniet. Odit totam sunt et. Error non possimus non accusantium harum. Molestiae est est consequatur eum alias nesciunt.', 0, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:26'),
(8, 1, 'sint', 'Aliquam aliquid totam quaerat illum nemo voluptatem. Soluta odit eligendi omnis beatae aliquam eum et hic. Ut debitis pariatur est quidem. Vitae nobis veritatis cum. Vel sit qui sit quia.', 0, 1, '2018-04-12 06:25:15', '2018-06-03 18:50:15'),
(9, 1, 'ut', 'Excepturi et excepturi quia sunt hic. Impedit incidunt ratione est velit.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:50:12'),
(10, 1, 'porro', 'Ad quia qui id nobis qui consequatur. Eos et enim itaque nihil quasi ipsa aut. Est veniam inventore in fugit facilis asperiores iusto. Non nihil aperiam nemo nostrum eos perferendis porro. Quas iusto qui cumque tempore.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:50:34'),
(11, 1, 'Long Term Client', '<p>Long Term Client</p>', 1, 0, '2018-06-03 18:51:03', '2018-06-03 18:51:03'),
(12, 1, 'Short Term Client', '<p>Short Term Client</p>', 1, 0, '2018-06-03 18:51:30', '2018-06-03 18:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE IF NOT EXISTS `deductions` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deduction_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_month` date NOT NULL,
  `deduction_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `created_by`, `department`, `department_description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lehner PLC', 'Aliquam earum eligendi soluta inventore sit nulla nisi. Tempora ut necessitatibus eos laborum rerum commodi. Blanditiis architecto rerum libero et nulla cupiditate. Cum doloremque laborum ab sunt et. Quam eligendi amet eius tempore nesciunt commodi. Enim distinctio autem et expedita non qui error est. Magni similique id quod. Exercitationem dolorum corrupti quos natus similique ut est rerum. Velit officia deleniti quaerat rerum vero veritatis. Officia magni assumenda aut nisi quae consectetur.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:52'),
(2, 1, 'Lehner-Walsh', 'Nemo in beatae alias voluptatem iste exercitationem et. Omnis temporibus aut et. Saepe iusto est pariatur sequi ea aut est recusandae. Temporibus cupiditate sapiente quia temporibus. Modi consequatur id sed quod ut earum repudiandae nam. Enim omnis sed quod sint nihil voluptatibus quia. Excepturi id ipsum qui quos enim. Reiciendis eos consequatur consequatur quia eius quidem. Doloremque itaque et repudiandae delectus natus est maxime.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:58'),
(3, 1, 'Senger-Wilkinson', 'Dolores dignissimos nam quo cupiditate veritatis. Expedita est vel debitis tenetur. Quas eius expedita amet et aut iusto quis esse. Rerum labore numquam cum. Eos delectus voluptatem fugit ad sed. Rem ipsam ut sed quidem error et. Repellat odio ad accusamus non. Ut aliquam quam voluptas sed. Soluta ab molestiae dolorem architecto voluptatum. Eaque soluta similique assumenda. Voluptas quaerat autem dolores. Unde molestiae vero quisquam recusandae exercitationem.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:48:04'),
(4, 1, 'Bahringer-Sauer', 'Aliquid sint sit explicabo laborum facilis. Nam numquam ut quos. Ut qui perspiciatis sit dolore. Et accusamus perferendis harum architecto sunt minima. Voluptatem voluptatem et explicabo quia aut consequatur. Ut quia vero molestiae earum quis odit. Et delectus quis excepturi temporibus dolor. Consequatur assumenda eligendi ex delectus debitis. Ea consequatur a vel sunt pariatur et sit. Est veniam aut quo ratione amet.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:27'),
(5, 1, 'Klein LLC', 'Omnis magnam facere earum. Corrupti tenetur beatae quod ut placeat. Qui et ut et aut vero. Nisi ea deserunt alias excepturi animi illum. Animi nulla fugiat itaque reprehenderit qui. Deleniti nulla et dolor id est. Facilis a non nostrum. Aperiam voluptatem delectus est ut est. Porro quia illo quia eos. Quas asperiores qui rerum temporibus tempore voluptatem. Pariatur repudiandae magnam voluptatibus. Unde incidunt ut vitae voluptas ipsum.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:33'),
(6, 1, 'Finance Department', '<p>Managing Company Finances</p>', 1, 1, '2018-06-03 18:48:40', '2018-06-05 19:19:38'),
(7, 1, 'HR Department', '<p>Managing HR</p>', 1, 1, '2018-06-03 18:49:09', '2018-06-05 19:19:29'),
(8, 1, 'ICT Department', '<p>For Managing ICT</p>', 1, 1, '2018-06-03 18:49:30', '2018-06-05 19:19:19'),
(9, 1, 'BOD', '<p>BOARD OF DIRECTORS</p>', 1, 0, '2018-06-05 19:20:03', '2018-06-05 19:20:03'),
(10, 1, 'DIRECTOR', '<p>DIRECTOR</p>', 1, 0, '2018-06-05 19:20:28', '2018-06-05 19:20:28'),
(11, 1, 'FINANCE', '<p>FINANCE<br></p>', 1, 0, '2018-06-05 19:20:59', '2018-06-05 19:20:59'),
(12, 1, 'HUMAN RESOURCE', '<p>HUMAN RESOURCE</p>', 1, 0, '2018-06-05 19:21:44', '2018-06-05 19:21:44'),
(13, 1, 'ICT & LIB', '<p>ICT operations<br></p>', 1, 0, '2018-06-05 19:49:01', '2018-06-05 19:49:01'),
(14, 1, 'ICT RESEARCH', '<p>ICT research   </p><p><br></p><p><br></p>', 1, 0, '2018-06-05 19:49:28', '2018-06-05 19:49:28');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `created_by`, `department_id`, `designation`, `designation_description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Hackett-Treutel', 'Fugiat nostrum itaque sapiente velit assumenda in aperiam eum. Consequatur temporibus sunt necessitatibus ut. Soluta eum veritatis magnam aut. Voluptatem laudantium est voluptates eveniet et. Velit dolore unde velit sunt neque ea perferendis recusandae. Ea quasi adipisci dolorum sit similique magni. Debitis eius voluptas doloribus repellendus. Sint sit corrupti ipsum molestiae architecto ut maiores nulla. Sint repellat est et et asperiores corrupti.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:06'),
(2, 1, 4, 'Satterfield-Cremin', 'Ea rem deleniti nostrum voluptatem. Et ducimus optio voluptatem ut consequatur. Dolorum sint eius asperiores non nihil. Molestias ex perspiciatis praesentium non. Et sint magni qui sed nostrum. Enim voluptatibus laborum eveniet debitis numquam consequatur. Praesentium accusantium eveniet ut omnis earum facilis dolores. Ipsum iusto quod ratione eos in aspernatur.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:37'),
(3, 1, 3, 'Kuvalis-Mitchell', 'Tempore quod molestias sed velit vel quas. Qui quisquam fuga in ducimus error dolor. Qui ut officiis occaecati voluptates dolore. Sit est consequatur provident. Eos tempore adipisci at nisi voluptatem commodi. Deserunt neque officiis harum ipsa nostrum. Ut vel non exercitationem cum laboriosam. Dolorum enim est maxime quia adipisci. Praesentium quis aut harum. Ea error et dolorem id sunt. Aut laborum quibusdam eum quis. Asperiores quia aut eum quod quaerat architecto harum.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:25'),
(4, 1, 5, 'Kirlin, Reinger and Haag', 'Doloremque consequatur accusantium molestiae dolores odio. Eos vero rem architecto et ea veniam provident. Porro qui illo ad assumenda. Illum at deserunt quod qui non consequatur veritatis. Tempore deserunt architecto tempore molestiae provident et odio. Consectetur quia similique ea non nostrum et. Distinctio iste quam porro dolorem ut pariatur aut.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:17'),
(5, 1, 3, 'Towne, Jerde and Littel', 'Consequatur eligendi modi consequatur eligendi. Perferendis laborum voluptas ipsum distinctio numquam. Non illo hic alias repudiandae at atque itaque in. Et ipsam nulla et voluptatem illo illo aut sequi. Maxime cumque eos tenetur est. Qui dolores fugit nihil modi inventore. Adipisci sint at cumque consequatur ullam. Optio est qui laudantium fugiat architecto minus. Earum eveniet nam ut sunt enim. Facere reprehenderit aut doloribus. Qui labore qui velit voluptatem dolores distinctio harum.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:47'),
(6, 1, 3, 'Kovacek-Barrows', 'Aperiam earum eius quia deleniti voluptatem. Quam omnis dolor asperiores rem quasi reiciendis minima. Cupiditate impedit perferendis quis quia voluptatum quasi necessitatibus. Omnis et quo porro. Sit possimus voluptatem natus officia totam in. Quam voluptas quis ipsa et. Saepe quo et aliquid unde ratione et est. Quia libero rerum blanditiis voluptatem qui ducimus. Consectetur eum ut nisi tempore consequatur et expedita.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:21'),
(7, 1, 2, 'Hudson Inc', 'Repellat quasi soluta fugiat nobis. Aut aliquam qui atque optio autem ex. Voluptates quis atque culpa molestias temporibus. Vitae commodi atque nulla sed perferendis quam ut. Adipisci ut placeat aperiam ratione itaque. Nulla velit omnis accusamus delectus voluptatibus. Blanditiis vel aut aperiam incidunt. Ducimus nulla illo dolorem quia commodi. Assumenda illo dolorem voluptatem. Iste nihil quia voluptatem vero sunt veniam. Dolorem suscipit repellat veniam dicta.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:11'),
(8, 1, 4, 'Schmitt Group', 'Ipsam qui est numquam. Magnam qui in at at eum laudantium. Eum possimus et mollitia explicabo quibusdam excepturi expedita. Iusto nihil vero aspernatur esse ab alias occaecati aut. Ut id voluptatibus sunt ut at cupiditate. Vero quo quia at cumque consectetur. Exercitationem pariatur est debitis quam exercitationem pariatur qui. Magnam reiciendis magnam voluptatum aspernatur. Fugiat omnis ipsum veniam qui itaque modi qui. Fugiat soluta autem qui voluptatum est.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:43'),
(9, 1, 3, 'O''Conner-Hilll', 'Accusamus et tempora soluta quia saepe. Praesentium commodi praesentium voluptas eum aut eos. Eveniet qui eius rerum hic pariatur. Sint optio quae eveniet vel corrupti dolores. Qui asperiores non porro ullam odio. Quae libero quam blanditiis culpa odio consequatur sit. Rerum voluptates sit repellendus quas quis cum atque. Velit sit eius deleniti enim asperiores minima. Molestias consequatur soluta eius et ducimus harum et.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:29'),
(10, 1, 2, 'Predovic Group', 'Quaerat voluptas consequuntur esse quibusdam. Repellendus fugit sequi aperiam. Ut hic qui veniam explicabo. Magnam omnis ullam sit quia. Aut ut omnis quisquam repudiandae aut. Voluptatem dolorem praesentium vel et aperiam qui. Nihil non ut aut dignissimos ex error. Similique facere asperiores et ullam in possimus at. Dolor illo perspiciatis molestias repudiandae voluptas pariatur. Laboriosam autem vel commodi ipsum tempora non harum expedita.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:33'),
(11, 1, 6, 'Senior Finance Officer', '<p>Senior Finance Officer</p>', 1, 0, '2018-06-03 18:53:28', '2018-06-03 18:53:28'),
(12, 1, 7, 'Principal Human Resource Manager', '<p>Principan HRM</p>', 1, 0, '2018-06-03 18:54:21', '2018-06-03 18:54:21'),
(13, 1, 13, 'senior ICT', '<p>ICT<br></p>', 1, 0, '2018-06-05 19:50:14', '2018-06-05 19:50:14'),
(14, 1, 13, 'HEAD ICT', '<p>ICT<br></p>', 1, 0, '2018-06-05 19:51:47', '2018-06-05 19:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `employee_awards`
--

CREATE TABLE IF NOT EXISTS `employee_awards` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `award_category_id` int(11) NOT NULL,
  `gift_item` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `select_month` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expence_managements`
--

CREATE TABLE IF NOT EXISTS `expence_managements` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchased_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchased_date` date NOT NULL,
  `amount_spent` int(11) NOT NULL,
  `purchased_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) DEFAULT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `folder_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE IF NOT EXISTS `general_settings` (
  `id` int(10) unsigned NOT NULL,
  `updated_by` int(11) NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `holiday_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE IF NOT EXISTS `leave_applications` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `leave_category_id` int(11) NOT NULL,
  `leave_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `last_leave_date` date DEFAULT NULL,
  `last_leave_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_leave_category_id` int(11) DEFAULT NULL,
  `during_leave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL DEFAULT '0',
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `created_by`, `approved_by`, `leave_category_id`, `leave_address`, `start_date`, `end_date`, `last_leave_date`, `last_leave_period`, `last_leave_category_id`, `during_leave`, `reason`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 11, NULL, 3, '<p>sdfsdf</p><p>asdf</p><p>asdf&nbsp;</p>', '2018-06-03', '2018-06-14', '2018-06-01', '6 Days', 2, 'Denno', '<p>sdfasdf asdfaf asdf</p>', 1, 0, '2018-06-03 20:42:11', '2018-06-03 20:42:58'),
(2, 1, NULL, 2, NULL, '2018-06-03', '2018-06-03', NULL, '6', NULL, 'Denno', '<p>ad asdas d</p>', 1, 0, '2018-06-03 20:48:30', '2018-06-03 20:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `leave_categories`
--

CREATE TABLE IF NOT EXISTS `leave_categories` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `leave_category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_category_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_categories`
--

INSERT INTO `leave_categories` (`id`, `created_by`, `leave_category`, `leave_category_description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Paternity', 'Paternity Leave', 1, 0, '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(2, 1, 'Maternity', 'Maternity Leave', 1, 0, '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(3, 1, 'Annual', 'Annual Leave', 1, 0, '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(4, 1, 'Casual', 'Casual Leave', 1, 0, '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(5, 1, 'Off', 'Off', 1, 0, '2018-06-03 00:00:00', '2018-06-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE IF NOT EXISTS `loans` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `loan_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_installments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remaining_installments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_10_16_064138_create_client_types_table', 1),
(4, '2017_10_16_072245_create_designations_table', 1),
(5, '2017_11_11_090618_create_general_settings_table', 1),
(6, '2017_11_17_083029_create_files_table', 1),
(7, '2017_11_17_083147_create_folders_table', 1),
(8, '2017_12_29_092609_create_departments_table', 1),
(9, '2017_12_29_114115_create_leave_categories_table', 1),
(10, '2017_12_29_124702_create_attendances_table', 1),
(11, '2017_12_29_185757_create_working_days_table', 1),
(12, '2017_12_29_215610_create_holidays_table', 1),
(13, '2017_12_29_233919_create_personal_events_table', 1),
(14, '2017_12_30_161317_create_payrolls_table', 1),
(15, '2017_12_30_174811_create_notices_table', 1),
(16, '2017_12_31_185730_create_leave_applications_table', 1),
(17, '2018_01_03_081227_create_bonuses_table', 1),
(18, '2018_01_03_104224_create_deductions_table', 1),
(19, '2018_01_03_114151_create_loans_table', 1),
(20, '2018_01_03_153120_create_expence_managements_table', 1),
(21, '2018_01_04_061104_create_salary_payments_table', 1),
(22, '2018_01_04_173403_create_award_categories_table', 1),
(23, '2018_01_05_164319_create_employee_awards_table', 1),
(24, '2018_02_03_073729_entrust_setup_tables', 1),
(25, '2018_03_24_100116_create_salary_payment_details_table', 1),
(33, '2018_06_04_004009_create_assets_table', 2),
(34, '2018_06_04_022029_create_asset_histories_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `notice_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `created_by`, `notice_title`, `description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Party', '<p>Details...</p>', 1, 0, '2018-04-16 05:59:04', '2018-04-16 05:59:04'),
(2, 1, 'Test', '<p>Test notice&nbsp;</p>', 1, 0, '2018-06-05 07:54:45', '2018-06-05 07:54:45'),
(3, 1, 'directors tea', '<p>directors tea test</p>', 1, 0, '2018-06-05 15:16:24', '2018-06-05 15:16:24'),
(4, 1, 'test', '<p><img alt="" src="https://images.template.net/wp-content/uploads/2015/07/Letter-of-Notification-of-Filming-Sample.jpg"><br></p>', 1, 0, '2018-06-05 19:10:02', '2018-06-05 19:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE IF NOT EXISTS `payrolls` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_type` tinyint(4) NOT NULL COMMENT '1 for Provision & 2 for Permanent',
  `basic_salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_rent_allowance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_allowance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special_allowance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provident_fund_contribution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_allowance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_deduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provident_fund_deduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_deduction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `created_by`, `user_id`, `employee_type`, `basic_salary`, `house_rent_allowance`, `medical_allowance`, `special_allowance`, `provident_fund_contribution`, `other_allowance`, `tax_deduction`, `provident_fund_deduction`, `other_deduction`, `activation_status`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 2, '35000', '10000', '1000', '0', '0', '0', '16000', '0', '0', 0, '2018-06-03 21:40:57', '2018-06-05 07:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(16, 1),
(17, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(7, 2),
(9, 2),
(23, 2),
(25, 2),
(26, 2),
(28, 2),
(30, 2),
(32, 2),
(33, 2),
(7, 3),
(9, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 4),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(32, 4),
(33, 4);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'hrm-setting', 'HRM Setting', 'HRM Setting', '2018-04-12 06:29:04', '2018-04-12 06:29:04'),
(2, 'role', 'Role Setting', 'Role Setting Details', '2018-04-12 06:29:04', '2018-04-12 06:29:04'),
(3, 'people', 'People', 'People', '2018-04-12 06:29:04', '2018-04-12 06:29:04'),
(4, 'manage-employee', 'Manage employee', 'Manage employee', '2018-04-12 06:29:04', '2018-04-12 06:29:04'),
(5, 'manage-clients', 'Manage clients', 'Manage clients', '2018-04-12 06:29:04', '2018-04-12 06:29:04'),
(6, 'manage-references', 'Manage references', 'Manage references', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(7, 'file-upload', 'File Upload', 'File Upload', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(8, 'sms', 'SMS', 'SMS', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(9, 'payroll-management', 'Payroll Management', 'Payroll Management', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(10, 'manage-salary', 'Manage Salary', 'Manage Salary', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(11, 'salary-list', 'Salary List', 'Salary List', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(12, 'make-payment', 'Make Payment', 'Make Payment', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(13, 'generate-payslip', 'Generate Payslip', 'Generate Payslip', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(14, 'manage-bonus', 'Manage Bonus', 'Manage Bonus', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(15, 'manage-deduction', 'Manage Deduction', 'Manage Deduction', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(16, 'loan-management', 'Loan Management', 'Loan Management', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(17, 'provident-fund', 'Provident Fund', 'Provident Fund', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(18, 'attendance-management', 'Attendance Management', 'Attendance Management', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(19, 'manage-attendance', 'Manage Attendance ', 'Manage Attendance', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(20, 'attendance-report', 'Attendance Report', 'Attendance Report', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(21, 'manage-expense', 'Manage Expense', 'Manage Expense', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(22, 'manage-award', 'Manage Award', 'Manage Award', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(23, 'leave-application', 'Leave Application', 'Leave Application', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(24, 'manage-leave-application', 'Manage Leave Application List', 'Application List', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(25, 'my-leave-application', 'My Leave Application List', 'Application List', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(26, 'notice', 'Notice', 'Notice', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(27, 'manage-notice', 'Manage Notice', 'Manage Notice', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(28, 'notice-board', 'Notice Board', 'Notice Board', '2018-04-12 06:29:05', '2018-04-12 06:29:05'),
(29, 'leave-reports', 'Leave Reports', 'Leave Reports', NULL, NULL),
(30, 'assets', 'Assets', 'Manage Assets', '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(31, 'asset-management', 'Manage Assets', 'Manage Assets', '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(32, 'my-assets', 'My Assets', 'View My Assets', '2018-06-03 00:00:00', '2018-06-03 00:00:00'),
(33, 'view-my-payslips', 'View My Payslips', 'View My Payslips', '2018-06-04 00:00:00', '2018-06-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `personal_events`
--

CREATE TABLE IF NOT EXISTS `personal_events` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `personal_event` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_event_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_events`
--

INSERT INTO `personal_events` (`id`, `created_by`, `personal_event`, `personal_event_description`, `start_date`, `end_date`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Party', '<p>details...</p>', '2018-06-04', '2018-06-04', 1, 0, '2018-04-16 05:45:40', '2018-04-16 05:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(13, 2),
(11, 3),
(12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Superadmin', 'Superadmin Details', '2018-04-12 06:35:05', '2018-04-12 06:35:05'),
(2, 'employee', 'Employee', 'Employee Details...', '2018-04-16 05:47:29', '2018-04-16 05:47:29'),
(3, 'team-leader', 'Team Leader', 'Team Leader', '2018-06-03 19:00:50', '2018-06-03 19:00:50'),
(4, 'human-resource', 'Human Resource', 'Human Resource', '2018-06-03 19:02:31', '2018-06-03 19:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payment_details`
--

CREATE TABLE IF NOT EXISTS `salary_payment_details` (
  `id` int(10) unsigned NOT NULL,
  `salary_payment_id` int(10) unsigned NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_payment_details`
--

INSERT INTO `salary_payment_details` (`id`, `salary_payment_id`, `item_name`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic Salary', 35000, 'credits', '2018-06-03 21:41:50', '2018-06-03 21:41:50'),
(2, 1, 'Tax Deduction', 16000, 'debits', '2018-06-03 21:41:50', '2018-06-03 21:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payments`
--

CREATE TABLE IF NOT EXISTS `salary_payments` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gross_salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_deduction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provident_fund` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_month` date NOT NULL,
  `payment_type` tinyint(4) NOT NULL COMMENT '1 for cash payment, 2 for chaque payment & 3 for bank payment',
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_payments`
--

INSERT INTO `salary_payments` (`id`, `created_by`, `user_id`, `gross_salary`, `total_deduction`, `net_salary`, `provident_fund`, `payment_amount`, `payment_month`, `payment_type`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 11, '35000.00', '16000.00', '19000', '0', '19000', '2018-06-01', 2, NULL, '2018-06-03 21:41:50', '2018-06-03 21:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spouse_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `present_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `academic_qualification` text COLLATE utf8mb4_unicode_ci,
  `professional_qualification` text COLLATE utf8mb4_unicode_ci,
  `joining_date` date DEFAULT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `reference` text COLLATE utf8mb4_unicode_ci,
  `id_name` tinyint(4) DEFAULT NULL COMMENT '1 for NID, 2 Passport, 3 for Driving License',
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no_one` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no_two` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `marital_status` tinyint(4) DEFAULT NULL COMMENT '1 for Married, Single, 3 for Divorced, 4 for Separated, 5 for Widowed',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_type_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `joining_position` int(11) DEFAULT NULL,
  `access_label` tinyint(4) NOT NULL COMMENT '1 for superadmin, 2 for associates, 3 for employees, 4 for references and 5 for clients',
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_status` tinyint(4) NOT NULL DEFAULT '0',
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_by`, `employee_id`, `name`, `father_name`, `mother_name`, `spouse_name`, `email`, `password`, `present_address`, `permanent_address`, `home_district`, `academic_qualification`, `professional_qualification`, `joining_date`, `experience`, `reference`, `id_name`, `id_number`, `contact_no_one`, `contact_no_two`, `emergency_contact`, `web`, `gender`, `date_of_birth`, `marital_status`, `avatar`, `client_type_id`, `designation_id`, `joining_position`, `access_label`, `role`, `activation_status`, `deletion_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Hanna Kunde', NULL, NULL, NULL, 'admin@mail.com', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '517 Macejkovic Wells Apt. 548\nHermistonshire, SD 06403-7926', '340 Macejkovic Motorway\nMabellebury, MA 81057-0585', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '824.291.3043 x7421', NULL, NULL, 'http://feeney.com/id-dolor-ea-omnis-animi-recusandae-est-sit-repellat.html', 'm', '1988-04-04', NULL, NULL, 9, 8, NULL, 1, NULL, 1, 0, 'DqKmVIWnITcvLKg7NviEhvI7inYPLGmuUP1VHcEcCZyiATeNGHy2uWLjfC9p', '2018-04-12 06:25:15', '2018-04-12 06:25:15'),
(2, 1, 'EMP002', 'Walker Bruen', NULL, NULL, NULL, 'employee@mail.com', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '1590 Aurelie Burgs Suite 152West Jacky, DE 37148', '6460 Liana RapidMitchellborough, AK 31990-5659', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+1-974-253-1987', NULL, NULL, 'http://www.kutch.com/voluptatem-commodi-nemo-fugit-sit-consequatur.html', 'f', '1979-08-02', NULL, NULL, 1, 1, 9, 2, '2', 0, 1, 'BIHahWNnaFRjguGemgUX6B75xmrBA4epl0fu6tDJasNCYiMTuKaVjnatk0kk', '2018-04-12 06:25:15', '2018-06-03 19:04:29'),
(3, 1, 'EMP001', 'Vickie Spinka Jr.', NULL, NULL, NULL, 'maribel41@example.com', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '91446 Klocko EstatesSouth Janessafurt, MD 61067', '324 Terence Turnpike Apt. 931Loramouth, SD 34653', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+1 (320) 649-7292', NULL, NULL, 'http://rau.biz/', 'm', '2000-10-26', NULL, NULL, 9, 1, 7, 2, '2', 0, 1, 'yxyMUdJSvv', '2018-04-12 06:25:15', '2018-06-03 19:04:23'),
(4, 1, 'EMP005', 'Gardner Monahan', NULL, NULL, NULL, 'chane@example.net', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '7139 Garfield LakeNorth Myriamhaven, CT 89046-9484', '34976 Reina SquaresFritschfurt, VT 55974-7608', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1-295-300-8852 x205', NULL, NULL, 'http://www.johnston.com/dicta-totam-magni-dolores-tempora-ut.html', 'f', '1983-04-22', NULL, NULL, 9, 7, 7, 2, '2', 0, 1, 'XWLyMxPOsQ', '2018-04-12 06:25:15', '2018-06-03 19:04:52'),
(5, 1, 'EMP004', 'Helmer Hoppe', NULL, NULL, NULL, 'arely.abernathy@example.com', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '569 Orville MeadowMadisynhaven, AR 01396-7614', '5349 Wyman Dale Apt. 806West Sagebury, KY 93033-6522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '567-242-4527', NULL, NULL, 'http://www.kirlin.com/ut-eos-inventore-mollitia-culpa-et', 'f', '1982-06-04', NULL, NULL, 5, 7, 7, 2, '2', 0, 1, 'DT05ECIxMr', '2018-04-12 06:25:15', '2018-06-03 19:04:43'),
(6, 1, 'EMP003', 'Elfrieda Ebert', NULL, NULL, NULL, 'qjohns@example.net', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '588 Alvina Mission Apt. 582Greenmouth, NH 83483', '23376 Strosin HighwayHintzland, NE 52182', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '952-705-2185 x6200', NULL, NULL, 'http://www.nienow.com/dicta-dolorem-pariatur-voluptas-voluptatibus-officiis-et', 'f', '1984-01-20', NULL, NULL, 6, 9, 9, 2, '2', 0, 1, 'Z5IcPYj5tR', '2018-04-12 06:25:15', '2018-06-03 19:04:37'),
(7, 1, NULL, 'Amara Wiegand', NULL, NULL, NULL, 'pwolff@example.org', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '5868 Kiehn Turnpike Suite 391\nEdythborough, WI 28156', '50374 Estrella Falls\nJohnnieport, OH 99467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+1-216-840-4298', NULL, NULL, 'http://www.rogahn.com/', 'm', '1996-07-22', NULL, NULL, 10, 4, NULL, 4, NULL, 0, 1, '1e1RA6AbVg', '2018-04-12 06:25:15', '2018-04-12 06:25:15'),
(8, 1, NULL, 'Dr. Rey Eichmann', NULL, NULL, NULL, 'emaggio@example.org', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '86384 Helga Lakes\nCormierton, GA 99066', '6460 Kieran Place Suite 387\nLake Einar, UT 11733-9184', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1-624-402-9842', NULL, NULL, 'http://pfannerstill.com/', 'm', '1983-10-23', NULL, NULL, 3, 1, NULL, 4, NULL, 0, 1, 'uetBpPUya9', '2018-04-12 06:25:15', '2018-04-12 06:25:15'),
(9, 1, NULL, 'Mr. Maximus Kemmer III', NULL, NULL, NULL, 'katlyn09@example.org', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '76755 Reichert Springs Suite 346\nPort Erna, HI 04987-0316', '98035 Madge Spurs\nNew Toneymouth, WI 36349', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '495.244.3979', NULL, NULL, 'http://www.ondricka.biz/voluptatem-ut-cumque-omnis-ratione-porro-qui-quam-sed.html', 'm', '1988-05-16', NULL, NULL, 4, 8, NULL, 5, NULL, 0, 1, 'C7qfVDIRJK', '2018-04-12 06:25:15', '2018-06-03 19:06:32'),
(10, 1, NULL, 'Cordia McKenzie', NULL, NULL, NULL, 'qwaelchi@example.org', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '59738 Frida Inlet\nWest Ila, ME 40525-0980', '29684 Cartwright Forks\nNew Caleighport, NV 59445', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1-536-557-3274 x22497', NULL, NULL, 'http://www.huel.com/maxime-itaque-non-quia-debitis-error-omnis.html', 'f', '1977-04-23', NULL, NULL, 4, 6, NULL, 5, NULL, 0, 1, 'N1rsygfZof', '2018-04-12 06:25:15', '2018-04-12 06:25:15'),
(11, 1, '56', 'Ian Tom', 'Cornelius Rotich', 'Peris Rotich', 'Rachael Njuguna', 'abc@gmail.com', '$2y$10$1o0GaHxKDulfaMNxYzkBMOUs8KIW87V5PyaMWdTWANgGFg7VCSjLC', '44394-00100 Nairobi', '44394-00100 Nairobi', 'Kajiado', '<p>Degree</p><p>KCSE</p>', '<p>CCNA</p><p>CISCO</p>', '2018-06-20', '<p>NONE</p>', '<p>BUDA</p><p>MATHE</p>', 1, '30071699', '07200000000', NULL, '07200000000', 'www.gmail.com', 'm', '1992-07-10', 1, NULL, NULL, 11, 11, 2, '3', 0, 0, 'baE8R06kBzfUyfFKErZ6q2fD3nEQ6vpBjv2r7gI01EvtTmr5X3RBbxG3PKLH', '2018-06-03 18:42:17', '2018-06-05 08:07:10'),
(12, 1, '1234', 'Huhu', NULL, NULL, NULL, 'Huhu@gmail.com', '$2y$10$agVqJlbOXQoo4OdV.0ePNed3.v5aonvE3HR2uKM7/YHOitR4RmwCO', '16912', NULL, NULL, NULL, NULL, '2018-06-01', NULL, NULL, NULL, NULL, '123445', NULL, NULL, NULL, 'm', '2018-06-04', 3, NULL, NULL, 11, 11, 2, 'team-leader', 0, 0, 'G9hX3q5i3xZcCbz8tHjJWtnxEELBWFmnYNkBuLUl0L205Eh6P3te2YejqZC1', '2018-06-05 08:00:05', '2018-06-05 08:00:05'),
(13, 1, '0931', 'tama', NULL, NULL, NULL, 'tama.leve@kirdi.go.ke', '$2y$10$4bFI4gNAdYLetb9.Gjx0tOUpEWgj2jlQWTrg7E.5URu.TrLewvcNe', 'south C', NULL, NULL, NULL, NULL, '2018-05-01', NULL, NULL, NULL, NULL, '0773111889', NULL, NULL, NULL, 'm', '2018-06-05', NULL, NULL, NULL, 14, 13, 2, '2', 0, 0, NULL, '2018-06-05 19:46:32', '2018-06-05 19:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

CREATE TABLE IF NOT EXISTS `working_days` (
  `id` int(10) unsigned NOT NULL,
  `updated_by` int(11) NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_status` tinyint(4) NOT NULL COMMENT '0 for holiday & 1 for working day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `working_days`
--

INSERT INTO `working_days` (`id`, `updated_by`, `day`, `working_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fri', 1, '2018-04-12 06:25:16', '2018-06-03 18:43:13'),
(2, 1, 'Sat', 1, '2018-04-12 06:25:16', '2018-06-03 18:43:13'),
(3, 1, 'Sun', 0, '2018-04-12 06:25:17', '2018-06-03 18:43:13'),
(4, 1, 'Mon', 1, '2018-04-12 06:25:17', '2018-06-03 18:43:13'),
(5, 1, 'Tue', 1, '2018-04-12 06:25:17', '2018-06-03 18:43:13'),
(6, 1, 'Wed', 1, '2018-04-12 06:25:17', '2018-06-03 18:43:13'),
(7, 1, 'Thu', 1, '2018-04-12 06:25:17', '2018-06-03 18:43:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset_histories`
--
ALTER TABLE `asset_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award_categories`
--
ALTER TABLE `award_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_types`
--
ALTER TABLE `client_types`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `client_types_client_type_unique` (`client_type`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `departments_department_unique` (`department`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `designations_designation_unique` (`designation`);

--
-- Indexes for table `employee_awards`
--
ALTER TABLE `employee_awards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expence_managements`
--
ALTER TABLE `expence_managements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_categories`
--
ALTER TABLE `leave_categories`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `leave_categories_leave_category_unique` (`leave_category`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`), ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `personal_events`
--
ALTER TABLE `personal_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`), ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `salary_payment_details`
--
ALTER TABLE `salary_payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset_histories`
--
ALTER TABLE `asset_histories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `award_categories`
--
ALTER TABLE `award_categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `client_types`
--
ALTER TABLE `client_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `employee_awards`
--
ALTER TABLE `employee_awards`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expence_managements`
--
ALTER TABLE `expence_managements`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `leave_categories`
--
ALTER TABLE `leave_categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `personal_events`
--
ALTER TABLE `personal_events`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `salary_payment_details`
--
ALTER TABLE `salary_payment_details`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `salary_payments`
--
ALTER TABLE `salary_payments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `essayhub_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_levels`
--

CREATE TABLE IF NOT EXISTS `academic_levels` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `academic_levels`
--

INSERT INTO `academic_levels` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'High School', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(2, 'Undergraduate/Bachelor', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(3, 'Masters', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(4, 'PHD', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignment_types`
--

CREATE TABLE IF NOT EXISTS `assignment_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '10',
  `min_duration` int(11) NOT NULL DEFAULT '12',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assignment_types`
--

INSERT INTO `assignment_types` (`id`, `name`, `price`, `min_duration`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Essay', 12, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(2, 'Admission / Scholarship Essay', 12, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(3, 'Research paper', 10, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(4, 'Research Proposal', 10, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(5, 'Coursework', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(6, 'Term paper', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(7, 'Article', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(8, 'Literature / Movie review', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(9, 'Report', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(10, 'Dissertation', 10, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(11, 'Thesis', 18, 24, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(12, 'Thesis Proposal', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(13, 'Creative writing', 12, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(14, 'Business plan', 16, 24, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(15, 'Speech / Presentation', 12, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(16, 'Outline', 12, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(17, 'Annotated Bibliography', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(18, 'Dissertation Proposal', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(19, 'Proofreading', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(20, 'Paraphrasing', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(21, 'Powerpoint Presentation', 14, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(22, 'Personal Statement', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(23, 'Non-word Assignment', 10, 10, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(24, 'Math Assignment', 18, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(25, 'Lab Report', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(26, 'Code', 16, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(27, 'Case Study', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(28, 'Other type', 14, 12, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE IF NOT EXISTS `assignments` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `assignment_type_id` int(11) NOT NULL,
  `sub_discipline_id` int(11) NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci NOT NULL,
  `pages` int(11) NOT NULL,
  `deadline` timestamp NULL DEFAULT NULL,
  `price` double(12,2) DEFAULT NULL,
  `type_of_service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `academic_level_id` int(11) NOT NULL,
  `format_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `writer_id` int(11) DEFAULT '0',
  `status` enum('AUCTION','PROGRESS','COMPLETE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'AUCTION',
  `bids` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `title`, `assignment_type_id`, `sub_discipline_id`, `instructions`, `pages`, `deadline`, `price`, `type_of_service`, `academic_level_id`, `format_id`, `user_id`, `writer_id`, `status`, `bids`, `views`, `created_at`, `updated_at`, `deleted_at`, `assigned_at`, `completed_at`) VALUES
(8, 'strength of materials ', 5, 34, 'please text me if you understand the discipline ', 2, '2018-05-15 13:59:22', 20.00, 'Custom writing', 2, 1, 506, 0, 'AUCTION', 3, 12, '2018-05-14 11:00:50', '2018-05-16 23:52:39', NULL, NULL, NULL),
(9, 'Philosophy, plato ', 6, 30, 'hello, please text me if you are good in this area', 2, '2018-05-15 14:06:27', 50.00, 'Custom writing', 1, 2, 503, 505, 'COMPLETE', 1, 4, '2018-05-14 11:07:44', '2018-05-16 23:52:57', NULL, '2018-05-14 11:11:38', '2018-05-14 11:43:35'),
(10, 'Physicis - energy ', 7, 6, 'please let me get someone good in this field ', 2, '2018-05-15 14:15:04', 30.00, 'Custom writing', 2, 5, 503, 505, 'PROGRESS', 1, 7, '2018-05-14 11:15:58', '2018-05-16 23:57:55', NULL, '2018-05-14 11:17:16', NULL),
(11, 'Caleb test', 28, 3, 'please ', 2, '2018-05-15 15:07:17', 25.00, 'Editing', 2, 2, 503, 508, 'PROGRESS', 2, 7, '2018-05-14 12:08:09', '2018-05-21 08:49:16', NULL, '2018-05-14 16:56:36', NULL),
(12, 'Caleebson test', 1, 20, 'test, bid if you are well in this topic', 4, '2018-05-16 02:16:25', 20.00, 'Custom writing', 2, 2, 503, 513, 'COMPLETE', 2, 10, '2018-05-14 23:18:01', '2018-05-14 23:38:47', NULL, '2018-05-14 23:34:56', '2018-05-14 23:38:30'),
(13, 'political class', 1, 30, 'Names\r\nUniversity\r\nsubject\r\nDate\r\n\r\nCritical Analysis on The Survival Strategies of North Korean Female Border-Crossers and Possibilities for Empowerment\r\n\r\nKim in her journal gives a detailed account of survival strategies for Korean women in the crossing the border to China. She collects many pieces of evidence in trying to make sense of the situation that she later tours the regions to get first-hand information. Her work is rich in the sense that she also borrows content from earlier scholars and research. Arguably, she partners with North Korea university to legitimize her studies in a region heavily manned by the North Koreans regime.\r\nThe journal is classic and well detailed. The journal gives special focus on how women survived after illegally crossing the North Korea China border. The information in the journal is credible because the events occurred in the recent history and many other records agree with many facts. The author, Kim quotes other scholars in many instances in trying to build his argument. In a country where media is shut, many stories remain untold in North Korea and indeed about the North Korea China border. Kim’s journal accounts how people and especially women cross to the neighboring China. The article explains why people crossing the border are predominantly women and how they ensured they survived at the time of great persecution and dare punishment to the victim of border crossing\r\nThe concept of victims of economic system has not sufficiently addressed the discussion. However, some of the factors outlined here in this paper help to briefly put neglected or assumed facts into perspective. It is important to note that migrants border crossers are people with agency, self-reflexive, self-aware and embedded within cultural beliefs. However, it is important to appreciate that some border crossers are people holding legal travel documents who ends up overstaying in China and ends up living in China as illegal immigrants.\r\nNorth Korea for decades now has been known for the bad news, most of it involving violation of human rights.  The situation in South Korea deteriorated in the 1990s when there was the economic collapse, and at the same time, the government later refused to receive foreign aid. The situation went from bad to worse when the dictatorial regime was unable to provide humanitarian aids to its people forcing a massive migration of population who were categorized as victims of economic decline and later became refugees in China. The migration of North Korea Chinese border became rampant until the North Korea government abolished movement to China and consequently introduced the tough law to govern how people move from Korea (Silvery and Lawson 1999; McKay 2007).\r\nIn a patriarchal society, women are left with very few choices and especially in North Korea. Men dominate the major functions of the government, formal and informal sectors and at the same time, these men cannot provide because of the economic shutdown. These forced women to take up the role in most families to contribute to the family. Crossing the porous china border became the only option for most of the women in North Korea. Migration to China was dangerous but at the same time inevitable. The future had no hope while at the same time, people migrating illegally to China were repatriated and charged with treason and other charges.\r\nThe change of the law that governs how people should take travel documents changed, North Korea introduced a very tough and elaborate procedure of acquiring travel documents. An individual cannot apply a passport to the government directly but apply through an agency which is tasked with the responsibility of vetting the applicant background, the reason for travel and of course the political affiliation.\r\n“Apart from passports, there are three main ways to travel to China legally. First, the North Korean government issues permit to visit China for up to 90 days to persons with relatives legally in China.” \r\nTough measures by the North Korean regime have forced women to be adaptive. During of the days, while still doing her research, Kim invited a few North Korean border crossers and spent time with them swimming. Many women believed they had mastered the art of crossing the border by exploring sexuality. Many believed they were food to men and so crossing through border post manned by men was not a big deal. Kim makes us understand that border crossing was complicated and the general view that people migrated only for economic and political reason was not sufficient enough to explain the border crossing issue.\r\nKim points out that border crossing was a planned an well-executed plan through an agency that helped many women to acquire travel documents. As mentioned earlier, a good number of women entered China legally and overstayed thus making them illegal immigrants. Marriage in China was a means of legitimizing their stay in China and shockingly. Women settled for marriage to escape the crackdown by North Korean authorities and many didn’t mind keeping both home and Chinese marriage with the hope of one day reuniting with the family after years of gathering resources.\r\nReference\r\nKim, S. (2014). “I am well-cooked food”: survival strategies of North Korean female border-crossers and possibilities for empowerment. Inter-Asia Cultural Studies, 15(4), 553-571. http://dx.doi.org/10.1080/14649373.2014.972663\r\nJoh Young-kug. (2017). Cross-border Interaction and Cross-border City’s Development in North Korea-China Borderland: A Case study of Dandong, Liaoning, China. Journal Of The Economic Geographical Society Of Korea, 20(3), 307-328. http://dx.doi.org/10.23841/egsk.2017.20.3.307\r\n\r\n', 3, '2018-05-18 04:50:39', 24.00, 'Custom writing', 2, 2, 503, 505, 'COMPLETE', 1, 9, '2018-05-16 23:49:10', '2018-05-31 21:12:38', NULL, '2018-05-16 23:51:28', '2018-05-31 21:12:38'),
(14, 'Reflection on ancient greece', 5, 22, 'Due at 11:59 pm Florida eastern time ', 1, '2018-05-21 23:52:22', 10.00, 'Custom writing', 2, 5, 517, 0, 'AUCTION', 4, 15, '2018-05-21 04:54:22', '2018-05-21 13:37:21', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE IF NOT EXISTS `bids` (
  `id` int(10) unsigned NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `assignment_id`, `user_id`, `amount`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 505, 20.00, 'please consider me', '2018-05-14 11:01:39', '2018-05-14 11:01:39', NULL),
(2, 9, 505, NULL, 'i can do it', '2018-05-14 11:10:47', '2018-05-14 11:10:47', NULL),
(3, 10, 505, 30.00, 'i can do it', '2018-05-14 11:16:48', '2018-05-14 11:16:48', NULL),
(4, 8, 508, 25.00, 'I will offer you quality work.', '2018-05-14 13:55:28', '2018-05-14 13:55:28', NULL),
(5, 11, 508, 25.00, 'Quality is guaranteed', '2018-05-14 13:57:00', '2018-05-14 13:57:00', NULL),
(6, 8, 509, 25.00, 'I am good in this field ', '2018-05-14 16:40:41', '2018-05-14 16:40:41', NULL),
(7, 11, 509, 45.00, 'I can deliver this ', '2018-05-14 16:56:29', '2018-05-14 16:56:29', NULL),
(8, 12, 512, 50.00, 'i am confident i can deliver this', '2018-05-14 23:30:42', '2018-05-14 23:30:42', NULL),
(9, 12, 513, 20.00, 'I will do a perfect job', '2018-05-14 23:30:43', '2018-05-14 23:30:43', NULL),
(10, 13, 505, 24.00, 'i can handle it', '2018-05-16 23:50:11', '2018-05-16 23:50:11', NULL),
(11, 14, 519, 18.00, 'Hello,i guarantee quality work.pleaae accept my bid ', '2018-05-21 04:58:37', '2018-05-21 04:58:37', NULL),
(12, 14, 505, 20.00, 'hello there, i am ready to deliver this work. i have one year doing this topic and so i guarantee you a quality paper', '2018-05-21 05:04:51', '2018-05-21 05:04:51', NULL),
(13, 14, 520, 22.00, 'hello there, i have read and understood your paper, please confirm my bid.', '2018-05-21 05:09:14', '2018-05-21 05:09:14', NULL),
(14, 14, 508, 20.00, 'Gimme the work and you will never regret it.', '2018-05-21 08:51:36', '2018-05-21 08:51:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL,
  `bid_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `bid_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 506, 'are you sure you can deliver ', '2018-05-14 11:02:37', '2018-05-14 11:02:37'),
(2, 1, 506, '?????', '2018-05-14 11:04:00', '2018-05-14 11:04:00'),
(3, 1, 505, 'yes', '2018-05-14 11:04:36', '2018-05-14 11:04:36'),
(4, 5, 503, 'hello there', '2018-05-14 16:43:16', '2018-05-14 16:43:16'),
(5, 9, 503, 'are you sure you can', '2018-05-14 23:32:45', '2018-05-14 23:32:45'),
(6, 9, 513, 'Sure. I will do amazing work', '2018-05-14 23:33:49', '2018-05-14 23:33:49'),
(7, 9, 503, 'i am placing order now', '2018-05-14 23:34:30', '2018-05-14 23:34:30');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE IF NOT EXISTS `conversations` (
  `id` int(10) unsigned NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `from_id`, `to_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 503, 505, '2018-05-14 11:11:38', '2018-05-14 11:11:38', NULL),
(2, 503, 508, '2018-05-14 16:56:36', '2018-05-14 16:56:36', NULL),
(3, 503, 513, '2018-05-14 23:34:56', '2018-05-14 23:34:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) unsigned NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disciplines`
--

CREATE TABLE IF NOT EXISTS `disciplines` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disciplines`
--

INSERT INTO `disciplines` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Formal and Natural Sciences', 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(2, 'Social Sciences', 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(3, 'Humanities', 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(4, 'Other', 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE IF NOT EXISTS `downloads` (
  `id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `downloads`
--

INSERT INTO `downloads` (`id`, `filename`, `type`, `assignment_id`, `from_id`, `to_id`, `section`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'doc1-146.docx', 'docx', 3, 503, NULL, NULL, '2018-05-12 18:07:21', '2018-05-12 18:07:21', NULL),
(2, 'prfile-89.jpg', 'jpg', 10, 503, NULL, NULL, '2018-05-14 12:45:34', '2018-05-14 12:45:34', NULL),
(3, 'a-26.docx', 'docx', 12, 503, NULL, NULL, '2018-05-14 23:18:01', '2018-05-14 23:18:01', NULL),
(4, 'c161fec4-fe8a-4efb-9510-5e7c0595ae8e-33.png', 'png', 14, 517, NULL, NULL, '2018-05-21 04:54:22', '2018-05-21 04:54:22', NULL),
(5, 'smart-africa-ltd-pick-pay-v2-training-users-contributions-187.docx', 'docx', 13, 505, NULL, 'WRITER', '2018-05-31 21:10:50', '2018-05-31 21:10:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `formats`
--

CREATE TABLE IF NOT EXISTS `formats` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `formats`
--

INSERT INTO `formats` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AMA', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(2, 'APA', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(3, 'ASA', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(4, 'CBE', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(5, 'MLA', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(6, 'Chicago/Turabian', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(7, 'Oxford', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(8, 'McGill Guide', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(9, 'Other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_notifications`
--

CREATE TABLE IF NOT EXISTS `message_notifications` (
  `id` int(10) unsigned NOT NULL,
  `to_id` int(11) NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_notifications`
--

INSERT INTO `message_notifications` (`id`, `to_id`, `read_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 505, 1, '2018-05-14 11:11:38', '2018-05-14 11:11:51', NULL),
(2, 503, 1, '2018-05-14 11:12:24', '2018-05-14 11:12:37', NULL),
(3, 505, 1, '2018-05-14 11:17:17', '2018-05-14 11:42:41', NULL),
(4, 508, 1, '2018-05-14 16:56:37', '2018-05-21 08:49:35', NULL),
(5, 513, 1, '2018-05-14 23:34:56', '2018-05-14 23:35:08', NULL),
(6, 513, 1, '2018-05-14 23:41:13', '2018-05-14 23:44:02', NULL),
(7, 513, 1, '2018-05-14 23:41:42', '2018-05-14 23:44:02', NULL),
(8, 505, 1, '2018-05-16 23:51:29', '2018-05-16 23:52:11', NULL),
(9, 508, 0, '2018-06-04 20:32:23', '2018-06-04 20:32:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_id`, `to_id`, `conversation_id`, `message`, `read_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 503, 505, 1, 'I have an assignment for you with the title "Philosophy, plato ". You can find it under your notifications', 1, '2018-05-14 11:11:38', '2018-05-14 11:12:00', NULL),
(2, 505, 503, 1, 'i will be working on it', 1, '2018-05-14 11:12:24', '2018-05-29 14:11:23', NULL),
(3, 503, 505, 1, 'I have an assignment for you with the title "Physicis - energy ". You can find it under your notifications', 1, '2018-05-14 11:17:17', '2018-05-14 11:53:36', NULL),
(4, 503, 508, 2, 'I have an assignment for you with the title "Caleb test". You can find it under your notifications', 1, '2018-05-14 16:56:37', '2018-05-21 08:49:42', NULL),
(5, 503, 513, 3, 'I have an assignment for you with the title "Caleebson test". You can find it under your notifications', 1, '2018-05-14 23:34:56', '2018-05-14 23:35:19', NULL),
(6, 503, 513, 3, 'great sir', 0, '2018-05-14 23:41:13', '2018-05-14 23:41:13', NULL),
(7, 503, 513, 3, 'i will hire you next time ', 0, '2018-05-14 23:41:42', '2018-05-14 23:41:42', NULL),
(8, 503, 505, 1, 'I have an assignment for you with the title "political class". You can find it under your notifications', 1, '2018-05-16 23:51:29', '2018-05-16 23:52:20', NULL),
(9, 503, 508, 2, 'Are you sure you can do this ', 0, '2018-06-04 20:32:23', '2018-06-04 20:32:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_10_11_103501_create_assignment_types_table', 1),
('2016_10_11_103615_create_disciplines_table', 1),
('2016_10_11_103654_create_sub_disciplines_table', 1),
('2016_10_11_110019_create_assignments_table', 1),
('2016_10_11_114027_create_ratings_table', 1),
('2016_10_11_114147_create_bids_table', 1),
('2016_10_11_125340_create_academic_levels_table', 1),
('2016_10_11_130745_create_formats_table', 1),
('2016_10_14_143728_create_countries_table', 1),
('2016_10_19_122511_create_notifications_table', 1),
('2016_10_21_063840_create_conversations_table', 1),
('2016_10_21_063905_create_messages_table', 1),
('2016_10_22_070839_create_message_notifications_table', 1),
('2016_10_22_134813_create_transactions_table', 1),
('2016_10_22_141613_create_settings_table', 1),
('2016_10_23_090535_create_pay_pal__transactions_table', 1),
('2016_10_24_125707_create_withdrawal_requests_table', 1),
('2016_10_26_073808_create_downloads_table', 1),
('2016_10_26_105527_create_languages_table', 1),
('2016_10_26_105818_create_my_languages_table', 1),
('2016_10_26_110856_create_comments_table', 1),
('2016_11_22_081455_create_my_disciplines_table', 1),
('2016_11_22_081522_create_my_assignment_types_table', 1),
('2016_11_22_082354_create_portofolios_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `my_assignment_types`
--

CREATE TABLE IF NOT EXISTS `my_assignment_types` (
  `id` int(10) unsigned NOT NULL,
  `assignment_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `my_disciplines`
--

CREATE TABLE IF NOT EXISTS `my_disciplines` (
  `id` int(10) unsigned NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `my_languages`
--

CREATE TABLE IF NOT EXISTS `my_languages` (
  `id` int(10) unsigned NOT NULL,
  `language_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `refference_id` int(11) DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `from_id`, `to_id`, `type`, `message`, `refference_id`, `read_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 505, 506, 'bid_placed', 'placed a bid', 8, 0, '2018-05-14 11:01:39', '2018-05-14 11:01:39', NULL),
(2, 506, 505, 'bid_comment', ' commented on your bid', 8, 1, '2018-05-14 11:02:37', '2018-05-16 23:52:39', NULL),
(3, 506, 505, 'bid_comment', ' commented on your bid', 8, 1, '2018-05-14 11:04:00', '2018-05-14 11:04:20', NULL),
(4, 505, 506, 'bid_comment', ' commented on a bid', 8, 0, '2018-05-14 11:04:36', '2018-05-14 11:04:36', NULL),
(5, 505, 503, 'bid_placed', 'placed a bid', 9, 1, '2018-05-14 11:10:47', '2018-05-14 11:11:17', NULL),
(6, 503, 505, 'assignment_awarded', 'assigned you an assignment', 9, 1, '2018-05-14 11:11:38', '2018-05-16 23:52:56', NULL),
(7, 505, 503, 'bid_placed', 'placed a bid', 10, 1, '2018-05-14 11:16:48', '2018-05-14 11:16:57', NULL),
(8, 503, 505, 'assignment_awarded', 'assigned you an assignment', 10, 1, '2018-05-14 11:17:17', '2018-05-16 23:52:50', NULL),
(9, 503, 505, 'assignment_completed', 'marked your assignment as complete', 9, 1, '2018-05-14 11:43:35', '2018-05-16 23:52:45', NULL),
(10, 503, 505, 'review_made', 'made a review on your assignment', 9, 1, '2018-05-14 11:44:08', '2018-05-14 11:54:40', NULL),
(11, 508, 506, 'bid_placed', 'placed a bid', 8, 0, '2018-05-14 13:55:28', '2018-05-14 13:55:28', NULL),
(12, 508, 503, 'bid_placed', 'placed a bid', 11, 1, '2018-05-14 13:57:00', '2018-05-14 16:42:52', NULL),
(13, 509, 506, 'bid_placed', 'placed a bid', 8, 0, '2018-05-14 16:40:41', '2018-05-14 16:40:41', NULL),
(14, 503, 508, 'bid_comment', ' commented on your bid', 11, 1, '2018-05-14 16:43:16', '2018-05-21 08:48:41', NULL),
(15, 509, 503, 'bid_placed', 'placed a bid', 11, 0, '2018-05-14 16:56:29', '2018-05-14 16:56:29', NULL),
(16, 503, 508, 'assignment_awarded', 'assigned you an assignment', 11, 1, '2018-05-14 16:56:36', '2018-05-21 08:49:15', NULL),
(17, 512, 503, 'bid_placed', 'placed a bid', 12, 0, '2018-05-14 23:30:42', '2018-05-14 23:30:42', NULL),
(18, 513, 503, 'bid_placed', 'placed a bid', 12, 0, '2018-05-14 23:30:44', '2018-05-14 23:30:44', NULL),
(19, 503, 513, 'bid_comment', ' commented on your bid', 12, 1, '2018-05-14 23:32:45', '2018-05-14 23:33:19', NULL),
(20, 513, 503, 'bid_comment', ' commented on a bid', 12, 1, '2018-05-14 23:33:49', '2018-05-14 23:34:04', NULL),
(21, 503, 513, 'bid_comment', ' commented on your bid', 12, 0, '2018-05-14 23:34:30', '2018-05-14 23:34:30', NULL),
(22, 503, 513, 'assignment_awarded', 'assigned you an assignment', 12, 1, '2018-05-14 23:34:56', '2018-05-14 23:35:35', NULL),
(23, 503, 513, 'assignment_completed', 'marked your assignment as complete', 12, 1, '2018-05-14 23:38:30', '2018-05-14 23:38:45', NULL),
(24, 503, 513, 'review_made', 'made a review on your assignment', 12, 1, '2018-05-14 23:38:53', '2018-05-14 23:41:27', NULL),
(25, 505, 503, 'bid_placed', 'placed a bid', 13, 1, '2018-05-16 23:50:11', '2018-05-29 14:11:31', NULL),
(26, 503, 505, 'assignment_awarded', 'assigned you an assignment', 13, 1, '2018-05-16 23:51:29', '2018-05-16 23:51:53', NULL),
(27, 519, 517, 'bid_placed', 'placed a bid', 14, 0, '2018-05-21 04:58:38', '2018-05-21 04:58:38', NULL),
(28, 505, 517, 'bid_placed', 'placed a bid', 14, 0, '2018-05-21 05:04:51', '2018-05-21 05:04:51', NULL),
(29, 520, 517, 'bid_placed', 'placed a bid', 14, 0, '2018-05-21 05:09:14', '2018-05-21 05:09:14', NULL),
(30, 508, 517, 'bid_placed', 'placed a bid', 14, 0, '2018-05-21 08:51:36', '2018-05-21 08:51:36', NULL),
(31, 505, 503, 'bid_placed', 'uploaded a completed assignment', 13, 1, '2018-05-31 21:10:50', '2018-05-31 21:12:26', NULL),
(32, 503, 505, 'assignment_completed', 'marked your assignment as complete', 13, 0, '2018-05-31 21:12:38', '2018-05-31 21:12:38', NULL),
(33, 503, 505, 'review_made', 'made a review on your assignment', 13, 1, '2018-05-31 21:12:59', '2018-05-31 21:13:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_transactions`
--

CREATE TABLE IF NOT EXISTS `paypal_transactions` (
  `id` int(10) unsigned NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(12,2) NOT NULL,
  `type` enum('INCOMING','OUTGOING') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portofolios`
--

CREATE TABLE IF NOT EXISTS `portofolios` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `information` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(10) unsigned NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `reaction` enum('POSITIVE','NEGATIVE') COLLATE utf8_unicode_ci NOT NULL,
  `stars` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `assignment_id`, `writer_id`, `client_id`, `title`, `content`, `reaction`, `stars`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 505, 503, 'great work!', 'great work!', 'POSITIVE', 5, '2018-05-14 11:44:08', '2018-05-14 11:44:08', NULL),
(2, 12, 513, 503, 'great work sir', '', 'POSITIVE', 5, '2018-05-14 23:38:53', '2018-05-14 23:38:53', NULL),
(3, 13, 505, 503, 'Good work', '', 'POSITIVE', 5, '2018-05-31 21:12:59', '2018-05-31 21:12:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'commission_percent', '18', '2018-05-12 14:17:58', '2018-05-12 14:17:58'),
(2, 'mature_duration', '20', '2018-05-12 14:17:58', '2018-05-12 14:17:58'),
(3, 'paypal_email', '18', '2018-05-12 14:17:58', '2018-05-12 14:17:58'),
(4, 'account_balance', '0.00', '2018-05-12 14:17:58', '2018-05-12 14:17:58'),
(5, 'minimum_threshold', '20.00', '2018-05-12 14:17:58', '2018-05-12 14:17:58'),
(6, 'support_email', 'support@essayhubpro.com', '2018-05-12 14:17:58', '2018-05-12 18:28:44'),
(7, 'notification_email', 'support@essayhubpro.com', '2018-05-12 14:17:58', '2018-05-12 18:28:44'),
(8, 'phone_number', '1 (000) 000 54', '2018-05-12 14:17:58', '2018-05-12 18:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `sub_disciplines`
--

CREATE TABLE IF NOT EXISTS `sub_disciplines` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discipline_id` int(11) DEFAULT NULL,
  `discipline` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_disciplines`
--

INSERT INTO `sub_disciplines` (`id`, `name`, `slug`, `discipline_id`, `discipline`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Astronomy', 'astronomy', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(2, 'Computer Science', 'computer-science', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(3, 'Mathematics', 'mathematics', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(4, 'Biology', 'biology', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(5, 'Chemistry', 'chemistry', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(6, 'Physics', 'physics', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(7, 'Statistics', 'statistics', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(8, 'Environmental Sciences', 'environmental-sciences', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(9, 'Geology', 'geology', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(10, 'Information Technology', 'information-technology', NULL, 'formal-and-natural-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(11, 'Economics', 'economics', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(12, 'Geography', 'geography', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(13, 'Psychology', 'psychology', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(14, 'Sociology', 'sociology', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(15, 'Anthropology', 'anthropology', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(16, 'Archaeology', 'archaeology', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(17, 'Cultural Studies', 'cultural-studies', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(18, 'Finance', 'finance', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(19, 'Politics', 'politics', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(20, 'Social Work', 'social-work', NULL, 'social-sciences', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(21, 'Religion', 'religion', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(22, 'Arts', 'arts', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(23, 'Education', 'education', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(24, 'English Language', 'english-language', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(25, 'Human Rights', 'human-rights', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(26, 'Linguistics', 'linguistics', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(27, 'Literature', 'literature', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(28, 'Music', 'music', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(29, 'History', 'history', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(30, 'Philosophy', 'philosophy', NULL, 'humanities', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(31, 'Law', 'law', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(32, 'Marketing', 'marketing', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(33, 'Public Relations', 'public-relations', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(34, 'Engineering', 'engineering', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(35, 'Accounting', 'accounting', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(36, 'Architecture', 'architecture', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(37, 'Banking', 'banking', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(38, 'Business', 'business', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(39, 'Childcare', 'childcare', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(40, 'Communication', 'communication', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(41, 'Construction', 'construction', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(42, 'Criminology', 'criminology', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(43, 'Employment', 'employment', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(44, 'Fashion', 'fashion', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(45, 'Film Studies', 'film-studies', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(46, 'Health', 'health', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(47, 'Journalism', 'journalism', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(48, 'Management', 'management', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(49, 'Media', 'media', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(50, 'Medical', 'medical', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(51, 'Nursing', 'nursing', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(52, 'Physical Education', 'physical-education', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(53, 'Project Management', 'project-management', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(54, 'Sports', 'sports', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(55, 'Technology', 'technology', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(56, 'Tourism', 'tourism', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(57, 'Other', 'other', NULL, 'other', '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) unsigned NOT NULL,
  `amount` double(12,2) NOT NULL,
  `type` enum('INCOMING','OUTGOING') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('PENDING','COMPLETE','REJECTED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `to_id` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `frozen` tinyint(1) NOT NULL DEFAULT '0',
  `details` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `matures_at` datetime DEFAULT NULL,
  `transferred_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `amount`, `type`, `status`, `to_id`, `from_id`, `assignment_id`, `frozen`, `details`, `matures_at`, `transferred_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 50.00, 'OUTGOING', 'COMPLETE', 505, 503, 9, 0, 'Payment for "Philosophy, plato " (#9)', '2018-06-03 06:11:38', NULL, NULL, '2018-05-14 11:11:38', '2018-05-14 11:11:38'),
(2, 9.00, 'OUTGOING', 'COMPLETE', NULL, 505, 9, 0, '18% Writer Commission for assignment #9', '2018-06-03 06:11:38', NULL, NULL, '2018-05-14 11:11:38', '2018-05-14 11:11:38'),
(3, 41.00, 'INCOMING', 'COMPLETE', 505, 503, 9, 0, 'Payment for "Philosophy, plato " (#9)', '2018-06-23 06:11:38', '2018-05-14 06:43:35', NULL, '2018-05-14 11:11:38', '2018-05-14 11:43:35'),
(4, 9.00, 'INCOMING', 'PENDING', NULL, 505, 9, 0, '18% Writer Commission for assignment #9', '2018-06-23 06:11:38', NULL, NULL, '2018-05-14 11:11:38', '2018-05-14 11:11:38'),
(5, 30.00, 'OUTGOING', 'COMPLETE', 505, 503, 10, 0, 'Payment for "Physicis - energy " (#10)', '2018-06-03 06:17:16', NULL, NULL, '2018-05-14 11:17:16', '2018-05-14 11:17:16'),
(6, 5.40, 'OUTGOING', 'COMPLETE', NULL, 505, 10, 0, '18% Writer Commission for assignment #10', '2018-06-03 06:17:16', NULL, NULL, '2018-05-14 11:17:17', '2018-05-14 11:17:17'),
(7, 24.60, 'INCOMING', 'PENDING', 505, 503, 10, 0, 'Payment for "Physicis - energy " (#10)', '2018-06-23 06:17:16', NULL, NULL, '2018-05-14 11:17:17', '2018-05-14 11:17:17'),
(8, 5.40, 'INCOMING', 'PENDING', NULL, 505, 10, 0, '18% Writer Commission for assignment #10', '2018-06-23 06:17:16', NULL, NULL, '2018-05-14 11:17:17', '2018-05-14 11:17:17'),
(9, 30.00, 'OUTGOING', 'PENDING', NULL, 505, NULL, 0, 'Withdrawal request', NULL, NULL, NULL, '2018-05-14 11:44:59', '2018-05-14 11:44:59'),
(10, 25.00, 'OUTGOING', 'COMPLETE', 508, 503, 11, 0, 'Payment for "Caleb test" (#11)', '2018-06-03 11:56:36', NULL, NULL, '2018-05-14 16:56:36', '2018-05-14 16:56:36'),
(11, 4.50, 'OUTGOING', 'COMPLETE', NULL, 508, 11, 0, '18% Writer Commission for assignment #11', '2018-06-03 11:56:36', NULL, NULL, '2018-05-14 16:56:36', '2018-05-14 16:56:36'),
(12, 20.50, 'INCOMING', 'PENDING', 508, 503, 11, 0, 'Payment for "Caleb test" (#11)', '2018-06-23 11:56:36', NULL, NULL, '2018-05-14 16:56:36', '2018-05-14 16:56:36'),
(13, 4.50, 'INCOMING', 'PENDING', NULL, 508, 11, 0, '18% Writer Commission for assignment #11', '2018-06-23 11:56:36', NULL, NULL, '2018-05-14 16:56:36', '2018-05-14 16:56:36'),
(14, 20.00, 'OUTGOING', 'COMPLETE', 513, 503, 12, 0, 'Payment for "Caleebson test" (#12)', '2018-06-03 18:34:56', NULL, NULL, '2018-05-14 23:34:56', '2018-05-14 23:34:56'),
(15, 3.60, 'OUTGOING', 'COMPLETE', NULL, 513, 12, 0, '18% Writer Commission for assignment #12', '2018-06-03 18:34:56', NULL, NULL, '2018-05-14 23:34:56', '2018-05-14 23:34:56'),
(16, 16.40, 'INCOMING', 'COMPLETE', 513, 503, 12, 0, 'Payment for "Caleebson test" (#12)', '2018-06-23 18:34:56', '2018-05-14 18:38:30', NULL, '2018-05-14 23:34:56', '2018-05-14 23:38:30'),
(17, 3.60, 'INCOMING', 'PENDING', NULL, 513, 12, 0, '18% Writer Commission for assignment #12', '2018-06-23 18:34:56', NULL, NULL, '2018-05-14 23:34:56', '2018-05-14 23:34:56'),
(18, 24.00, 'OUTGOING', 'COMPLETE', 505, 503, 13, 0, 'Payment for "political class" (#13)', '2018-06-05 18:51:28', NULL, NULL, '2018-05-16 23:51:29', '2018-05-16 23:51:29'),
(19, 4.32, 'OUTGOING', 'COMPLETE', NULL, 505, 13, 0, '18% Writer Commission for assignment #13', '2018-06-05 18:51:28', NULL, NULL, '2018-05-16 23:51:29', '2018-05-16 23:51:29'),
(20, 19.68, 'INCOMING', 'COMPLETE', 505, 503, 13, 0, 'Payment for "political class" (#13)', '2018-06-25 18:51:28', '2018-05-31 16:12:38', NULL, '2018-05-16 23:51:29', '2018-05-31 21:12:38'),
(21, 4.32, 'INCOMING', 'PENDING', NULL, 505, 13, 0, '18% Writer Commission for assignment #13', '2018-06-25 18:51:28', NULL, NULL, '2018-05-16 23:51:29', '2018-05-16 23:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('CLIENT','WRITER','ADMIN') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paypal_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `academic_level_id` int(11) DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_of_specialization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `professional_bio` varchar(240) COLLATE utf8_unicode_ci DEFAULT NULL,
  `my_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `academic_experience` varchar(240) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `orders_complete` int(11) NOT NULL DEFAULT '0',
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `attempts_left` int(11) NOT NULL DEFAULT '3',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `user_type`, `email`, `paypal_email`, `dob`, `balance`, `is_admin`, `password`, `image`, `thumbnail`, `academic_level_id`, `school`, `field_of_specialization`, `country_id`, `city`, `address`, `phone`, `about`, `professional_bio`, `my_details`, `academic_experience`, `views`, `orders_complete`, `last_seen`, `active`, `attempts_left`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mrs. Jude Armstrong', 'violette.nikolaus', 'WRITER', 'alejandra.turner@example.com', NULL, NULL, 0, 0, '$2y$10$86hr4V5J.mTMTK6sCJLwNOoYKUMrTDu4odrd/qycsX/EHUxhmxlTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2018-05-12 14:17:58', 1, 3, NULL, '2018-05-12 14:17:58', '2018-05-12 14:17:58', NULL),
(2, 'Javier Schaden', 'marcelo08', 'WRITER', 'adell.kassulke@example.net', NULL, NULL, 0, 0, '$2y$10$htvVeuIaLGcxrG6iq0fAlOBfacOvNXC4doXQcVxxEL/G8vDcvyu6K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 112, '2018-05-12 16:23:14', 1, 3, 'a4pXqDu1VtksbtLSokO2cfDetoL2s3B0ImAeiYrRiMhfJVJ1dbJlVWRHvn4u', '2018-05-12 14:17:59', '2018-05-12 16:23:51', NULL),
(3, 'Tyrell Hettinger', 'audie31', 'WRITER', 'dayna23@example.org', NULL, NULL, 0, 0, '$2y$10$15J5EGggPcGQM7XGZZgMsOWAY16hg5xw9k.mrb1sN8YAbZ0SCBH1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 41, '2018-05-12 14:17:59', 1, 3, NULL, '2018-05-12 14:17:59', '2018-05-12 14:17:59', NULL),
(4, 'Giuseppe Lind', 'ktoy', 'WRITER', 'kayli45@example.com', NULL, NULL, 0, 0, '$2y$10$N8ccFLY6kQvtOtF/kQzvgO4evCmqUNPOOu35xisNyU7HobFFGaYEi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:17:59', 1, 3, NULL, '2018-05-12 14:17:59', '2018-05-12 14:17:59', NULL),
(5, 'Dr. Elnora Grant DDS', 'bogan.opal', 'WRITER', 'amy81@example.com', NULL, NULL, 0, 0, '$2y$10$ZqnBzL9N836TiNhGX8UVxOjZgwEX5w92qViCiSYZRoclwKViuVhUy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 103, '2018-05-12 14:17:59', 1, 3, NULL, '2018-05-12 14:17:59', '2018-05-12 14:17:59', NULL),
(6, 'Prof. Chance Hettinger', 'christina.fritsch', 'WRITER', 'terence.morissette@example.com', NULL, NULL, 0, 0, '$2y$10$SE4EC79McwpoqeCDhIa1Puq5J/IM1A5J0KfBA2ub78dHoC/j9qMY2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 114, '2018-05-12 14:17:59', 1, 3, '5F0rY2dvyiH3vYzbTavGMAtQHRusaVvQKBLXJFl9hnTjisrewMaocIHmHKr1', '2018-05-12 14:17:59', '2018-05-14 10:53:28', NULL),
(7, 'Prof. Gino Beier IV', 'howell.gay', 'WRITER', 'dolly06@example.net', NULL, NULL, 0, 0, '$2y$10$gHwvLrlDcbV1LS4cIB.pAe3sAlFUfaopkikd67cNgWGxqHwb8zwmu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, '2018-05-12 14:17:59', 1, 3, NULL, '2018-05-12 14:17:59', '2018-05-12 14:17:59', NULL),
(8, 'Rory Gleichner DDS', 'bauch.ewell', 'WRITER', 'hilma.farrell@example.org', NULL, NULL, 0, 0, '$2y$10$jkKfaXdLOrlxwrlN3JGm3u1abyMg7FTfBYsgoPlLzsHHSSwAb1XHm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:17:59', 1, 3, NULL, '2018-05-12 14:17:59', '2018-05-12 14:17:59', NULL),
(9, 'Nathaniel Deckow', 'rickie.bruen', 'WRITER', 'volkman.karson@example.com', NULL, NULL, 0, 0, '$2y$10$ie8i1EALVNACmHV13AQ1KeHS2wVISM92AW8BofLhLD6mYDM4QVmdS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 150, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-31 22:28:13', NULL),
(10, 'Dustin Huel', 'gerson11', 'WRITER', 'senger.mercedes@example.com', NULL, NULL, 0, 0, '$2y$10$yYG3kerTmtyR17UtZkhzBOH1rFIoUCNAxMuqIeBvjJ6xOjRwbCV4m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 88, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', NULL),
(11, 'Mr. Prince White V', 'chauck', 'WRITER', 'santos28@example.org', NULL, NULL, 0, 0, '$2y$10$BvsUGBLkZZGqFtP38tbsg.PbY3a7sn8/4X0o1Kx3GtJCJjll4f2hS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 105, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', NULL),
(12, 'Taryn Yost II', 'moshe.stracke', 'WRITER', 'camylle25@example.net', NULL, NULL, 0, 0, '$2y$10$5l/8lRznOHAHDxCrLyTUJek9RTt0kUAlm5H60dk0.TCo2wtqpYnEG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', NULL),
(13, 'Isabelle Schinner V', 'palma95', 'WRITER', 'jayme.mueller@example.net', NULL, NULL, 0, 0, '$2y$10$9z.e9MoR7Q5h0mw2fKCzaOwWmRcYJf7LnpTt6DOVWIZfMe9NXT0FO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 31, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', NULL),
(14, 'Dr. Grayce Leffler', 'rupert90', 'WRITER', 'bettye15@example.org', NULL, NULL, 0, 0, '$2y$10$AkTo1YRhpqCTr9V5lvcZ/uKEB6MUsr3hj5CX0mnbG7C/xWVh.9tRC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 127, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', NULL),
(15, 'Lacey Hahn', 'witting.ethelyn', 'WRITER', 'barton98@example.net', NULL, NULL, 0, 0, '$2y$10$PPp4yAc5tJ/QcjKFVQ/42.DiBVzfmmnHqpFePZ5H7.SQkDa/vr8pi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 132, '2018-05-12 14:18:00', 1, 3, NULL, '2018-05-12 14:18:00', '2018-05-12 14:18:00', NULL),
(16, 'Miss Maryam Senger Sr.', 'areichel', 'WRITER', 'moore.ernestine@example.org', NULL, NULL, 0, 0, '$2y$10$RLSfQBJlYBSlv2.uGM9.KuBPVdPq0y5cA6VesKjsWs064D1U2c8Ti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 147, '2018-05-12 14:18:01', 1, 3, NULL, '2018-05-12 14:18:01', '2018-05-15 07:55:41', NULL),
(17, 'Kathlyn Mosciski', 'pollich.lowell', 'WRITER', 'tillman.sandrine@example.org', NULL, NULL, 0, 0, '$2y$10$G8AvbvjIJoylxxbD.L81EOnXWcm5.ZcQQ5O2DQtpxd2.uYgY8Z6aG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:01', 1, 3, NULL, '2018-05-12 14:18:01', '2018-05-12 14:18:01', NULL),
(18, 'Shana Cole III', 'charlotte.howe', 'WRITER', 'minnie59@example.net', NULL, NULL, 0, 0, '$2y$10$Q7VBBc98S0Yy5qjcX4dikOZuoAPFcPn.8uRuXyjOhHnbipYf7qlre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 48, '2018-05-12 14:18:01', 1, 3, NULL, '2018-05-12 14:18:01', '2018-05-12 14:18:01', NULL),
(19, 'Ms. Natalie Ferry', 'skiles.lucious', 'WRITER', 'stark.toni@example.com', NULL, NULL, 0, 0, '$2y$10$YnBDaf/tsLbSqc6FyDn0jeW0vmMWzA6l.JVjoPberrCfxWe8UgdSa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141, '2018-05-12 14:18:01', 1, 3, NULL, '2018-05-12 14:18:01', '2018-05-12 14:18:01', NULL),
(20, 'Hermann Farrell', 'lbahringer', 'WRITER', 'maximillian.pagac@example.com', NULL, NULL, 0, 0, '$2y$10$qGvtHKhjspP3N8VPXiTR0ewLRjH2fScg5gZO2k5sTk8H/23qMVUO6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:18:01', 1, 3, NULL, '2018-05-12 14:18:01', '2018-05-12 14:18:01', NULL),
(21, 'Maryjane Mertz', 'adubuque', 'WRITER', 'hunter45@example.com', NULL, NULL, 0, 0, '$2y$10$f2dkIxUbn6GVRazTu/g/FuL4MWmbzMGj1lyJhihKt/ld8NNPs7HgG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:01', 1, 3, NULL, '2018-05-12 14:18:01', '2018-05-12 14:18:01', NULL),
(22, 'Reid Schulist', 'fredrick98', 'WRITER', 'willard00@example.org', NULL, NULL, 0, 0, '$2y$10$Qc37XCQOleNk1RpsG2BA3OsiV4roHgl3hXjJJfTYLLMPDx943zfHy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2018-05-12 14:18:02', 1, 3, NULL, '2018-05-12 14:18:02', '2018-05-29 14:08:52', NULL),
(23, 'Coty Kris', 'cleveland.moore', 'WRITER', 'nellie16@example.com', NULL, NULL, 0, 0, '$2y$10$T4CCb/or2BmJiRajsNPMAutcJCVSq4022vxzhyVocZQ53tnwW7sVa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:02', 1, 3, NULL, '2018-05-12 14:18:02', '2018-05-12 14:18:02', NULL),
(24, 'Prof. Adell Prosacco II', 'vivien.gusikowski', 'WRITER', 'adriel.wintheiser@example.net', NULL, NULL, 0, 0, '$2y$10$gKMLbrGkp1J9k9MnE/2EoOxAw6jlRUp7T8kRiZtV16qOYogm2Z0Va', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 105, '2018-05-12 14:18:02', 1, 3, NULL, '2018-05-12 14:18:02', '2018-05-12 14:18:02', NULL),
(25, 'Prof. Nicholas Herman', 'rowe.ryley', 'WRITER', 'nettie20@example.com', NULL, NULL, 0, 0, '$2y$10$ZA3frNgvoVUhZo3F76EEm.wsIu6S8.quiFDrBQUsXOboIiXC7PSw.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 85, '2018-05-12 14:18:02', 1, 3, NULL, '2018-05-12 14:18:02', '2018-05-12 14:18:02', NULL),
(26, 'Kaleigh Beahan', 'fbogisich', 'WRITER', 'magdalen52@example.org', NULL, NULL, 0, 0, '$2y$10$V3NLBYKcVEx/wTfNnCAureREpke0ZKusPrhx7ezlgWDtdu/eo/lJ2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 79, '2018-05-12 14:18:02', 1, 3, NULL, '2018-05-12 14:18:02', '2018-05-12 14:18:02', NULL),
(27, 'Arlie Wunsch', 'ecorkery', 'WRITER', 'ramiro.grimes@example.net', NULL, NULL, 0, 0, '$2y$10$wFlZdBkKJfiCosioxcS5o.Zh4koGzIL2ZYm78X5TguOjWh3zIr6xa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16, '2018-05-12 14:18:02', 1, 3, NULL, '2018-05-12 14:18:02', '2018-05-12 14:18:02', NULL),
(28, 'Courtney Crona II', 'nhaag', 'WRITER', 'clint.greenfelder@example.org', NULL, NULL, 0, 0, '$2y$10$qRJlyivGpNQBUEtz7I8tq.eNXLjgTv2za79Lm9g1fjz5CSgUTuAMe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 138, '2018-05-12 14:18:03', 1, 3, NULL, '2018-05-12 14:18:03', '2018-05-12 14:18:03', NULL),
(29, 'Gilbert Murazik V', 'junius76', 'WRITER', 'gzieme@example.com', NULL, NULL, 0, 0, '$2y$10$UjLdZVlynDLtO1IlhTorX.gZL5aVUNmoQO2jfxOqVoieU2mDSj7Z.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 142, '2018-05-12 14:18:03', 1, 3, NULL, '2018-05-12 14:18:03', '2018-05-12 14:18:03', NULL),
(30, 'Prof. Nicklaus Hyatt V', 'vincent15', 'WRITER', 'reichel.serenity@example.org', NULL, NULL, 0, 0, '$2y$10$SkrW72EtaiuA7/h96iHSKuSAo29osCtuPDv.zqRC.5h3vSVPPiJzO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19, '2018-05-12 14:18:03', 1, 3, NULL, '2018-05-12 14:18:03', '2018-05-12 14:18:03', NULL),
(31, 'Adelbert Lueilwitz', 'treutel.dee', 'WRITER', 'wanda62@example.com', NULL, NULL, 0, 0, '$2y$10$hsS40o9dZH.yMXUN8U5YsOTGB04amzZjmfz4No2xz.Dzb6ZawU6Am', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:03', 1, 3, NULL, '2018-05-12 14:18:03', '2018-05-12 14:18:03', NULL),
(32, 'Rodrick Ryan', 'zankunding', 'WRITER', 'lewis.keebler@example.com', NULL, NULL, 0, 0, '$2y$10$ELJdTUi/hOwml4Xj/VS/reU1UemRYE5l3LFjC70HZk8W70.1zV33K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 148, '2018-05-12 14:18:03', 1, 3, NULL, '2018-05-12 14:18:03', '2018-05-15 07:57:12', NULL),
(33, 'Erling Simonis', 'devonte08', 'WRITER', 'cummings.isabel@example.org', NULL, NULL, 0, 0, '$2y$10$4iN5Cy/N90yquQsdqOJLQedpChk/KRUiY31fChDVKlr4vDRIJiv9W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 45, '2018-05-12 14:18:03', 1, 3, NULL, '2018-05-12 14:18:03', '2018-05-12 14:18:03', NULL),
(34, 'Tobin Ullrich', 'nicolette.funk', 'WRITER', 'koss.uriel@example.com', NULL, NULL, 0, 0, '$2y$10$Jqt6gmftuhAj4I9UatOVhe2uQUAKIsizExG.omPZFZN.3N5hH5mpe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 138, '2018-05-12 14:18:04', 1, 3, NULL, '2018-05-12 14:18:04', '2018-05-12 14:18:04', NULL),
(35, 'Claud Collier', 'leslie10', 'WRITER', 'tess.casper@example.org', NULL, NULL, 0, 0, '$2y$10$LY1KY//Nl70VTaM5TpFrleGoqdK5o0wZ.2D2x0LnMahj/DsYTBpsq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 109, '2018-05-12 14:18:04', 1, 3, NULL, '2018-05-12 14:18:04', '2018-05-12 14:18:04', NULL),
(36, 'Prof. Ryann Murazik', 'bradtke.janis', 'WRITER', 'olynch@example.org', NULL, NULL, 0, 0, '$2y$10$0wAfeoRyo4Xqzq.DOu2H4.Pv5N.fhQsYqa8o6MrOSZK.oZV5Bit9m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:18:04', 1, 3, NULL, '2018-05-12 14:18:04', '2018-05-12 14:18:04', NULL),
(37, 'Vincent Toy', 'lwilkinson', 'WRITER', 'anabel19@example.org', NULL, NULL, 0, 0, '$2y$10$o7D3ohmy12IC1ErEluKd8uQgli172eslSZENIuHkGPYUPMgnmksqG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2018-05-12 14:18:04', 1, 3, NULL, '2018-05-12 14:18:04', '2018-05-12 14:18:04', NULL),
(38, 'Sigurd Gusikowski Sr.', 'ckoelpin', 'WRITER', 'kshlerin.carole@example.com', NULL, NULL, 0, 0, '$2y$10$s0tAgR5BChTjM04yamSyTuZTpafQ6gYbkLsRuMdOK0wp8AlDFHwl.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2018-05-12 14:18:04', 1, 3, NULL, '2018-05-12 14:18:04', '2018-05-12 14:18:04', NULL),
(39, 'Alayna Trantow', 'west.violette', 'WRITER', 'marks.torrey@example.org', NULL, NULL, 0, 0, '$2y$10$xYO2bl8YNcZAdx5rvM3Cn.5Hfk./npmvjcqrYlEnFKqJnKaX1uwba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 109, '2018-05-12 14:18:04', 1, 3, NULL, '2018-05-12 14:18:04', '2018-05-12 14:18:04', NULL),
(40, 'Jennie Reichert', 'dare.green', 'WRITER', 'rodrigo.romaguera@example.com', NULL, NULL, 0, 0, '$2y$10$DErzUsIQQLvGOz8OpOo/deJNLzwp1sZ02U6D9CWoFpqLqRQvFydSC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, '2018-05-12 14:18:05', 1, 3, NULL, '2018-05-12 14:18:05', '2018-05-12 14:18:05', NULL),
(41, 'Kelley Strosin V', 'mathew26', 'WRITER', 'pfeffer.angela@example.org', NULL, NULL, 0, 0, '$2y$10$7eXlcBHVkKmvoQBBsVAvYOKJwOdFRE5i7ogHf75qSM6ase5pxfqV6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 123, '2018-05-12 14:18:05', 1, 3, NULL, '2018-05-12 14:18:05', '2018-05-12 14:18:05', NULL),
(42, 'Kaelyn McLaughlin', 'eusebio00', 'WRITER', 'moen.cecile@example.com', NULL, NULL, 0, 0, '$2y$10$7ctaJQp/wylZtqz558l5Y.NEh9gRESigocsLDDSvgG06OXQS8g8cW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61, '2018-05-12 14:18:05', 1, 3, NULL, '2018-05-12 14:18:05', '2018-05-12 14:18:05', NULL),
(43, 'Mr. Waino Will', 'mable10', 'WRITER', 'estroman@example.com', NULL, NULL, 0, 0, '$2y$10$eT4Z4G3B8cWHpMbjstI6IenoS8V2TSZhTnYfjBUjpfK62Fsn1oN6m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:18:05', 1, 3, NULL, '2018-05-12 14:18:05', '2018-05-12 14:18:05', NULL),
(44, 'Prof. Elinore Herman I', 'joannie.zemlak', 'WRITER', 'sadye77@example.com', NULL, NULL, 0, 0, '$2y$10$cu3ANLb/VNARag0yZIjYqe5uqgLneNkukldNNZDqkj54PAgtPgsDm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 91, '2018-05-12 14:18:05', 1, 3, NULL, '2018-05-12 14:18:05', '2018-05-12 14:18:05', NULL),
(45, 'Dr. Marcia Johns', 'langosh.alena', 'WRITER', 'mary.marks@example.net', NULL, NULL, 0, 0, '$2y$10$TkCgSia4BSYt9HFVSab4UuW7nu9TFOFUNBw8FthS1Cx9srncItfMG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 66, '2018-05-12 14:18:05', 1, 3, NULL, '2018-05-12 14:18:05', '2018-05-12 14:18:05', NULL),
(46, 'Amanda Schiller', 'ulebsack', 'WRITER', 'sonia02@example.com', NULL, NULL, 0, 0, '$2y$10$hvK.NSXnnWZXEukc5mQwM.a5y224w7QMKBcGlA0XIXSDyxO.PAv5O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(47, 'Marjorie Greenfelder III', 'oswald.reynolds', 'WRITER', 'nlynch@example.org', NULL, NULL, 0, 0, '$2y$10$N69w9JcIgZK.jFH5d.7f.eTwiU.2NrRi.2ZeklDrtzXQWZWFG4qDu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(48, 'Mr. Justus Osinski V', 'bogan.anastasia', 'WRITER', 'jkilback@example.net', NULL, NULL, 0, 0, '$2y$10$kKlVbHf0inH7dIXxcQBIo.YmML4Ht2M5MLvcUohnMXSGnqZP9S2Vm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 125, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(49, 'Llewellyn Kilback', 'runte.alexandro', 'WRITER', 'ypfeffer@example.com', NULL, NULL, 0, 0, '$2y$10$OSQQhO4F1JSPQAvKIWbQuevHVC8q6Qsjqw4TMDyqXgy/xcon7pCGi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(50, 'Candace Keeling DDS', 'elnora.emmerich', 'WRITER', 'golden.crona@example.com', NULL, NULL, 0, 0, '$2y$10$ct1EqMLOHYQgI7RpQybW1..jfDh6vYBll756Hi4u0QtTADB8bIfSa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 116, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(51, 'Claudine Hartmann', 'lenore.walter', 'WRITER', 'wbins@example.com', NULL, NULL, 0, 0, '$2y$10$uF2m8FPjdneAOPy8raVRoOiU3I/nU8p04X/Jjn/Cdxeh5x8ea/JDq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(52, 'Constance Daugherty', 'ernest.cartwright', 'WRITER', 'yrenner@example.org', NULL, NULL, 0, 0, '$2y$10$hEQg2ECex1geoxelqE1ciekpECCXkVXoCxsEmtNAIcaDKhG2P2OA.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, '2018-05-12 14:18:06', 1, 3, NULL, '2018-05-12 14:18:06', '2018-05-12 14:18:06', NULL),
(53, 'Dr. Stephon Strosin II', 'trantow.cielo', 'WRITER', 'xander.jones@example.com', NULL, NULL, 0, 0, '$2y$10$ktgjWYlMQzKpTnPoCYLobef43NMbuzg8uD7IdTFxXKcTiusXRDqRC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 72, '2018-05-12 14:18:07', 1, 3, NULL, '2018-05-12 14:18:07', '2018-05-12 14:18:07', NULL),
(54, 'Miss Justine Hirthe Sr.', 'oconnelly', 'WRITER', 'opagac@example.net', NULL, NULL, 0, 0, '$2y$10$9NvPNxwAZmiWhyqycb9GIem0052PCXrxDSlYkucX.GjM8pDNUxtAG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 52, '2018-05-12 14:18:07', 1, 3, NULL, '2018-05-12 14:18:07', '2018-05-12 14:18:07', NULL),
(55, 'Fannie Beatty', 'kamryn26', 'WRITER', 'hbeier@example.com', NULL, NULL, 0, 0, '$2y$10$AqN3py5fqv6Fskj1.xYM0uj91kkWlQ0qVBfz/HG6nncWWXRFjQzHG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 38, '2018-05-12 14:18:07', 1, 3, NULL, '2018-05-12 14:18:07', '2018-05-12 14:18:07', NULL),
(56, 'Dr. Cory Conn', 'lois.larson', 'WRITER', 'crystel.mclaughlin@example.net', NULL, NULL, 0, 0, '$2y$10$.RwX7NXkD/YIIjUeCTE50.RTjnrXpm3Z2JHOQ5z06C4VmmMxX5GA.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55, '2018-05-12 14:18:07', 1, 3, NULL, '2018-05-12 14:18:07', '2018-05-12 14:18:07', NULL),
(57, 'Mr. David Witting IV', 'amely.dickens', 'WRITER', 'kuhn.jaylon@example.org', NULL, NULL, 0, 0, '$2y$10$gVKhvaRyLfL5dTYjOuO50u1Vj5fjLBCFSg1zbX0PboZID93axW2nu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39, '2018-05-12 14:18:07', 1, 3, NULL, '2018-05-12 14:18:07', '2018-05-12 14:18:07', NULL),
(58, 'Assunta Gislason', 'uschiller', 'WRITER', 'dayana.jacobson@example.com', NULL, NULL, 0, 0, '$2y$10$gUAxoGd9AjghDJmw9iA5g.zHHhU1/dO./jNnZvLe3MX3WvYLP9Aqq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 28, '2018-05-12 14:18:08', 1, 3, NULL, '2018-05-12 14:18:08', '2018-05-12 14:18:08', NULL),
(59, 'Orville McLaughlin', 'dach.renee', 'WRITER', 'michale.anderson@example.org', NULL, NULL, 0, 0, '$2y$10$Lr9rUglqp77Zus3w3p4EreZWsOwpBI6rj9M3gzSj24HjC.2NuGb16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 118, '2018-05-12 14:18:08', 1, 3, NULL, '2018-05-12 14:18:08', '2018-05-12 14:18:08', NULL),
(60, 'Hope Kling IV', 'rkeebler', 'WRITER', 'ivory.satterfield@example.net', NULL, NULL, 0, 0, '$2y$10$IWw/ebstNZJOM8EwUgmvRewm1mfqJ8x0SRXY4B9f5uDptQBnI9RJG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 15, '2018-05-12 14:18:08', 1, 3, NULL, '2018-05-12 14:18:08', '2018-05-12 14:18:08', NULL),
(61, 'Ms. Ursula Zieme', 'haley.giles', 'WRITER', 'alittel@example.org', NULL, NULL, 0, 0, '$2y$10$/9NqF4euQUzk8bwC.3oiKuHOuAY1c2NmRtf2lWr4vS8YNP0FAi.nK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-05-12 14:18:08', 1, 3, NULL, '2018-05-12 14:18:08', '2018-05-12 14:18:08', NULL),
(62, 'Marie Bayer', 'elda.schmitt', 'WRITER', 'lowe.heloise@example.net', NULL, NULL, 0, 0, '$2y$10$QVFjrTUWaDBZsPu90Qd8g.dGPHFMTXxyHuHqYStlrWTfreN467OWq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, '2018-05-12 14:18:08', 1, 3, NULL, '2018-05-12 14:18:08', '2018-05-12 14:18:08', NULL),
(63, 'Deangelo Kling', 'hamill.ramona', 'WRITER', 'zdavis@example.net', NULL, NULL, 0, 0, '$2y$10$pD9YW4eVljn8Q1XQJqPtV.T3ZNNZ.to8B1XqOco3NqTWnG.aF0yuK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 51, '2018-05-12 14:18:08', 1, 3, NULL, '2018-05-12 14:18:08', '2018-05-12 14:18:08', NULL),
(64, 'Prof. Catherine Davis Sr.', 'jolie46', 'WRITER', 'francis.gleichner@example.com', NULL, NULL, 0, 0, '$2y$10$6Uk.URCz9EyMyOrVWp0jyOz5crqG25r1UmhugIyMMYO5ZX1txYQHW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 98, '2018-05-12 14:18:09', 1, 3, NULL, '2018-05-12 14:18:09', '2018-05-12 14:18:09', NULL),
(65, 'Emanuel Nolan', 'leffler.raheem', 'WRITER', 'lelia94@example.net', NULL, NULL, 0, 0, '$2y$10$pf./FMUA8/ueRwhCGN.tfei5MsWCdReDCpMw4LXW3FsT7vID4sSpG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77, '2018-05-12 14:18:09', 1, 3, NULL, '2018-05-12 14:18:09', '2018-05-12 14:18:09', NULL),
(66, 'Jaclyn Kub', 'drake.connelly', 'WRITER', 'aleen09@example.org', NULL, NULL, 0, 0, '$2y$10$FSQp7ZlP6U3t1HhWb0KVgePmqVRG7WZHnO8pq4HhjYh91iWxZ1Ag2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 81, '2018-05-12 14:18:09', 1, 3, NULL, '2018-05-12 14:18:09', '2018-05-12 14:18:09', NULL),
(67, 'Mr. Sammie Reilly', 'bauch.alan', 'WRITER', 'elias67@example.net', NULL, NULL, 0, 0, '$2y$10$qsC9cHmmdfc.jEMHie4iwO42p1lFXT/KEoUjvOGxYIFvqsmgXi1Ey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-05-12 14:18:09', 1, 3, NULL, '2018-05-12 14:18:09', '2018-05-12 14:18:09', NULL),
(68, 'Walton Goldner', 'lloyd.parker', 'WRITER', 'hanna.shanahan@example.com', NULL, NULL, 0, 0, '$2y$10$JYWXVpFE7L7ftNNzj1hFluCtq1nq2ewoQ6oHGGkOIkdpWidRHR8vK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, '2018-05-12 14:18:09', 1, 3, NULL, '2018-05-12 14:18:09', '2018-05-12 14:18:09', NULL),
(69, 'Clotilde Boyle', 'crona.mylene', 'WRITER', 'herman.verda@example.org', NULL, NULL, 0, 0, '$2y$10$D73ICeGCLofk6J0MmO8B7O6A8wVo5V/0tAetDJdoZhQSfReAYJgxO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, '2018-05-12 14:18:09', 1, 3, NULL, '2018-05-12 14:18:09', '2018-05-12 14:18:09', NULL),
(70, 'Prof. Kimberly Herzog IV', 'laurine54', 'WRITER', 'luigi.cremin@example.org', NULL, NULL, 0, 0, '$2y$10$IjBcsjSiFkiBmbwEwFG5D.TADzDDGCkVVwLPaUWRLgF2vFKbhBoRa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(71, 'Mariana Ferry', 'haag.rodger', 'WRITER', 'jaden.rodriguez@example.org', NULL, NULL, 0, 0, '$2y$10$3UjpL.fBHqc6BiPQeI/PTeMDO4e4QbLMGqiF.qJXpp1lNJHOVZbBO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(72, 'Orville Fisher', 'gusikowski.earl', 'WRITER', 'charley51@example.com', NULL, NULL, 0, 0, '$2y$10$9iub2ASrCf3D6jQeZ/hsUe2BQ9k0yz.QUVxSCn0aUWoDfKvdWSN4O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 140, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(73, 'Tavares Emard II', 'ullrich.angel', 'WRITER', 'legros.tia@example.com', NULL, NULL, 0, 0, '$2y$10$X2ELBPp6vTZ2JJ40Y/iAJeqFuEEZdADZTP6xke714OHPD0YGvUhOW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 142, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(74, 'Dr. Jordan Stoltenberg', 'hertha94', 'WRITER', 'isabella.fay@example.com', NULL, NULL, 0, 0, '$2y$10$MMAKxRqdeC6EtqPoXYXGv.NQLiSf/MldD8V/1JFUvS.qrvlwMWf/S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(75, 'Miss Ellie Brown', 'witting.angelina', 'WRITER', 'jerad.stamm@example.net', NULL, NULL, 0, 0, '$2y$10$zlsg6TU2ZiQUmUYlhl6Yzuj3Rt36mn.t2A1b7AMVC8F.X6IMPBjau', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 79, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(76, 'Bell Mitchell IV', 'eula54', 'WRITER', 'stanton.lavern@example.net', NULL, NULL, 0, 0, '$2y$10$irdlqdAuXIcV2U5O1EzpHuvY9Fcq3xEHU5bU8rtNRWO1NyXRew0oa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 43, '2018-05-12 14:18:10', 1, 3, NULL, '2018-05-12 14:18:10', '2018-05-12 14:18:10', NULL),
(77, 'Brionna Bergnaum', 'cassandre.mcglynn', 'WRITER', 'jwindler@example.com', NULL, NULL, 0, 0, '$2y$10$jEzOgfMGsWd2zR12m/X84edOMBZNM5LGo6029mUTVH97PDeW5KA/i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 37, '2018-05-12 14:18:11', 1, 3, NULL, '2018-05-12 14:18:11', '2018-05-12 14:18:11', NULL),
(78, 'Laverne Streich', 'piper.ratke', 'WRITER', 'austen29@example.com', NULL, NULL, 0, 0, '$2y$10$QJ593xESV0sJUe4CZujPyeuKRu/sVyHVTjDe4dqNuxY3IxwnUPkWq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, '2018-05-12 14:18:11', 1, 3, NULL, '2018-05-12 14:18:11', '2018-05-12 14:18:11', NULL),
(79, 'Prof. Horacio Howe V', 'damaris.rath', 'WRITER', 'ecasper@example.net', NULL, NULL, 0, 0, '$2y$10$1fI92P9bMmAGZbGY/l6HOeH4BdUGn1DdRiHFeVRIGqlfIB4rHmJye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 73, '2018-05-12 14:18:11', 1, 3, NULL, '2018-05-12 14:18:11', '2018-05-12 14:18:11', NULL),
(80, 'Ana Cole', 'dpowlowski', 'WRITER', 'bailey.augusta@example.com', NULL, NULL, 0, 0, '$2y$10$mBEZdPrLIDNy5PWSLpT8QOJM4siDZoXvzrY/VpS3WS4mj/qnvB0Ge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, '2018-05-12 14:18:11', 1, 3, NULL, '2018-05-12 14:18:11', '2018-05-12 14:18:11', NULL),
(81, 'Prof. Devante Mohr II', 'federico.strosin', 'WRITER', 'emilie56@example.net', NULL, NULL, 0, 0, '$2y$10$3n4fAWE4iKUTYaucaB93lOg6IrLKWSaflbhmHea./5QfDqB7b3K1K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 84, '2018-05-12 14:18:11', 1, 3, NULL, '2018-05-12 14:18:11', '2018-05-12 14:18:11', NULL),
(82, 'Camila McClure Jr.', 'corene.russel', 'WRITER', 'schuster.tina@example.com', NULL, NULL, 0, 0, '$2y$10$8H2T/f4XQQAmmM0ETnzEvOMFQPxGQzfomHjQ7i8cDpw0c2JHDDZ/6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 31, '2018-05-12 14:18:11', 1, 3, NULL, '2018-05-12 14:18:11', '2018-05-12 14:18:11', NULL),
(83, 'Mr. Kody Breitenberg', 'antoinette.connelly', 'WRITER', 'fkunze@example.org', NULL, NULL, 0, 0, '$2y$10$Jb6dmTWSkY.X8HqGTTQPHeY78OVoJ/YSW2jGTgp8g3FJB6034696.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:18:12', 1, 3, NULL, '2018-05-12 14:18:12', '2018-05-12 14:18:12', NULL),
(84, 'Vivien Gulgowski DDS', 'hackett.rosella', 'WRITER', 'joe82@example.net', NULL, NULL, 0, 0, '$2y$10$7XVJyqbkxa3L4NsKh5qVoOaiZ2920wnjqx4.dSWYJSAs37Db9lX06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39, '2018-05-12 14:18:12', 1, 3, NULL, '2018-05-12 14:18:12', '2018-05-12 14:18:12', NULL),
(85, 'Odie Johnson', 'larkin.christopher', 'WRITER', 'lamont01@example.net', NULL, NULL, 0, 0, '$2y$10$5ff/HXMexfZN3WbdSRHXHuHNMM9KRscKHvqKLxalQtiMz5xaPMYWm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 36, '2018-05-12 14:18:12', 1, 3, NULL, '2018-05-12 14:18:12', '2018-05-12 14:18:12', NULL),
(86, 'Lincoln Frami', 'keshawn38', 'WRITER', 'mills.gerardo@example.net', NULL, NULL, 0, 0, '$2y$10$nZXjR4Q/oZF39MwLGUqb8eaFH3TrlybQOLxegDAQHlfkPStagRBgq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 135, '2018-05-12 14:18:12', 1, 3, NULL, '2018-05-12 14:18:12', '2018-05-12 14:18:12', NULL),
(87, 'Brain Schneider', 'erwin18', 'WRITER', 'herman.janessa@example.net', NULL, NULL, 0, 0, '$2y$10$pX6nZboHYKSKbqatBMPw/uMHwxyJt2DFpJqXQHNQuTM7kUIvhWUT2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 58, '2018-05-12 14:18:12', 1, 3, NULL, '2018-05-12 14:18:12', '2018-05-12 14:18:12', NULL),
(88, 'Davon Lesch', 'briana11', 'WRITER', 'rosalind33@example.com', NULL, NULL, 0, 0, '$2y$10$35eWvTeWSvPLUr7.4rHfJ.PBPwQXwJfNUzeWwOesYOMZSQLnwUDFW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, '2018-05-12 14:18:13', 1, 3, NULL, '2018-05-12 14:18:13', '2018-05-12 14:18:13', NULL),
(89, 'Mr. Ignatius Homenick', 'sjerde', 'WRITER', 'vernon.dietrich@example.org', NULL, NULL, 0, 0, '$2y$10$JMEExd2oGOdSApD6TbXuuuZ0qiGRbeOHOVWHhoFeEkiyPR90JTX5a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:18:13', 1, 3, NULL, '2018-05-12 14:18:13', '2018-05-12 14:18:13', NULL),
(90, 'Alysa Lueilwitz', 'emills', 'WRITER', 'clair.predovic@example.org', NULL, NULL, 0, 0, '$2y$10$a8uASOWFg1l64yiSvONYxeUceCKGs6E5a5s9PNBk9WfipavjXhqfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:13', 1, 3, NULL, '2018-05-12 14:18:13', '2018-05-12 14:18:13', NULL),
(91, 'Miracle Howe', 'leon82', 'WRITER', 'norma72@example.org', NULL, NULL, 0, 0, '$2y$10$rOcvZdhWp0ub4TD/lldGdOHYCwa06VyxGg56GtdPKUAzDdnMdQFjG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 66, '2018-05-12 14:18:13', 1, 3, NULL, '2018-05-12 14:18:13', '2018-05-12 14:18:13', NULL),
(92, 'Prof. Dee Hammes V', 'kgaylord', 'WRITER', 'milo.smitham@example.org', NULL, NULL, 0, 0, '$2y$10$2suDv9hjzSO0FUk.ag78z.WETpLmlPTIc4gbO12zoKWzJ43YmXRsO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96, '2018-05-12 14:18:13', 1, 3, NULL, '2018-05-12 14:18:13', '2018-05-12 14:18:13', NULL),
(93, 'Kendra Quigley', 'fidel.casper', 'WRITER', 'pagac.ara@example.org', NULL, NULL, 0, 0, '$2y$10$Le1yxaC/KRKsr2DPPencqukIbrqhoL4EQdkXIGNFk7zLCTgt2vex2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(94, 'Dr. Cole Nienow', 'bergnaum.gregoria', 'WRITER', 'ahilll@example.net', NULL, NULL, 0, 0, '$2y$10$fLvAuIwQZNgzHyQmfGCTrOwMQQ6FEMijkA8CjzMk6hE8sc60jW4IS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(95, 'Ms. Adela Ziemann', 'windler.edna', 'WRITER', 'onie46@example.org', NULL, NULL, 0, 0, '$2y$10$kfGyajpHATiWXNBajSgsneA7DP4Q1KTISU92lpaenZfhTn1wXyOvC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 103, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(96, 'Miss Lois Ward DVM', 'jessika.schneider', 'WRITER', 'lambert26@example.com', NULL, NULL, 0, 0, '$2y$10$s/STMmCHoXitJ7Tkj7ej.ua2Ib97dh5ex/ZkbZVouZ4XhACZVXgNm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 120, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(97, 'Dr. Tamara Murray', 'kling.gregoria', 'WRITER', 'grant.jaren@example.net', NULL, NULL, 0, 0, '$2y$10$IIt.pr1TDPN/LiuMR3dQi.UwzxAgWwE.m4AjXkOafgO5C1pz0wjpK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 73, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(98, 'Mr. Erin Frami', 'collin.lockman', 'WRITER', 'brock.purdy@example.org', NULL, NULL, 0, 0, '$2y$10$ySOHBhO.t5ejm1726mSb6enqV39ALnx1drkYlv5s2cfJ33WiSFp4m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 108, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(99, 'Dr. Nicklaus Grant', 'jules.walker', 'WRITER', 'ernestine79@example.org', NULL, NULL, 0, 0, '$2y$10$Vd6egXgc9NZvJdki7XL42.wm.fvh2.26W4Iw7/P8FevFnVSNxVBMK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:18:14', 1, 3, NULL, '2018-05-12 14:18:14', '2018-05-12 14:18:14', NULL),
(100, 'Miss Ashlynn Mueller MD', 'dquigley', 'WRITER', 'vivian.conn@example.com', NULL, NULL, 0, 0, '$2y$10$nHToYMfMGOT/kfJuGyXGNeuE7Kc9QjJJ.7qH69YIXF6IHBs91gwXq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96, '2018-05-12 14:18:15', 1, 3, NULL, '2018-05-12 14:18:15', '2018-05-12 14:18:15', NULL),
(101, 'Dr. Estefania Dach', 'moore.antonetta', 'WRITER', 'keegan89@example.com', NULL, NULL, 0, 0, '$2y$10$6JHYvaeOdcMx7qKg/q/lh.31cA7AmT8snx0emvlHM5Mip0tnEbm36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 121, '2018-05-12 14:18:15', 1, 3, NULL, '2018-05-12 14:18:15', '2018-05-12 14:18:15', NULL),
(102, 'Dr. Lloyd Mante MD', 'beryl78', 'WRITER', 'griffin.carter@example.org', NULL, NULL, 0, 0, '$2y$10$n0RiHhDXEiDpg9Sm11pn9uYt1ABms5d6mQS6ftjXX8.tRinoEdvWO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46, '2018-05-12 14:18:15', 1, 3, NULL, '2018-05-12 14:18:15', '2018-05-12 14:18:15', NULL),
(103, 'Melyssa Block', 'lindgren.verna', 'WRITER', 'kristina76@example.com', NULL, NULL, 0, 0, '$2y$10$aUPGkYQuFMldXN/OPgp6D.PaErI5xwM106MF21Gj6KzG5plyvqo8a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 67, '2018-05-12 14:18:15', 1, 3, NULL, '2018-05-12 14:18:15', '2018-05-12 14:18:15', NULL),
(104, 'Austin Hills V', 'donavon.hayes', 'WRITER', 'kaitlyn.jakubowski@example.net', NULL, NULL, 0, 0, '$2y$10$a6BU.Uj13qHh/udQUmgnhOWVsm2gF.Y6EVQ3HtFXK/jEWFG/g3wCy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 140, '2018-05-12 14:18:15', 1, 3, NULL, '2018-05-12 14:18:15', '2018-05-12 14:18:15', NULL),
(105, 'Miss Estrella Yundt', 'fmclaughlin', 'WRITER', 'lavonne.smitham@example.net', NULL, NULL, 0, 0, '$2y$10$QEbB6IxH789xLmEryX4/mumv/gMSFjLhD.P237mhB2MvxV9wME/EC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54, '2018-05-12 14:18:15', 1, 3, NULL, '2018-05-12 14:18:15', '2018-05-12 14:18:15', NULL),
(106, 'Prof. Isai Kohler', 'brandt.greenholt', 'WRITER', 'becker.rahsaan@example.org', NULL, NULL, 0, 0, '$2y$10$WtZqmHP5suRQ/.1jdEYcTOVPtAHrsTZ/UUTg.QgIM42IYbYxnKCui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124, '2018-05-12 14:18:16', 1, 3, NULL, '2018-05-12 14:18:16', '2018-05-12 14:18:16', NULL),
(107, 'Dr. Aniyah Tillman', 'idietrich', 'WRITER', 'karlee30@example.com', NULL, NULL, 0, 0, '$2y$10$hFTjS0eWt6gx6YatVwArk.IkvipZaAQreil2PgKPwSY77ihoO5nnm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:16', 1, 3, NULL, '2018-05-12 14:18:16', '2018-05-12 14:18:16', NULL),
(108, 'Dulce Mosciski Jr.', 'ecartwright', 'WRITER', 'iparisian@example.net', NULL, NULL, 0, 0, '$2y$10$3pU1VAeoRSs6cC9SAy8eX.DlXVM37WK8LtrDue7gCrdlQaqTiCguS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8, '2018-05-12 14:18:16', 1, 3, NULL, '2018-05-12 14:18:16', '2018-05-12 14:18:16', NULL),
(109, 'Dr. Edmund Gleason', 'larkin.cyrus', 'WRITER', 'wmills@example.net', NULL, NULL, 0, 0, '$2y$10$Nu1HRgmVW5.yg2m3ErkfTuUZKgCM7C9pTQiQc2m/C4LghC2bR8jNi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 119, '2018-05-12 14:18:16', 1, 3, NULL, '2018-05-12 14:18:16', '2018-05-12 14:18:16', NULL),
(110, 'Cristobal West I', 'tyler66', 'WRITER', 'kris.keira@example.org', NULL, NULL, 0, 0, '$2y$10$4Zn6fqk8Ni359yAAgrZm3.yAM5KI2W79r7emmmhrLSeeYEqO6vucW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7, '2018-05-12 14:18:16', 1, 3, NULL, '2018-05-12 14:18:16', '2018-05-12 14:18:16', NULL),
(111, 'Mozelle Cremin', 'dudley.sanford', 'WRITER', 'geovanny18@example.com', NULL, NULL, 0, 0, '$2y$10$TAPimSi1gAGB2Y7Q/2xpAO5PNbfUQQ.AD26BfbVquQ.BfrfMI7QiG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107, '2018-05-12 14:18:16', 1, 3, NULL, '2018-05-12 14:18:16', '2018-05-12 14:18:16', NULL),
(112, 'Dr. Roxanne McCullough', 'evalyn17', 'WRITER', 'hollis75@example.com', NULL, NULL, 0, 0, '$2y$10$xPLDCB1sJA9jOythyiZl9.uK1EaAh4EKDJiwmAGOt9R9vkObPNGnC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(113, 'Michaela Lockman', 'chelsey.konopelski', 'WRITER', 'antonietta.maggio@example.net', NULL, NULL, 0, 0, '$2y$10$tlQsQeVCYcBn9HTBFZa0rO2vgzkjeQ7scQNPXgi9T0w92fGOOXHom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 135, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(114, 'Braulio Ullrich I', 'cale.prosacco', 'WRITER', 'meda.gibson@example.org', NULL, NULL, 0, 0, '$2y$10$vgOWbgcuFS2vhpnbXU8XoekMuRwZG0T1bZGnzLohhg5Mbq3Noouri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 50, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(115, 'Miss Annetta Abbott III', 'geo70', 'WRITER', 'rheaney@example.com', NULL, NULL, 0, 0, '$2y$10$8s0u8Xsg5llO.b1QrlnLaOA.TlNhYRrasbVfBf922/TWtrs71ON9K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 42, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(116, 'Prof. Norma Mills', 'bernice94', 'WRITER', 'trenner@example.org', NULL, NULL, 0, 0, '$2y$10$zi34c32bqMBRwdTo.sZKnu/NjDqItdvScX1gnl35C29rH3QIoAZ5C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(117, 'Yessenia Lehner', 'ucrooks', 'WRITER', 'candice99@example.net', NULL, NULL, 0, 0, '$2y$10$AW92u8YigmbiLzZ23u6sDefolzoQqzQBinVIn0FwYn2oi3osxIT1a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 88, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(118, 'Vilma Wolf', 'haley.willa', 'WRITER', 'zlemke@example.org', NULL, NULL, 0, 0, '$2y$10$RC1xUnLiCnOFfG.QVtf4jeD6PDLbj7xMcZLy9El1RYbqnMQld8bkK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 74, '2018-05-12 14:18:17', 1, 3, NULL, '2018-05-12 14:18:17', '2018-05-12 14:18:17', NULL),
(119, 'Adelle Johnson DDS', 'susan.bashirian', 'WRITER', 'emory29@example.net', NULL, NULL, 0, 0, '$2y$10$xI45uNh2gYCb5yza0vkwV.NRMKUvysj6m3v5q0KEkOSyr0qRRLzta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(120, 'Aileen Cartwright DVM', 'medhurst.milan', 'WRITER', 'damon83@example.net', NULL, NULL, 0, 0, '$2y$10$qM/dPHz5PfAfLuXAjGi/ruW5agXsi4f3fKaV7JEyjNiLv6aMG4thq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(121, 'June Wyman', 'qernser', 'WRITER', 'margret.hammes@example.net', NULL, NULL, 0, 0, '$2y$10$RUK/QyYc6WlWfMQfQd1pN.Itq11sFh7W36dbriQcgw3fnZfTVRdW.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(122, 'Aric Keeling IV', 'laurine72', 'WRITER', 'rod.moore@example.com', NULL, NULL, 0, 0, '$2y$10$FLiHzOrDa4aBFTvxLdp4ven.i7NRe/f533.xRKHw20D1crU5pNpra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 79, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(123, 'Dr. Doris Harvey', 'max.nader', 'WRITER', 'athena36@example.com', NULL, NULL, 0, 0, '$2y$10$RhDhVwUWlYLnIeNsvmJjF.p4CS8mTalrBWXRF/gY7lcMkjpewkEfu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 85, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(124, 'Frank Jenkins DDS', 'monahan.jovani', 'WRITER', 'josh49@example.org', NULL, NULL, 0, 0, '$2y$10$sfumUVnHj1zts4YcXG342unX2iaPySCm0waykztH0HPpR2QzLogsu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 132, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(125, 'Arch Schowalter II', 'corwin.susan', 'WRITER', 'donnie49@example.net', NULL, NULL, 0, 0, '$2y$10$G.BlGXjgqpi83LyWW14owOmQ1vZFShPCSEcEeSsL/jnJOqJzKpWR2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 89, '2018-05-12 14:18:18', 1, 3, NULL, '2018-05-12 14:18:18', '2018-05-12 14:18:18', NULL),
(126, 'Dr. Deshaun Crist', 'ratke.jerrod', 'WRITER', 'gleichner.kelsi@example.com', NULL, NULL, 0, 0, '$2y$10$DsrOvlb8p5JrfKYB4i1O4OwefPjFvABGQX4Q9QwhppNlvCTn.tOZ6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 37, '2018-05-12 14:18:19', 1, 3, NULL, '2018-05-12 14:18:19', '2018-05-12 14:18:19', NULL),
(127, 'Bert Lueilwitz', 'rcrooks', 'WRITER', 'stokes.hadley@example.org', NULL, NULL, 0, 0, '$2y$10$K.noPzDr0kO8qYFxSF9tSO9mlr6oNYJIFTBz0Hw59LH4RxllES7Y2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, '2018-05-12 14:18:19', 1, 3, NULL, '2018-05-12 14:18:19', '2018-05-12 14:18:19', NULL),
(128, 'Maxime Towne', 'harmony.douglas', 'WRITER', 'hellen82@example.com', NULL, NULL, 0, 0, '$2y$10$C0uF6ijpeFyOLy5pEbG5E./HPj9hkkCUEVmftbEpG12ZCyCaLbx0i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 82, '2018-05-12 14:18:19', 1, 3, NULL, '2018-05-12 14:18:19', '2018-05-12 14:18:19', NULL),
(129, 'Samson Turner', 'smedhurst', 'WRITER', 'emma.oberbrunner@example.net', NULL, NULL, 0, 0, '$2y$10$Mt.D//tPnMAfbdCFZFpWC.HKW/5VVGr7l3bnH8iK0.d7ratVDKjhS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 147, '2018-05-12 14:18:19', 1, 3, NULL, '2018-05-12 14:18:19', '2018-05-15 07:56:57', NULL),
(130, 'Lydia Metz', 'kemmer.manley', 'WRITER', 'ncremin@example.net', NULL, NULL, 0, 0, '$2y$10$6FLK7dS6kD7VvdJvNj12puKKJeVca51uYQtUCe9b4TtZrBhXmaUJu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 49, '2018-05-12 14:18:19', 1, 3, NULL, '2018-05-12 14:18:19', '2018-05-12 14:18:19', NULL),
(131, 'Cassandra Klein', 'smith.nash', 'WRITER', 'quigley.kassandra@example.org', NULL, NULL, 0, 0, '$2y$10$xrE2mMZ4/5YH1ug5uiBmHOd0YRAgdFSDR9MKZKIXs7G9cnxdgiBqi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:18:19', 1, 3, NULL, '2018-05-12 14:18:19', '2018-05-12 14:18:19', NULL),
(132, 'Rozella Bashirian DDS', 'loyal.glover', 'WRITER', 'lwuckert@example.org', NULL, NULL, 0, 0, '$2y$10$1eepJyNo0cSKhdHC24Qd8e/J6WnosFM1r5FWobt9ZRKHw4RSuk7By', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:18:20', 1, 3, NULL, '2018-05-12 14:18:20', '2018-05-12 14:18:20', NULL),
(133, 'Mrs. Jennie Cummerata III', 'botsford.hellen', 'WRITER', 'wbogan@example.com', NULL, NULL, 0, 0, '$2y$10$kbloiU1uuXYa30vAWnCvQeBgOSXjHkFxre7B7bOa003i0LgnAkXDe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2018-05-12 14:18:20', 1, 3, NULL, '2018-05-12 14:18:20', '2018-05-12 14:18:20', NULL),
(134, 'Everett Murphy', 'marion.willms', 'WRITER', 'bailey.ophelia@example.com', NULL, NULL, 0, 0, '$2y$10$VOSeH9QUtdfBqJgUtIb3uuN2uYmZo4Qgxb/7PgUiK2Xa87NZ69fEG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 124, '2018-05-12 14:18:20', 1, 3, NULL, '2018-05-12 14:18:20', '2018-05-12 14:18:20', NULL),
(135, 'Dr. Rudolph Deckow', 'rmckenzie', 'WRITER', 'ddickens@example.com', NULL, NULL, 0, 0, '$2y$10$apaYpt2AoNNECyeLsiz6MuHq5oaNx9hIbHwcVxlyaUekRa8Ld9WnO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39, '2018-05-12 14:18:20', 1, 3, NULL, '2018-05-12 14:18:20', '2018-05-12 14:18:20', NULL),
(136, 'Myriam Cormier DDS', 'romaguera.eduardo', 'WRITER', 'savannah.ondricka@example.org', NULL, NULL, 0, 0, '$2y$10$hACpfKi8Mg3RCm9k9o10retpxHSBE8.9D.Eq9ElcMhMPBobBs5ZTm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:18:20', 1, 3, NULL, '2018-05-12 14:18:20', '2018-05-12 14:18:20', NULL),
(137, 'Maegan Larson DVM', 'thad.beer', 'WRITER', 'cgoldner@example.org', NULL, NULL, 0, 0, '$2y$10$WsnAfhBBTrpUSh.OZNyuK.wq6zrBPqVriWuhVVoHNEADImHdh4oXS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 91, '2018-05-12 14:18:20', 1, 3, NULL, '2018-05-12 14:18:20', '2018-05-12 14:18:20', NULL),
(138, 'Alayna Kerluke', 'efrain02', 'WRITER', 'gottlieb.humberto@example.org', NULL, NULL, 0, 0, '$2y$10$tgfm9vU9tpbdOFKmQPhpCuJC8qEiI1VNmve7kO0UGAlIRvVkfuryS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 85, '2018-05-12 14:18:21', 1, 3, NULL, '2018-05-12 14:18:21', '2018-05-12 14:18:21', NULL),
(139, 'Prof. Mariano Thompson', 'haley08', 'WRITER', 'christiansen.stanley@example.net', NULL, NULL, 0, 0, '$2y$10$hSoKRW4nA6aaUGO9sTzkYOAy5tNp/N6qY7PKM330nGGcg6sQUmQEu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104, '2018-05-12 14:18:21', 1, 3, NULL, '2018-05-12 14:18:21', '2018-05-12 14:18:21', NULL),
(140, 'Mrs. Naomie Schamberger', 'zane.bradtke', 'WRITER', 'raynor.clement@example.org', NULL, NULL, 0, 0, '$2y$10$uFeuMYiBajwYjUMGtfzKaOwqEgdGjLvc9dqEDfA0oZvN4WIMZEBPq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 129, '2018-05-12 14:18:21', 1, 3, NULL, '2018-05-12 14:18:21', '2018-05-12 14:18:21', NULL),
(141, 'Amanda Carroll', 'abagail.block', 'WRITER', 'kianna.paucek@example.net', NULL, NULL, 0, 0, '$2y$10$VY/XXVq5IebTtK1Zb6KHdedBOwyPufsSbWiwno7aloIlr1loacb7G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 86, '2018-05-12 14:18:21', 1, 3, NULL, '2018-05-12 14:18:21', '2018-05-12 14:18:21', NULL),
(142, 'Oswaldo Thompson', 'madisen61', 'WRITER', 'bode.clifford@example.net', NULL, NULL, 0, 0, '$2y$10$z06aIXpbWoesGxKx4bJO2u7I6L.u4fwGJmAG7c8FtjoI2GW8GNBV.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 65, '2018-05-12 14:18:22', 1, 3, NULL, '2018-05-12 14:18:22', '2018-05-12 14:18:22', NULL),
(143, 'Prof. Hillary Lang III', 'ferry.zelma', 'WRITER', 'grady.xzavier@example.net', NULL, NULL, 0, 0, '$2y$10$2i3bmueKY1VNlojKEP1hmODEzIkWMyzse2PlqLrfRgmooQ/NifQPy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 97, '2018-05-12 14:18:22', 1, 3, NULL, '2018-05-12 14:18:22', '2018-05-12 14:18:22', NULL),
(144, 'Armando Howe', 'stacey.bartoletti', 'WRITER', 'tara.crona@example.org', NULL, NULL, 0, 0, '$2y$10$sQDdn2NtQ1GX3yweRY6OruJzszmDIPZuVw04WpGfO/r8EW0UcAxzK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 135, '2018-05-12 14:18:22', 1, 3, NULL, '2018-05-12 14:18:22', '2018-05-12 14:18:22', NULL),
(145, 'Ulises Waelchi', 'halle53', 'WRITER', 'nigel39@example.com', NULL, NULL, 0, 0, '$2y$10$P7Fs3uPLKwBf33zBtncDUOBRftAWPujTpDP8FxV8k9yTULlNDePO.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 137, '2018-05-12 14:18:22', 1, 3, NULL, '2018-05-12 14:18:22', '2018-05-12 14:18:22', NULL),
(146, 'Sonya Von', 'kwhite', 'WRITER', 'smitham.americo@example.net', NULL, NULL, 0, 0, '$2y$10$WsWmZp8sFbfWkUgNzsHZo.flg.Ts6IO0OkFoppkZxzGrVkyyqXFPa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 102, '2018-05-12 14:18:22', 1, 3, NULL, '2018-05-12 14:18:22', '2018-05-12 14:18:22', NULL),
(147, 'Lilla Ondricka', 'anais.cronin', 'WRITER', 'magali21@example.net', NULL, NULL, 0, 0, '$2y$10$hIAqxAPFPqVvU2AsaKmq8eotjS0Q69lekj2VZst8hUiZ1khnnl6oK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 137, '2018-05-12 14:18:23', 1, 3, NULL, '2018-05-12 14:18:23', '2018-05-12 14:18:23', NULL),
(148, 'Dr. Zander Hessel PhD', 'ledner.genevieve', 'WRITER', 'morissette.seth@example.com', NULL, NULL, 0, 0, '$2y$10$vEn12czYzLmXvNl3UAWBQuJDQVVHdVBteGBnlHT6V5RJhXRnlyjwW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 37, '2018-05-12 14:18:23', 1, 3, NULL, '2018-05-12 14:18:23', '2018-05-12 14:18:23', NULL),
(149, 'Antonette Nitzsche I', 'maeve16', 'WRITER', 'heathcote.lora@example.net', NULL, NULL, 0, 0, '$2y$10$5dE37ofWfpNjno.dD7dsZeAXDK5QjlNTBUq0Z1b/njw.cBa902JWm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141, '2018-05-12 14:18:23', 1, 3, NULL, '2018-05-12 14:18:23', '2018-05-12 14:18:23', NULL);
INSERT INTO `users` (`id`, `name`, `username`, `user_type`, `email`, `paypal_email`, `dob`, `balance`, `is_admin`, `password`, `image`, `thumbnail`, `academic_level_id`, `school`, `field_of_specialization`, `country_id`, `city`, `address`, `phone`, `about`, `professional_bio`, `my_details`, `academic_experience`, `views`, `orders_complete`, `last_seen`, `active`, `attempts_left`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(150, 'Ms. Marianna Towne', 'lilian82', 'WRITER', 'paucek.jacynthe@example.com', NULL, NULL, 0, 0, '$2y$10$vjQrWE0BOBOFUGQ5N2ARH.j1WEwtw6Xgy3pMblKWnXPeFQf7NdMEG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 97, '2018-05-12 14:18:23', 1, 3, NULL, '2018-05-12 14:18:23', '2018-05-12 14:18:23', NULL),
(151, 'Amya Schuster', 'boehm.sincere', 'WRITER', 'jrempel@example.net', NULL, NULL, 0, 0, '$2y$10$Qx47qTl68cOS6V3ynPzj7.DhGfbmvV7mlnOfsV6LlZFKbye6UVaC6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 24, '2018-05-12 14:18:23', 1, 3, NULL, '2018-05-12 14:18:23', '2018-05-12 14:18:23', NULL),
(152, 'Miss Bettye McCullough Jr.', 'okuneva.evert', 'WRITER', 'hfriesen@example.org', NULL, NULL, 0, 0, '$2y$10$Em3YgkFjHrnQoq/jw7H22e4geh/8OWvjECAO1gQtPqL4YF.3djq1q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 24, '2018-05-12 14:18:23', 1, 3, NULL, '2018-05-12 14:18:23', '2018-05-12 14:18:23', NULL),
(153, 'Dr. Demetris Nolan', 'aron71', 'WRITER', 'colleen.monahan@example.net', NULL, NULL, 0, 0, '$2y$10$vPlx8tQ8tTsbOJkUtvfvh.g7wp1aTAPm2RuMn4M7PFJEhh18GRlWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(154, 'Ms. Lauriane Grady MD', 'flossie.williamson', 'WRITER', 'toni.daniel@example.com', NULL, NULL, 0, 0, '$2y$10$C9/dNypygXlSXIW50FeqXe6.59d7h9FJXrINHhcsTkFXyDkAeYzo2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(155, 'Hayley Wyman', 'moses34', 'WRITER', 'casper.bell@example.org', NULL, NULL, 0, 0, '$2y$10$WzDWIXiLrZ100h/VKW5pt.MmG9y0/SD.j1yJfkJkVlvYEHK4n.hUm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(156, 'Mr. Troy Schimmel', 'lorenza.stroman', 'WRITER', 'stella.wunsch@example.com', NULL, NULL, 0, 0, '$2y$10$xFg3H7R1eFnaSBo/BO85cek/iQUHYz9tdunlwsaeTr89571aTL6PC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(157, 'Jovani Roberts', 'nschuppe', 'WRITER', 'xokuneva@example.com', NULL, NULL, 0, 0, '$2y$10$QMwsih9cpRqVC/YGOXTVnu4yBnjo06oK4hgNPCjAmO9.qY3gdsCdK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 24, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(158, 'Amelia Goyette', 'georgianna38', 'WRITER', 'delilah.dietrich@example.net', NULL, NULL, 0, 0, '$2y$10$ByWFjLxtTIFhYh.BuZichO5la0zoL7FeRna5uJr8KDulUwvZ4ASS6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 122, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(159, 'Leatha Schneider', 'vernon74', 'WRITER', 'ron.jacobs@example.com', NULL, NULL, 0, 0, '$2y$10$RaYENUoB/tD0YyEBldD4x.kErZFUK3qPq3hl0dgQYfrHrfIgOuVI6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, '2018-05-12 14:18:24', 1, 3, NULL, '2018-05-12 14:18:24', '2018-05-12 14:18:24', NULL),
(160, 'Juanita Schimmel', 'ambrose91', 'WRITER', 'blick.monroe@example.org', NULL, NULL, 0, 0, '$2y$10$Ym4c/dfNODLz2fbLc4p84eRxTiJA17hV/3S0IA3bgTm4gerTPTxWa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2018-05-12 14:18:25', 1, 3, NULL, '2018-05-12 14:18:25', '2018-05-12 14:18:25', NULL),
(161, 'Novella Hodkiewicz', 'bfeil', 'WRITER', 'okoss@example.org', NULL, NULL, 0, 0, '$2y$10$2SLSK1JEkL7AoT1FyB/60.Gjs1eadx/s5LCYR2JBZkbk2e1M3zq6i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 101, '2018-05-12 14:18:25', 1, 3, NULL, '2018-05-12 14:18:25', '2018-05-12 14:18:25', NULL),
(162, 'Dr. Bernita Mills', 'rflatley', 'WRITER', 'mckayla76@example.org', NULL, NULL, 0, 0, '$2y$10$LzMTeOxbshnHTTZ9v6qcqetVbmYsKP8TXrKbOxQPU1ozx4FtgY1wq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9, '2018-05-12 14:18:25', 1, 3, NULL, '2018-05-12 14:18:25', '2018-05-12 14:18:25', NULL),
(163, 'Prof. Fernando Schoen Sr.', 'tillman.edd', 'WRITER', 'dedrick08@example.com', NULL, NULL, 0, 0, '$2y$10$YcII45tpnfvmDCk6fNnPvOAcImrfEUuJORQ47WEaRTa/Pnfapnwf6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8, '2018-05-12 14:18:25', 1, 3, NULL, '2018-05-12 14:18:25', '2018-05-12 14:18:25', NULL),
(164, 'Prof. Adan Toy Sr.', 'schroeder.orpha', 'WRITER', 'odie.tremblay@example.com', NULL, NULL, 0, 0, '$2y$10$ZwpbwgSDbxROfcfSf/0qz.FGnEWQu0NhHupcoPuwuS9JG/XYaAp9a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 11, '2018-05-12 14:18:25', 1, 3, NULL, '2018-05-12 14:18:25', '2018-05-12 14:18:25', NULL),
(165, 'Baron Yundt', 'elouise.torphy', 'WRITER', 'brook94@example.net', NULL, NULL, 0, 0, '$2y$10$VaLCZAhV5EBWyU.cF0L25uzyZUKNoxzUFKg4Qj49tI6DCoC0NaFP.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68, '2018-05-12 14:18:25', 1, 3, NULL, '2018-05-12 14:18:25', '2018-05-12 14:18:25', NULL),
(166, 'Conner Klocko', 'mathias.fisher', 'WRITER', 'osinski.monique@example.org', NULL, NULL, 0, 0, '$2y$10$znqQ9kH5gx.Y.WqvJUNRruIKATApI22qCtqQGu.M9fbk1V2RPjUe6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(167, 'Dr. Minnie Dickinson I', 'romaguera.anabel', 'WRITER', 'viva.hand@example.org', NULL, NULL, 0, 0, '$2y$10$IZ8.kctm/8dhtxudLdL39OD9GYZzSfgoOtjCTAB93BvDFMJRxJca.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(168, 'Jennyfer Powlowski', 'sbraun', 'WRITER', 'candice05@example.org', NULL, NULL, 0, 0, '$2y$10$VSwvPpNyHOh1Jkd58ju6TeK66/h2T.YtfOTVl6MCPL5yf1agenbeq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 41, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(169, 'Dewitt Rolfson', 'boconner', 'WRITER', 'desiree.tillman@example.com', NULL, NULL, 0, 0, '$2y$10$iFZjWM5.YVLABcOVTn6Ete.kSeeCN3fouN1ptYGJtUkNnSzkBiym2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 65, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(170, 'Mr. Blaise Adams', 'dena82', 'WRITER', 'ryann.homenick@example.org', NULL, NULL, 0, 0, '$2y$10$U3R6V30L7QqmEQkaU96Uv.W.uUGiSzmgqHts.f.2I6GHr/mXizRHK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 66, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(171, 'Prof. Ova Flatley MD', 'deonte.auer', 'WRITER', 'wrippin@example.org', NULL, NULL, 0, 0, '$2y$10$yAB.ojd.seDxus2zpji78uEJoYegiSonOJCw/ZsOvQMzgAIrkvmue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 116, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(172, 'Vergie Goodwin', 'ischumm', 'WRITER', 'lubowitz.rodolfo@example.net', NULL, NULL, 0, 0, '$2y$10$Sja2hv027WiHL22F5cPymuZLvDJQdaVmtsQ0hWl/f1JkZ4Y4i3Z16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:26', 1, 3, NULL, '2018-05-12 14:18:26', '2018-05-12 14:18:26', NULL),
(173, 'Jules Lindgren', 'brady.johns', 'WRITER', 'nat.beahan@example.org', NULL, NULL, 0, 0, '$2y$10$p5f7d/PjO3a0j/5KS6lhWuUwm2sGuYnrvk3gJVqWaWJU2plOzsbqu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 105, '2018-05-12 14:18:27', 1, 3, NULL, '2018-05-12 14:18:27', '2018-05-12 14:18:27', NULL),
(174, 'Sydnee Herzog', 'sdoyle', 'WRITER', 'hilpert.layne@example.com', NULL, NULL, 0, 0, '$2y$10$A1hZEZcGRyCiCbIoQgLkjegY3hleS2RpY8cCxk7aWMV/nngHDo3Ym', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 75, '2018-05-12 14:18:27', 1, 3, NULL, '2018-05-12 14:18:27', '2018-05-12 14:18:27', NULL),
(175, 'Nash Medhurst', 'tomas.zboncak', 'WRITER', 'hellen30@example.com', NULL, NULL, 0, 0, '$2y$10$cwMGzY9nzZIg97sQvDrTIeGR.VjyjzPwANywxXjOm3nnATn80eqea', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, '2018-05-12 14:18:27', 1, 3, NULL, '2018-05-12 14:18:27', '2018-05-12 14:18:27', NULL),
(176, 'Noel Cremin III', 'xgutkowski', 'WRITER', 'heathcote.karli@example.org', NULL, NULL, 0, 0, '$2y$10$gAOWNHsaA/6ehtd5tcewiO30flo.tRHC4GnrnVVpaRQgAyUbEPm5e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16, '2018-05-12 14:18:27', 1, 3, NULL, '2018-05-12 14:18:27', '2018-05-12 14:18:27', NULL),
(177, 'Dr. Waino Leffler', 'feil.mireille', 'WRITER', 'hessel.emmet@example.org', NULL, NULL, 0, 0, '$2y$10$CckEYUPFNtOA2jxNGlGIhuKMvSob/BMJ5lT00NHd1YUpxb1vMbCcm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 140, '2018-05-12 14:18:27', 1, 3, NULL, '2018-05-12 14:18:27', '2018-05-12 14:18:27', NULL),
(178, 'Elizabeth Roob', 'ilegros', 'WRITER', 'javier58@example.net', NULL, NULL, 0, 0, '$2y$10$AScOWL1ONxrzVwlVpsxxA.4TZLp.Oc4b5zR65YBnGBNBJoDqvY2J2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 13, '2018-05-12 14:18:27', 1, 3, NULL, '2018-05-12 14:18:27', '2018-05-12 14:18:27', NULL),
(179, 'Ervin Simonis I', 'schroeder.joany', 'WRITER', 'cade.casper@example.net', NULL, NULL, 0, 0, '$2y$10$7aUzmQdLjQLO1/z2Wz3sGOxOgZBwMia8GB0m/5cw9fviPd2A5Iuhu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 136, '2018-05-12 14:18:28', 1, 3, NULL, '2018-05-12 14:18:28', '2018-05-12 14:18:28', NULL),
(180, 'Dameon Swift', 'rigoberto73', 'WRITER', 'julia33@example.net', NULL, NULL, 0, 0, '$2y$10$6q7UMprXtLWR2paa27y8jeX.pA..12n2ldMyN4tDC1zZTIahGvIFm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 146, '2018-05-12 14:18:28', 1, 3, NULL, '2018-05-12 14:18:28', '2018-05-12 14:18:28', NULL),
(181, 'Micaela Greenfelder', 'effertz.lela', 'WRITER', 'iherzog@example.net', NULL, NULL, 0, 0, '$2y$10$HtKBrVdmyNSTJckT/mTgKuZCtj7.fHjtaYvwj.HqvGQlvODfJ9YZq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:18:28', 1, 3, NULL, '2018-05-12 14:18:28', '2018-05-12 14:18:28', NULL),
(182, 'Prof. Dorothy Lebsack PhD', 'dax26', 'WRITER', 'ihudson@example.org', NULL, NULL, 0, 0, '$2y$10$3U0uzoLXb31H1l54mHko3ON6bkx/DKCw7Yk1COw4kzKc/YUniJTyW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110, '2018-05-12 14:18:28', 1, 3, NULL, '2018-05-12 14:18:28', '2018-05-12 14:18:28', NULL),
(183, 'Mitchel Schulist', 'della84', 'WRITER', 'cruickshank.conner@example.com', NULL, NULL, 0, 0, '$2y$10$.c/SUY0u4Xvq77LUsvBcleOT.tQSf8A9zZyb2AAJvh73n6DUkXH16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 49, '2018-05-12 14:18:28', 1, 3, NULL, '2018-05-12 14:18:28', '2018-05-12 14:18:28', NULL),
(184, 'Prof. Brielle Waelchi', 'emmerich.jaquan', 'WRITER', 'cormier.cleta@example.org', NULL, NULL, 0, 0, '$2y$10$uJpVwsaKV68WOLX40aoJR.zVhHJBYkGWkA15MSS2.p2NMEBlnKMOm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 69, '2018-05-12 14:18:29', 1, 3, NULL, '2018-05-12 14:18:29', '2018-05-12 14:18:29', NULL),
(185, 'Miss Thalia Leffler', 'quitzon.arianna', 'WRITER', 'ocorwin@example.com', NULL, NULL, 0, 0, '$2y$10$eDu7XkJYjDXa55WyX6PcGOM82Ks4iUBymrW.YA0tyBpTzqS6nLnH6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71, '2018-05-12 14:18:29', 1, 3, NULL, '2018-05-12 14:18:29', '2018-05-12 14:18:29', NULL),
(186, 'Marcel Satterfield', 'caterina40', 'WRITER', 'uriah.keebler@example.org', NULL, NULL, 0, 0, '$2y$10$NSBi9RhDVU10w5sZb2QhDOj.byr4utGofwsW7D741e2FCeX0sVVBi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:18:29', 1, 3, NULL, '2018-05-12 14:18:29', '2018-05-12 14:18:29', NULL),
(187, 'Tobin Glover', 'abigail51', 'WRITER', 'dkuphal@example.com', NULL, NULL, 0, 0, '$2y$10$3U76Os4Biu9wTZEbbOY6EuwLtXEJ7ww6DeVcDhKsPpGvyePPUQIbG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 53, '2018-05-12 14:18:29', 1, 3, NULL, '2018-05-12 14:18:29', '2018-05-12 14:18:29', NULL),
(188, 'Bessie Little', 'meggie.erdman', 'WRITER', 'vkling@example.com', NULL, NULL, 0, 0, '$2y$10$xw7YJ7tpQMgTeN/I68JHoetG5KRzOPMwPl/iazROcGomaBtq01d0e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 131, '2018-05-12 14:18:29', 1, 3, NULL, '2018-05-12 14:18:29', '2018-05-12 14:18:29', NULL),
(189, 'Prof. Danyka Ward', 'patrick.crooks', 'WRITER', 'ebahringer@example.org', NULL, NULL, 0, 0, '$2y$10$BJ4gWMuXoElvz2wznNcMrulXN0zeAOrja46TsyJLvpxBsc8xlxGge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56, '2018-05-12 14:18:29', 1, 3, NULL, '2018-05-12 14:18:29', '2018-05-12 14:18:29', NULL),
(190, 'Giovanna Lind', 'kariane00', 'WRITER', 'desmond42@example.org', NULL, NULL, 0, 0, '$2y$10$pmk4QgT8yHFFgzfbTPYFk.g10TckH9AaYwxF0iHIQ.EugOsMNsHMm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(191, 'Mr. Austyn Fritsch', 'zkreiger', 'WRITER', 'luther51@example.com', NULL, NULL, 0, 0, '$2y$10$c3PNkvp14BWYrvqKETTX/utdQ0lBHKNElDum9LiILpIvmX4ax/DPG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(192, 'Tabitha Weimann DDS', 'annamae28', 'WRITER', 'zondricka@example.net', NULL, NULL, 0, 0, '$2y$10$qf9OW59r3ZRn7mDaSA4nHOO0gWVHhDlmKHjcl1ZI.Y.utZe8AUs/m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(193, 'Shyann Baumbach', 'henriette.bednar', 'WRITER', 'donavon78@example.com', NULL, NULL, 0, 0, '$2y$10$BCPsH90KJULkt3q8O0mC.uNU5GAtZhWZlmBCPDYI/xl7nZ5tjUyL.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(194, 'Marques Gleason', 'marian36', 'WRITER', 'sschoen@example.org', NULL, NULL, 0, 0, '$2y$10$4Gb2gseWO5sGriCattvoxeyeqYtbOvOYgDSNKzwNzkIouc0yt6yQ6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 128, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(195, 'Emilia Terry', 'krystel33', 'WRITER', 'friedrich.murray@example.com', NULL, NULL, 0, 0, '$2y$10$fuAXnI7sX9gETtlTgKA.n.WqsAANfzKMw4uHsjl9n.0F/FJ8Q3huu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 15, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(196, 'Arnold Lowe', 'sipes.connor', 'WRITER', 'nhintz@example.com', NULL, NULL, 0, 0, '$2y$10$N26GN.cN15Q9R63KlC5O.OyR4CP86Mmgx2MVxUK6H193Z73BUOf46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 54, '2018-05-12 14:18:30', 1, 3, NULL, '2018-05-12 14:18:30', '2018-05-12 14:18:30', NULL),
(197, 'Suzanne Kilback', 'kbashirian', 'WRITER', 'rbayer@example.net', NULL, NULL, 0, 0, '$2y$10$0DzjSy5U3qq/lEm/gRW9k.hEYN9flvQKuKqaq36vvKCnNsFf8Ls8y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 121, '2018-05-12 14:18:31', 1, 3, NULL, '2018-05-12 14:18:31', '2018-05-12 14:18:31', NULL),
(198, 'Ima McLaughlin', 'kolson', 'WRITER', 'brenda.schoen@example.org', NULL, NULL, 0, 0, '$2y$10$0vGWTacrQFCHzdInpVLKReoBJme815ZW4/P2wBpFxje9Lw8KOuibO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, '2018-05-12 14:18:31', 1, 3, NULL, '2018-05-12 14:18:31', '2018-05-12 14:18:31', NULL),
(199, 'Selena Ortiz', 'umurray', 'WRITER', 'schneider.arely@example.org', NULL, NULL, 0, 0, '$2y$10$3lMReLVf50eeqUIU9xBgZObTlVefcZ2c9GhqcywdLXcg/965mSSf2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55, '2018-05-12 14:18:31', 1, 3, NULL, '2018-05-12 14:18:31', '2018-05-12 14:18:31', NULL),
(200, 'Adrienne Ortiz II', 'ahane', 'WRITER', 'tyler62@example.org', NULL, NULL, 0, 0, '$2y$10$d2.YxtOPKM92rUf2R7Yz8uo53e09dssvBsI2oH8NySdMLdoEcOpna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:18:31', 1, 3, NULL, '2018-05-12 14:18:31', '2018-05-12 14:18:31', NULL),
(201, 'Peyton Welch', 'cierra.haag', 'WRITER', 'predovic.donny@example.net', NULL, NULL, 0, 0, '$2y$10$/AhMrxLcY.nfbLFkwYLbC.aJbV83mem1Na9IfuNrHzreu7I8LyTOK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:18:31', 1, 3, NULL, '2018-05-12 14:18:31', '2018-05-12 14:18:31', NULL),
(202, 'Yvonne Hoeger', 'ella28', 'WRITER', 'ken.koelpin@example.net', NULL, NULL, 0, 0, '$2y$10$QJfW7mySlIJ53IpB1XwkEu.YC7uC232LuRBkKTLQ.K7JXknzhBA6i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 103, '2018-05-12 14:18:31', 1, 3, NULL, '2018-05-12 14:18:31', '2018-05-12 14:18:31', NULL),
(203, 'Steve Rutherford', 'erick60', 'WRITER', 'annamarie37@example.net', NULL, NULL, 0, 0, '$2y$10$gEoV9rzc3kVox96W8TM1GejSv/kWqtJuyn./zLm5Ts7fVMAelD.b6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 122, '2018-05-12 14:18:32', 1, 3, NULL, '2018-05-12 14:18:32', '2018-05-12 14:18:32', NULL),
(204, 'Jacklyn Lowe', 'lorine79', 'WRITER', 'sarina.jacobson@example.com', NULL, NULL, 0, 0, '$2y$10$EnmILnJSzRngJj57q2P9eu.yBDYF8CsV2oevD4YRki9ANCjt739J2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 98, '2018-05-12 14:18:32', 1, 3, NULL, '2018-05-12 14:18:32', '2018-05-12 14:18:32', NULL),
(205, 'Maryam Beahan', 'janie60', 'WRITER', 'skye.stokes@example.org', NULL, NULL, 0, 0, '$2y$10$CgNgarb0XNokeIs9RRG5E.KWtlmSJd/Po2Tiz18wWmjp.ynrU78tO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 89, '2018-05-12 14:18:32', 1, 3, NULL, '2018-05-12 14:18:32', '2018-05-12 14:18:32', NULL),
(206, 'Jacinthe Wuckert', 'bogan.ova', 'WRITER', 'medhurst.waldo@example.com', NULL, NULL, 0, 0, '$2y$10$JdAR5Ftv3trPYOOGUhz5wOu3e49bgTEbmlYb2.MO1s2RGCMoZkK/K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 94, '2018-05-12 14:18:32', 1, 3, NULL, '2018-05-12 14:18:32', '2018-05-12 14:18:32', NULL),
(207, 'Maximus Kuvalis', 'tremblay.zack', 'WRITER', 'ward.zora@example.net', NULL, NULL, 0, 0, '$2y$10$AQ8DZnkrjM1/NVQjgYx2K.DjUieAZzJq5pqyeseORrsgoa8MyP5Oa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, '2018-05-12 14:18:32', 1, 3, NULL, '2018-05-12 14:18:32', '2018-05-12 14:18:32', NULL),
(208, 'Miss Jammie Ondricka', 'oernser', 'WRITER', 'oprohaska@example.org', NULL, NULL, 0, 0, '$2y$10$1fu7q40e4qFua9ZZx0Qk4.D5mjVwyT8TJBmK3hKGO0Q.upZWjtqnC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 145, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(209, 'Russel Parker', 'ocremin', 'WRITER', 'claire31@example.net', NULL, NULL, 0, 0, '$2y$10$0NUdA1Hq0V7sQtO3iBmZuOhrpw.aQw0wN.Zfz6DA7P/T7sNtYAGli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 89, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(210, 'Cullen Gulgowski', 'reginald.bergnaum', 'WRITER', 'nels.mertz@example.net', NULL, NULL, 0, 0, '$2y$10$uhgKwIEcrgT7GxKw1FV5eOtSsfjX0rgNP7bbCsOoZO9ylMfJUDQjm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 94, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(211, 'Jayson Batz', 'rubye39', 'WRITER', 'bert.hoppe@example.net', NULL, NULL, 0, 0, '$2y$10$GNdIIE0rEbFlBykBYkiKaeTtvAj8302.UtW0dvuzkmwnn2X8TL3wO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 69, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(212, 'Rosendo Lebsack', 'vhilll', 'WRITER', 'prosacco.zakary@example.net', NULL, NULL, 0, 0, '$2y$10$6PPL58wcz8MUfLSQaq6u1.cqRc1Enha3mDq/ovITIi2vmzv65IuBi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 126, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(213, 'Elyssa Ritchie', 'iwelch', 'WRITER', 'tristin.hackett@example.com', NULL, NULL, 0, 0, '$2y$10$htcpjOxbHxmlzG1Lax2Wv.P9eDDrApjjA7YDV4ojVsKkluHOy/GFm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 87, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(214, 'Ms. Thea Von DVM', 'crooks.rylan', 'WRITER', 'amari15@example.net', NULL, NULL, 0, 0, '$2y$10$ybo8eENjDnBLkETwN1QVbuO0fXba/cAWb4DB3L/WKrdH5OTJv0ygS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, '2018-05-12 14:18:33', 1, 3, NULL, '2018-05-12 14:18:33', '2018-05-12 14:18:33', NULL),
(215, 'Alberto Buckridge II', 'swaniawski.saige', 'WRITER', 'rlangworth@example.com', NULL, NULL, 0, 0, '$2y$10$h9NtfSLsg5.9jPwjDFqIJevGvbv2s3PQmfg.87KrTVM7ySWmLE7RW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 52, '2018-05-12 14:18:34', 1, 3, NULL, '2018-05-12 14:18:34', '2018-05-12 14:18:34', NULL),
(216, 'Dariana Wolf', 'michale08', 'WRITER', 'amaya44@example.net', NULL, NULL, 0, 0, '$2y$10$iugLDMs19q3PjOgjZbaLSOBimDNjQIXqMSSiEUiojv1EPq5dohwm.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 144, '2018-05-12 14:18:34', 1, 3, NULL, '2018-05-12 14:18:34', '2018-05-12 14:18:34', NULL),
(217, 'Prof. Veronica Bogan PhD', 'skassulke', 'WRITER', 'okuneva.michele@example.com', NULL, NULL, 0, 0, '$2y$10$awzE5ZDvrkyTPICN8IUQX./r3rsBPiaBEHUA9en/irSI2LyNfk/oW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71, '2018-05-12 14:18:34', 1, 3, NULL, '2018-05-12 14:18:34', '2018-05-12 14:18:34', NULL),
(218, 'Angela Turcotte PhD', 'walter.price', 'WRITER', 'clay.waelchi@example.com', NULL, NULL, 0, 0, '$2y$10$RbpZMZH3AoFVXv2nt8r4EuM3Du2CCWzHbN01sQsQJvk7Fokr6aiLO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55, '2018-05-12 14:18:34', 1, 3, NULL, '2018-05-12 14:18:34', '2018-05-12 14:18:34', NULL),
(219, 'Dario King III', 'cielo.kohler', 'WRITER', 'cathryn.vonrueden@example.org', NULL, NULL, 0, 0, '$2y$10$qZQADkFKpXfgc53/B9CkpOmwyZPE8uUPL37EJqibhiII46hpfPBke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 109, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(220, 'Carmella Olson IV', 'meda.wisozk', 'WRITER', 'moriah.graham@example.com', NULL, NULL, 0, 0, '$2y$10$JmcNf7JI25jIfp1eqV8KOOHEYZaNxRIbCgO6KsgIGd8USH9JX/sUW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 132, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(221, 'Gerry Kub', 'casimir.tromp', 'WRITER', 'wolff.marilyne@example.com', NULL, NULL, 0, 0, '$2y$10$AB4ssbwMbt0Js7J0izv4LOX.dC3cU6eHX6ypTiKqyHi26Lk.dzN4K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 72, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(222, 'Cole Christiansen', 'carroll.leffler', 'WRITER', 'jordan.kilback@example.org', NULL, NULL, 0, 0, '$2y$10$mpfsL8seiwsreYAkQNb3IOPwJ7rkoocbc3bW2RnknU9lWRA.DiiF2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(223, 'Hans Treutel', 'khand', 'WRITER', 'theodora90@example.org', NULL, NULL, 0, 0, '$2y$10$4D1Gsu2fjaoStVJlKyk.mukxA0Bb0taJzwJgzlTAQtwHDchit6esK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 74, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(224, 'Prof. Ressie Nicolas', 'emory.hegmann', 'WRITER', 'hilll.destini@example.org', NULL, NULL, 0, 0, '$2y$10$18pecqtuTFvovTL6lDNzBekS3JZ2HJWfP5hqx4DB8pedNboEoUDAy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(225, 'Carlos Mueller', 'bell46', 'WRITER', 'ian21@example.org', NULL, NULL, 0, 0, '$2y$10$9rjIYIyE0yUHgEamzR3OxOkl3UfVUfohto3.9imvSeu2FwfWkvcLu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60, '2018-05-12 14:18:35', 1, 3, NULL, '2018-05-12 14:18:35', '2018-05-12 14:18:35', NULL),
(226, 'Rogelio Hahn', 'zola62', 'WRITER', 'courtney.osinski@example.org', NULL, NULL, 0, 0, '$2y$10$SnvOmrxrnpAxw2.Z3eRq3.fzsBcGndVuzOVD/k.xa/TnhviVyo/S2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 143, '2018-05-12 14:18:36', 1, 3, NULL, '2018-05-12 14:18:36', '2018-05-12 14:18:36', NULL),
(227, 'Arlie Harber', 'london.wunsch', 'WRITER', 'waters.enrico@example.org', NULL, NULL, 0, 0, '$2y$10$w/bxQNGaXslghXGJSA6rFu.IGA1yOg2t6BU5Y1IDs7Bih6fV/zt0W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 73, '2018-05-12 14:18:36', 1, 3, NULL, '2018-05-12 14:18:36', '2018-05-12 14:18:36', NULL),
(228, 'Miss Wanda Predovic PhD', 'jrath', 'WRITER', 'gottlieb.phoebe@example.net', NULL, NULL, 0, 0, '$2y$10$KrrQc6xW0LCC1gYKk1ejxuUxMtrc2OB9L3yrcPyHsN6jyV3mJzpI6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19, '2018-05-12 14:18:36', 1, 3, NULL, '2018-05-12 14:18:36', '2018-05-12 14:18:36', NULL),
(229, 'Arvel Cronin', 'nharber', 'WRITER', 'douglas.don@example.com', NULL, NULL, 0, 0, '$2y$10$eBuINp9T7aIFxBczRJiJA.Nt/TSRYMmefc9fP0OzwUU2J2/d0XqK2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71, '2018-05-12 14:18:36', 1, 3, NULL, '2018-05-12 14:18:36', '2018-05-12 14:18:36', NULL),
(230, 'Prof. Philip Lesch', 'myron.kirlin', 'WRITER', 'kaitlyn.toy@example.org', NULL, NULL, 0, 0, '$2y$10$Otbkvs9NOKtjPwCY6/ja4O2jMHe9f4AMojhVk5XGLBryLV7TLxXrW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 66, '2018-05-12 14:18:36', 1, 3, NULL, '2018-05-12 14:18:36', '2018-05-12 14:18:36', NULL),
(231, 'Trever McDermott', 'vkeeling', 'WRITER', 'schmitt.cali@example.com', NULL, NULL, 0, 0, '$2y$10$iEmUtOrlvI7jKvj7fSuTju67WGiSzaiOscmnA2.wjGOdEUr65kTr.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 102, '2018-05-12 14:18:36', 1, 3, NULL, '2018-05-12 14:18:36', '2018-05-12 14:18:36', NULL),
(232, 'Gino Sipes', 'lillian.douglas', 'WRITER', 'meaghan.koch@example.org', NULL, NULL, 0, 0, '$2y$10$YYn/vAzOWWty7zvJK13.g.RhVXDBOTXE8FWqaL/T/ve6H6pOYFZqG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:37', 1, 3, NULL, '2018-05-12 14:18:37', '2018-05-12 14:18:37', NULL),
(233, 'Mrs. Sabrina Howe', 'lucile99', 'WRITER', 'milford48@example.net', NULL, NULL, 0, 0, '$2y$10$LbQHhq99Sge.fRog.g6uyeyQVmClEuSDpi11eqTfaeZ5VrLs2ngMC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 62, '2018-05-12 14:18:37', 1, 3, NULL, '2018-05-12 14:18:37', '2018-05-12 14:18:37', NULL),
(234, 'Prof. Kaitlyn Ward IV', 'bins.jovan', 'WRITER', 'dante.walker@example.com', NULL, NULL, 0, 0, '$2y$10$knpXNIJg9QIqegXvqgkVD.VpQN9L0d9XGvU4qF2UXKxMpF481MtdW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-05-12 14:18:37', 1, 3, NULL, '2018-05-12 14:18:37', '2018-05-12 14:18:37', NULL),
(235, 'Zachery Deckow Jr.', 'leatha.walker', 'WRITER', 'sasha.lesch@example.org', NULL, NULL, 0, 0, '$2y$10$TnLulbljdBC9/a.UIWb1Tu/7bVp.uZ97wwU7iSu0PaGZsOG05DwL.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 49, '2018-05-12 14:18:37', 1, 3, NULL, '2018-05-12 14:18:37', '2018-05-12 14:18:37', NULL),
(236, 'Edd Goyette', 'stephany.raynor', 'WRITER', 'paucek.damon@example.com', NULL, NULL, 0, 0, '$2y$10$IAEeLRgV6eQ0T67rXxN/Pu2Z8yHM8lAeXzijtbujao3al7RRTlDPG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 98, '2018-05-12 14:18:38', 1, 3, NULL, '2018-05-12 14:18:38', '2018-05-12 14:18:38', NULL),
(237, 'Thora Gaylord', 'sunny14', 'WRITER', 'sylvester59@example.org', NULL, NULL, 0, 0, '$2y$10$hxwlRluMrU0Mjqwzk8xWIetngMT3LQppYMeUoNmHrg2Xg5MRRVVM6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:18:38', 1, 3, NULL, '2018-05-12 14:18:38', '2018-05-12 14:18:38', NULL),
(238, 'Samir Brekke', 'damore.maud', 'WRITER', 'dimitri04@example.org', NULL, NULL, 0, 0, '$2y$10$QPtwbGGwqCf52RiI0yijUOdDpxPIS7WcC0coZmptbEw4UWqaY4JGC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 81, '2018-05-12 14:18:38', 1, 3, NULL, '2018-05-12 14:18:38', '2018-05-12 14:18:38', NULL),
(239, 'Prof. Jaden Beer III', 'dena.lehner', 'WRITER', 'darlene.ledner@example.com', NULL, NULL, 0, 0, '$2y$10$Qp8Qkv4e05sCNRGMKjRcbOo1WwBiVh1fRNbVuAIrJHWH0/EImoDEC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:18:38', 1, 3, NULL, '2018-05-12 14:18:38', '2018-05-12 14:18:38', NULL),
(240, 'Rasheed Marks', 'loraine32', 'WRITER', 'considine.lyric@example.com', NULL, NULL, 0, 0, '$2y$10$hs.B0IXqsgIA763R.pG/fewUVumFtYHw5v6/4NkteNMlFizBU4pMO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9, '2018-05-12 14:18:38', 1, 3, NULL, '2018-05-12 14:18:38', '2018-05-12 14:18:38', NULL),
(241, 'Mr. Gennaro Davis', 'chad.kerluke', 'WRITER', 'lindsey.kemmer@example.org', NULL, NULL, 0, 0, '$2y$10$UncbJZB0q4A5Y9s9sA2TseYWEpbITU0kdVKbqkVsQgQnGWr0IE.H2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(242, 'Dr. Deon Roberts', 'bode.zella', 'WRITER', 'nicklaus.larson@example.org', NULL, NULL, 0, 0, '$2y$10$Ob4hAXE/nv08DGUtEjqEX.2HlER4u1zaMYsH71h9q5MARfoNOedKW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 122, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(243, 'Kory Stark', 'sofia.hudson', 'WRITER', 'elouise97@example.net', NULL, NULL, 0, 0, '$2y$10$YGqN2K4sl8QXHAE.ahy/D.PZMyNk.iGn24r0EbxL.ZO280MMGTmy2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(244, 'Janice Williamson', 'rodriguez.emilie', 'WRITER', 'werner69@example.com', NULL, NULL, 0, 0, '$2y$10$mnDMgm0cb9ESB.pwm12K1Ouf8B8amSFS72eLVrV/QagZdHrIlch4u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 84, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(245, 'Miss Zoey Larson DVM', 'kuhlman.summer', 'WRITER', 'devyn.simonis@example.com', NULL, NULL, 0, 0, '$2y$10$kqSaZSh9Yc3zDRhLplsj/O0WtyqVV/Id/ib9ZGqB5Cyxgxs8F3ZsS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(246, 'Chasity Roob', 'alyce54', 'WRITER', 'ybraun@example.com', NULL, NULL, 0, 0, '$2y$10$ZflRbKefDi.NHVb9E28MMO0aKNwpND0VIychXMkRRU6eENTmL8JgG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 130, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(247, 'Brent Fay IV', 'raymond.gleason', 'WRITER', 'elena.hoppe@example.com', NULL, NULL, 0, 0, '$2y$10$zKM1/paWiliinaB5KS1ZcOTF1XyzC5Ef3vNF7WUmrInL7csBnEJli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:18:39', 1, 3, NULL, '2018-05-12 14:18:39', '2018-05-12 14:18:39', NULL),
(248, 'Ms. Aurore Schroeder', 'cole.caleigh', 'WRITER', 'qparker@example.net', NULL, NULL, 0, 0, '$2y$10$LojRyw/ZRHBXWLCGMdwpAO0qehNxKjEhF/SciOR/AVCfORfvLsL1m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 62, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(249, 'Sherman Nader', 'hammes.carmen', 'WRITER', 'tlegros@example.com', NULL, NULL, 0, 0, '$2y$10$tzkQCNFFnTu0r83gy1BPTOWa6OoTTHyCCZKu3D0ntX0usZ0YkEmO2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 107, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(250, 'Marquis Parisian', 'georgette.quitzon', 'WRITER', 'gveum@example.net', NULL, NULL, 0, 0, '$2y$10$uf9bp0..lmpIGl7qmA0XJO0.qq2f.8PJobtFalO/ZrSGUghj72ikK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 57, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(251, 'Dejuan Gutkowski V', 'smitham.joshuah', 'WRITER', 'farrell.mateo@example.net', NULL, NULL, 0, 0, '$2y$10$kmKvxFEo/ZmhGBXQ/XlBJu/DHnqJfcN5h7aac4GAGXOVbe4fpR9M.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 129, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(252, 'Mr. Jalen Hegmann Jr.', 'tbogan', 'WRITER', 'cstark@example.com', NULL, NULL, 0, 0, '$2y$10$Q/XE2NegIdq/IBXon2dzXOXQDxmGvyX9Ie3n1ImW10PP6uB0Et9qm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 27, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(253, 'Sandrine Eichmann DVM', 'hobart.bahringer', 'WRITER', 'will.lindsay@example.org', NULL, NULL, 0, 0, '$2y$10$M2XGhdpSHk1AJuKtBzzRkeVkQionUun9u9DxyXeNhtWbygZgQkcfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(254, 'Miss Missouri Paucek MD', 'tbashirian', 'WRITER', 'karli.bergnaum@example.org', NULL, NULL, 0, 0, '$2y$10$xxubknmYbMGfz3bL53kezOfhSChvhd/gvcbNNfZESMzQPONaSl1b6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:18:40', 1, 3, NULL, '2018-05-12 14:18:40', '2018-05-12 14:18:40', NULL),
(255, 'Felipe Rowe', 'rath.oma', 'WRITER', 'anderson88@example.com', NULL, NULL, 0, 0, '$2y$10$v.kZO/47nIUlzpGKATOz3eCWFWumcU.YN0WDf3gASM7K2K0cwVZoO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 140, '2018-05-12 14:18:41', 1, 3, NULL, '2018-05-12 14:18:41', '2018-05-12 14:18:41', NULL),
(256, 'Estella Schmidt', 'hayden.harris', 'WRITER', 'alia14@example.net', NULL, NULL, 0, 0, '$2y$10$z5fegaZ3kGZ40anQHPPslO/zJJGioF9m.mZ51JzaugwSR3C9/8cta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 59, '2018-05-12 14:18:41', 1, 3, NULL, '2018-05-12 14:18:41', '2018-05-12 14:18:41', NULL),
(257, 'Taya Olson MD', 'pacocha.karson', 'WRITER', 'miller.schiller@example.net', NULL, NULL, 0, 0, '$2y$10$y6AwmG9rVUDJPTfMsWmnuOOwndao0SmQJu1uuU1GxILs.efyeI71q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:41', 1, 3, NULL, '2018-05-12 14:18:41', '2018-05-12 14:18:41', NULL),
(258, 'Maxie Mueller', 'zbahringer', 'WRITER', 'ressie.littel@example.net', NULL, NULL, 0, 0, '$2y$10$wr0NY5Bcfw2xm7g97yqGhu1EYpOTGT6bze4kfo7fEk2bQmq3h3mvm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 76, '2018-05-12 14:18:41', 1, 3, NULL, '2018-05-12 14:18:41', '2018-05-12 14:18:41', NULL),
(259, 'Dortha McClure', 'ellen.tromp', 'WRITER', 'madelynn.ohara@example.net', NULL, NULL, 0, 0, '$2y$10$6ppTl.12yC0R7z252ZL3Tupz6YH3wG5s2ml8qb7aKh3h4P7TR8gKa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2018-05-12 14:18:41', 1, 3, NULL, '2018-05-12 14:18:41', '2018-05-12 14:18:41', NULL),
(260, 'Dr. Roel Deckow MD', 'aferry', 'WRITER', 'ullrich.monte@example.org', NULL, NULL, 0, 0, '$2y$10$KwKGaleSFJpb.H767IbNCe6Nxd2KllkBTHskE7ld0//WuTjC3WjmW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 24, '2018-05-12 14:18:42', 1, 3, NULL, '2018-05-12 14:18:42', '2018-05-12 14:18:42', NULL),
(261, 'Anissa Bins', 'miller.madie', 'WRITER', 'lorine.king@example.com', NULL, NULL, 0, 0, '$2y$10$Q73DR/lffrikt19KMl506usOLuHuUss7Jbzh7m4ze8BuHoZfmMuyi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 148, '2018-05-12 14:18:42', 1, 3, NULL, '2018-05-12 14:18:42', '2018-05-15 07:57:42', NULL),
(262, 'Mrs. Madelynn Cremin', 'kaya.schroeder', 'WRITER', 'rritchie@example.net', NULL, NULL, 0, 0, '$2y$10$ZMZMnQKVXqO6PKvn7cnNK.FMa5Ga1M0FZ8mC/lOv.IJ9y8NXmljK6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39, '2018-05-12 14:18:42', 1, 3, NULL, '2018-05-12 14:18:42', '2018-05-12 14:18:42', NULL),
(263, 'Novella Kuphal', 'rhianna.sipes', 'WRITER', 'ashtyn.hirthe@example.net', NULL, NULL, 0, 0, '$2y$10$ng0i0AchvEKNFYDcF4xJ1.Nr2SwhUBKLxRFyrGgpQAkxYkkgu//6a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 73, '2018-05-12 14:18:42', 1, 3, NULL, '2018-05-12 14:18:42', '2018-05-12 14:18:42', NULL),
(264, 'Seamus Emard', 'haylee58', 'WRITER', 'eve00@example.net', NULL, NULL, 0, 0, '$2y$10$g1.fcx8GJN6rKA1OW66pC.5UbHGCNnWoH8NhpiWIXcqlJgyNIo7DW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:42', 1, 3, NULL, '2018-05-12 14:18:42', '2018-05-12 14:18:42', NULL),
(265, 'Mr. Dewitt Towne', 'alba37', 'WRITER', 'candice76@example.org', NULL, NULL, 0, 0, '$2y$10$XKSydz0C.CiRR0QkDsTXtu7fq2ba6McTw66PlrCGpnP8m5gwyKckC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 98, '2018-05-12 14:18:43', 1, 3, NULL, '2018-05-12 14:18:43', '2018-05-12 14:18:43', NULL),
(266, 'Jasmin Shields Jr.', 'powlowski.rogelio', 'WRITER', 'alice.pouros@example.net', NULL, NULL, 0, 0, '$2y$10$/xF.2I0zhwNCeX2/9wbW8.EUijxouuK3KoOg6KaTtox0fc2qpuIxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 6, '2018-05-12 14:18:43', 1, 3, NULL, '2018-05-12 14:18:43', '2018-05-12 14:18:43', NULL),
(267, 'Leora Russel', 'derek94', 'WRITER', 'ada.legros@example.org', NULL, NULL, 0, 0, '$2y$10$A6vMTcZ5OfvjkZjlGS37B.hTnDmb5OuPJsEeFtwyFrhSRXndomVtq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2018-05-12 14:18:43', 1, 3, NULL, '2018-05-12 14:18:43', '2018-05-12 14:18:43', NULL),
(268, 'Madyson Gusikowski', 'craig25', 'WRITER', 'vandervort.gaylord@example.org', NULL, NULL, 0, 0, '$2y$10$8icINk6c5GkUWXDoInRh7uiff0zL7yViuLhBeiGfTMc3zbBTttf6S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19, '2018-05-12 14:18:43', 1, 3, NULL, '2018-05-12 14:18:43', '2018-05-12 14:18:43', NULL),
(269, 'Emerald Kutch', 'wtowne', 'WRITER', 'santiago.robel@example.net', NULL, NULL, 0, 0, '$2y$10$P5b8E74BjVEC3G3G9Bb0n.vcJrf4qBe41P6L2gP2CTmNG7JCCqSse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8, '2018-05-12 14:18:43', 1, 3, NULL, '2018-05-12 14:18:43', '2018-05-12 14:18:43', NULL),
(270, 'Haley Gerhold I', 'steuber.clemmie', 'WRITER', 'bdonnelly@example.com', NULL, NULL, 0, 0, '$2y$10$imegmN043JHsU1LaMmwJjuQ9wk6vWNuEyVPiWIecVRHUXLCBiFf2e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 125, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-12 14:18:44', NULL),
(271, 'Lexus Thompson', 'rhoda.hane', 'WRITER', 'jzulauf@example.org', NULL, NULL, 0, 0, '$2y$10$Muyh3wG4SReiawmhqqpV.O8PFM7d1jHaBJknNROUNy2HUpqahXX5.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 143, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-12 14:18:44', NULL),
(272, 'Mr. Forrest Altenwerth IV', 'hoppe.ethan', 'WRITER', 'tanner27@example.com', NULL, NULL, 0, 0, '$2y$10$zL4cmIdrIXnuE7o/ILyTqegm39kK.DQFuTSul/Idwnf0j7pcmU6wG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 133, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-12 14:18:44', NULL),
(273, 'Mr. Greyson Heller', 'eoreilly', 'WRITER', 'chasity48@example.net', NULL, NULL, 0, 0, '$2y$10$fKQfDEky.vkoTT7maPeXBuTBHLQq7G7OhCawQCESjonuunJ5.AV4K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 23, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-12 14:18:44', NULL),
(274, 'Jessica Bergnaum', 'stephen.abernathy', 'WRITER', 'zrippin@example.org', NULL, NULL, 0, 0, '$2y$10$.FkSsqXKFcZ8/KkmgXidy.NMONjYCs4Mec/nZcLciHnK6JdXIcvAe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-12 14:18:44', NULL),
(275, 'Mrs. Corene Kuhlman MD', 'gjerde', 'WRITER', 'rice.carolyne@example.org', NULL, NULL, 0, 0, '$2y$10$tGdS/l48NlbS9ZlVCt0IVujzfvYWhfz.czd2Wk7tl2njgiWUz1pdC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 148, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-15 07:56:09', NULL),
(276, 'Mona Rath', 'mmills', 'WRITER', 'wyman.helena@example.com', NULL, NULL, 0, 0, '$2y$10$sAoN75jSxkMa6pvaElqQD.MZRT4iFus8nyfRTgdJIjow8xXrcWq5i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 145, '2018-05-12 14:18:44', 1, 3, NULL, '2018-05-12 14:18:44', '2018-05-12 14:18:44', NULL),
(277, 'Prof. Assunta Strosin V', 'prince20', 'WRITER', 'konopelski.anissa@example.com', NULL, NULL, 0, 0, '$2y$10$qvg.w.TyRHNLnPfCstsy..oSZekkqZ8X5/9LtywEAd1Drh0p2Oc2O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 88, '2018-05-12 14:18:45', 1, 3, NULL, '2018-05-12 14:18:45', '2018-05-12 14:18:45', NULL),
(278, 'Cristina O''Keefe', 'braulio49', 'WRITER', 'ian43@example.com', NULL, NULL, 0, 0, '$2y$10$MFeiNH0rrJwLywr3ft5LEOupJZnxjDvxJVuzSOF4eBy2zLq9/dUgS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 43, '2018-05-12 14:18:45', 1, 3, NULL, '2018-05-12 14:18:45', '2018-05-12 14:18:45', NULL),
(279, 'Luciano Franecki', 'etha.block', 'WRITER', 'gail13@example.net', NULL, NULL, 0, 0, '$2y$10$qSHQR6xasYrddfDCxqD3cuIUOhuMey4GAX0gYCnOmh/vcGxGhK6Qi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 114, '2018-05-12 14:18:45', 1, 3, NULL, '2018-05-12 14:18:45', '2018-05-12 14:18:45', NULL),
(280, 'Mrs. Ressie Schiller', 'will.blair', 'WRITER', 'batz.idell@example.net', NULL, NULL, 0, 0, '$2y$10$5wKDt99dp5A2ufjjUEGThOtghHZWssUDXLlStITeG9hFmZK7MIaTG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, '2018-05-12 14:18:45', 1, 3, NULL, '2018-05-12 14:18:45', '2018-05-12 14:18:45', NULL),
(281, 'Cathryn Dicki', 'lemuel70', 'WRITER', 'jessie.kuhn@example.net', NULL, NULL, 0, 0, '$2y$10$9GLV6AmcQ1HUwchZxSD1YOMoE7/wKUy3Dl2bZBj5IjcIv8xaln2l.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 11, '2018-05-12 14:18:45', 1, 3, NULL, '2018-05-12 14:18:45', '2018-05-12 14:18:45', NULL),
(282, 'Hertha Bradtke Jr.', 'qraynor', 'WRITER', 'marks.osvaldo@example.org', NULL, NULL, 0, 0, '$2y$10$2yM2yugIYm0w6ek6IBL2ZOCQY8V4bz2UiCY19jO0q1XhJzIA6rOoi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56, '2018-05-12 14:18:45', 1, 3, NULL, '2018-05-12 14:18:45', '2018-05-12 14:18:45', NULL),
(283, 'Daniela Aufderhar', 'marks.trenton', 'WRITER', 'hand.myrtice@example.org', NULL, NULL, 0, 0, '$2y$10$Xh9GDIrvBehEo2TslyAVoerV62..qD1Zuz1toXNMgNNptJikkNx9y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 103, '2018-05-12 14:18:46', 1, 3, NULL, '2018-05-12 14:18:46', '2018-05-12 14:18:46', NULL),
(284, 'Prof. Oceane Rosenbaum V', 'west.marina', 'WRITER', 'sdaniel@example.com', NULL, NULL, 0, 0, '$2y$10$pv1CIpzyTDvuS/kkRDPUFuzOPhk3fIKg4l9JK..XxoQeefKUtW2qm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61, '2018-05-12 14:18:46', 1, 3, NULL, '2018-05-12 14:18:46', '2018-05-12 14:18:46', NULL),
(285, 'Paolo Fritsch', 'antone77', 'WRITER', 'jennifer07@example.com', NULL, NULL, 0, 0, '$2y$10$3h.H7P8ktKsKXblH87opkO8DqNYOGuIsqEz0csoJdSksX83quaBhy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 87, '2018-05-12 14:18:46', 1, 3, NULL, '2018-05-12 14:18:46', '2018-05-12 14:18:46', NULL),
(286, 'Westley Stanton', 'lubowitz.kenyatta', 'WRITER', 'susanna.mitchell@example.org', NULL, NULL, 0, 0, '$2y$10$yaSOVvOZswUaLz7uskK9UeqqiV42ucck29JcLfL8DtplU/q/XPScW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 48, '2018-05-12 14:18:46', 1, 3, NULL, '2018-05-12 14:18:46', '2018-05-12 14:18:46', NULL),
(287, 'Dr. Tony Weber DVM', 'lorena.murazik', 'WRITER', 'lucie.mueller@example.com', NULL, NULL, 0, 0, '$2y$10$Syfp.F5vTv9FOmRD0T5Y8OeoihohR/OfEO6bkwO.oaB99lv0ex.PC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 82, '2018-05-12 14:18:46', 1, 3, NULL, '2018-05-12 14:18:46', '2018-05-12 14:18:46', NULL),
(288, 'Tiara Vandervort', 'gstreich', 'WRITER', 'richmond92@example.com', NULL, NULL, 0, 0, '$2y$10$6UAZrIzZUf251muUeSEV9.jCP8hKISxyB9INxz0yScnf65bAK533a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 89, '2018-05-12 14:18:47', 1, 3, NULL, '2018-05-12 14:18:47', '2018-05-12 14:18:47', NULL),
(289, 'Viola Feeney', 'dickinson.flavio', 'WRITER', 'ewillms@example.net', NULL, NULL, 0, 0, '$2y$10$VyQMjiiGe8zq8GpmOSYAQ.pm8hx0/TgNVde7hgyBWnqsCXAU9C37G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 86, '2018-05-12 14:18:47', 1, 3, NULL, '2018-05-12 14:18:47', '2018-05-12 14:18:47', NULL),
(290, 'Harrison Quitzon Jr.', 'corkery.cortez', 'WRITER', 'brett.kihn@example.com', NULL, NULL, 0, 0, '$2y$10$aLjib10WpfYCi/Uthshn.uZH/Fkocr22nnQm9dcFkZdxorLNMsnSy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 43, '2018-05-12 14:18:47', 1, 3, NULL, '2018-05-12 14:18:47', '2018-05-12 14:18:47', NULL),
(291, 'Orville Moen', 'ilangosh', 'WRITER', 'charlotte.ernser@example.net', NULL, NULL, 0, 0, '$2y$10$ZlKMeDndzAiH4hUjJhCFcOLektX.gbDVA0OwlfubyoPWh3SRd4hDq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 137, '2018-05-12 14:18:47', 1, 3, NULL, '2018-05-12 14:18:47', '2018-05-12 14:18:47', NULL),
(292, 'Prof. Jaime Bins II', 'veum.octavia', 'WRITER', 'yrau@example.net', NULL, NULL, 0, 0, '$2y$10$pd/YdlhUmztjebyvp/DevOciYq7tKwpHzO10moniE2C5rXCnE4qmy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:18:47', 1, 3, NULL, '2018-05-12 14:18:47', '2018-05-12 14:18:47', NULL),
(293, 'Marcos Mills', 'balistreri.adrien', 'WRITER', 'dell.haley@example.com', NULL, NULL, 0, 0, '$2y$10$UL.yA9P41m1qCzD2C92HGeH.ftGaidK9ay44OcvzIssSG5MIBNa2u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 67, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-12 14:18:48', NULL),
(294, 'Brigitte Schimmel', 'emanuel63', 'WRITER', 'ray.emmerich@example.org', NULL, NULL, 0, 0, '$2y$10$FQzWPfNgO/Cdb8UIlbSnXewz/TH04djU19/FwVaxpr/VPqNiBNAkq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 51, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-12 14:18:48', NULL),
(295, 'Brock Huels', 'ecarroll', 'WRITER', 'elva.weimann@example.org', NULL, NULL, 0, 0, '$2y$10$bRPhqKLwx/.YwIFd6233UOIRpW6HdSNsY6cmYGOvTyOY3oVR3NTee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 15, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-12 14:18:48', NULL),
(296, 'Jack Goldner', 'wgreenfelder', 'WRITER', 'karina.bayer@example.org', NULL, NULL, 0, 0, '$2y$10$sLOomAZNA7jI8muF62rjDOkSlQD4QeV8M.NqI7.PlSWHzq/ovehFu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 113, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-12 14:18:48', NULL),
(297, 'Prof. Adam Kuhic', 'vernon.barrows', 'WRITER', 'uhand@example.org', NULL, NULL, 0, 0, '$2y$10$BzyLqMMY9SNCBddmuSDNdu73/kEbaNFfpFaQ9sgv9R1XN/7cgaGrK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-12 14:18:48', NULL),
(298, 'Alvina Mohr', 'pinkie.sanford', 'WRITER', 'rubie.mitchell@example.org', NULL, NULL, 0, 0, '$2y$10$iVzHvEmOYOOlXY6Uo6Nqi.cMlGH8wfvBlG4uCqExp4BKSHIh9Hwye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 150, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-15 07:58:06', NULL);
INSERT INTO `users` (`id`, `name`, `username`, `user_type`, `email`, `paypal_email`, `dob`, `balance`, `is_admin`, `password`, `image`, `thumbnail`, `academic_level_id`, `school`, `field_of_specialization`, `country_id`, `city`, `address`, `phone`, `about`, `professional_bio`, `my_details`, `academic_experience`, `views`, `orders_complete`, `last_seen`, `active`, `attempts_left`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(299, 'Jaeden Zieme', 'rutherford.anastacio', 'WRITER', 'alfreda.haag@example.com', NULL, NULL, 0, 0, '$2y$10$SBz.ul69zw1AArAiP1TilO8fiWooemH/XareufAtrIZcB6u791wam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, '2018-05-12 14:18:48', 1, 3, NULL, '2018-05-12 14:18:48', '2018-05-12 14:18:48', NULL),
(300, 'Edd Veum', 'nicolette55', 'WRITER', 'korbin.durgan@example.org', NULL, NULL, 0, 0, '$2y$10$RYMhbDfEcZYzg7/VeV/UbObFEqy4OpzzNJMD2dVgOe4gOF6jf6pxS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 17, '2018-05-12 14:18:49', 1, 3, NULL, '2018-05-12 14:18:49', '2018-05-12 14:18:49', NULL),
(301, 'Rhea Ritchie', 'beverly50', 'WRITER', 'bailey.hubert@example.net', NULL, NULL, 0, 0, '$2y$10$pW0kZJIxdErqCCrjS4VsN.OAbEDnAZFuXnxGTYfHQq8p5Lcr6fIfS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:18:49', 1, 3, NULL, '2018-05-12 14:18:49', '2018-05-12 14:18:49', NULL),
(302, 'Myrna Macejkovic', 'haskell.koch', 'WRITER', 'marcelo.sporer@example.org', NULL, NULL, 0, 0, '$2y$10$7FnX3fR/Rgb1Hvhio5MO2.UxbavyuzAl0Mifo9EASn17jDe3VHCSC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 128, '2018-05-12 14:18:49', 1, 3, NULL, '2018-05-12 14:18:49', '2018-05-12 14:18:49', NULL),
(303, 'Alejandra Weissnat', 'conroy.kylie', 'WRITER', 'alessandro93@example.com', NULL, NULL, 0, 0, '$2y$10$9ujve8aFSptXH.kGnAfLA.EOgY4j7frUkSMUzz0h.lh6OvnnIIRb2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 36, '2018-05-12 14:18:49', 1, 3, NULL, '2018-05-12 14:18:49', '2018-05-12 14:18:49', NULL),
(304, 'Maximilian Sipes', 'effertz.kenna', 'WRITER', 'ykovacek@example.org', NULL, NULL, 0, 0, '$2y$10$LfT.tNSSM28wJT2axczcV.fDeeTv6jspfIzOL7ZrfpFk/j7f4X4j6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, '2018-05-12 14:18:49', 1, 3, NULL, '2018-05-12 14:18:49', '2018-05-12 14:18:49', NULL),
(305, 'Cordell Schroeder', 'clubowitz', 'WRITER', 'kreichert@example.net', NULL, NULL, 0, 0, '$2y$10$GbJg3Ad2H/oFvWgH6ucqzOM0Vt24ejMFQmoh6K2/qEE07NXEyC8eO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 45, '2018-05-12 14:18:49', 1, 3, NULL, '2018-05-12 14:18:49', '2018-05-12 14:18:49', NULL),
(306, 'Everardo Zemlak', 'blair37', 'WRITER', 'dudley.hyatt@example.com', NULL, NULL, 0, 0, '$2y$10$UKgi1olGNbf5NZA3UKKxMuU1Mxx/yMfGVSYbMUNXLz7025bXIz3hu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 44, '2018-05-12 14:18:50', 1, 3, NULL, '2018-05-12 14:18:50', '2018-05-12 14:18:50', NULL),
(307, 'Myrna Leffler MD', 'delores87', 'WRITER', 'justine69@example.com', NULL, NULL, 0, 0, '$2y$10$cpRCU6tvbNSKGnYlym3zCOxxPbPXC8.53fu/mT3EGl5rVjK8HOu5i', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 90, '2018-05-12 14:18:50', 1, 3, NULL, '2018-05-12 14:18:50', '2018-05-12 14:18:50', NULL),
(308, 'Miracle Kerluke', 'josiah11', 'WRITER', 'eheidenreich@example.net', NULL, NULL, 0, 0, '$2y$10$tA2JCodEAuSykx55bIA53OPSqYkufLA4rO5nGuvLw4jUPYKNsYxom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60, '2018-05-12 14:18:50', 1, 3, NULL, '2018-05-12 14:18:50', '2018-05-12 14:18:50', NULL),
(309, 'Tina Blanda', 'tomas13', 'WRITER', 'domingo.wunsch@example.net', NULL, NULL, 0, 0, '$2y$10$OIn/t82GxspGwfB3.JVvZOg0JWFUncIdxY4aUlu6KajyLdJGVDFX.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141, '2018-05-12 14:18:50', 1, 3, NULL, '2018-05-12 14:18:50', '2018-05-12 14:18:50', NULL),
(310, 'Rowan Hammes', 'garrison.moore', 'WRITER', 'wolf.sabryna@example.com', NULL, NULL, 0, 0, '$2y$10$bIBkuk3FmprTmQiCUpMqkO4TXuF7ul.aMUJsUCncpSZlgPYkPCEke', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, '2018-05-12 14:18:50', 1, 3, NULL, '2018-05-12 14:18:50', '2018-05-12 14:18:50', NULL),
(311, 'Angeline Sawayn', 'walton.purdy', 'WRITER', 'hpurdy@example.com', NULL, NULL, 0, 0, '$2y$10$Fonk42jyAg0uKHgaLpJ4b.y73UMGRokabJKRnj.uBS1zuGreyT2HG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 125, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(312, 'Hettie Lockman', 'alia.reinger', 'WRITER', 'keeley72@example.org', NULL, NULL, 0, 0, '$2y$10$WVSScBNbNZ2gHrwuSeK83.8vBr1A9mops2yAfwBwqAs3Gn0r6ivum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 25, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(313, 'Lambert Medhurst', 'wtorp', 'WRITER', 'gulgowski.chaz@example.com', NULL, NULL, 0, 0, '$2y$10$6sdXbIRkX8ErhH.CDRw0Qeqv3OG2i7VoRYLKNaBU/zBNWP7xTSjBW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(314, 'Dr. Cicero Terry IV', 'oreilly.ima', 'WRITER', 'trisha25@example.net', NULL, NULL, 0, 0, '$2y$10$QkzSMoNU9B4QaYBA40HA8ePDCzIORLwkDqQSXw2/hKomK2UL43DsK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 75, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(315, 'Arnold Murazik', 'tess52', 'WRITER', 'weber.annalise@example.net', NULL, NULL, 0, 0, '$2y$10$XD/aHXSuFTUGl8AdOu50Q.z5BRu/fz5XTiVcLQ3rn2unTLBcUSDS6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(316, 'Nelda Botsford', 'zwalsh', 'WRITER', 'keely.jacobs@example.net', NULL, NULL, 0, 0, '$2y$10$Zrb/aEqMkthVL74cO4Ea1OBwWWvNDPviBwtLynhrdWmwJNES9mGkC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 118, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(317, 'Pablo Heathcote', 'alejandrin12', 'WRITER', 'oreilly.sage@example.org', NULL, NULL, 0, 0, '$2y$10$hzHu3h8fM9N.DAS/WEW4AuXIgXIIHOxS1bfmaZEbQ1qXLCTmh8Dre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 63, '2018-05-12 14:18:51', 1, 3, NULL, '2018-05-12 14:18:51', '2018-05-12 14:18:51', NULL),
(318, 'Deborah Ebert', 'wjacobs', 'WRITER', 'crooks.candace@example.net', NULL, NULL, 0, 0, '$2y$10$PNfPV0qvrhLM.WWWprVPXOrEhVjqzxjxPdJ8TUeZAsIWd192v9ClW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(319, 'Cecilia Baumbach', 'connelly.matilde', 'WRITER', 'santos52@example.org', NULL, NULL, 0, 0, '$2y$10$/msDvKSX.so9B7nRjvnvYuCVIdWM3DQoP9QfV02nIsn3f3yOcW6Sy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 102, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(320, 'Travis Waelchi', 'bria88', 'WRITER', 'fstoltenberg@example.com', NULL, NULL, 0, 0, '$2y$10$zUZ57Luiw8N8sdWcdb7lnuADtbggIllMCKGUz4jRAA.m.Vr7gwk7u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 34, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(321, 'Dejon Reinger', 'hollie77', 'WRITER', 'mikayla.morar@example.net', NULL, NULL, 0, 0, '$2y$10$wDFnSYqT0s8IWzqigrSjeO4eyry5eKghOWo7XkaVQkDJx2A/ieIxW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(322, 'Lambert Vandervort PhD', 'mayert.kylie', 'WRITER', 'alta.lehner@example.org', NULL, NULL, 0, 0, '$2y$10$ezDvxkgv.DG33oyHL4N7LObRjt0..hTChFgASkNyUnklsLBBJYTpi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 36, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(323, 'Janice Hills II', 'santino53', 'WRITER', 'terry56@example.com', NULL, NULL, 0, 0, '$2y$10$.t1tbOjhMlO/Y1ubPjqQCeBSX40sZfwb.NZJcGMN5.1uQAD2fCrwm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 120, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(324, 'Zakary Robel Jr.', 'dnolan', 'WRITER', 'sincere90@example.net', NULL, NULL, 0, 0, '$2y$10$C62XK4Ztx/fKB/EtwFxB0eTTqI.gxh5dLzW3jVtZDjZNvJi6vRtCq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96, '2018-05-12 14:18:52', 1, 3, NULL, '2018-05-12 14:18:52', '2018-05-12 14:18:52', NULL),
(325, 'Kaylin Watsica III', 'qcarroll', 'WRITER', 'elyssa.okeefe@example.net', NULL, NULL, 0, 0, '$2y$10$g1s4UBMPkhQVmjC.Ll69zO6X0L7Lwiz/xNp/zRc75tlGrpEK997oK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 93, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(326, 'Lilyan Franecki', 'ahmed68', 'WRITER', 'cody.jones@example.com', NULL, NULL, 0, 0, '$2y$10$z1OAy.fb5LLh5EzYMDtmUO7YtVI1XS2XWoRivVMziPkT71PlJQnMG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 112, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(327, 'Mallie Zboncak', 'ezequiel.ruecker', 'WRITER', 'awatsica@example.org', NULL, NULL, 0, 0, '$2y$10$6ZEjOUOQavj.H8x2C46a1.pYJU97SQFWb6Py8/Y1x3FdqjZgaHWJW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 9, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(328, 'Audra McKenzie', 'edyth65', 'WRITER', 'cassin.liana@example.com', NULL, NULL, 0, 0, '$2y$10$yRzK4225jRcu6XcKI3nBgOSrOFHmtAMIl58gc4cYyP/fBFBzmahtq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 48, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(329, 'Antonio Goodwin', 'ola.mcglynn', 'WRITER', 'gabrielle02@example.net', NULL, NULL, 0, 0, '$2y$10$jQZaaP5Le892qFiGglNA..2c3xLiF3w05tuuJJSH/uWe/mHqapghq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 69, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(330, 'Hudson Veum', 'friesen.trent', 'WRITER', 'devyn35@example.com', NULL, NULL, 0, 0, '$2y$10$P71l.cgurQcU6pCObKjQe.utncX/IuLk4KVZeyRK93C8Bpc3UwmOu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(331, 'Candida Mosciski', 'jeanette73', 'WRITER', 'nader.arne@example.org', NULL, NULL, 0, 0, '$2y$10$L2g0G2YByu5z4/vczaI5uefttMSyXjs4s2uv1P4mz0yuPT0ErF3Me', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 33, '2018-05-12 14:18:53', 1, 3, NULL, '2018-05-12 14:18:53', '2018-05-12 14:18:53', NULL),
(332, 'Prof. Miller Schultz', 'carter18', 'WRITER', 'baumbach.otto@example.net', NULL, NULL, 0, 0, '$2y$10$uvGChhjwtZ8QAkPc0Dwg..5WXm3W8V6tSwuvvlya4GIk/B/8KbBEO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 78, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(333, 'Earnestine Williamson', 'watsica.olin', 'WRITER', 'marilou88@example.org', NULL, NULL, 0, 0, '$2y$10$ta80Q7X2ZWgNKGMplSEmiu6p0.sJdjHsfceO2FEpxtUJ8HOxLnHXi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(334, 'Lottie Prosacco', 'oreilly.bernie', 'WRITER', 'delilah81@example.org', NULL, NULL, 0, 0, '$2y$10$EBPXUEf1amkBDT0cv7PyDudScB2imcTf7XLT/rdOfPaK5riFNi.YK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 70, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(335, 'Iliana Bauch', 'bogisich.cyrus', 'WRITER', 'schaden.fay@example.org', NULL, NULL, 0, 0, '$2y$10$AZpehYcH9HuD6UISrDAXHupKBQX46Lwpjj2Psd5XkBohq208m9cNK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(336, 'Dr. Glenna Luettgen', 'nkerluke', 'WRITER', 'madams@example.org', NULL, NULL, 0, 0, '$2y$10$cbdDEBkSzVhkFS3kp/7PKuhH.IQPCv3RKyyAtkSW/fDoM9DCNs67K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(337, 'Elliot Spinka', 'idell42', 'WRITER', 'gconroy@example.com', NULL, NULL, 0, 0, '$2y$10$jKTfPySa6CbP3lIPOoVEG.qvG6nu8lheavQmg.sVq9bTzReQZus1e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 32, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(338, 'Citlalli Beatty', 'daugherty.caitlyn', 'WRITER', 'daugherty.kailee@example.net', NULL, NULL, 0, 0, '$2y$10$ViOb3MqVjepZLRTN7Db0BeWJXX6uBFJ9y7ncIfVhtwi0fXDUtzUPG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 16, '2018-05-12 14:18:54', 1, 3, NULL, '2018-05-12 14:18:54', '2018-05-12 14:18:54', NULL),
(339, 'Sandrine McClure DDS', 'chane', 'WRITER', 'rberge@example.com', NULL, NULL, 0, 0, '$2y$10$BBh73iDACxXgB0tT890JQeM2AY9KuwSs/F2yxguSoQMJFlmxT9/vq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 121, '2018-05-12 14:18:55', 1, 3, NULL, '2018-05-12 14:18:55', '2018-05-12 14:18:55', NULL),
(340, 'Leslie Jacobi', 'alessia81', 'WRITER', 'qharris@example.org', NULL, NULL, 0, 0, '$2y$10$kyKmXxuVM.8cgVSXYpQeDO556v/PSx6fl8YYn6omsIh0b946sDi/u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68, '2018-05-12 14:18:55', 1, 3, NULL, '2018-05-12 14:18:55', '2018-05-12 14:18:55', NULL),
(341, 'Vance Gerhold', 'kristina92', 'WRITER', 'donnie.koelpin@example.net', NULL, NULL, 0, 0, '$2y$10$7V87lDgBtJlIJQC7Y5B/0u8x0gMEnHa.WIkiLP/QRSIiAujjnPemS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 32, '2018-05-12 14:18:55', 1, 3, NULL, '2018-05-12 14:18:55', '2018-05-12 14:18:55', NULL),
(342, 'Jocelyn Keeling', 'kenyon01', 'WRITER', 'lwilliamson@example.net', NULL, NULL, 0, 0, '$2y$10$.YdYd0QcX0QjSJ2Ixqz/rOoriZleFydoANBte3CPg1.buNA40Gzhe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 60, '2018-05-12 14:18:55', 1, 3, NULL, '2018-05-12 14:18:55', '2018-05-12 14:18:55', NULL),
(343, 'Prof. Carolyn Bruen', 'lindsay96', 'WRITER', 'rlubowitz@example.org', NULL, NULL, 0, 0, '$2y$10$5ubNSrT5eKcWVFedrHxO0e4W./IP9JnleSZ3cRUhYvwTMuFj6tlJm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141, '2018-05-12 14:18:55', 1, 3, NULL, '2018-05-12 14:18:55', '2018-05-12 14:18:55', NULL),
(344, 'Lazaro Morissette', 'fritz.reichel', 'WRITER', 'frami.walton@example.com', NULL, NULL, 0, 0, '$2y$10$mzaEdNjaZW3CmW4Z0tAgPu.vk.Emnetd6IlNPm/dfx0FS9laAo7d.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 106, '2018-05-12 14:18:55', 1, 3, NULL, '2018-05-12 14:18:55', '2018-05-12 14:18:55', NULL),
(345, 'Lisette Blanda', 'reba.wilkinson', 'WRITER', 'mittie24@example.org', NULL, NULL, 0, 0, '$2y$10$D.hBT835iSIGIdcxLCVg6u3DqssR1Yn12wYpq6DUXeL2m339LCDgC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 88, '2018-05-12 14:18:56', 1, 3, NULL, '2018-05-12 14:18:56', '2018-05-12 14:18:56', NULL),
(346, 'Vernie Lehner', 'loraine40', 'WRITER', 'nyasia.turcotte@example.net', NULL, NULL, 0, 0, '$2y$10$l/jRB/jlsBo6FUOluWazBO3FBUEToXnHYlPDXjFLgloY6wT3rpePy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 140, '2018-05-12 14:18:56', 1, 3, NULL, '2018-05-12 14:18:56', '2018-05-12 14:18:56', NULL),
(347, 'Nola Predovic', 'forrest.swaniawski', 'WRITER', 'veum.gaylord@example.org', NULL, NULL, 0, 0, '$2y$10$hnr2je8WMHKKPUKXUzpc4OTgZkFerJfTk1vD4v40UQBXh/l0zldiq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:18:56', 1, 3, NULL, '2018-05-12 14:18:56', '2018-05-12 14:18:56', NULL),
(348, 'Samanta McDermott', 'jeanne76', 'WRITER', 'jbalistreri@example.net', NULL, NULL, 0, 0, '$2y$10$kwt75TNNzqD9z3MhSkrbIeEesLw7WR1Xu7ijeRX.OZpfTsnnoFV5y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 119, '2018-05-12 14:18:56', 1, 3, NULL, '2018-05-12 14:18:56', '2018-05-12 14:18:56', NULL),
(349, 'Amely Hoeger', 'okon.reginald', 'WRITER', 'mackenzie.mills@example.com', NULL, NULL, 0, 0, '$2y$10$GgWBAMppacRAQvH1RCqfrO39q/2bKDIe3q9M9S/27qJVbVZHSIKta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 38, '2018-05-12 14:18:56', 1, 3, NULL, '2018-05-12 14:18:56', '2018-05-12 14:18:56', NULL),
(350, 'Shanelle Dickinson', 'tristian.carroll', 'WRITER', 'stokes.esther@example.org', NULL, NULL, 0, 0, '$2y$10$dPy5ZidTA.y7nxHtXz.14OiGCjSngHiHxR/ZsGGn9x/GoBbTh4MRi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 70, '2018-05-12 14:18:57', 1, 3, NULL, '2018-05-12 14:18:57', '2018-05-12 14:18:57', NULL),
(351, 'Rene Bernier', 'alexa17', 'WRITER', 'alaina08@example.com', NULL, NULL, 0, 0, '$2y$10$.mXJBziToMTEDlMoXR0CM.CBlOV7zvEmuABsjG3PylOQSB.TzBVYu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, '2018-05-12 14:18:57', 1, 3, NULL, '2018-05-12 14:18:57', '2018-05-12 14:18:57', NULL),
(352, 'Miguel Stehr', 'mwolff', 'WRITER', 'tromp.erich@example.org', NULL, NULL, 0, 0, '$2y$10$hBc/YOBykYQFkOkUQ0kR/uAnuqyFks.CslCw4B6aoJrGj.IcPykLK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 85, '2018-05-12 14:18:57', 1, 3, NULL, '2018-05-12 14:18:57', '2018-05-12 14:18:57', NULL),
(353, 'Royal Von', 'ygutmann', 'WRITER', 'hbednar@example.com', NULL, NULL, 0, 0, '$2y$10$wiZAXQearGpw/BgElXG1YuMtqt58ng3mwK/NQSHp6YBh.Fz0Waa0.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:18:57', 1, 3, NULL, '2018-05-12 14:18:57', '2018-05-12 14:18:57', NULL),
(354, 'Prof. Leta Steuber', 'moore.rogelio', 'WRITER', 'osinski.allan@example.net', NULL, NULL, 0, 0, '$2y$10$Bi8R3jBH.Sh3mgqW4HEVjeq6uYrmATPEJ1TVCGgkQWZ4Brm/A/0dK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 52, '2018-05-12 14:18:57', 1, 3, NULL, '2018-05-12 14:18:57', '2018-05-12 14:18:57', NULL),
(355, 'Mr. Derick Metz', 'irosenbaum', 'WRITER', 'bert.smitham@example.com', NULL, NULL, 0, 0, '$2y$10$swonprfIOJQQ8j2C3ecynuZOEzXKl1WcxylsEH9VErkFMx.zqOTge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 92, '2018-05-12 14:18:57', 1, 3, NULL, '2018-05-12 14:18:57', '2018-05-12 14:18:57', NULL),
(356, 'Charley Purdy Sr.', 'mcdermott.karley', 'WRITER', 'oeffertz@example.net', NULL, NULL, 0, 0, '$2y$10$/3yyHw5XcJFeaCA0.j7mw.Ld3AX4cqDDyiNFEYYZPtxJlcyola8wW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 143, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(357, 'Kelsi McClure', 'jwitting', 'WRITER', 'mmurray@example.com', NULL, NULL, 0, 0, '$2y$10$39/HixHjS1dWoriaROvjiOKh5veE7FjcNjt4BpES8fhgU4WrKIzCe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 45, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(358, 'Emmy Crooks', 'chartmann', 'WRITER', 'morissette.geoffrey@example.org', NULL, NULL, 0, 0, '$2y$10$ZlRfqoAGJZS431MFRg.RZevut5yUCdZf6MJ7fvYIKj0wrDdvlANuG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(359, 'Jailyn Kassulke', 'wuckert.jazmyne', 'WRITER', 'matt.moore@example.org', NULL, NULL, 0, 0, '$2y$10$XPvSEiLPK4c/MbfU9edyYOQLYRBUNAa6QPbZcbM2j62ADqcOD7XjS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 69, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(360, 'Mrs. Marta Herman', 'alverta73', 'WRITER', 'goyette.chadd@example.org', NULL, NULL, 0, 0, '$2y$10$ygHYgsAgH/XWpqZCRvvGfuf8aE9bJ6AoK4m1W/tvXfF9PuemCXCUe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 86, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(361, 'Lavina Fisher', 'marlin04', 'WRITER', 'koelpin.ebony@example.org', NULL, NULL, 0, 0, '$2y$10$Q5OpBG4hmV.09LkM60xmIOk51y2uCU7Xib1L3G4NyGnr6U1Tiw8W6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 65, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(362, 'Fred Lueilwitz', 'jenkins.cruz', 'WRITER', 'cormier.cullen@example.net', NULL, NULL, 0, 0, '$2y$10$UBjUSgfp5TtpZFQrL3ftKuxzLcRFHNHRdrOsmh6kXK.rlfyG/MOMi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 131, '2018-05-12 14:18:58', 1, 3, NULL, '2018-05-12 14:18:58', '2018-05-12 14:18:58', NULL),
(363, 'Bertram Hammes', 'lonny37', 'WRITER', 'vella.hamill@example.com', NULL, NULL, 0, 0, '$2y$10$Y8yTiZ5OZHrbA.PVMIubN.3tBA9WrD2QFEJGWtb85oExWv9C9pMba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18, '2018-05-12 14:18:59', 1, 3, NULL, '2018-05-12 14:18:59', '2018-05-12 14:18:59', NULL),
(364, 'Tamia Conroy', 'arvilla67', 'WRITER', 'terrance.nitzsche@example.com', NULL, NULL, 0, 0, '$2y$10$lnGjDPUv2JnyH.f2RDSHqu.H0m9c/kHIbw2ZoRajvESR.NLAMSa7a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 139, '2018-05-12 14:18:59', 1, 3, NULL, '2018-05-12 14:18:59', '2018-05-12 14:18:59', NULL),
(365, 'Markus Williamson', 'zpacocha', 'WRITER', 'sauer.burdette@example.org', NULL, NULL, 0, 0, '$2y$10$hAMkKsa622CCG0SQfhGlj.U54NoK4UGSSEXb22zbHcaKBNIjYJP8C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 149, '2018-05-12 14:18:59', 1, 3, NULL, '2018-05-12 14:18:59', '2018-05-15 07:56:38', NULL),
(366, 'Dr. Allie Lindgren II', 'lora22', 'WRITER', 'genevieve47@example.com', NULL, NULL, 0, 0, '$2y$10$H.VDroGEo3Uiu65k4UwVz.rvrnUYH7FIvqh32gJeZ8V0Aq6/NB2gO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, '2018-05-12 14:18:59', 1, 3, NULL, '2018-05-12 14:18:59', '2018-05-12 14:18:59', NULL),
(367, 'Mr. Willard Funk MD', 'chester.franecki', 'WRITER', 'trisha.legros@example.com', NULL, NULL, 0, 0, '$2y$10$Vhq5NzpfDM24z5xSlr/0Auu.0cAdXdgZfMebMGh2wX3ogWgV4uIfe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 75, '2018-05-12 14:18:59', 1, 3, NULL, '2018-05-12 14:18:59', '2018-05-12 14:18:59', NULL),
(368, 'Mrs. Noemy Berge', 'jakubowski.cristopher', 'WRITER', 'telly78@example.net', NULL, NULL, 0, 0, '$2y$10$ElvVrYbnmB08pE18aCyx9eSAQSMVbU5J9COzrgBNVcFxYCdg2yhHq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, '2018-05-12 14:18:59', 1, 3, NULL, '2018-05-12 14:18:59', '2018-05-12 14:18:59', NULL),
(369, 'Ms. Ella Blick II', 'zkub', 'WRITER', 'dach.oceane@example.com', NULL, NULL, 0, 0, '$2y$10$E9cKYEu9UbRo0tMq1gBk8.l5IzAURQ3.7yqZ851FRuGIYDncvhFGK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 79, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(370, 'Sophia Konopelski PhD', 'merlin.marvin', 'WRITER', 'cindy64@example.net', NULL, NULL, 0, 0, '$2y$10$Le.SqzqPvRr55h4GGXaPLOnj/B/nusDAhJbHeWYQoeEfbwOG02LSK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 112, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(371, 'Dorthy Carter', 'chyna47', 'WRITER', 'jackeline.sawayn@example.net', NULL, NULL, 0, 0, '$2y$10$F5z3Couh8238GNgixm4eUuL2OSjPkK04w12s9pZQITEQDG6kO74Bi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 59, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(372, 'Reynold Kertzmann', 'qschmidt', 'WRITER', 'wgutmann@example.net', NULL, NULL, 0, 0, '$2y$10$/abFGuJSV/x2IzG7Db.Pq.pagOQGCwwWoM6W0Kp4M.prnRmLtyJX.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 58, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(373, 'Zella Bradtke', 'hammes.juvenal', 'WRITER', 'uriah21@example.org', NULL, NULL, 0, 0, '$2y$10$Nbrs5ccQy6J9z7bkBeRwB.Y2RFv/2/2IRODu/fE3Ba96R/bzX.oWS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(374, 'Lucinda Buckridge', 'irempel', 'WRITER', 'jaida67@example.org', NULL, NULL, 0, 0, '$2y$10$Et2PoWhLIu/a/jN4fncpT.k7xFbdbzDXUL6lVVE1yJ58M1ZkaXftS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 63, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(375, 'Gwendolyn Stanton', 'little.khalil', 'WRITER', 'weber.lacey@example.net', NULL, NULL, 0, 0, '$2y$10$FO6wnVL1WXVXzdGrc8BLMuOJri7q6VRvj9Tyu5zOK8pKb3TEKCHqS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 83, '2018-05-12 14:19:00', 1, 3, NULL, '2018-05-12 14:19:00', '2018-05-12 14:19:00', NULL),
(376, 'Armand Boyer', 'tklein', 'WRITER', 'cnader@example.org', NULL, NULL, 0, 0, '$2y$10$yUhwqKG3/CJDjw/.RM8V7OWku0e70CSCA6I3xFI6jRzVfZQdJMjI6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(377, 'Ms. Maud Hessel IV', 'aspinka', 'WRITER', 'madelynn32@example.com', NULL, NULL, 0, 0, '$2y$10$0AVh550RQHZbb581uiBphOCfVWJl12Fga3tUaAQ1gSjrMv6.Xw.qW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(378, 'Mr. Fred Yundt Jr.', 'ghermiston', 'WRITER', 'kirlin.jaron@example.net', NULL, NULL, 0, 0, '$2y$10$/YWAxpj3w55wCNEG9kTmpeXhDnYP0O0GfFv/d80QZWaPHAAphXXyG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(379, 'Shirley Jast III', 'amari.halvorson', 'WRITER', 'jadon51@example.net', NULL, NULL, 0, 0, '$2y$10$8sCssOpW.9ExWyX7.JNbh.kmix.uLdZgy6yW6EHhP6Gh5Q3vwbtRq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(380, 'Vada Zboncak', 'dillan23', 'WRITER', 'isabel.connelly@example.org', NULL, NULL, 0, 0, '$2y$10$KyWqiXmNL2M8L0MdL/g3VOUC0xqaxUXZROPeuRAX8LG4rp6qZa.si', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(381, 'Trinity Eichmann I', 'pkihn', 'WRITER', 'hessel.blaise@example.org', NULL, NULL, 0, 0, '$2y$10$E2Xmq.z2tQ.YonNjIEyEOuC5ExRWaKM2V.UX0WacU7xdcJlTnif3.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 142, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(382, 'Abigayle Kertzmann', 'kelly.crooks', 'WRITER', 'ehettinger@example.org', NULL, NULL, 0, 0, '$2y$10$J0XzMsNimjBr6dY5jRuKXOe9rGSDI03HYe.Bs2kxGoalQDR586Ebq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 71, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(383, 'Nina Ernser', 'boyle.florine', 'WRITER', 'gina69@example.org', NULL, NULL, 0, 0, '$2y$10$9Y3qwjWRvsEVvrXUyd.fTOnyM3i7Vy4d1K.5WEYK0oz2zGpu3UmeS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 111, '2018-05-12 14:19:01', 1, 3, NULL, '2018-05-12 14:19:01', '2018-05-12 14:19:01', NULL),
(384, 'Jacky Wilderman', 'zane.quitzon', 'WRITER', 'lafayette24@example.net', NULL, NULL, 0, 0, '$2y$10$agj07SSFJCRtj8RUxOSaXuDLLYO/UGuqzn1kuU.TgT0jJMBAp6wi6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(385, 'Miss Bonnie Kreiger DVM', 'vivienne88', 'WRITER', 'flatley.silas@example.org', NULL, NULL, 0, 0, '$2y$10$psW.LLws.cPYyPuuY0T8kOVp1Q6nTVDEw3Nz4sP5E4Ow94C1IGrvO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 132, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(386, 'Jeanne Feil', 'xcollins', 'WRITER', 'ewyman@example.net', NULL, NULL, 0, 0, '$2y$10$OAytP2UcVfr/KvHm38sWwed5N/7hUN8PdmiDrY.oqvoZxAmIv8HNu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 90, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(387, 'Mrs. Lelia Klein PhD', 'rusty24', 'WRITER', 'uhyatt@example.net', NULL, NULL, 0, 0, '$2y$10$h.VPP4OI0ru3WIUOG1A9HuRsiBoejKEqg.fmetejGNgFLXUxSwUrC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 94, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(388, 'Miss Leonora Klocko', 'nabernathy', 'WRITER', 'gulgowski.lucinda@example.net', NULL, NULL, 0, 0, '$2y$10$Uw4lUDKh9XEEUggWVAGPOum5fZQAf/ruh2OR/u4xSGvNDQ42pOS1W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 32, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(389, 'Bridget Russel PhD', 'bmckenzie', 'WRITER', 'winfield74@example.com', NULL, NULL, 0, 0, '$2y$10$/B4BzoeVQ6.sdY5i2kMp3eiI3QupRsR810jZzAZletawB225DjcxK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 75, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(390, 'Dr. Juwan Blick', 'lowell.marks', 'WRITER', 'richie67@example.net', NULL, NULL, 0, 0, '$2y$10$xcJqfLLi9dKuyx9OlmusI.FNvOAG/iJlngszSRskIk7mepAtjtYMe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, '2018-05-12 14:19:02', 1, 3, NULL, '2018-05-12 14:19:02', '2018-05-12 14:19:02', NULL),
(391, 'Miss Beulah Crooks IV', 'chickle', 'WRITER', 'declan51@example.net', NULL, NULL, 0, 0, '$2y$10$E.2Iwf.qkb9OspK5vn2c..BaNGW79BKUAXqPf0m6xJHxqWllWLT/u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 98, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(392, 'Ada Wiegand', 'rutherford.adan', 'WRITER', 'trisha.lubowitz@example.net', NULL, NULL, 0, 0, '$2y$10$r5LvDMmvtR/VkDw1cfo8/.WmatqX7BAMxUtMugCReX3hin6yn3Q8.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(393, 'Prof. Burley Waelchi', 'andre.metz', 'WRITER', 'osinski.karson@example.net', NULL, NULL, 0, 0, '$2y$10$oHXu3XrMVCx3jIA1cE3m4eLTls69vY0oy34lBIN3a8wQ.xl1hTelO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(394, 'Ahmad Russel', 'eschuppe', 'WRITER', 'marques06@example.org', NULL, NULL, 0, 0, '$2y$10$V0s.TMm8PeM51QxABMV2ZuUpyCd9FT2cpJmIIUWDb/qBPKVpidC6m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(395, 'Citlalli Romaguera', 'franecki.judge', 'WRITER', 'felipa.ruecker@example.net', NULL, NULL, 0, 0, '$2y$10$n45oUkuMH6FUkGRGq75fouwmiFMXQtdYInd0p5WCr.vaaSd.L21Jm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(396, 'Prof. Sabryna Krajcik', 'vilma.lowe', 'WRITER', 'sydnee22@example.net', NULL, NULL, 0, 0, '$2y$10$cwlOWEUJYI4f6Qf7r/KdpOmUDrMte9dHGYZWt3VF8QRkS38iAlKfW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(397, 'Shane Murray', 'stroman.rae', 'WRITER', 'helga45@example.net', NULL, NULL, 0, 0, '$2y$10$urpyHpXNc1cGNWXxQGfw2ODMH/Q5rhSBcVnLOryHTrtOBTkhTiEfy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:19:03', 1, 3, NULL, '2018-05-12 14:19:03', '2018-05-12 14:19:03', NULL),
(398, 'Freda Cormier', 'catalina50', 'WRITER', 'demetrius.deckow@example.org', NULL, NULL, 0, 0, '$2y$10$gPFJEXXYFXiEvoej35fiN.rEcVMkfM7RjFxCCA/PIhrxhhUGIoDUa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 17, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(399, 'Mrs. Beverly Stamm II', 'borer.carmelo', 'WRITER', 'vpagac@example.net', NULL, NULL, 0, 0, '$2y$10$1s7Wi8iOB5MsNVqMcJDNAOG6A.Lz1I9rJhFbuZth4kOzFESYmUM5C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 90, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(400, 'Ms. Martine Block', 'hkessler', 'WRITER', 'ruecker.chase@example.com', NULL, NULL, 0, 0, '$2y$10$/BNhsBnpzrvGI5yYal8Nf.FjYixOQ2jMMnhqNeRb0iF4tmDxUrlv.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(401, 'Marcelina Thiel PhD', 'berenice63', 'WRITER', 'cartwright.hortense@example.com', NULL, NULL, 0, 0, '$2y$10$Ih2nWhWF9j50yr1f3QTntuYQ0ruy5E24Cu3xJi249X/C7TUqtYxye', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 4, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(402, 'Mr. Dedrick Leuschke III', 'okeefe.makayla', 'WRITER', 'brett.satterfield@example.com', NULL, NULL, 0, 0, '$2y$10$BCme81tnmezmo58j8plize76mQKMYNMNbm7qn0oTGQVvd6y6XyjXC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(403, 'Jordon Prohaska', 'dillon.rolfson', 'WRITER', 'addie97@example.net', NULL, NULL, 0, 0, '$2y$10$gsuVlL/qbfEfvsSvLXloHOa47ND1zRYLRIRfknqkpD9BDuYg9gN4u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 27, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(404, 'Alvina Schuppe', 'tremayne.conn', 'WRITER', 'sschinner@example.org', NULL, NULL, 0, 0, '$2y$10$2vyIRTVJOt4xSOByzrf9tOUUk620YnyT4RvNXiLvjsnzjNZRv.bEe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 17, '2018-05-12 14:19:04', 1, 3, NULL, '2018-05-12 14:19:04', '2018-05-12 14:19:04', NULL),
(405, 'Ms. Itzel Romaguera IV', 'linwood.bayer', 'WRITER', 'roscoe69@example.com', NULL, NULL, 0, 0, '$2y$10$F4ZV7ppMbZBr.NcvmQJxWe3JyIbl6JlhTchqucaWhPgjGTuMqQFyi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 82, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-12 14:19:05', NULL),
(406, 'Alphonso Flatley', 'teresa58', 'WRITER', 'edwin34@example.com', NULL, NULL, 0, 0, '$2y$10$L4xXhDUK6Q6ziLXJqmQotuRYu71ox1YGWULnKdxGyv9yEKazPDVFG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 19, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-12 14:19:05', NULL),
(407, 'Norberto Hodkiewicz I', 'aisha.pollich', 'WRITER', 'yadira92@example.net', NULL, NULL, 0, 0, '$2y$10$yLEbwmY1PIOxPWHH1ZtEZua1dLtblT0ExWSoAo4pF6VEgrd7URnHy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 74, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-12 14:19:05', NULL),
(408, 'Maude Mueller', 'pstanton', 'WRITER', 'wiley22@example.org', NULL, NULL, 0, 0, '$2y$10$TuIwVQENOPjrOvGW6bZJJuFxbVXGVXLhF8112ddsLqy241rSztebm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 64, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-12 14:19:05', NULL),
(409, 'Dr. Timothy Graham Jr.', 'noelia18', 'WRITER', 'joany27@example.org', NULL, NULL, 0, 0, '$2y$10$Pmzrw0xWkvzsyS/yUjHEEuzI1z6xVlNKsEm94HsWRdz6mT.Du168G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-12 14:19:05', NULL),
(410, 'Bernhard Schmeler', 'vickie70', 'WRITER', 'cdeckow@example.com', NULL, NULL, 0, 0, '$2y$10$BKadSUMU81oVV2ZagJxA3.gsiNMVgYWkukevcBylxsAx/v3/MoXqW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 147, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-15 07:56:19', NULL),
(411, 'Elaina Hane', 'ronaldo80', 'WRITER', 'nils63@example.net', NULL, NULL, 0, 0, '$2y$10$vxxnLB/SC2C35H0b1hSO.u1VX3MgiXemGxbo8MWp/j5qjbItwjpo6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 68, '2018-05-12 14:19:05', 1, 3, NULL, '2018-05-12 14:19:05', '2018-05-12 14:19:05', NULL),
(412, 'Wava Nienow', 'betty85', 'WRITER', 'omer63@example.org', NULL, NULL, 0, 0, '$2y$10$vCZg5zFoeOB3Slo28dnqJuP5IrK6OP9qHkUCi3iwgrjs5HU6mrkVm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 102, '2018-05-12 14:19:06', 1, 3, NULL, '2018-05-12 14:19:06', '2018-05-12 14:19:06', NULL),
(413, 'Sonya Breitenberg Jr.', 'abalistreri', 'WRITER', 'vfunk@example.org', NULL, NULL, 0, 0, '$2y$10$UNjwcK5YXA8eIXVyy6E9UOr6w24Om1eGdna7N0HEhmxwp1ABEldkO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 87, '2018-05-12 14:19:06', 1, 3, NULL, '2018-05-12 14:19:06', '2018-05-12 14:19:06', NULL),
(414, 'Skylar Goodwin', 'tanner.cole', 'WRITER', 'barrett.schuppe@example.org', NULL, NULL, 0, 0, '$2y$10$5BlhYWW2Kdtx5rxkqVe6seaS6fL/TgN/vi47/59K68ry..Lq.XsEu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:19:06', 1, 3, NULL, '2018-05-12 14:19:06', '2018-05-12 14:19:06', NULL),
(415, 'Aubrey Weber', 'cadams', 'WRITER', 'hartmann.jacinthe@example.org', NULL, NULL, 0, 0, '$2y$10$GM2cNUWzv/0BSxJvzHTU5uTpZwz3SQMgyk60cZgcV/1KS.r3iqDgi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 28, '2018-05-12 14:19:06', 1, 3, NULL, '2018-05-12 14:19:06', '2018-05-12 14:19:06', NULL),
(416, 'Luigi Towne', 'mparker', 'WRITER', 'glenna50@example.net', NULL, NULL, 0, 0, '$2y$10$BaXr0ftPpHx8LLVbB48d6edUKlU5zOCwsRUYzBojHzI2Dom0QzGAa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 146, '2018-05-12 14:19:06', 1, 3, NULL, '2018-05-12 14:19:06', '2018-05-12 14:19:06', NULL),
(417, 'Ms. Lisette Kub V', 'twillms', 'WRITER', 'newton.rutherford@example.org', NULL, NULL, 0, 0, '$2y$10$dUOPtdfN1ZFhcfccNftR2u33VKr/tLm64j3imZQr6QBh42dpOEDPS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 104, '2018-05-12 14:19:06', 1, 3, NULL, '2018-05-12 14:19:06', '2018-05-12 14:19:06', NULL),
(418, 'Eryn Blanda', 'senger.woodrow', 'WRITER', 'gerlach.marquise@example.net', NULL, NULL, 0, 0, '$2y$10$B1cBC.gXRuR9FHWnCkZz8Ot7Rkj9Gup2HU6YVOjPQcs3YHJ/LHr7y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 122, '2018-05-12 14:19:07', 1, 3, NULL, '2018-05-12 14:19:07', '2018-05-12 14:19:07', NULL),
(419, 'Sandrine Quitzon', 'kayley87', 'WRITER', 'runolfsson.jaydon@example.com', NULL, NULL, 0, 0, '$2y$10$83Xec1IoW0prrxVEb0ivFuDGPYzZNuBknbbkbmOZ7U9bvh8z7JUSO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-12 14:19:07', 1, 3, NULL, '2018-05-12 14:19:07', '2018-05-12 14:19:07', NULL),
(420, 'Marlin Parisian', 'graham.virgil', 'WRITER', 'devan.haley@example.org', NULL, NULL, 0, 0, '$2y$10$nXnlXxQt80qy3UJHycIZZe4zswPXx1kRzB.nVTvI/S0SZgwtLzXWG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 76, '2018-05-12 14:19:07', 1, 3, NULL, '2018-05-12 14:19:07', '2018-05-12 14:19:07', NULL),
(421, 'Quentin Volkman', 'sydnee04', 'WRITER', 'arianna00@example.com', NULL, NULL, 0, 0, '$2y$10$1QgAtovRkWF0zfN8U14cY.ttTp8W4qpndyZhniyUXSf0exWOpeJN6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 88, '2018-05-12 14:19:07', 1, 3, NULL, '2018-05-12 14:19:07', '2018-05-12 14:19:07', NULL),
(422, 'Cullen Kozey', 'anais.stamm', 'WRITER', 'qgrimes@example.com', NULL, NULL, 0, 0, '$2y$10$B1CfmDuq5nrK4sh.xkDFMe6mFC62w14IOzUwiyQ9JvkLHdtDNX2LS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 126, '2018-05-12 14:19:07', 1, 3, NULL, '2018-05-12 14:19:07', '2018-05-12 14:19:07', NULL),
(423, 'Neva Tremblay', 'sharon09', 'WRITER', 'kiara.daugherty@example.org', NULL, NULL, 0, 0, '$2y$10$PX2E6LN4qDCcdnsIvbNukeNhtvefW08IHrkbcTtHB/RmNTkNljb1u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 65, '2018-05-12 14:19:08', 1, 3, NULL, '2018-05-12 14:19:08', '2018-05-12 14:19:08', NULL),
(424, 'Torrance Lueilwitz', 'marion.fahey', 'WRITER', 'gleichner.reese@example.com', NULL, NULL, 0, 0, '$2y$10$q8aFYeiZIgCXWZIwWLllkuT51rydeeQpkmubgZkT25U2t.Zn43YK6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7, '2018-05-12 14:19:08', 1, 3, NULL, '2018-05-12 14:19:08', '2018-05-12 14:19:08', NULL),
(425, 'Wallace Prosacco', 'ruecker.cleveland', 'WRITER', 'hudson.braun@example.org', NULL, NULL, 0, 0, '$2y$10$S6z2D2KBAoDAv2DYkHVv0.FaknJYM1yYJQctiReMNm5GZsd6r7Yca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 18, '2018-05-12 14:19:08', 1, 3, NULL, '2018-05-12 14:19:08', '2018-05-12 14:19:08', NULL),
(426, 'Gardner Turner III', 'sophie.stracke', 'WRITER', 'spinka.jermey@example.com', NULL, NULL, 0, 0, '$2y$10$C.7Ahc/DP9Rq9i0517mHmeJGa4jy9QBF5yflvj5VbS6QTrJkZVuuW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 91, '2018-05-12 14:19:08', 1, 3, NULL, '2018-05-12 14:19:08', '2018-05-12 14:19:08', NULL),
(427, 'Mayra Lind DDS', 'jnienow', 'WRITER', 'neil.hauck@example.org', NULL, NULL, 0, 0, '$2y$10$HaRkOMv2/DVKmncKeEUOGueD7gfYMURLlBWtIqo0r2ebAbxwHhPXe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 87, '2018-05-12 14:19:08', 1, 3, NULL, '2018-05-12 14:19:08', '2018-05-12 14:19:08', NULL),
(428, 'Kitty Jacobi', 'stacy.abshire', 'WRITER', 'eleazar09@example.net', NULL, NULL, 0, 0, '$2y$10$pDN6D8QyWefscR/SwKOQTukY0en65hG/qIIn0u/iFq.VAO0Qybq.K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56, '2018-05-12 14:19:09', 1, 3, NULL, '2018-05-12 14:19:09', '2018-05-12 14:19:09', NULL),
(429, 'Mia McCullough', 'anna.kautzer', 'WRITER', 'rmonahan@example.net', NULL, NULL, 0, 0, '$2y$10$gcjXG/.neLro14gUQrh0q.14TsEgGt.KGcncmnf718uB.jJqh48ku', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 63, '2018-05-12 14:19:09', 1, 3, NULL, '2018-05-12 14:19:09', '2018-05-12 14:19:09', NULL),
(430, 'Lafayette Turner', 'bbechtelar', 'WRITER', 'rupert.altenwerth@example.com', NULL, NULL, 0, 0, '$2y$10$w1YusP8M1iGAPmhctB6vMec3Q2AE.ZTe11wLdiF4UiAuiopE6JLm2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 27, '2018-05-12 14:19:09', 1, 3, NULL, '2018-05-12 14:19:09', '2018-05-12 14:19:09', NULL),
(431, 'Rowena Howe', 'jaylon30', 'WRITER', 'ckihn@example.net', NULL, NULL, 0, 0, '$2y$10$qylOprA6NVK8mIJoU.D7TeKKPgufuOGhhMvjXQX9kibi3KOPz.grq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 50, '2018-05-12 14:19:09', 1, 3, NULL, '2018-05-12 14:19:09', '2018-05-12 14:19:09', NULL),
(432, 'Pasquale Price', 'upouros', 'WRITER', 'vnitzsche@example.com', NULL, NULL, 0, 0, '$2y$10$GdYlXSmPduDEA20kD01nQeIibdthjfjMSz/FT3LMzkrFiyGH9kLJa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, '2018-05-12 14:19:09', 1, 3, NULL, '2018-05-12 14:19:09', '2018-05-12 14:19:09', NULL),
(433, 'Harold Jerde', 'tavares.torphy', 'WRITER', 'rodriguez.henriette@example.org', NULL, NULL, 0, 0, '$2y$10$kBLIPqp6P8PgxjMn2CDweu/.z75lsCc3MWKtVHliwko.E0frD5eRS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:19:09', 1, 3, NULL, '2018-05-12 14:19:09', '2018-05-12 14:19:09', NULL),
(434, 'Miss Joelle Gerlach', 'mohr.tate', 'WRITER', 'aherzog@example.net', NULL, NULL, 0, 0, '$2y$10$XahW1ELhtRFu1NLh9zcaCOss6qeMAzNjgKO/yM7KsAmouXs/OGk5a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7, '2018-05-12 14:19:10', 1, 3, NULL, '2018-05-12 14:19:10', '2018-05-12 14:19:10', NULL),
(435, 'Dr. Genevieve Hodkiewicz', 'schowalter.ella', 'WRITER', 'igleason@example.com', NULL, NULL, 0, 0, '$2y$10$E9wzy48avQuDh00mVmP4dOT/5mmqZB92y2KnWlgUhMc3/lZxWM98W', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 110, '2018-05-12 14:19:10', 1, 3, NULL, '2018-05-12 14:19:10', '2018-05-12 14:19:10', NULL),
(436, 'Marcel McCullough', 'jabari66', 'WRITER', 'bpollich@example.org', NULL, NULL, 0, 0, '$2y$10$RQiKy1kH6SCmlUnQ1EiF8OYyA55o81gYYEfKriDvPWxkyB.fi1pxK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 52, '2018-05-12 14:19:10', 1, 3, NULL, '2018-05-12 14:19:10', '2018-05-12 14:19:10', NULL),
(437, 'Clifford Bradtke', 'adrienne.smitham', 'WRITER', 'stephan.lynch@example.net', NULL, NULL, 0, 0, '$2y$10$Z7nurpvKe4s4ZuNTNFBOduelg/K3kPjVGvD1Oo1wjHOUNWaO8ESjK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 45, '2018-05-12 14:19:10', 1, 3, NULL, '2018-05-12 14:19:10', '2018-05-12 14:19:10', NULL),
(438, 'Dr. Adrian Cassin DVM', 'trycia.kling', 'WRITER', 'morar.angus@example.org', NULL, NULL, 0, 0, '$2y$10$S3L5Di61MIcJywWxU6kIDOKK2tS2hAWf4V6tCZltae4KcQ/U8D1fC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46, '2018-05-12 14:19:10', 1, 3, NULL, '2018-05-12 14:19:10', '2018-05-12 14:19:10', NULL),
(439, 'Jose Littel', 'rosalinda.schmeler', 'WRITER', 'weldon88@example.net', NULL, NULL, 0, 0, '$2y$10$u251msbFMRSp3n6Chfp7Ou01XfLUJbLe0uGSVuNcKnvf5TKmQlVai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-12 14:19:10', 1, 3, NULL, '2018-05-12 14:19:10', '2018-05-12 14:19:10', NULL),
(440, 'Joy Homenick', 'melyna80', 'WRITER', 'hdouglas@example.net', NULL, NULL, 0, 0, '$2y$10$o.6BVFzQH6eXgIipy9J6HOMwQcE1lLQwZY2dkG9tuAE8wHb5PNLbm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 122, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-12 14:19:11', NULL),
(441, 'Sylvester Balistreri V', 'vjohns', 'WRITER', 'zieme.charley@example.org', NULL, NULL, 0, 0, '$2y$10$7wpeoGkvTltmwyYlg1Vfw.c7QAQdNXQBvSHmPAo1SR.gSKeTkjFoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 150, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-15 07:55:54', NULL),
(442, 'Kaylah Bogan', 'elnora68', 'WRITER', 'deckow.alice@example.net', NULL, NULL, 0, 0, '$2y$10$yjNW003/G94BzGHC7P0RI.biVzto8sfKolIAygjGL0TMmyGYXzMx2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 62, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-12 14:19:11', NULL),
(443, 'Emanuel Waelchi', 'rebecca.reinger', 'WRITER', 'wblick@example.net', NULL, NULL, 0, 0, '$2y$10$7Bz25BVO/s84J/2ulr3rzOLGD03.TcADHhCr894/q4IRm.o0.kn/C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 55, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-12 14:19:11', NULL),
(444, 'Junius Borer', 'reichel.fletcher', 'WRITER', 'abbott.casper@example.org', NULL, NULL, 0, 0, '$2y$10$I22XP7PdW3X5WVKi6jctu.Si4c1v8MoUOsn97OgsGs4HrVFC.4Lqy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 112, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-12 14:19:11', NULL),
(445, 'Norma Mayer', 'lorenzo59', 'WRITER', 'kari64@example.com', NULL, NULL, 0, 0, '$2y$10$/WwiHbp2/auSMP9FFxBEWO5D4ZjBAycf7am6RX3c8rJtG84ga.MIu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-12 14:19:11', NULL),
(446, 'Josianne Schroeder II', 'lraynor', 'WRITER', 'pgrimes@example.org', NULL, NULL, 0, 0, '$2y$10$IgqbuRKM4uNztmkgPKfhu..w0DMJYdApFh/BzcLJhWJx9K.xQrKQC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-12 14:19:11', 1, 3, NULL, '2018-05-12 14:19:11', '2018-05-12 14:19:11', NULL),
(447, 'Joan D''Amore', 'hollis.keeling', 'WRITER', 'hattie.schaefer@example.com', NULL, NULL, 0, 0, '$2y$10$WUXnKq8zVzncW3vDm2SmROzdXCZz/2IXebUGG.YOAz93pJJJfGeoq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 22, '2018-05-12 14:19:12', 1, 3, NULL, '2018-05-12 14:19:12', '2018-05-12 14:19:12', NULL),
(448, 'Patrick Klein', 'kianna93', 'WRITER', 'joyce60@example.org', NULL, NULL, 0, 0, '$2y$10$Qeq/xKcHZMOOV4tLslKEtuiE8iSjzYBHHgP/bkMcNDjlE0wFFVTmu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 114, '2018-05-12 14:19:12', 1, 3, NULL, '2018-05-12 14:19:12', '2018-05-12 14:19:12', NULL);
INSERT INTO `users` (`id`, `name`, `username`, `user_type`, `email`, `paypal_email`, `dob`, `balance`, `is_admin`, `password`, `image`, `thumbnail`, `academic_level_id`, `school`, `field_of_specialization`, `country_id`, `city`, `address`, `phone`, `about`, `professional_bio`, `my_details`, `academic_experience`, `views`, `orders_complete`, `last_seen`, `active`, `attempts_left`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(449, 'Prof. Liliane Sawayn DVM', 'arlene.eichmann', 'WRITER', 'ihilpert@example.com', NULL, NULL, 0, 0, '$2y$10$gzOST06ICyqKY3hfzV5O9uhdh1XmGeGuqlH6kmyTusr.akVzqaz.K', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 93, '2018-05-12 14:19:12', 1, 3, NULL, '2018-05-12 14:19:12', '2018-05-12 14:19:12', NULL),
(450, 'Billy Christiansen PhD', 'brandt39', 'WRITER', 'beryl.graham@example.net', NULL, NULL, 0, 0, '$2y$10$DLn4wb6sJJTatDiFrmokd.95MxC7P6FBL5CIHLj0T37VzZznE0pYW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 118, '2018-05-12 14:19:12', 1, 3, NULL, '2018-05-12 14:19:12', '2018-05-12 14:19:12', NULL),
(451, 'Ardella Hagenes', 'aurelio10', 'WRITER', 'jasper40@example.org', NULL, NULL, 0, 0, '$2y$10$LOwybJR6LJqCKxqoUM.9gOSYAMsY9Fv0eUqIksg6TO0c4Se6C8KK6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 146, '2018-05-12 14:19:12', 1, 3, NULL, '2018-05-12 14:19:12', '2018-05-12 18:53:45', NULL),
(452, 'Titus Dickens', 'leffler.electa', 'WRITER', 'oral.johns@example.org', NULL, NULL, 0, 0, '$2y$10$jxGFedPdoN8whIai7G0X.e9PxbzYrsWtYyGS37a3RZMD/PhrUAJmy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21, '2018-05-12 14:19:12', 1, 3, NULL, '2018-05-12 14:19:12', '2018-05-12 14:19:12', NULL),
(453, 'Ray Stark', 'joan78', 'WRITER', 'welch.annie@example.net', NULL, NULL, 0, 0, '$2y$10$rWyDMrgqR/Fvfgoc9WXkEeZ9IBHAbQTwe/hrGlzQyP19mkA3E86iu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 101, '2018-05-12 14:19:13', 1, 3, NULL, '2018-05-12 14:19:13', '2018-05-12 14:19:13', NULL),
(454, 'Prof. Dylan Erdman', 'dewayne.sanford', 'WRITER', 'anibal32@example.org', NULL, NULL, 0, 0, '$2y$10$P.Rkk6dcxuOPxUY.Im9u6.hYRKl2j34fHvl0khB5P0l71hBwajC4.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, '2018-05-12 14:19:13', 1, 3, NULL, '2018-05-12 14:19:13', '2018-05-12 14:19:13', NULL),
(455, 'Ashleigh Abbott', 'dawson.ruecker', 'WRITER', 'ken37@example.net', NULL, NULL, 0, 0, '$2y$10$uce4unAePgCOSeI/B/hEBO2qmQbpvCNuCnRDKbLKgpevAYi0Qwuvu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 118, '2018-05-12 14:19:13', 1, 3, NULL, '2018-05-12 14:19:13', '2018-05-12 14:19:13', NULL),
(456, 'Ignacio Wilderman', 'dooley.issac', 'WRITER', 'ramiro.crooks@example.net', NULL, NULL, 0, 0, '$2y$10$eOEqL7DLl9K24AxqFoewlOELVkeOCS4nYE5Roxim.o/HDwC.kzQNO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 59, '2018-05-12 14:19:13', 1, 3, NULL, '2018-05-12 14:19:13', '2018-05-12 14:19:13', NULL),
(457, 'Nikita Bernier', 'josiane.gutkowski', 'WRITER', 'mjones@example.net', NULL, NULL, 0, 0, '$2y$10$17xOm4XMOqnb98Py3FNnEesws6yJjUSzWOQ72zZm7wBG1poeSFA5.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 23, '2018-05-12 14:19:13', 1, 3, NULL, '2018-05-12 14:19:13', '2018-05-12 14:19:13', NULL),
(458, 'Janelle Johnson', 'freeda.rosenbaum', 'WRITER', 'beatty.isabelle@example.net', NULL, NULL, 0, 0, '$2y$10$FX0GSpmBMcun8//uTpvH2eR4SVhsX54vr/1GlXRsv08gZ7H7/RHYm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 47, '2018-05-12 14:19:14', 1, 3, NULL, '2018-05-12 14:19:14', '2018-05-12 14:19:14', NULL),
(459, 'Lizzie Harvey', 'nigel07', 'WRITER', 'kyler45@example.org', NULL, NULL, 0, 0, '$2y$10$xJztlbWETlPfrOjOu7t8.OWdXDnxeh9SNRPazSP2PVyK0XhoIGR.S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 29, '2018-05-12 14:19:14', 1, 3, NULL, '2018-05-12 14:19:14', '2018-05-12 14:19:14', NULL),
(460, 'Eugene Klein', 'pswaniawski', 'WRITER', 'kyla40@example.net', NULL, NULL, 0, 0, '$2y$10$N8duvmk5/cZsTQEMJrChtuk0JEQjrrXh3xEa7VOW8Q5Eqx0oTd.CW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 116, '2018-05-12 14:19:14', 1, 3, NULL, '2018-05-12 14:19:14', '2018-05-12 14:19:14', NULL),
(461, 'Mr. Maxwell Littel V', 'wade79', 'WRITER', 'rbeatty@example.com', NULL, NULL, 0, 0, '$2y$10$aqMenWQqnRbRhL51LR9r7ugRrKc91p/i6aqVfvjCBoNiRCCpuoGi.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 48, '2018-05-12 14:19:14', 1, 3, NULL, '2018-05-12 14:19:14', '2018-05-12 14:19:14', NULL),
(462, 'Mr. Arthur Connelly', 'asia.toy', 'WRITER', 'qgoyette@example.org', NULL, NULL, 0, 0, '$2y$10$MH/6cdijm4ccPel99tSDZuxNVgZHE6zBd1h6cKzHO5VchaqEpHBOi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 133, '2018-05-12 14:19:14', 1, 3, NULL, '2018-05-12 14:19:14', '2018-05-12 14:19:14', NULL),
(463, 'Prof. Keegan Hackett', 'mayert.jennie', 'WRITER', 'rodrick.muller@example.com', NULL, NULL, 0, 0, '$2y$10$.qObHCjsYafZysqKjYXttOmDJWede.joDhShqbkKEFF/xcykYqAMG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 134, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(464, 'Tyreek Crooks', 'daisha.schultz', 'WRITER', 'hickle.grady@example.com', NULL, NULL, 0, 0, '$2y$10$4VD.PMi.Q.rQsS0KJni9zuuTfw2XK970ex8FBEbRkUx4X.ECnN3R6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 56, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(465, 'Dr. Arturo Kautzer DDS', 'maxime.effertz', 'WRITER', 'dan.prosacco@example.net', NULL, NULL, 0, 0, '$2y$10$CSvJnOcGCILJPhnIdB/M/OKl.aSKngEKCCHqGQy9JWLsteHliwkPq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 17, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(466, 'Arvid Hammes', 'lavada.bartell', 'WRITER', 'stanton.leopold@example.com', NULL, NULL, 0, 0, '$2y$10$b3M.tdjLeGfRiSNJ2zCSvujJLpJBO37v3yEALl5FKVFEMGwpHO7cS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 39, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(467, 'Sonya Blanda MD', 'marquardt.cullen', 'WRITER', 'chadd.breitenberg@example.net', NULL, NULL, 0, 0, '$2y$10$KMDwK6.hLyEGI6focRJt3OifLM8jczv9mxODtaTz96RRQQ7wjlpnu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 95, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(468, 'Weston Zemlak PhD', 'mrunolfsdottir', 'WRITER', 'bernhard.muriel@example.org', NULL, NULL, 0, 0, '$2y$10$2mXkxv1islnvT5ZnCsNKGO1QqyaijaC0BBbBuNOV6c3BVvj9oQrdy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 148, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-15 07:58:16', NULL),
(469, 'Guadalupe Rau', 'jerald.abernathy', 'WRITER', 'brady.johns@example.com', NULL, NULL, 0, 0, '$2y$10$WS3VQF./iRxExcLnGbPBee5r2PVh8jKP/IU0jCS4o9bINLjnxPkA2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 89, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(470, 'Danika Hansen I', 'gpagac', 'WRITER', 'buckridge.maybell@example.org', NULL, NULL, 0, 0, '$2y$10$2FRbLLpAkacCX8GEBCp2NeGfABfYokfW8kZIXTuu6ZEOzkfCIQ90q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 106, '2018-05-12 14:19:15', 1, 3, NULL, '2018-05-12 14:19:15', '2018-05-12 14:19:15', NULL),
(471, 'Reggie Lowe', 'daisha92', 'WRITER', 'kailyn.jacobi@example.org', NULL, NULL, 0, 0, '$2y$10$0PvRleXqFe6oUQ3HhkMWnOXdQTQlbkOAyW0k..CSIDJn8y.ClomlC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(472, 'Andre Kunde', 'iokuneva', 'WRITER', 'pfannerstill.pearl@example.net', NULL, NULL, 0, 0, '$2y$10$i4sOns2xAlTnsTLYXXnNb.iVyqtQ7bXP6BTQwf1zVXUJaN6KMhKUO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(473, 'Alejandrin Skiles', 'uluettgen', 'WRITER', 'pkuhic@example.com', NULL, NULL, 0, 0, '$2y$10$tpV6CHLqkNmXZGkuJ3PMy.tsCfP9jCI/YMTbKcS8q8fVUdfZoligq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 141, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(474, 'Eli Grant', 'cgerlach', 'WRITER', 'zmarvin@example.com', NULL, NULL, 0, 0, '$2y$10$LZdwqEbgsKBYMbtk66SJ0OyyC5zP.7AWRKz0zXHbup4ilxijpUnxC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 91, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(475, 'Ms. Madge Conroy Jr.', 'swaniawski.pansy', 'WRITER', 'giovanna00@example.org', NULL, NULL, 0, 0, '$2y$10$91uAoh3Md.j5Vy48moexc.xX7o4WOCx0d0srcPdPYxggR.PDBghjq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(476, 'Jaren Halvorson', 'qquigley', 'WRITER', 'ocasper@example.org', NULL, NULL, 0, 0, '$2y$10$eVrGUxR4tjD0sJrX6xk7Lu42jyNnhJQYvsGmVB2nME8ga256Mi0gO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(477, 'Rebekah Fisher', 'caleb.okeefe', 'WRITER', 'wolff.assunta@example.com', NULL, NULL, 0, 0, '$2y$10$KjQYDAIlNj6naZm4ljSIkeLHhGXi3j0OyO4ycYMAWDvWuccBlzJju', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 87, '2018-05-12 14:19:16', 1, 3, NULL, '2018-05-12 14:19:16', '2018-05-12 14:19:16', NULL),
(478, 'Dr. Crawford Rosenbaum', 'gutkowski.brayan', 'WRITER', 'hdenesik@example.org', NULL, NULL, 0, 0, '$2y$10$VRepVURPfSq3KVWLypfLSeb7vEA7rQzxQIBiqXLVBlwpMa4DiPxyC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 57, '2018-05-12 14:19:17', 1, 3, NULL, '2018-05-12 14:19:17', '2018-05-12 14:19:17', NULL),
(479, 'Otto Crooks', 'jeanne10', 'WRITER', 'lehner.natasha@example.com', NULL, NULL, 0, 0, '$2y$10$YUtZwfcMysWmGLzkvKYaEuYzL./cQTD5CzWyKwj.Ku7cJlTwRlLyy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 114, '2018-05-12 14:19:17', 1, 3, NULL, '2018-05-12 14:19:17', '2018-05-12 14:19:17', NULL),
(480, 'Keith Waelchi MD', 'abatz', 'WRITER', 'okuneva.anissa@example.org', NULL, NULL, 0, 0, '$2y$10$MM.z9k3C6R6NxLIpsLPhouDQRFNkeet/ptUBEXWcum85klUkm35ua', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96, '2018-05-12 14:19:17', 1, 3, NULL, '2018-05-12 14:19:17', '2018-05-12 14:19:17', NULL),
(481, 'Taya Wunsch MD', 'labadie.joyce', 'WRITER', 'erik78@example.com', NULL, NULL, 0, 0, '$2y$10$CdPnDOqCrqRSLQSOS2VQTOXsWDVJllVkpqmac9Dz1i7P/TlqQczNq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, '2018-05-12 14:19:17', 1, 3, NULL, '2018-05-12 14:19:17', '2018-05-12 14:19:17', NULL),
(482, 'Odie Kuhn', 'ankunding.diamond', 'WRITER', 'kamryn37@example.com', NULL, NULL, 0, 0, '$2y$10$SXiVDEro1ENaFCMVlHvNwOW39/z8YzAQoI9Vz14lP38aKlp/ctxpq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 115, '2018-05-12 14:19:17', 1, 3, NULL, '2018-05-12 14:19:17', '2018-05-12 14:19:17', NULL),
(483, 'Otis Boyle', 'denis.weber', 'WRITER', 'rita.gibson@example.net', NULL, NULL, 0, 0, '$2y$10$43FIQ/ZOW8AJcNjoBKqOd.D5uTR3G0Hph9T7iU46bppcz1EEYncam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 125, '2018-05-12 14:19:17', 1, 3, NULL, '2018-05-12 14:19:17', '2018-05-12 14:19:17', NULL),
(484, 'Audra Rippin', 'jesse01', 'WRITER', 'briana.zulauf@example.net', NULL, NULL, 0, 0, '$2y$10$CpQ20k9dJAQA6wFG3piFF.wfJuK.WWOARSd.ArtWwaI5XCvSItwJq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 143, '2018-05-12 14:19:18', 1, 3, NULL, '2018-05-12 14:19:18', '2018-05-12 14:19:18', NULL),
(485, 'Pansy Blick II', 'juliet40', 'WRITER', 'kristy.mertz@example.net', NULL, NULL, 0, 0, '$2y$10$TAek7tbL27UJSh.H.Tm0c..fk4I0nw59m9E3OnyW1xu1xWcR2QqLq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 92, '2018-05-12 14:19:18', 1, 3, NULL, '2018-05-12 14:19:18', '2018-05-12 14:19:18', NULL),
(486, 'Dr. Jaquan Hyatt II', 'stehr.garret', 'WRITER', 'smayer@example.com', NULL, NULL, 0, 0, '$2y$10$a4xhTVqXbomEt9KV80akL.lGn0I1aBUB1djytxtz68wiqIldfBceC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 120, '2018-05-12 14:19:18', 1, 3, NULL, '2018-05-12 14:19:18', '2018-05-12 14:19:18', NULL),
(487, 'Mr. Xavier McKenzie', 'nwiza', 'WRITER', 'maverick.barton@example.com', NULL, NULL, 0, 0, '$2y$10$s24WcrpYhqkBneHK3tFICuC/kzaqKJXWqJkdoVRyMb.S8KlOm1lT6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 46, '2018-05-12 14:19:18', 1, 3, NULL, '2018-05-12 14:19:18', '2018-05-12 14:19:18', NULL),
(488, 'Maeve Hamill', 'blair.daugherty', 'WRITER', 'harry.collins@example.org', NULL, NULL, 0, 0, '$2y$10$lJnms8ntkBJcOZqSsaYWFuYV8ZIfgx722UaLIqwlzcKkLSiTPrDC6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 144, '2018-05-12 14:19:18', 1, 3, NULL, '2018-05-12 14:19:18', '2018-05-12 14:19:18', NULL),
(489, 'Dr. Jena West II', 'abagail98', 'WRITER', 'phoebe.hyatt@example.net', NULL, NULL, 0, 0, '$2y$10$1mEGVj285UWrnx.ti6WRQuLOmFl4UTH5v3hjcpu1XajrenGa2UGrO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 102, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(490, 'Carlos Pollich', 'zetta78', 'WRITER', 'adams.zella@example.com', NULL, NULL, 0, 0, '$2y$10$KHnwYh93MtkcsqWr9KfmMO58brrz7ibYSGQ/GG/VTR9ysorLphA8y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 112, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(491, 'Hans Stehr', 'iliana13', 'WRITER', 'liam14@example.org', NULL, NULL, 0, 0, '$2y$10$qUjVaFs6uLiQ9vGHBmh3be.ddH4FHikknJ3rDpJnlqSFA1yIZxgK2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 51, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(492, 'Orlo Bednar', 'gretchen38', 'WRITER', 'vern98@example.com', NULL, NULL, 0, 0, '$2y$10$NeBLaEZFKF7.ieYfJp2ApOdhSO9D.IEPxzz268.jxy0QmOxKMLbEO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 102, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(493, 'Moises Fritsch', 'preston05', 'WRITER', 'flynch@example.com', NULL, NULL, 0, 0, '$2y$10$DB9hpMqQazjKFAJJZ0/QS.FbK4gZ5LDgykLxZYkZMwRkzLQi22uUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(494, 'Rickey Koelpin', 'lehner.edward', 'WRITER', 'nestor.hayes@example.net', NULL, NULL, 0, 0, '$2y$10$XJRiIIiFPjl3n.s.PPu5k.nQIVP2S9xmAaWE5ucbC1nTkYvINSidS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 85, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(495, 'Prof. Martine Hudson V', 'felton75', 'WRITER', 'kaia50@example.com', NULL, NULL, 0, 0, '$2y$10$2YwwPIL4SXRonStCCadHle5QcCyA4CZmwifqirS.oi/CHY..36Dsu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 77, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(496, 'Ellen Johnson', 'koch.cyrus', 'WRITER', 'jerod.yost@example.org', NULL, NULL, 0, 0, '$2y$10$G11qHlILTQKiC/adwaC.Vut3ZkkLcfhf/IgE/bTFIYbqtSHdiLV2y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 80, '2018-05-12 14:19:19', 1, 3, NULL, '2018-05-12 14:19:19', '2018-05-12 14:19:19', NULL),
(497, 'Miss Marietta Morar', 'fherzog', 'WRITER', 'amelia16@example.org', NULL, NULL, 0, 0, '$2y$10$HuDs4RgZ5Q5tEG8Aei4yw.hbueDBrqwIXbKafaxMWu8lRBUYJGqdO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 81, '2018-05-12 14:19:20', 1, 3, NULL, '2018-05-12 14:19:20', '2018-05-12 14:19:20', NULL),
(498, 'Elinor Moore', 'mia.hermann', 'WRITER', 'kessler.vernon@example.org', NULL, NULL, 0, 0, '$2y$10$Pwa1pzRdn/NkTrcmDMeXleaEmkSlt0xFstrMUJiCcg5cgiW9APfeq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 148, '2018-05-12 14:19:20', 1, 3, NULL, '2018-05-12 14:19:20', '2018-05-29 23:07:05', NULL),
(499, 'Eldon Legros', 'mabel99', 'WRITER', 'rlittel@example.org', NULL, NULL, 0, 0, '$2y$10$Af4uDDMXOTpKh5gdFPdK9eUnIfHRWrgPTC.6ZIHuvtlRZArbzga8m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, '2018-05-12 14:19:20', 1, 3, NULL, '2018-05-12 14:19:20', '2018-05-12 14:19:20', NULL),
(500, 'Rickie Mohr I', 'hal97', 'WRITER', 'gorczany.kenneth@example.org', NULL, NULL, 0, 0, '$2y$10$BMyl13w9GWHILaiUdhm1vekonkrYamLk6hMqrV.pjMkweP94Kh.S.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 116, '2018-05-12 14:19:20', 1, 3, NULL, '2018-05-12 14:19:20', '2018-05-12 14:19:20', NULL),
(501, 'Prof. Noble Buckridge', 'laurence.roberts', 'WRITER', 'seth78@example.com', NULL, NULL, 0, 0, '$2y$10$mij5Gl724QspP60nOgMiPepTXWisMUyu5izmfCmUJEtc3vjD8NvBa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 145, '2018-05-12 14:19:20', 1, 3, NULL, '2018-05-12 14:19:20', '2018-05-12 14:19:20', NULL),
(502, 'Writer', 'writer', 'WRITER', 'writer@gmail.com', NULL, NULL, 0, 0, '$2y$10$Y7YkHlzAz.Qsezu63C5IeuQn7fPAJLZOSmYltwVLGX2yp8NmNCxB.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, '2018-05-29 18:40:45', 1, 3, '90cxI4QLhO8qihU8yMJ0DVeeVsGzE7nk16yuVZLacizUcui7SHGfzlsS3lBL', '2018-05-12 14:17:58', '2018-05-31 10:19:29', NULL),
(503, 'Client', 'client', 'CLIENT', 'client@gmail.com', NULL, NULL, 4851, 0, '$2y$10$cKZ7iQGwz8ziVMtGhoeb0eOZ.Ro.H4umz0MEyYQXgXXfHGXTeTwlC', 'image_1526133042.jpg', 'thumb_image_1526133042.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-06-05 11:17:40', 1, 3, 'JVmCnTaiIWgKV8gwsv1oVRh5zh8uPr2r5gv7VJO5fvXT3ZaARR4ZAXE322PK', '2018-05-12 14:17:58', '2018-06-05 11:17:40', NULL),
(504, 'Admin', 'admin', 'ADMIN', 'admin@gmail.com', NULL, NULL, 0, 1, '$2y$10$MpjV9.noeUB6S/bDJsI27uGWBs0HjHFwM6H4clubqgEfwNaTXp/Mq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-12 18:31:01', 1, 3, 'M7R09SODtoinDJq42gcvUNhrywpQgWBcbi69H5ISo3bWLdHiGfSJE4k2yEe5', '2018-05-12 14:17:58', '2018-05-12 18:31:07', NULL),
(505, 'kevin kiumbe', 'qmbe', 'WRITER', 'kevoqmbe@gmail.com', NULL, '2000-05-14', 61, 0, '$2y$10$EeoZ9ZsWHTxD.DmvFeLKxe/Xlt2UAfGYuiWqTh8sysV.nrrz34FLO', 'image_1526277361.JPG', 'thumb_image_1526277361.JPG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, '2018-05-31 21:32:28', 1, 3, NULL, '2018-05-14 10:55:21', '2018-05-31 21:32:28', NULL),
(506, 'james bohl', '77gl', 'CLIENT', 'kevinkiumbe77@gmail.com', NULL, NULL, 0, 0, '$2y$10$jum4UJbX/LJJ3TUy8AHft./QvQXhdsMqNnQt21Y6B5CJpQL9NzElS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-14 11:05:11', 1, 3, 'OMIqhlRoWlTiiF7FOXqRSU2Rz3GyQ3sz6tgBiLPTu3IGrnBHKn4h6fMl0T1m', '2018-05-14 10:59:05', '2018-05-14 11:05:16', NULL),
(507, 'caleb nyachwaya', 'Caleb', 'CLIENT', 'caleebson@gmail.com', NULL, NULL, 0, 0, '$2y$10$HEUgL23CBI8OpdsAnhogVe6yQ7lpxT10GNpRNgIwYebgUu6L3fAuC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-14 14:38:58', 1, 3, NULL, '2018-05-14 12:05:56', '2018-05-14 14:38:58', NULL),
(508, 'Ken Nzioka', 'nzioker', 'WRITER', 'nzioker@outlook.com', 'nzioker@gmail.com', NULL, 0, 0, '$2y$10$CAN0SawBxNuM.OqZA9hVUuxmIrTliJrErGXfGd.qbKEno4cfZd28W', 'image_1526288377.jpg', 'thumb_image_1526288377.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-05-21 13:39:43', 1, 3, 'V3On7RQD2f7CbhENVieRiD9mTpC9XIB6Dmdj4irrROXi1qGqKsY30dl7PNfv', '2018-05-14 13:53:18', '2018-06-04 20:31:59', NULL),
(509, 'Joel james', 'Njoel', 'WRITER', 'nanciemo192@gmail.com', NULL, NULL, 0, 0, '$2y$10$xT0rCPG.DmoUPvDnhRwAFel.Su6aWDiUrjFO.8xtTeE7LGvwpVUrW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-21 04:52:26', 1, 3, 'oeF6uWNL7V0EgMEG3eK0wKDzyJ5JK0zlM2eImDiii0C3T9Udm39YqZHvRvq9', '2018-05-14 16:39:40', '2018-05-21 04:52:34', NULL),
(510, 'Caleb Nyachwaya', 'Caleebson', 'CLIENT', 'calebnyach@gmail.com', NULL, NULL, 0, 0, '$2y$10$mHFW7xsJHc9Zt0.emmyiLeG43nFCeGTEujjWwjjj5wnTVGdKARgjG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-14 23:20:56', 1, 3, 'Ma8gwqpk4lwMDuzVhGJVNqIJgUtADRir6VSJXcw6rqrfsBG8dy8RdStpKadE', '2018-05-14 23:16:41', '2018-05-14 23:20:56', NULL),
(511, 'Caleb Writer', 'caleb  writer', 'CLIENT', 'calebcaleb@yahoo.com', NULL, NULL, 0, 0, '$2y$10$48gAv.imiAfdUVaC3dauZufqEQC/vCvvSmW7VetKh23EtI.QKMhri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-14 23:24:16', 1, 3, 'UY7mC9MbTvPJ33KU74Kwy2ZIyTKJ0VRXI3b9Gqa4Jn6rsLLMTa5ljehZBeIh', '2018-05-14 23:23:00', '2018-05-14 23:24:17', NULL),
(512, 'bjoh manry', 'Mariah', 'WRITER', 'kelvin@spa-limited.com', NULL, NULL, 0, 0, '$2y$10$B.sdQfpLVGf0qT2vKb1Izu7HXiu5FAo7swnMkv9OVd2RbK58Z7L2S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-14 23:30:54', 1, 3, 'G6dognVpi6w2B4SM0cg0Z5pAm9UBmR0gefKExtqWCfDpprYxFAQKVBFTFmK8', '2018-05-14 23:25:43', '2018-05-14 23:31:03', NULL),
(513, 'writer caleb', 'Witer caleb', 'WRITER', 'calebcalebcaleb@yahoo.com', NULL, NULL, 16, 0, '$2y$10$dL2JkBDx4D5eHzsSkVY60.ENZtbym741E/bQOLyX5ZYjHYHR8kE8m', 'image_1526323389.jpg', 'thumb_image_1526323389.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '2018-05-14 23:50:20', 1, 3, NULL, '2018-05-14 23:28:06', '2018-05-14 23:50:20', NULL),
(514, 'Brock Butler', 'Butle469570', 'CLIENT', 'brock.butler0126@gmail.com', NULL, NULL, 0, 0, '$2y$10$1XHCoWIr2Yy80chYnc649u1WEFJm.kvJTOdekvf27.eFe7bL5MCiK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-17 06:21:32', 1, 3, NULL, '2018-05-17 06:16:31', '2018-05-17 06:21:32', NULL),
(515, 'Hillary Soita', 'Larry', 'WRITER', 'larysoita1@gmail.com', NULL, NULL, 0, 0, '$2y$10$OFA9DuOXTAgcoOuMMsGksOgdM.LCU0BUJKEge11ulKa54S9HMREYu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, '2018-05-17 11:59:36', 1, 3, NULL, '2018-05-17 09:00:15', '2018-05-17 11:59:36', NULL),
(516, 'Jasmyn ', 'Jassava', 'CLIENT', 'jasmyndickerson12@gmail.com', NULL, NULL, 0, 0, '$2y$10$dd7cvyktnYbW/lpo9pVT3OEeGqhIAd9.Xp/9UuhgYiHRRb7zlhGHm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-18 19:11:56', 1, 3, NULL, '2018-05-18 19:06:02', '2018-05-18 19:11:56', NULL),
(517, 'Dalimar', 'Dalimar13', 'CLIENT', 'dalimar13vargas@hotmail.com', NULL, NULL, 0, 0, '$2y$10$phjEyYWyy/JVJ5dXf9qc8O6rNkXCdalP9.oun3Sf0CcOqckmICOJ2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-21 05:25:13', 1, 3, 'wJOtY9WtiRyGfoRvCnqYznRZFnR6qx6p9rMnVoKaeyDXKWm2OZiFjz9hfQK5', '2018-05-21 04:43:43', '2018-05-21 05:25:13', NULL),
(518, 'kevin Kiumbe ', 'Qmbe12', 'WRITER', 'Writerkevin@yahoo.com', NULL, NULL, 0, 0, '$2y$10$W2xxmAj3opvCsmXHP5AQlO2BGFNKT8cupTdxZdkYDyKoEs4UsrBnu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-05-21 04:55:27', 1, 3, 'TQSsmO7GSEA1WAdQUc82kaHDr2i0qjV6kusIWVo8EM4WbiCPShTpuUySALfI', '2018-05-21 04:53:59', '2018-05-21 04:55:34', NULL),
(519, 'Kevin jade ', 'Qmbe123', 'WRITER', 'kevinqmbe@yahoo.com', NULL, NULL, 0, 0, '$2y$10$E8YvZDRNanDrUj52sICDQ.RPu3xBDmu9LefFdpJ5aDsarXpN1WKp.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2018-06-04 20:30:22', 1, 3, 'ZcVK35Xtgv0ZmqhNr7nlVbs5OEgUMcIoqxMRHXloMr5TYwQz7miBPvPC4r2u', '2018-05-21 04:57:13', '2018-06-04 20:30:29', NULL),
(520, 'vlmar joseph', 'vmarj', 'WRITER', 'vladislavpanarim101@gmail.com', NULL, NULL, 0, 0, '$2y$10$1B2Nv3Nx.h1zjOvxU.VSt.MPhg0y0Q2XdQ616S4YBzPCCrC9GEG3q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2018-05-21 06:50:02', 1, 3, NULL, '2018-05-21 05:08:10', '2018-05-21 06:50:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE IF NOT EXISTS `withdrawal_requests` (
  `id` int(10) unsigned NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `amount` double(12,2) NOT NULL,
  `status` enum('APPROVED','PENDING','REJECTED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PENDING',
  `approved_at` timestamp NULL DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `withdrawal_requests`
--

INSERT INTO `withdrawal_requests` (`id`, `transaction_id`, `user_id`, `admin_id`, `amount`, `status`, `approved_at`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 505, NULL, 30.00, 'PENDING', NULL, NULL, '2018-05-14 11:44:59', '2018-05-14 11:44:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_levels`
--
ALTER TABLE `academic_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_types`
--
ALTER TABLE `assignment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_notifications`
--
ALTER TABLE `message_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_assignment_types`
--
ALTER TABLE `my_assignment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_disciplines`
--
ALTER TABLE `my_disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_languages`
--
ALTER TABLE `my_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `paypal_transactions`
--
ALTER TABLE `paypal_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portofolios`
--
ALTER TABLE `portofolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_disciplines`
--
ALTER TABLE `sub_disciplines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_levels`
--
ALTER TABLE `academic_levels`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `assignment_types`
--
ALTER TABLE `assignment_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `formats`
--
ALTER TABLE `formats`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message_notifications`
--
ALTER TABLE `message_notifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `my_assignment_types`
--
ALTER TABLE `my_assignment_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `my_disciplines`
--
ALTER TABLE `my_disciplines`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `my_languages`
--
ALTER TABLE `my_languages`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `paypal_transactions`
--
ALTER TABLE `paypal_transactions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `portofolios`
--
ALTER TABLE `portofolios`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sub_disciplines`
--
ALTER TABLE `sub_disciplines`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=521;
--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
