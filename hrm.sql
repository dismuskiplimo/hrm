-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2019 at 11:25 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eddu_hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `annual_leaves`
--

CREATE TABLE `annual_leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `days_used` int(11) DEFAULT NULL,
  `days_left` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `annual_leaves`
--

INSERT INTO `annual_leaves` (`id`, `user_id`, `year`, `days_used`, `days_left`, `created_at`, `updated_at`) VALUES
(1, 1, 2016, 15, 30, '2018-06-09 19:00:08', '2018-06-09 19:38:39'),
(2, 1, 2017, 0, 12, '2018-06-10 01:20:12', '2018-06-10 01:20:12'),
(8, 1, 2018, 0, 42, '2018-06-10 02:54:04', '2018-06-10 02:54:04');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `asset_type`, `brand`, `model`, `serial_number`, `description`, `assigned`, `assigned_to`, `assigned_by`, `assigned_at`, `disposed`, `disposed_by`, `disposed_reason`, `deletion_status`, `created_by`, `previous_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Television', 'Samsung', '32D6', 'ccddeee09', '<p>32 Inch TV</p>', 1, 11, 1, '2018-06-04 04:17:34', 0, NULL, NULL, 0, 1, 3, '2018-06-04 03:46:58', '2018-06-04 04:34:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_histories`
--

CREATE TABLE `asset_histories` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_histories`
--

