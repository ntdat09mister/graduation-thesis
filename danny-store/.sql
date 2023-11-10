-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.41 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table danny-store-db.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `created_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `user_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.cart: ~14 rows (approximately)
REPLACE INTO `cart` (`id`, `created_at`, `modified_at`, `user_id`) VALUES
	(2, NULL, NULL, 5),
	(3, NULL, NULL, 5),
	(4, NULL, NULL, 5),
	(5, '2023-10-18 16:20:39', '2023-10-18 16:20:39', 5),
	(6, '2023-10-18 16:23:19', '2023-10-18 16:23:19', 5),
	(7, '2023-10-21 02:46:48', '2023-10-21 02:46:48', 5),
	(8, '2023-10-21 03:55:57', '2023-10-21 03:55:57', 5),
	(9, '2023-10-21 04:00:39', '2023-10-21 04:00:39', 5),
	(10, '2023-10-21 04:05:32', '2023-10-21 04:05:32', 5),
	(11, '2023-10-21 04:05:43', '2023-10-21 04:05:43', 5),
	(12, '2023-10-21 04:06:17', '2023-10-21 04:06:17', 5),
	(13, '2023-10-21 04:06:48', '2023-10-21 04:06:48', 5),
	(14, '2023-10-23 15:42:25', '2023-10-23 15:42:25', 5),
	(15, '2023-10-23 15:43:10', '2023-10-23 15:43:10', 5);

-- Dumping structure for table danny-store-db.cart_detail
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE IF NOT EXISTS `cart_detail` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `cart_id` bigint(20) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `price` bigint(20) DEFAULT NULL,
    `product_id` bigint(20) DEFAULT NULL,
    `quantity` bigint(20) DEFAULT NULL,
    `total_amount` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.cart_detail: ~14 rows (approximately)
REPLACE INTO `cart_detail` (`id`, `cart_id`, `created_at`, `modified_at`, `price`, `product_id`, `quantity`, `total_amount`) VALUES
	(2, 2, NULL, NULL, 600, 2, 3, 1800),
	(3, 3, NULL, NULL, 800, 4, 3, 2400),
	(4, 4, NULL, NULL, 1000, 3, 3, 3000),
	(5, 5, '2023-10-18 16:20:39', '2023-10-18 16:20:39', 1000, 6, 3, NULL),
	(6, 6, '2023-10-18 16:23:19', '2023-10-18 16:23:19', 1100, 8, 2, NULL),
	(7, 7, '2023-10-21 02:46:48', '2023-10-21 02:46:48', 1100, 8, 11, NULL),
	(8, 8, '2023-10-21 03:55:57', '2023-10-21 03:55:57', 1100, 8, 8, NULL),
	(9, 9, '2023-10-21 04:00:39', '2023-10-21 04:00:39', 1100, 1, 8, NULL),
	(10, 10, '2023-10-21 04:05:32', '2023-10-21 04:05:32', 1100, 1, 1, NULL),
	(11, 11, '2023-10-21 04:05:43', '2023-10-21 04:05:43', 1100, 1, 1, NULL),
	(12, 12, '2023-10-21 04:06:17', '2023-10-21 04:06:17', 1100, 1, 1, NULL),
	(13, 13, '2023-10-21 04:06:48', '2023-10-21 04:06:48', 1100, 1, 1, NULL),
	(14, 14, '2023-10-23 15:42:25', '2023-10-23 15:42:25', 2777500, 1, 1, NULL),
	(15, 15, '2023-10-23 15:43:10', '2023-10-23 15:43:10', 2777500, 1, 1, NULL);

