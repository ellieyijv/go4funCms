-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2019 at 10:15 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `go4fun`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aboutusImg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `herobannerImg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `third_img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(2, NULL, 1, 'Category 2', 'category-2', '2019-07-17 17:46:27', '2019-07-17 17:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `state_id`, `created_at`) VALUES
(8, '北京', 'beijing', 15, NULL),
(9, '夏威夷', 'haweiyi', 16, NULL),
(10, '墨尔本', 'melbourn', 17, NULL),
(11, '布里斯班', 'brisben', 17, NULL),
(12, '黄金海岸', 'goldcoast', 17, NULL),
(13, '柏斯', 'perth', 17, NULL),
(14, '凯恩斯', 'kaiens', 17, NULL),
(15, '悉尼', 'sydney', 17, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(100, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(101, 11, 'product_code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 2),
(102, 11, 'product_name', 'text', 'Product Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(103, 11, 'duration', 'text', 'Duration', 0, 0, 1, 1, 1, 1, '{}', 4),
(104, 11, 'product_description', 'text', 'Product Description', 1, 0, 1, 1, 1, 1, '{}', 5),
(105, 11, 'sales_price', 'text', 'Sales Price', 1, 1, 1, 1, 1, 1, '{}', 6),
(106, 11, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 7),
(107, 11, 'price_description', 'text', 'Price Description', 1, 0, 1, 1, 1, 1, '{}', 8),
(108, 11, 'tour_language', 'text', 'Tour Language', 1, 1, 1, 1, 1, 1, '{}', 9),
(109, 11, 'pick_up_service', 'text', 'Pick Up Service', 1, 0, 1, 1, 1, 1, '{}', 10),
(110, 11, 'meals', 'text', 'Meals', 1, 0, 1, 1, 1, 1, '{}', 11),
(111, 11, 'policy', 'text', 'Policy', 1, 0, 1, 1, 1, 1, '{}', 12),
(112, 11, 'travel_document', 'text', 'Travel Document', 1, 0, 1, 1, 1, 1, '{}', 13),
(113, 11, 'flyer', 'media_picker', 'Flyer', 1, 0, 1, 1, 1, 1, '{\"max\":5,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":false,\"allow_delete\":false,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":false,\"allowed\":[\"image\\/jpeg\",\"image\\/png\",\"image\\/bmp\"],\"hide_thumbnails\":false,\"quality\":90}', 16),
(114, 11, 'card_image', 'media_picker', 'Card Image', 1, 0, 1, 1, 1, 1, '{\"max\":2,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":false,\"allow_delete\":false,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":false,\"allowed\":[\"image\\/jpeg\",\"image\\/png\",\"image\\/bmp\"],\"hide_thumbnails\":false,\"quality\":90}', 17),
(115, 11, 'description_image', 'text', 'spots', 1, 0, 0, 0, 0, 0, '{}', 19),
(116, 11, 'inclusion', 'rich_text_box', 'Inclusion', 1, 0, 1, 1, 1, 1, '{}', 20),
(117, 11, 'exclusion', 'rich_text_box', 'Exclusion', 1, 0, 1, 1, 1, 1, '{}', 21),
(118, 11, 'terms_conditions', 'rich_text_box', 'Terms Conditions', 1, 0, 1, 1, 1, 1, '{}', 22),
(119, 11, 'ltinerary', 'text_area', 'Ltinerary', 1, 0, 0, 0, 0, 0, '{}', 23),
(120, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 24),
(121, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 26),
(165, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(166, 21, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(167, 21, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(168, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(169, 21, 'state_id', 'text', 'State Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(170, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(171, 22, 'state', 'text', 'State/Country', 1, 1, 1, 1, 1, 1, '{}', 2),
(172, 22, 'created_at', 'timestamp', 'Created At', 1, 0, 0, 0, 0, 0, '{}', 4),
(173, 22, 'updated_at', 'text', 'Updated At', 1, 0, 0, 0, 0, 0, '{}', 5),
(174, 21, 'city_belongsto_state_relationship', 'relationship', 'states', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\State\",\"table\":\"states\",\"type\":\"belongsTo\",\"column\":\"state_id\",\"key\":\"id\",\"label\":\"state\",\"pivot_table\":\"about_us\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(175, 11, 'product_belongstomany_city_relationship', 'relationship', 'cities', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\City\",\"table\":\"cities\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_cities\",\"pivot\":\"1\",\"taggable\":\"on\"}', 15),
(176, 11, 'product_belongsto_state_relationship', 'relationship', 'states', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\State\",\"table\":\"states\",\"type\":\"belongsTo\",\"column\":\"state_id\",\"key\":\"id\",\"label\":\"state\",\"pivot_table\":\"about_us\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(177, 11, 'state_id', 'text', 'State Id', 0, 0, 1, 1, 1, 1, '{}', 25),
(181, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(182, 24, 'iamge', 'media_picker', 'Iamge', 1, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 2),
(183, 24, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(184, 24, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(185, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(186, 11, 'product_belongstomany_spot_relationship', 'relationship', 'spots', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Spot\",\"table\":\"spots\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_spots\",\"pivot\":\"1\",\"taggable\":\"0\"}', 18),
(187, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(188, 26, 'product_id', 'text', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(189, 26, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 4),
(190, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(191, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(192, 26, 'special_deal_hasone_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"product_name\",\"pivot_table\":\"about_us\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(193, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(194, 27, 'product_id', 'text', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(195, 27, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 4),
(196, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(197, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(198, 27, 'popular_tour_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"product_name\",\"pivot_table\":\"about_us\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(199, 22, 'banner_image', 'media_picker', 'Banner Image', 0, 1, 1, 1, 1, 1, '{\"max\":2,\"min\":0,\"expanded\":true,\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":false,\"allow_delete\":false,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":false,\"allowed\":[\"image\\/jpeg\",\"image\\/png\",\"image\\/bmp\"],\"hide_thumbnails\":false,\"quality\":90}', 3),
(200, 21, 'slug', 'text', 'English Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(201, 22, 'slug', 'text', 'English Name', 1, 1, 1, 1, 1, 1, '{}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(11, 'products', 'products', 'Product', 'Products', NULL, 'App\\Models\\Product', NULL, 'App\\Http\\Controllers\\Voyager\\ProductsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-17 18:11:28', '2019-07-24 21:56:45'),
(21, 'cities', 'cities', 'City', 'Cities', NULL, 'App\\Models\\City', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-17 20:09:07', '2019-07-31 19:51:39'),
(22, 'states', 'states', 'Category', 'Category', NULL, 'App\\Models\\State', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-17 20:11:06', '2019-07-31 19:52:38'),
(24, 'spots', 'spots', 'Spot', 'Spots', NULL, 'App\\Models\\Spot', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-23 13:37:38', '2019-07-23 13:41:49'),
(26, 'special_deals', 'special-deals', 'Special Deal', 'Special Deals', NULL, 'App\\Models\\SpecialDeal', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-28 18:37:49', '2019-07-28 18:59:40'),
(27, 'popular_tours', 'popular-tours', 'Popular Tour', 'Popular Tours', NULL, 'App\\Models\\PopularTour', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-07-28 19:01:07', '2019-07-28 19:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-07-17 17:46:26', '2019-07-17 17:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-07-17 17:46:26', '2019-07-17 17:46:26', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 2, '2019-07-17 17:46:26', '2019-07-17 18:48:05', 'voyager.media.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', '#000000', NULL, 6, '2019-07-17 17:46:26', '2019-07-28 21:06:55', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-07-17 17:46:26', '2019-07-17 18:48:05', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-07-17 17:46:26', '2019-07-17 18:48:05', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-07-17 17:46:26', '2019-07-17 18:48:05', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-07-17 17:46:26', '2019-07-17 18:48:05', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2019-07-17 17:46:26', '2019-07-28 21:06:55', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-07-17 17:46:27', '2019-07-17 18:48:05', 'voyager.hooks', NULL),
(17, 1, 'Products', '', '_self', 'voyager-receipt', '#000000', NULL, 4, '2019-07-17 18:11:28', '2019-07-28 19:52:29', 'voyager.products.index', 'null'),
(26, 1, 'Cities', '', '_self', NULL, NULL, 29, 4, '2019-07-17 20:09:07', '2019-07-28 21:06:55', 'voyager.cities.index', NULL),
(27, 1, 'Category', '', '_self', NULL, '#000000', 29, 5, '2019-07-17 20:11:06', '2019-07-28 21:06:55', 'voyager.states.index', 'null'),
(28, 1, 'Spots', '', '_self', 'voyager-star', '#000000', NULL, 3, '2019-07-23 13:37:38', '2019-07-28 19:51:27', 'voyager.spots.index', 'null'),
(29, 1, 'HomePage', '', '_self', 'voyager-window-list', '#000000', NULL, 5, '2019-07-24 18:23:03', '2019-07-24 18:23:50', NULL, ''),
(30, 1, 'Special Deals', '', '_self', NULL, NULL, 29, 3, '2019-07-28 18:37:49', '2019-07-28 21:06:55', 'voyager.special-deals.index', NULL),
(31, 1, 'Popular Tours', '', '_self', NULL, NULL, 29, 2, '2019-07-28 19:01:07', '2019-07-28 21:06:55', 'voyager.popular-tours.index', NULL);

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
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_07_02_033357_create_products_table', 1),
(28, '2019_07_02_033423_create_special_deals_table', 1),
(29, '2019_07_02_063057_create_popular_tours_table', 1),
(30, '2019_07_02_071237_create_cities_table', 1),
(31, '2019_07_08_062025_about_us_table', 1),
(32, '2019_07_10_001012_create_countries_table', 1),
(33, '2019_07_10_040952_create_product_cities_table', 1),
(34, '2019_07_10_050040_create_product_countries_table', 1),
(35, '2019_07_10_072706_create_spots_table', 1),
(36, '2019_07_10_073937_create_product_spots_table', 1),
(37, '2019_07_10_080700_create_related_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-07-17 17:46:27', '2019-07-17 17:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(2, 'browse_bread', NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(3, 'browse_database', NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(4, 'browse_media', NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(5, 'browse_compass', NULL, '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(6, 'browse_menus', 'menus', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(7, 'read_menus', 'menus', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(8, 'edit_menus', 'menus', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(9, 'add_menus', 'menus', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(10, 'delete_menus', 'menus', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(11, 'browse_roles', 'roles', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(12, 'read_roles', 'roles', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(13, 'edit_roles', 'roles', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(14, 'add_roles', 'roles', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(15, 'delete_roles', 'roles', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(16, 'browse_users', 'users', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(17, 'read_users', 'users', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(18, 'edit_users', 'users', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(19, 'add_users', 'users', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(20, 'delete_users', 'users', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(21, 'browse_settings', 'settings', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(22, 'read_settings', 'settings', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(23, 'edit_settings', 'settings', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(24, 'add_settings', 'settings', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(25, 'delete_settings', 'settings', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(26, 'browse_categories', 'categories', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(27, 'read_categories', 'categories', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(28, 'edit_categories', 'categories', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(29, 'add_categories', 'categories', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(30, 'delete_categories', 'categories', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(31, 'browse_posts', 'posts', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(32, 'read_posts', 'posts', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(33, 'edit_posts', 'posts', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(34, 'add_posts', 'posts', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(35, 'delete_posts', 'posts', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(36, 'browse_pages', 'pages', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(37, 'read_pages', 'pages', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(38, 'edit_pages', 'pages', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(39, 'add_pages', 'pages', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(40, 'delete_pages', 'pages', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(41, 'browse_hooks', NULL, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(52, 'browse_products', 'products', '2019-07-17 18:11:28', '2019-07-17 18:11:28'),
(53, 'read_products', 'products', '2019-07-17 18:11:28', '2019-07-17 18:11:28'),
(54, 'edit_products', 'products', '2019-07-17 18:11:28', '2019-07-17 18:11:28'),
(55, 'add_products', 'products', '2019-07-17 18:11:28', '2019-07-17 18:11:28'),
(56, 'delete_products', 'products', '2019-07-17 18:11:28', '2019-07-17 18:11:28'),
(97, 'browse_cities', 'cities', '2019-07-17 20:09:07', '2019-07-17 20:09:07'),
(98, 'read_cities', 'cities', '2019-07-17 20:09:07', '2019-07-17 20:09:07'),
(99, 'edit_cities', 'cities', '2019-07-17 20:09:07', '2019-07-17 20:09:07'),
(100, 'add_cities', 'cities', '2019-07-17 20:09:07', '2019-07-17 20:09:07'),
(101, 'delete_cities', 'cities', '2019-07-17 20:09:07', '2019-07-17 20:09:07'),
(102, 'browse_states', 'states', '2019-07-17 20:11:06', '2019-07-17 20:11:06'),
(103, 'read_states', 'states', '2019-07-17 20:11:06', '2019-07-17 20:11:06'),
(104, 'edit_states', 'states', '2019-07-17 20:11:06', '2019-07-17 20:11:06'),
(105, 'add_states', 'states', '2019-07-17 20:11:06', '2019-07-17 20:11:06'),
(106, 'delete_states', 'states', '2019-07-17 20:11:06', '2019-07-17 20:11:06'),
(107, 'browse_spots', 'spots', '2019-07-23 13:37:38', '2019-07-23 13:37:38'),
(108, 'read_spots', 'spots', '2019-07-23 13:37:38', '2019-07-23 13:37:38'),
(109, 'edit_spots', 'spots', '2019-07-23 13:37:38', '2019-07-23 13:37:38'),
(110, 'add_spots', 'spots', '2019-07-23 13:37:38', '2019-07-23 13:37:38'),
(111, 'delete_spots', 'spots', '2019-07-23 13:37:38', '2019-07-23 13:37:38'),
(112, 'browse_special_deals', 'special_deals', '2019-07-28 18:37:49', '2019-07-28 18:37:49'),
(113, 'read_special_deals', 'special_deals', '2019-07-28 18:37:49', '2019-07-28 18:37:49'),
(114, 'edit_special_deals', 'special_deals', '2019-07-28 18:37:49', '2019-07-28 18:37:49'),
(115, 'add_special_deals', 'special_deals', '2019-07-28 18:37:49', '2019-07-28 18:37:49'),
(116, 'delete_special_deals', 'special_deals', '2019-07-28 18:37:49', '2019-07-28 18:37:49'),
(117, 'browse_popular_tours', 'popular_tours', '2019-07-28 19:01:07', '2019-07-28 19:01:07'),
(118, 'read_popular_tours', 'popular_tours', '2019-07-28 19:01:07', '2019-07-28 19:01:07'),
(119, 'edit_popular_tours', 'popular_tours', '2019-07-28 19:01:07', '2019-07-28 19:01:07'),
(120, 'add_popular_tours', 'popular_tours', '2019-07-28 19:01:07', '2019-07-28 19:01:07'),
(121, 'delete_popular_tours', 'popular_tours', '2019-07-28 19:01:07', '2019-07-28 19:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
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
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
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
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1);

-- --------------------------------------------------------

--
-- Table structure for table `popular_tours`
--

CREATE TABLE `popular_tours` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_tours`
--

INSERT INTO `popular_tours` (`id`, `product_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 3, 'a', '2019-07-28 19:02:52', '2019-07-28 19:02:52'),
(2, 2, '獨家提供史蒂芬港中文精品小團', '2019-07-30 18:05:07', '2019-07-30 18:05:07'),
(3, 3, 'b', '2019-07-30 18:05:14', '2019-07-30 18:05:14'),
(4, 4, 'c', '2019-07-30 18:05:23', '2019-07-30 18:05:23'),
(5, 5, 'd', '2019-07-30 18:05:30', '2019-07-30 18:05:30'),
(6, 6, '6', '2019-07-30 18:05:42', '2019-07-30 18:05:42'),
(7, 10, '7', '2019-07-30 18:05:52', '2019-07-30 18:05:52'),
(8, 13, '2', '2019-07-30 18:06:02', '2019-07-30 18:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-07-17 17:46:27', '2019-07-17 17:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_code` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` tinyint(3) UNSIGNED DEFAULT 0,
  `product_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_price` decimal(8,2) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `price_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tour_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pick_up_service` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meals` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `policy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `travel_document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flyer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inclusion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exclusion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms_conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ltinerary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `duration`, `product_description`, `sales_price`, `price`, `price_description`, `tour_language`, `pick_up_service`, `meals`, `policy`, `travel_document`, `flyer`, `card_image`, `inclusion`, `exclusion`, `terms_conditions`, `ltinerary`, `created_at`, `updated_at`, `state_id`) VALUES
(1, 25407, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\5aflvrC2fWOpjpLbAWBa.png\"]', '[\"products/aussydmel.png\"]', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)交通：5-12座舒適用車</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)服務：市區酒店接，中文司導服務</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">3)司導：司導餐補費用，過路費，車輛燃油費、小費</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">4)配套：兒童座椅/嬰兒籃/車載WiFi</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">5)門票：觀海豚船票，海岸沙漠滑沙體驗</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">6)可選：爬蟲動物園、午餐等項目，具體以套餐包含為準</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)门票：自选门票</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)旅行保险(建议购买旅行保险)</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">1.游玩开始时间，72小时内，不做退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">2.游玩开始时间，72小时外，可做无损退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">3.如遇不可抗自然灾害客观因素，造成无法成行，提供相关官方凭据，无损取消</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">4.其他存在主客观特殊原因，请与平台协调处理</li>\r\n</ul>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>a<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>b<\\/p>\"}}', '2019-07-17 18:13:00', '2019-07-31 15:39:44', 17),
(2, 25409, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\vmIq41RqP7q3jkY9D7li.png\"]', '[\"products/auscanssyd.png\"]', '<p>dd</p>', '<p>dd</p>', '<p>dd</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>daf<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>dsaf<\\/p>\"}}', '2019-07-17 21:30:00', '2019-07-31 15:39:21', 17),
(3, 25408, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 4, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\RrdoruONy040Q1AHVBrJ.png\"]', '[\"products/aussydmel.png\"]', '<p>dd</p>', '<p>dd</p>', '<p>dd</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>aa<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>bbb<\\/p>\"},\"3\":{\"day\":\"3\",\"description\":\"<p>sss<\\/p>\"},\"4\":{\"day\":\"4\",\"description\":\"<p>cccc<\\/p>\"}}', '2019-07-17 21:33:00', '2019-07-31 15:39:05', 17),
(4, 25410, '10澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\Cs07E33DYN3UKSyoO6cK.png\"]', '[\"products/auscanssyd.png\"]', '<p>aaaaaaa</p>', '<p>ddddddd</p>', '<p>dddddddddd</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>as<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>adsf<\\/p>\"}}', '2019-07-22 17:55:51', '2019-07-30 19:05:19', 17),
(5, 25410, '10澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '333.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\zMBCDx5jhEN67iKj5HpS.png\"]', '[\"products/auscanssyd.png\"]', '<p>aaaaaaa</p>', '<p>ddddddd</p>', '<p>dddddddddd</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>asdf<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>fa&nbsp;<\\/p>\"}}', '2019-07-22 17:56:32', '2019-07-31 18:44:55', 17),
(6, 25410, '10澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 3, '獨家提供史蒂芬港中文精品小團', '889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\6ZHMKkCWiqe0WRL2cItS.png\"]', '[\"products/auscanssyd.png\"]', '<p>aaaaaaa</p>', '<p>ddddddd</p>', '<p>dddddddddd</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>asd<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>saf<\\/p>\"},\"3\":{\"day\":\"3\",\"description\":\"<p>asfd&nbsp;<\\/p>\"}}', '2019-07-22 17:56:37', '2019-07-31 18:44:42', 17),
(8, 25420, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 1, '獨家提供史蒂芬港中文精品小團', '1800.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\ffNImj4K0Gb88RfIoNLu.png\"]', '[\"products/aussydmel.png\"]', '<p>aa</p>', '<p>vv</p>', '<p>cc</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>\\u7684\\u8428\\u82ac<\\/p>\"}}', '2019-07-22 18:03:26', '2019-07-31 18:44:31', 17),
(9, 25415, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\5aflvrC2fWOpjpLbAWBa.png\"]', '[\"products/auscanssyd.png\"]', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)交通：5-12座舒適用車</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)服務：市區酒店接，中文司導服務</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">3)司導：司導餐補費用，過路費，車輛燃油費、小費</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">4)配套：兒童座椅/嬰兒籃/車載WiFi</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">5)門票：觀海豚船票，海岸沙漠滑沙體驗</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">6)可選：爬蟲動物園、午餐等項目，具體以套餐包含為準</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)门票：自选门票</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)旅行保险(建议购买旅行保险)</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">1.游玩开始时间，72小时内，不做退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">2.游玩开始时间，72小时外，可做无损退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">3.如遇不可抗自然灾害客观因素，造成无法成行，提供相关官方凭据，无损取消</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">4.其他存在主客观特殊原因，请与平台协调处理</li>\r\n</ul>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>\\u554a\\u554a<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>vga<\\/p>\"}}', '2019-07-17 18:13:00', '2019-07-31 15:39:59', 17),
(10, 25417, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\5aflvrC2fWOpjpLbAWBa.png\"]', '[\"products/aussydmel.png\"]', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)交通：5-12座舒適用車</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)服務：市區酒店接，中文司導服務</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">3)司導：司導餐補費用，過路費，車輛燃油費、小費</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">4)配套：兒童座椅/嬰兒籃/車載WiFi</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">5)門票：觀海豚船票，海岸沙漠滑沙體驗</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">6)可選：爬蟲動物園、午餐等項目，具體以套餐包含為準</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)门票：自选门票</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)旅行保险(建议购买旅行保险)</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">1.游玩开始时间，72小时内，不做退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">2.游玩开始时间，72小时外，可做无损退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">3.如遇不可抗自然灾害客观因素，造成无法成行，提供相关官方凭据，无损取消</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">4.其他存在主客观特殊原因，请与平台协调处理</li>\r\n</ul>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>\\u5b89\\u629a<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>\\u6697\\u5ba4\\u9022\\u706f<\\/p>\"}}', '2019-07-17 18:13:00', '2019-07-31 15:42:51', 17),
(11, 25422, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 3, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\5aflvrC2fWOpjpLbAWBa.png\"]', '[\"products/auscanssyd.png\"]', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)交通：5-12座舒適用車</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)服務：市區酒店接，中文司導服務</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">3)司導：司導餐補費用，過路費，車輛燃油費、小費</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">4)配套：兒童座椅/嬰兒籃/車載WiFi</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">5)門票：觀海豚船票，海岸沙漠滑沙體驗</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">6)可選：爬蟲動物園、午餐等項目，具體以套餐包含為準</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)门票：自选门票</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)旅行保险(建议购买旅行保险)</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">1.游玩开始时间，72小时内，不做退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">2.游玩开始时间，72小时外，可做无损退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">3.如遇不可抗自然灾害客观因素，造成无法成行，提供相关官方凭据，无损取消</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">4.其他存在主客观特殊原因，请与平台协调处理</li>\r\n</ul>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>dsaf<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>fdsa<\\/p>\"},\"3\":{\"day\":\"3\",\"description\":\"<p>dafs<\\/p>\"}}', '2019-07-17 18:13:00', '2019-07-31 16:51:50', 15),
(12, 25423, '1澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 1, '獨家提供史蒂芬港中文精品小團', '1889.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '英文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products\\\\July2019\\\\5aflvrC2fWOpjpLbAWBa.png\"]', '[\"products/auscanssyd.png\"]', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)交通：5-12座舒適用車</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)服務：市區酒店接，中文司導服務</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">3)司導：司導餐補費用，過路費，車輛燃油費、小費</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">4)配套：兒童座椅/嬰兒籃/車載WiFi</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">5)門票：觀海豚船票，海岸沙漠滑沙體驗</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">6)可選：爬蟲動物園、午餐等項目，具體以套餐包含為準</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">1)门票：自选门票</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; font-family: FangPingRegular; color: #3c3c3c; line-height: 24px;\" data-v-4c4ff3a9=\"\">2)旅行保险(建议购买旅行保险)</li>\r\n</ul>', '<ul>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">1.游玩开始时间，72小时内，不做退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">2.游玩开始时间，72小时外，可做无损退改</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">3.如遇不可抗自然灾害客观因素，造成无法成行，提供相关官方凭据，无损取消</li>\r\n<li style=\"box-sizing: border-box; display: -webkit-box; color: #3c3c3c; line-height: 24px; font-family: FangPingRegular;\" data-v-6304b4ea=\"\">4.其他存在主客观特殊原因，请与平台协调处理</li>\r\n</ul>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>dfsa<\\/p>\"}}', '2019-07-17 18:13:00', '2019-07-31 16:52:11', 15),
(13, 2222, '10澳大利亚墨尔本+凯恩斯+悉尼自由行 经典东海岸每城', 2, '獨家提供史蒂芬港中文精品小團', '1000.00', '3447.00', '優惠：原價$1,899/成人 $1,299/兒童  出行後點評可返 $20', '中文', '只接不送', '不含餐食', '可退改', '电子票免打印', '[\"products/auscanssyd.png\"]', '[\"products/aussydmel.png\"]', '<p>啊</p>', '<p>吧</p>', '<p>啊</p>', '{\"1\":{\"day\":\"1\",\"description\":\"<p>\\u6253\\u8d4f<\\/p>\"},\"2\":{\"day\":\"2\",\"description\":\"<p>\\u963f\\u65af\\u987f<\\/p>\"}}', '2019-07-28 18:14:56', '2019-07-31 18:44:22', 17);

-- --------------------------------------------------------

--
-- Table structure for table `product_cities`
--

CREATE TABLE `product_cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_cities`
--

INSERT INTO `product_cities` (`id`, `product_id`, `city_id`, `created_at`, `updated_at`) VALUES
(10, 13, 10, NULL, NULL),
(11, 8, 11, NULL, NULL),
(12, 6, 12, NULL, NULL),
(13, 5, 14, NULL, NULL),
(14, 4, 14, NULL, NULL),
(15, 3, 12, NULL, NULL),
(16, 3, 14, NULL, NULL),
(17, 2, 10, NULL, NULL),
(18, 1, 15, NULL, NULL),
(19, 9, 12, NULL, NULL),
(20, 10, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_recommends`
--

CREATE TABLE `product_recommends` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recommend_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `product_recommends`
--

INSERT INTO `product_recommends` (`id`, `product_id`, `recommend_id`) VALUES
(4, 1, 4),
(5, 1, 4),
(6, 1, 4),
(13, 3, 3),
(14, 13, 3),
(15, 6, 4),
(16, 4, 12),
(17, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_spots`
--

CREATE TABLE `product_spots` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `spot_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_spots`
--

INSERT INTO `product_spots` (`id`, `product_id`, `spot_id`, `created_at`, `updated_at`) VALUES
(2, 3, 1, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 13, 2, NULL, NULL),
(5, 8, 2, NULL, NULL),
(6, 6, 3, NULL, NULL),
(7, 4, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-07-17 17:46:26', '2019-07-17 17:46:26'),
(2, 'user', 'Normal User', '2019-07-17 17:46:26', '2019-07-17 17:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `special_deals`
--

CREATE TABLE `special_deals` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_deals`
--

INSERT INTO `special_deals` (`id`, `product_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 4, 'aa', '2019-07-28 18:59:56', '2019-07-28 18:59:56'),
(2, 3, '2', '2019-07-30 15:30:44', '2019-07-30 15:30:44'),
(3, 2, '3', '2019-07-30 15:30:52', '2019-07-30 15:30:52'),
(4, 6, '4', '2019-07-30 15:31:02', '2019-07-30 15:31:02');

-- --------------------------------------------------------

--
-- Table structure for table `spots`
--

CREATE TABLE `spots` (
  `id` int(10) UNSIGNED NOT NULL,
  `iamge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spots`
--

INSERT INTO `spots` (`id`, `iamge`, `name`, `created_at`, `updated_at`) VALUES
(1, 'spots/ausclassic.png', '墨尔本', '2019-07-24 18:14:56', '2019-07-24 18:14:56'),
(2, 'spots/auscans.png', '新西兰', '2019-07-24 18:15:26', '2019-07-24 18:15:26'),
(3, 'spots/auscans.png', '蓝山', '2019-07-28 18:21:04', '2019-07-28 18:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `banner_image` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state`, `slug`, `banner_image`, `created_at`) VALUES
(15, '亞洲', 'asia', '[\"states/carousel2.png\"]', NULL),
(16, '美洲', 'america', '[\"states/module_table_bottom.png\"]', NULL),
(17, '澳大利亞', 'australia', '[\"states/carousel2.png\"]', NULL),
(18, '非洲', 'africa', '[\"states/carousel2.png\"]', NULL),
(19, '歐洲', 'europe', '[\"states/carousel2.png\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-07-17 17:46:27', '2019-07-17 17:46:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-07-17 17:46:27', '2019-07-17 17:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$24HW5YNj2qQbAi7/k8vUFuY8Ef9F6mhEsOYDL.qAUXa.197Zoza36', 'dUfrHbZjfLaMXI0NyYIu21Tu6C6APsWnw8spTjkon8jE2jVpFdhKHAMbpJls', NULL, '2019-07-17 17:46:27', '2019-07-17 17:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `popular_tours`
--
ALTER TABLE `popular_tours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_cities`
--
ALTER TABLE `product_cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_cities_product_id_city_id_unique` (`product_id`,`city_id`);

--
-- Indexes for table `product_recommends`
--
ALTER TABLE `product_recommends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_spots`
--
ALTER TABLE `product_spots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_spots_product_id_spot_id_unique` (`product_id`,`spot_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `special_deals`
--
ALTER TABLE `special_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spots`
--
ALTER TABLE `spots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `popular_tours`
--
ALTER TABLE `popular_tours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_cities`
--
ALTER TABLE `product_cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_recommends`
--
ALTER TABLE `product_recommends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_spots`
--
ALTER TABLE `product_spots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `special_deals`
--
ALTER TABLE `special_deals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `spots`
--
ALTER TABLE `spots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