INSERT INTO `asset_histories` (`id`, `asset_id`, `user_id`, `assigned_by`, `condition_before`, `condition_after`, `cleared`, `cleared_by`, `cleared_at`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 1, 'Great', 'Great', 1, 1, '2018-06-04 03:50:49', '2018-06-04 03:47:16', '2018-06-04 03:50:49'),
(2, 1, 11, 1, 'Good', 'Marvelous', 1, 1, '2018-06-04 04:02:23', '2018-06-04 03:52:37', '2018-06-04 04:02:23'),
(3, 1, 11, 1, 'Good', NULL, 0, NULL, NULL, '2018-06-04 04:17:34', '2018-06-04 04:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `award_categories` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `bonuses` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `client_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `client_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `deductions` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `created_by`, `department`, `department_description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lehner PLC', 'Aliquam earum eligendi soluta inventore sit nulla nisi. Tempora ut necessitatibus eos laborum rerum commodi. Blanditiis architecto rerum libero et nulla cupiditate. Cum doloremque laborum ab sunt et. Quam eligendi amet eius tempore nesciunt commodi. Enim distinctio autem et expedita non qui error est. Magni similique id quod. Exercitationem dolorum corrupti quos natus similique ut est rerum. Velit officia deleniti quaerat rerum vero veritatis. Officia magni assumenda aut nisi quae consectetur.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:52'),
(2, 1, 'Lehner-Walsh', 'Nemo in beatae alias voluptatem iste exercitationem et. Omnis temporibus aut et. Saepe iusto est pariatur sequi ea aut est recusandae. Temporibus cupiditate sapiente quia temporibus. Modi consequatur id sed quod ut earum repudiandae nam. Enim omnis sed quod sint nihil voluptatibus quia. Excepturi id ipsum qui quos enim. Reiciendis eos consequatur consequatur quia eius quidem. Doloremque itaque et repudiandae delectus natus est maxime.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:58'),
(3, 1, 'Senger-Wilkinson', 'Dolores dignissimos nam quo cupiditate veritatis. Expedita est vel debitis tenetur. Quas eius expedita amet et aut iusto quis esse. Rerum labore numquam cum. Eos delectus voluptatem fugit ad sed. Rem ipsam ut sed quidem error et. Repellat odio ad accusamus non. Ut aliquam quam voluptas sed. Soluta ab molestiae dolorem architecto voluptatum. Eaque soluta similique assumenda. Voluptas quaerat autem dolores. Unde molestiae vero quisquam recusandae exercitationem.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:48:04'),
(4, 1, 'Bahringer-Sauer', 'Aliquid sint sit explicabo laborum facilis. Nam numquam ut quos. Ut qui perspiciatis sit dolore. Et accusamus perferendis harum architecto sunt minima. Voluptatem voluptatem et explicabo quia aut consequatur. Ut quia vero molestiae earum quis odit. Et delectus quis excepturi temporibus dolor. Consequatur assumenda eligendi ex delectus debitis. Ea consequatur a vel sunt pariatur et sit. Est veniam aut quo ratione amet.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:27'),
(5, 1, 'Klein LLC', 'Omnis magnam facere earum. Corrupti tenetur beatae quod ut placeat. Qui et ut et aut vero. Nisi ea deserunt alias excepturi animi illum. Animi nulla fugiat itaque reprehenderit qui. Deleniti nulla et dolor id est. Facilis a non nostrum. Aperiam voluptatem delectus est ut est. Porro quia illo quia eos. Quas asperiores qui rerum temporibus tempore voluptatem. Pariatur repudiandae magnam voluptatibus. Unde incidunt ut vitae voluptas ipsum.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:47:33'),
(6, 1, 'Finance Department', '<p>Managing Company Finances</p>', 1, 0, '2018-06-03 18:48:40', '2018-06-03 18:48:40'),
(7, 1, 'HR Department', '<p>Managing HR</p>', 1, 0, '2018-06-03 18:49:09', '2018-06-03 18:49:09'),
(8, 1, 'ICT Department', '<p>For Managing ICT</p>', 1, 0, '2018-06-03 18:49:30', '2018-06-03 18:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 1, 3, 'O\'Conner-Hilll', 'Accusamus et tempora soluta quia saepe. Praesentium commodi praesentium voluptas eum aut eos. Eveniet qui eius rerum hic pariatur. Sint optio quae eveniet vel corrupti dolores. Qui asperiores non porro ullam odio. Quae libero quam blanditiis culpa odio consequatur sit. Rerum voluptates sit repellendus quas quis cum atque. Velit sit eius deleniti enim asperiores minima. Molestias consequatur soluta eius et ducimus harum et.', 1, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:29'),
(10, 1, 2, 'Predovic Group', 'Quaerat voluptas consequuntur esse quibusdam. Repellendus fugit sequi aperiam. Ut hic qui veniam explicabo. Magnam omnis ullam sit quia. Aut ut omnis quisquam repudiandae aut. Voluptatem dolorem praesentium vel et aperiam qui. Nihil non ut aut dignissimos ex error. Similique facere asperiores et ullam in possimus at. Dolor illo perspiciatis molestias repudiandae voluptas pariatur. Laboriosam autem vel commodi ipsum tempora non harum expedita.', 0, 1, '2018-04-12 06:25:16', '2018-06-03 18:52:33'),
(11, 1, 6, 'Senior Finance Officer', '<p>Senior Finance Officer</p>', 1, 0, '2018-06-03 18:53:28', '2018-06-03 18:53:28'),
(12, 1, 7, 'Principal Human Resource Manager', '<p>Principan HRM</p>', 1, 0, '2018-06-03 18:54:21', '2018-06-03 18:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `employee_awards`
--

CREATE TABLE `employee_awards` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `expence_managements` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `folders` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `leave_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `leave_category_id` int(11) NOT NULL,
  `leave_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days` int(11) NOT NULL DEFAULT '0',
  `last_leave_date` date DEFAULT NULL,
  `last_leave_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_leave_category_id` int(11) DEFAULT NULL,
  `during_leave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recommender_id` int(11) DEFAULT NULL,
  `recommended` tinyint(1) DEFAULT NULL,
  `recommender_message` text COLLATE utf8mb4_unicode_ci,
  `publication_status` tinyint(4) NOT NULL DEFAULT '0',
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `created_by`, `approved_by`, `leave_category_id`, `leave_address`, `start_date`, `end_date`, `days`, `last_leave_date`, `last_leave_period`, `last_leave_category_id`, `during_leave`, `reason`, `recommender_id`, `recommended`, `recommender_message`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(13, 1, 1, 1, '<p>sf<br></p>', '2018-06-09', '2018-09-07', 64, '2018-06-07', '45', 1, 'dennis', '<p>ssfsdf<br></p>', NULL, NULL, NULL, 1, 0, '2018-06-10 01:58:01', '2018-06-10 02:10:54'),
(14, 1, 1, 2, '<p>sdfsd<br></p>', '2018-06-09', '2018-09-07', 64, '2018-06-27', '4', 2, 'dennis', '<p>dvzxcx<br></p>', NULL, NULL, NULL, 1, 0, '2018-06-10 02:12:09', '2018-06-10 02:13:45'),
(15, 1, 1, 3, '<p>sfsf</p>', '2018-06-09', '2018-06-20', 7, '2018-06-01', '5', 1, 'Denno', '<p>sdfsgf</p>', NULL, NULL, NULL, 1, 0, '2018-06-10 02:20:34', '2018-06-10 02:23:01'),
(16, 1, 1, 4, '<p>xvxcv<br></p>', '2018-06-09', '2018-06-20', 7, '2018-06-27', '4', 1, 'dennis', '<p>xcvxvx<br></p>', NULL, NULL, NULL, 1, 0, '2018-06-10 02:25:57', '2018-06-10 02:32:50'),
(17, 1, 1, 3, '<p>fsdfd</p>', '2018-06-09', '2018-06-13', 2, '2018-06-26', '4', 3, 'Denno', '<p>zxcscvz</p>', NULL, NULL, NULL, 1, 0, '2018-06-10 02:33:48', '2018-06-10 02:36:15'),
(18, 1, 1, 4, '<p>n..</p>', '2018-06-09', '2018-06-27', 12, '2018-06-29', '5', 2, 'Denno', '<p>n.,mn</p>', NULL, NULL, NULL, 1, 0, '2018-06-10 02:42:26', '2018-06-10 02:46:55'),
(19, 1, 1, 1, '<p>sdacv</p>', '2018-06-09', '2018-09-07', 64, '2018-06-26', '4', 3, 'Denno', '<p>fasdaf</p>', NULL, NULL, NULL, 1, 0, '2018-06-10 02:47:33', '2018-06-10 02:54:48'),
(20, 1, NULL, 4, '<p>sdfsd</p>', '2018-06-09', '2018-06-09', 0, '2018-06-29', '4', 1, 'Denno', '<p>sdfsf</p>', NULL, NULL, NULL, 2, 0, '2018-06-10 02:57:01', '2018-06-18 19:29:40'),
(21, 1, NULL, 3, NULL, '2018-06-18', '2018-06-20', 2, '2018-06-05', '6', 2, 'Denno', '<p>hljlhjh<br></p>', 1, NULL, NULL, 0, 0, '2018-06-18 20:44:46', '2018-06-18 20:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `leave_categories`
--

CREATE TABLE `leave_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `leave_category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_category_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `loans` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(34, '2018_06_04_022029_create_asset_histories_table', 2),
(35, '2018_06_09_182446_create_annual_leaves_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `notice_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `created_by`, `notice_title`, `description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Party', '<p>Details...</p>', 1, 0, '2018-04-16 05:59:04', '2018-04-16 05:59:04'),
(2, 1, 'Test', '<p>Test notice&nbsp;</p>', 1, 0, '2018-06-05 07:54:45', '2018-06-05 07:54:45'),
(3, 1, 'directors tea', '<p>directors tea test</p>', 1, 0, '2018-06-05 15:16:24', '2018-06-05 15:16:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `created_by`, `user_id`, `employee_type`, `basic_salary`, `house_rent_allowance`, `medical_allowance`, `special_allowance`, `provident_fund_contribution`, `other_allowance`, `tax_deduction`, `provident_fund_deduction`, `other_deduction`, `activation_status`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 2, '35000', '10000', '1000', '0', '0', '0', '16000', '0', '0', 0, '2018-06-03 21:40:57', '2018-06-05 07:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(6, 4),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 4),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(24, 1),
(24, 3),
(24, 4),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(27, 1),
(27, 3),
(27, 4),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(29, 1),
(29, 3),
(29, 4),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(31, 1),
(31, 3),
(31, 4),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(33, 1),
(33, 2),
(33, 3),
(33, 4);

-- --------------------------------------------------------

--
-- Table structure for table `personal_events`
--

CREATE TABLE `personal_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `personal_event` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_event_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `publication_status` tinyint(4) NOT NULL,
  `deletion_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_events`
--

INSERT INTO `personal_events` (`id`, `created_by`, `personal_event`, `personal_event_description`, `start_date`, `end_date`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Office Party', '<p>details...</p>', '2018-06-04', '2018-06-04', 1, 0, '2018-04-16 05:45:40', '2018-04-16 05:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
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
(11, 3),
(12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `salary_payments`
--

CREATE TABLE `salary_payments` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_payments`
--

INSERT INTO `salary_payments` (`id`, `created_by`, `user_id`, `gross_salary`, `total_deduction`, `net_salary`, `provident_fund`, `payment_amount`, `payment_month`, `payment_type`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 11, '35000.00', '16000.00', '19000', '0', '19000', '2018-06-01', 2, NULL, '2018-06-03 21:41:50', '2018-06-03 21:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `salary_payment_details`
--

CREATE TABLE `salary_payment_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `salary_payment_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_payment_details`
--

INSERT INTO `salary_payment_details` (`id`, `salary_payment_id`, `item_name`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic Salary', 35000, 'credits', '2018-06-03 21:41:50', '2018-06-03 21:41:50'),
(2, 1, 'Tax Deduction', 16000, 'debits', '2018-06-03 21:41:50', '2018-06-03 21:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_by`, `employee_id`, `name`, `father_name`, `mother_name`, `spouse_name`, `email`, `password`, `present_address`, `permanent_address`, `home_district`, `academic_qualification`, `professional_qualification`, `joining_date`, `experience`, `reference`, `id_name`, `id_number`, `contact_no_one`, `contact_no_two`, `emergency_contact`, `web`, `gender`, `date_of_birth`, `marital_status`, `avatar`, `client_type_id`, `designation_id`, `joining_position`, `access_label`, `role`, `activation_status`, `deletion_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Hanna Kunde', NULL, NULL, NULL, 'admin@mail.com', '$2y$10$Y17jCoozWQAi0i5jDK65D.JSAyd0JbvznZ4vp3lnZC3Ck6CIVLGBu', '517 Macejkovic Wells Apt. 548\nHermistonshire, SD 06403-7926', '340 Macejkovic Motorway\nMabellebury, MA 81057-0585', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '824.291.3043 x7421', NULL, NULL, 'http://feeney.com/id-dolor-ea-omnis-animi-recusandae-est-sit-repellat.html', 'm', '1988-04-04', NULL, NULL, 9, 8, NULL, 1, NULL, 1, 0, '8TBFas4hA5OC088nSriPzsgBg5vf35S39t6chERw9kEJtqN8FMeZ89QTIyzw', '2018-04-12 06:25:15', '2018-04-12 06:25:15'),
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
(12, 1, '1234', 'Huhu', NULL, NULL, NULL, 'Huhu@gmail.com', '$2y$10$agVqJlbOXQoo4OdV.0ePNed3.v5aonvE3HR2uKM7/YHOitR4RmwCO', '16912', NULL, NULL, NULL, NULL, '2018-06-01', NULL, NULL, NULL, NULL, '123445', NULL, NULL, NULL, 'm', '2018-06-04', 3, NULL, NULL, 11, 11, 2, 'team-leader', 0, 0, 'G9hX3q5i3xZcCbz8tHjJWtnxEELBWFmnYNkBuLUl0L205Eh6P3te2YejqZC1', '2018-06-05 08:00:05', '2018-06-05 08:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `working_days`
--

CREATE TABLE `working_days` (
  `id` int(10) UNSIGNED NOT NULL,
  `updated_by` int(11) NOT NULL,
  `day` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_status` tinyint(4) NOT NULL COMMENT '0 for holiday & 1 for working day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_histories`
--
ALTER TABLE `asset_histories`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_types_client_type_unique` (`client_type`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_department_unique` (`department`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_designation_unique` (`designation`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_categories_leave_category_unique` (`leave_category`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `personal_events`
--
ALTER TABLE `personal_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_payment_details`
--
ALTER TABLE `salary_payment_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `working_days`
--
ALTER TABLE `working_days`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annual_leaves`
--
ALTER TABLE `annual_leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asset_histories`
--
ALTER TABLE `asset_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `award_categories`
--
ALTER TABLE `award_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_types`
--
ALTER TABLE `client_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_awards`
--
ALTER TABLE `employee_awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expence_managements`
--
ALTER TABLE `expence_managements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `leave_categories`
--
ALTER TABLE `leave_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_events`
--
ALTER TABLE `personal_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary_payments`
--
ALTER TABLE `salary_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_payment_details`
--
ALTER TABLE `salary_payment_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `working_days`
--
ALTER TABLE `working_days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