-- Dumping structure for table danny-store-db.evaluate
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE IF NOT EXISTS `evaluate` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `created_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `user_id` bigint(20) DEFAULT NULL,
    `vote_stars` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.evaluate: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.hibernate_sequence
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
    `next_val` bigint(20) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.hibernate_sequence: ~6 rows (approximately)
REPLACE INTO `hibernate_sequence` (`next_val`) VALUES
	(4),
	(4),
	(4),
	(4),
	(4),
	(4);

-- Dumping structure for table danny-store-db.order
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `created_at` datetime DEFAULT NULL,
    `customer_id` bigint(20) DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `sale_staff_id` bigint(20) DEFAULT NULL,
    `status_id` bigint(20) DEFAULT NULL,
    `total_amount` float DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.order: ~11 rows (approximately)
REPLACE INTO `order` (`id`, `created_at`, `customer_id`, `modified_at`, `sale_staff_id`, `status_id`, `total_amount`) VALUES
	(1, '2023-11-06 15:53:02', 6, NULL, 2, 1, 3990),
	(2, '2023-11-07 15:53:19', 6, NULL, 2, 2, 3000),
	(3, '2023-11-08 15:53:38', 6, NULL, 2, 3, 5412),
	(6, '2023-11-09 13:07:34', 4, NULL, 1, 2, 6696),
	(7, '2023-11-09 13:44:34', 4, NULL, 1, 3, 6875),
	(8, '2023-11-09 13:48:39', 4, NULL, 1, 2, 3750),
	(9, '2023-11-09 13:52:37', 7, NULL, 1, 1, 1168),
	(10, '2023-11-09 15:49:31', 6, NULL, 1, 1, 8535),
	(11, '2023-11-09 15:54:45', 6, NULL, 1, 1, 6469),
	(12, '2023-11-10 16:46:12', 6, NULL, 1, 1, 12287),
	(13, '2023-11-10 16:50:08', 8, NULL, 1, 1, 3125);

-- Dumping structure for table danny-store-db.order_item
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `created_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `order_id` bigint(20) DEFAULT NULL,
    `product_id` bigint(20) DEFAULT NULL,
    `quantity` bigint(20) DEFAULT NULL,
    `price` float DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.order_item: ~18 rows (approximately)
REPLACE INTO `order_item` (`id`, `created_at`, `modified_at`, `order_id`, `product_id`, `quantity`, `price`) VALUES
	(22, '2023-11-08 15:53:02', NULL, 1, 5, 1, 3990),
	(23, '2023-11-08 15:53:19', NULL, 2, 2, 1, 3000),
	(24, '2023-11-08 15:53:38', NULL, 3, 10, 1, 5412),
	(25, '2023-11-09 13:07:34', NULL, 6, 3, 1, 4460),
	(26, '2023-11-09 13:07:34', NULL, 6, 20, 1, 2236),
	(27, '2023-11-09 13:44:34', NULL, 7, 2, 1, 3750),
	(28, '2023-11-09 13:44:34', NULL, 7, 1, 1, 3125),
	(29, '2023-11-09 13:48:39', NULL, 8, 2, 1, 3750),
	(30, '2023-11-09 13:52:37', NULL, 9, 36, 1, 1168),
	(31, '2023-11-09 15:49:31', NULL, 10, 10, 1, 5412),
	(32, '2023-11-09 15:49:31', NULL, 10, 11, 1, 3123),
	(33, '2023-11-09 15:54:45', NULL, 11, 20, 1, 1789),
	(34, '2023-11-09 15:54:45', NULL, 11, 21, 1, 2313),
	(35, '2023-11-09 15:54:45', NULL, 11, 22, 1, 2367),
	(36, '2023-11-10 16:46:12', NULL, 12, 1, 1, 3125),
	(37, '2023-11-10 16:46:12', NULL, 12, 2, 1, 3750),
	(38, '2023-11-10 16:46:12', NULL, 12, 10, 1, 5412),
	(39, '2023-11-10 16:50:08', NULL, 13, 1, 1, 3125);

-- Dumping structure for table danny-store-db.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime DEFAULT NULL,
    `description` varchar(255) DEFAULT NULL,
    `manufacturer_id` bigint(20) DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `name` varchar(255) DEFAULT NULL,
    `price` varchar(255) DEFAULT NULL,
    `product_type` bigint(20) DEFAULT NULL,
    `promotion_id` bigint(20) DEFAULT NULL,
    `src` varchar(255) DEFAULT NULL,
    `create_time` varchar(50) DEFAULT NULL,
    `modified_time` varchar(50) DEFAULT NULL,
    `quantity` bigint(20) DEFAULT NULL,
    `status` bit(1) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.product: ~36 rows (approximately)
REPLACE INTO `product` (`id`, `created_at`, `description`, `manufacturer_id`, `modified_at`, `name`, `price`, `product_type`, `promotion_id`, `src`, `create_time`, `modified_time`, `quantity`, `status`) VALUES
	(1, NULL, 'Giáº£m 1 triá»‡u vá»›i khÃ¡ch hÃ ng vip', 1, NULL, 'Iphone 11 promax', '2500.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_225.jpg', '', '', 9993, b'1'),
	(2, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 1, NULL, 'iPhone 12 promax', '3000.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_18.png', '', '', 0, b'1'),
	(3, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 1, NULL, 'iPhone 13 promax', '3568.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_241_2.jpg', '', '', 5, b'1'),
	(4, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 1, NULL, 'iPhone 14 promax', '4715', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_51_1_3.jpg', '', '', 10, b'1'),
	(5, NULL, 'HÃ ng sáº¯p vá»? hÃ£y Ä‘áº·t hÃ ng trÆ°á»›c', 2, NULL, 'Samsung Galaxy Z Fold5', '3990.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/b/4/b48cd136-7366-4d01-8d58-8ee3d5dc93b7_1.jpg', '', '', 6, b'1'),
	(6, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 2, NULL, 'Samsung Galaxy S23 Ultra', '4550', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/4/d4a672c5-4709-4056-9f7f-72d6d70c2c1d_1.jpg', '', '', 10, b'1'),
	(7, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 2, NULL, 'Samsung Galaxy Z Flip4', '3412.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-20-fe_4_.jpg', '', '', 9, b'1'),
	(8, NULL, 'Giáº£m 1 triá»‡u vá»›i khÃ¡ch hÃ ng vip', 2, NULL, 'Samsung Galaxy S22 Ultra', '3141', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_phantomblack_211119_2.jpg', '', '', 10, b'1'),
	(9, NULL, 'Giáº£m 1 triá»‡u vá»›i khÃ¡ch hÃ ng vip', 3, NULL, 'Xiaomi Redmi Note 12', '4123', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/7/_76666_7__3-3.jpg', '', '', 10, b'1'),
	(10, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 3, NULL, 'Xiaomi Redmi Note 12 4G', '5412.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt_7766_3__1.jpg', '', '', 7, b'1'),
	(11, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 3, NULL, 'Xiaomi Redmi Note 12 Pro', '3123.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-12t-den_1.jpg', '', '', 9, b'1'),
	(12, NULL, 'Giáº£m 1 triá»‡u vá»›i khÃ¡ch hÃ ng vip', 3, NULL, 'Xiaomi 12T 8GB 128GB', '2314', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/redmi-note-12-pro-4g-1-den.jpg', '', '', 10, b'1'),
	(13, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 4, NULL, 'OPPO Reno10 5G 8GB 256GB', '2214', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/reno10_5g_-_combo_product_-_blue.png', '', '', 10, b'1'),
	(14, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 4, NULL, 'OPPO A78 4G (8GB 256GB)', '2200', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a78_-_black_-_rgb.jpg', '', '', 10, b'1'),
	(15, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 4, NULL, 'OPPO Find N2 Flip', '1387', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/2/n2_flip_-_combo_product_-_black.png', '', '', 10, b'1'),
	(16, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 4, NULL, 'OPPO Reno8 T 5G (8GB - 128GB)', '4321', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02t.png', '', '', 10, b'1'),
	(17, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 5, NULL, 'Vivo V27e 8GB 256GB', '1143', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_23__4_6.png', '', '', 10, b'1'),
	(18, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 5, NULL, 'Vivo Y02t 4GB 64GB', '1500', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02t.png', '', '', 10, b'1'),
	(19, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 5, NULL, 'Vivo Y36', '1256', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y36_2.jpg', '', '', 10, b'1'),
	(20, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 5, NULL, 'vivo V23e', '1789.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/9/c91ba5bf721d5b2d4eae4f821b8e4ced.png', '', '', 8, b'1'),
	(21, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 6, NULL, 'realme 11 8GB 128GB', '2313.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-11-vang-1.jpg', '', '', 9, b'1'),
	(22, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 6, NULL, 'realme 10 8GB 256GB', '2367.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/h/white-7e6a0f537b.png', '', '', 9, b'1'),
	(23, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 6, NULL, 'realme 9 Pro Plus', '1890', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/9/_/9_ro_plus.png', '', '', 10, b'1'),
	(24, NULL, 'Giáº£m 1 triá»‡u vá»›i khÃ¡ch hÃ ng vip', 6, NULL, 'realme C30s 2GB 32GB', '1900', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-c30s-den-glr--009.jpg', '', '', 10, b'1'),
	(25, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 7, NULL, 'Nokia G22 4GB 128GB', '578', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/g/dgtyi8899_.jpg', '', '', 10, b'1'),
	(26, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 7, NULL, 'Nokia C32 4GB 128GB', '987', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-c32_3_.png', '', '', 10, b'1'),
	(27, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 7, NULL, 'Nokia C31 4GB 128GB', '1100', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_250_1.jpg', '', '', 10, b'1'),
	(28, NULL, 'Giáº£m 1 triá»‡u vá»›i khÃ¡ch hÃ ng vip', 7, NULL, 'Nokia 5710 XpressAudio', '980', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-5701.jpg', '', '', 10, b'1'),
	(29, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 8, NULL, 'ASUS ROG Phone 7 Ultimate', '3367', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_365.jpg', '', '', 10, b'1'),
	(30, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 8, NULL, 'ASUS ROG Phone 7 16GB 512GB', '3341', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_366.jpg', '', '', 10, b'1'),
	(31, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 8, NULL, 'ASUS ROG Phone 6 16GB 512GB ', '3678', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/s/asus-rog-phone-6-12gb-256gb_2.png', '', '', 10, b'1'),
	(32, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 8, NULL, 'ASUS ROG Phone 5', '4000', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/s/asus-rog-phone-5_0002_gsmarena_001.jpg', '', '', 10, b'1'),
	(33, NULL, 'Táº·ng cá»§ sáº¡c vÃ airpod pro', 9, NULL, 'Tecno POVA 5 8GB 128GB', '567', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-pova-5_2_.png', '', '', 10, b'1'),
	(34, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 9, NULL, 'Tecno POVA 5 8GB 256GB', '478', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-pova-5_2__1.png', '', '', 10, b'1'),
	(35, NULL, 'Giáº£m 20% vá»›i hÃ³a Ä‘Æ¡n trÃªn 50 triá»‡u', 9, NULL, 'Tecno Camon 20 Pro', '689', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-camon-20-1_2.png', '', '', 10, b'1'),
	(36, NULL, 'Táº·ng sáº¡c dá»± phÃ²ng vÃ balo Danny shop', 9, NULL, 'Tecno Spark 10 8GB 128GB', '934.0', 1, NULL, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-spark-10_5_.png', '', '', 9, b'1');

-- Dumping structure for table danny-store-db.product_detail
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE IF NOT EXISTS `product_detail` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime DEFAULT NULL,
    `image_src` varchar(255) DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `product_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.product_detail: ~144 rows (approximately)
REPLACE INTO `product_detail` (`id`, `created_at`, `image_src`, `modified_at`, `product_id`) VALUES
	(1, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/i/p/iphone-11-pro-max-gold-select-2019_1_1_2_2_3.png', NULL, 1),
	(2, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/i/p/iphone-11-pro-max-midnight-green-select-2019_1_1_2_2_3.png', NULL, 1),
	(3, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/i/p/iphone-11-pro-max-silver-select-2019_1_1_2_2_3.png', NULL, 1),
	(4, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/i/p/iphone-11-pro-max-space-select-2019_1_1_2_2_3.png', NULL, 1),
	(5, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/o/download_2__1_6.png', NULL, 2),
	(6, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/o/download_1__2_6.png', NULL, 2),
	(7, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/o/download_2_13.png', NULL, 2),
	(8, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/o/download_37__4.png', NULL, 2),
	(9, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_66_6_2_1_12.jpg', NULL, 3),
	(10, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_36_3_2_1_10.jpg', NULL, 3),
	(11, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_51_1_8.jpg', NULL, 3),
	(12, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_61_8_2_1_13.jpg', NULL, 3),
	(13, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_m_20.png', NULL, 4),
	(14, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/_/b_c_1_11.png', NULL, 4),
	(15, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/_/v_ng_20.png', NULL, 4),
	(16, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/x/_/x_m_26.png', NULL, 4),
	(17, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/a/galaxy-z-fold-5-xam-1_1_.jpg', NULL, 5),
	(18, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/a/galaxy-z-fold-5-xanh-1_1_1.jpg', NULL, 5),
	(19, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/a/galaxy-z-fold-5-kem-1_2.jpg', NULL, 5),
	(20, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/4/b49cc2fe-130c-4476-abc1-068eb72d43fa_1.jpg', NULL, 5),
	(21, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/2/s23-ultra-tim_1.png', NULL, 6),
	(22, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/2/s23-ultra-xanh_1.png', NULL, 6),
	(23, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/2/s23-ultra-den_1.png', NULL, 6),
	(24, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/2/s23-ultra-kem_1.png', NULL, 6),
	(25, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-1_1.jpg', NULL, 7),
	(26, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-11.jpg', NULL, 7),
	(27, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-25.jpg', NULL, 7),
	(28, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/a/samsung_galaxy_z_flip_m_i_2022-15.jpg', NULL, 7),
	(29, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_burgundy_211119_2.jpg', NULL, 8),
	(30, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_phantomblack_211119_2.jpg', NULL, 8),
	(31, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_green_211119_2.jpg', NULL, 8),
	(32, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_phantomwhite_211119_1_1.jpg', NULL, 8),
	(33, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/7/_76666_7__3.jpg', NULL, 9),
	(34, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/t/gtt_7766_3__1_5.jpg', NULL, 9),
	(35, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/g/rgt76878_1__4.jpg', NULL, 9),
	(36, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/7/_76666_6__4.jpg', NULL, 9),
	(37, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/t/gtt_7766_3__1.jpg', NULL, 10),
	(38, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/g/rgt76878_1_.jpg', NULL, 10),
	(39, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/7/_76666_6_.jpg', NULL, 10),
	(40, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/7/_76666_7__3.jpg', NULL, 10),
	(41, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/t/gtt7766.jpg', NULL, 11),
	(42, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/t/gtt7766_9_.jpg', NULL, 11),
	(43, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/t/gtt_7766_4_.jpg', NULL, 11),
	(44, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/t/gtt_7766_2_.jpg', NULL, 11),
	(45, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/x/i/xiaomi-12t-xanh_1.jpg', NULL, 12),
	(46, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/x/i/xiaomi-12t-xam_1.jpg', NULL, 12),
	(47, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/x/i/xiaomi-12t-den_1.jpg', NULL, 12),
	(48, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/7/_/7_193_1.png', NULL, 12),
	(49, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/reno10_5g_-_combo_product_-_blue_-_copy.png', NULL, 13),
	(50, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/reno10_5g_-_combo_product_-_grey.png', NULL, 13),
	(51, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/y/nywdynqvzfswk2ze_-_copy.png', NULL, 13),
	(52, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/e/o/eoo4apyf1r4obqgy_-_copy.png', NULL, 13),
	(53, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/c/o/combo_a78_-_black_-_rgb.jpg', NULL, 14),
	(54, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/c/o/combo_a78_-_blue_-_rgb.png', NULL, 14),
	(55, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/u/muses__product_images__green__side_cmyk.jpg', NULL, 14),
	(56, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/u/muses__product_images__black__top_and_bottom_cmyk.jpg', NULL, 14),
	(57, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/2/n2_flip_-_combo_product_-_purple.png', NULL, 15),
	(58, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/2/n2_flip_-_combo_product_-_black.png', NULL, 15),
	(59, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/o/p/oppo_find_n2_flip_4_.jpg', NULL, 15),
	(60, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/o/p/oppo_find_n2_flip_1_.jpg', NULL, 15),
	(61, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/o/p/oppo-reno8t-den1-thumb-600x600.jpg', NULL, 16),
	(62, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/o/p/oppo-reno8t-vang1-thumb-600x600.jpg', NULL, 16),
	(63, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/3/638091158554197072_oppo-reno8-t-5g-dd.jpg', NULL, 16),
	(64, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/o/p/oppo_reno8_t_5g_8gb_-_128gb_13_.jpg', NULL, 16),
	(65, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_23__4_6.png', NULL, 17),
	(66, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-v27e-ra-mat-2.jpg', NULL, 17),
	(67, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-v27-022.jpeg', NULL, 17),
	(68, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-v27-023.jpeg', NULL, 17),
	(69, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-y02t_1_.png', NULL, 18),
	(70, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-y02t.png', NULL, 18),
	(71, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-y02t-xanh-tim-3.jpeg', NULL, 18),
	(72, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-y02t-xanh-tim-2.jpeg', NULL, 18),
	(73, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-y36_1__2.jpg', NULL, 19),
	(74, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-y36_2.jpg', NULL, 19),
	(75, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo_y36.png', NULL, 19),
	(76, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo_y36_1_.png', NULL, 19),
	(77, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/c/9/c91ba5bf721d5b2d4eae4f821b8e4ced.png', NULL, 20),
	(78, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/6/66f28c6dfb784145079efaf494a83f8c.png', NULL, 20),
	(79, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-v23e_5_.jpg', NULL, 20),
	(80, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/i/vivo-v23e_3_.jpg', NULL, 20),
	(81, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/realme-11-vang-1.jpg', NULL, 21),
	(82, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/realme-11-xam-1.jpg', NULL, 21),
	(83, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/realme-11_1__1.png', NULL, 21),
	(84, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/realme-11_1.png', NULL, 21),
	(85, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/b/l/black-558e4859a9.png', NULL, 22),
	(86, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/w/h/white-7e6a0f537b.png', NULL, 22),
	(87, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/o/doki-_side-rgb-fa_1.png', NULL, 22),
	(88, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/o/doki-_top_and_bottom-rgb-fa.png', NULL, 22),
	(89, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/9/_/9_pro_plus.png', NULL, 23),
	(90, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/9/_/9_pro_plus_1.png', NULL, 23),
	(91, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/9/_/9_ro_plus.png', NULL, 23),
	(92, NULL, 'https://thongsokythuat.vn/wp-content/uploads/2023/02/Dien-thoai-Realme-9-Pro-Plus-5G-2022.jpg', NULL, 23),
	(93, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/realme-c30s-den-glr--009.jpg', NULL, 24),
	(94, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/e/realme-c30s-xanh-glr--009.jpg', NULL, 24),
	(95, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/i/milan-_black_side-rgb-fa.png', NULL, 24),
	(96, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/i/milan-_black_top_and_bottom-rgb-fa.png', NULL, 24),
	(97, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/g/dgtyi8899_.jpg', NULL, 25),
	(98, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/g/dgtyi8899_2_.jpg', NULL, 25),
	(99, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/g/dgfg666_4_.jpg', NULL, 25),
	(100, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/g/dgfg666_1_.jpg', NULL, 25),
	(101, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c32_3_.png', NULL, 26),
	(102, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c32_3__2.png', NULL, 26),
	(103, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c32_1_.png', NULL, 26),
	(104, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c32_2__1.png', NULL, 26),
	(105, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-c31-xl_1.jpg', NULL, 27),
	(106, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_250_1.jpg', NULL, 27),
	(107, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/7/_/7_87_1.jpg', NULL, 27),
	(108, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/8/_/8_63_1.jpg', NULL, 27),
	(109, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_24__1_3.png', NULL, 28),
	(110, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia5710xpressaudioteaser.png', NULL, 28),
	(111, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_13__1_6.png', NULL, 28),
	(112, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/n/o/nokia-5701.jpg', NULL, 28),
	(113, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_365.jpg', NULL, 29),
	(114, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_350.jpg', NULL, 29),
	(115, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_246.jpg', NULL, 29),
	(116, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_336.jpg', NULL, 29),
	(117, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/7/_/7_132.jpg', NULL, 30),
	(118, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_366.jpg', NULL, 30),
	(119, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_337.jpg', NULL, 30),
	(120, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/4/14_24_1.jpg', NULL, 30),
	(121, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/a/s/asus-rog-phone-6-12gb-256gb-den_2.png', NULL, 31),
	(122, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/a/s/asus-rog-phone-6-12gb-256gb_2.png', NULL, 31),
	(123, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/8/18_3.png', NULL, 31),
	(124, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/3/13_7_2.png', NULL, 31),
	(125, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/a/s/asus-rog-phone-5_0002_gsmarena_001.jpg', NULL, 32),
	(126, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/a/s/asus-rog-phone-5_0001_rog_phone_5_storm_white_1200x768.jpg', NULL, 32),
	(127, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/a/s/asus-rog-phone-5_0000_3-rog-phone-5display-16153751648.jpg', NULL, 32),
	(128, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/o/rog_5_1.jpg', NULL, 32),
	(129, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-pova-5_2_.png', NULL, 33),
	(130, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-pova-5_1_.png', NULL, 33),
	(131, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-pova-5.png', NULL, 33),
	(132, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno_pova5_-_128_-1.png', NULL, 33),
	(133, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-pova-5_2__1.png', NULL, 34),
	(134, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-pova-5_1__1.png', NULL, 34),
	(135, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-pova-5_1.png', NULL, 34),
	(136, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno_pova5_-_3_1.png', NULL, 34),
	(137, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-camon-20-1_2.png', NULL, 35),
	(138, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/v/-/v-3_2.png', NULL, 35),
	(139, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-camon20-pro-1.png', NULL, 35),
	(140, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-camon20-pro-5.png', NULL, 35),
	(141, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-spark-10_5_.png', NULL, 36),
	(142, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-spark-10_4_.png', NULL, 36),
	(143, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-spark-10_3_.png', NULL, 36),
	(144, NULL, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/tecno-spark-10_6_.png', NULL, 36);

-- Dumping structure for table danny-store-db.product_manufacturer
DROP TABLE IF EXISTS `product_manufacturer`;
CREATE TABLE IF NOT EXISTS `product_manufacturer` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime DEFAULT NULL,
    `manufacturer` varchar(255) DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `product_type` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.product_manufacturer: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.product_type
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `type_name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.product_type: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.promotion
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `end_day_promotion` datetime DEFAULT NULL,
    `percent_value` varchar(255) DEFAULT NULL,
    `start_day_promotion` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.promotion: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.receipt_import
DROP TABLE IF EXISTS `receipt_import`;
CREATE TABLE IF NOT EXISTS `receipt_import` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `created_at` datetime DEFAULT NULL,
    `id_manufacturer` bigint(20) DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `user_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.receipt_import: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.receipt_import_detail
DROP TABLE IF EXISTS `receipt_import_detail`;
CREATE TABLE IF NOT EXISTS `receipt_import_detail` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `price` bigint(20) DEFAULT NULL,
    `product_id` bigint(20) DEFAULT NULL,
    `quantity` bigint(20) DEFAULT NULL,
    `receipt_import_id` bigint(20) DEFAULT NULL,
    `total_amount` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.receipt_import_detail: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `role_name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.role: ~4 rows (approximately)
REPLACE INTO `role` (`id`, `role_name`) VALUES
	(1, 'admin'),
	(2, 'warehouse'),
	(3, 'sales'),
	(4, 'customer');

-- Dumping structure for table danny-store-db.status
DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `status_name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.status: ~0 rows (approximately)

-- Dumping structure for table danny-store-db.status_order
DROP TABLE IF EXISTS `status_order`;
CREATE TABLE IF NOT EXISTS `status_order` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `status_name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.status_order: ~5 rows (approximately)
REPLACE INTO `status_order` (`id`, `status_name`) VALUES
	(1, 'Đã tiếp nhận đơn'),
	(2, 'Đang lấy hàng'),
	(3, 'Đang giao hàng'),
	(4, 'Đã giao hàng'),
	(5, 'Hủy đơn');

-- Dumping structure for table danny-store-db.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `active` bit(1) DEFAULT NULL,
    `address` varchar(255) DEFAULT NULL,
    `avatar` varchar(255) DEFAULT NULL,
    `created_at` datetime DEFAULT NULL,
    `gender` varchar(255) DEFAULT NULL,
    `modified_at` datetime DEFAULT NULL,
    `name` varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    `password_reset_token` varchar(255) DEFAULT NULL,
    `password_reset_token_expiry_date` datetime DEFAULT NULL,
    `phone` varchar(255) DEFAULT NULL,
    `role` varchar(255) DEFAULT NULL,
    `username` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.user: ~7 rows (approximately)
REPLACE INTO `user` (`id`, `active`, `address`, `avatar`, `created_at`, `gender`, `modified_at`, `name`, `password`, `password_reset_token`, `password_reset_token_expiry_date`, `phone`, `role`, `username`) VALUES
	(1, b'1', 'Nam Dinh', 'None', '2023-10-11 13:41:14', '', NULL, 'Long', '$2a$10$.mHniwHnIa0QrR.UXC4Y4.c2gAA6/mFmCbJg3to28SGxJaJbb1HPm', NULL, NULL, '1234567890', 'admin', 'admin@gmail.com'),
	(2, b'1', 'Ha noi', 'None', '2023-10-11 13:42:21', '', NULL, 'Nam', '$2a$10$L1ivD7VswYqLXaP7bUM3NOvQFFxQNnuyOztsxbS5vYnsYTd8TpMYC', NULL, NULL, '1234567890', 'warehouse', 'warehouse@gmail.com'),
	(3, b'1', 'Nghe An', 'None', '2023-10-11 13:42:27', '', NULL, 'Hieu', '$2a$10$g0Iu28fkjnfbAKO7RrdjhOA71mxjNfjkKNUFnq5IVeKd6QKmrlo6.', NULL, NULL, '1234567890', 'sales', 'sales@gmail.com'),
	(4, b'1', 'Hai phong', 'None', '2023-10-11 13:42:32', '', NULL, 'Vu', '$2a$10$yqtSK81T16bro8QI5LKs3uWtn.n7xTEgK3a9uyr39D6HBYmRlvyIO', NULL, NULL, '1234567890', 'customer', 'customer@gmail.com'),
	(5, b'1', 'Nam Dinh', 'None', '2023-10-11 14:19:17', '', NULL, 'Hoang', '$2a$10$dZ5cgij0mhq7bTpE5W8IL.ZXgUpJXKv/bYvvXF0SlMpO3YKDb/Bbq', NULL, NULL, '1234567890', 'customer', 'customer2@gmail.com'),
	(6, b'1', 'TP HCM', NULL, '2023-10-25 15:37:49', '', NULL, 'Hai', '$2a$10$kM3.oYwcDwekxQxeM1ZAdelQL0dbcA7oGFAP3bRoCKRLpa7f09uo2', NULL, NULL, '1234567890', 'customer', 'dat123@gmail.com'),
	(7, b'1', NULL, NULL, '2023-11-09 13:49:08', NULL, NULL, 'Chien', '$2a$10$MlNFjaBFG66hNpq/uoqiC.aTObdaGDl7IGEvSQ5KB.XY1G4yd6PI.', NULL, NULL, '12345', 'customer', 'pqc@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
