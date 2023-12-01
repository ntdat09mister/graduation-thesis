-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.41 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.5.0.6677
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
    ) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.cart: ~5 rows (approximately)
REPLACE INTO `cart` (`id`, `created_at`, `modified_at`, `user_id`) VALUES
	(5, '2023-11-25 04:43:13', '2023-11-25 04:43:13', 12),
	(6, '2023-11-25 04:43:22', '2023-11-25 04:43:22', 12),
	(7, '2023-11-25 04:43:43', '2023-11-25 04:43:43', 12),
	(18, '2023-11-27 16:31:46', '2023-11-27 16:31:46', 1),
	(19, '2023-11-27 16:40:50', '2023-11-27 16:40:50', 1);

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
    ) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.cart_detail: ~8 rows (approximately)
REPLACE INTO `cart_detail` (`id`, `cart_id`, `created_at`, `modified_at`, `price`, `product_id`, `quantity`, `total_amount`) VALUES
	(5, 5, '2023-11-25 04:43:13', '2023-11-25 04:43:13', 4460, 3, 1, NULL),
	(6, 6, '2023-11-25 04:43:22', '2023-11-25 04:43:22', 4988, 5, 1, NULL),
	(7, 7, '2023-11-25 04:43:43', '2023-11-25 04:43:43', 5688, 6, 1, NULL),
	(12, 10, '2023-11-27 16:09:33', '2023-11-27 16:09:33', 3125, 1, 4, NULL),
	(13, 11, '2023-11-27 16:10:13', '2023-11-27 16:10:13', 3125, 1, 1, NULL),
	(19, 17, '2023-11-27 16:30:13', '2023-11-27 16:30:13', 4460, 3, 0, NULL),
	(20, 18, '2023-11-27 16:31:47', '2023-11-27 16:31:47', 4460, 3, 1, NULL),
	(21, 19, '2023-11-27 16:40:50', '2023-11-27 16:40:50', 3125, 1, 1, NULL);

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
    ) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.order: ~25 rows (approximately)
REPLACE INTO `order` (`id`, `created_at`, `customer_id`, `modified_at`, `sale_staff_id`, `status_id`, `total_amount`) VALUES
	(1, '2023-11-06 15:53:02', 6, NULL, 2, 2, 3990),
	(2, '2023-11-07 15:53:19', 6, NULL, 2, 2, 3000),
	(3, '2023-11-08 15:53:38', 6, NULL, 2, 3, 5412),
	(6, '2023-11-09 13:07:34', 4, NULL, 1, 2, 6696),
	(7, '2023-11-09 13:44:34', 4, NULL, 1, 1, 6875),
	(8, '2023-11-09 13:48:39', 4, NULL, 1, 4, 3750),
	(9, '2023-11-09 13:52:37', 7, NULL, 1, 4, 1168),
	(10, '2023-11-09 15:49:31', 6, NULL, 1, 1, 8535),
	(11, '2023-11-09 15:54:45', 6, NULL, 1, 2, 6469),
	(12, '2023-11-10 16:46:12', 6, NULL, 1, 1, 12287),
	(13, '2023-11-10 16:50:08', 8, NULL, 1, 2, 3125),
	(14, '2023-12-10 16:50:08', 4, NULL, 1, 2, 12334),
	(15, '2024-11-10 16:50:08', 7, NULL, 1, 1, 1234),
	(16, '2023-11-11 15:21:51', 8, NULL, 1, 1, 5412),
	(17, '2023-11-12 17:03:41', 8, NULL, 1, 4, 1168),
	(18, '2023-11-12 01:23:34', 1, NULL, 1, 5, 5894),
	(19, '2023-11-24 16:44:25', 1, NULL, 1, 5, 4460),
	(20, '2023-11-24 16:52:39', 5, NULL, 1, 5, 16860),
	(21, '2023-11-25 03:24:03', 12, NULL, 1, 5, 5894),
	(22, '2023-11-25 03:25:12', 12, NULL, 1, 5, 3990),
	(23, '2023-11-25 04:18:34', 1, NULL, 1, 5, 3125),
	(24, '2023-11-25 04:31:46', 1, NULL, 1, 5, 3990),
	(25, '2023-11-25 05:09:18', 13, NULL, 1, 5, 10676),
	(35, '2023-11-27 16:27:59', 1, NULL, 1, 1, 22300),
	(36, '2023-11-27 16:29:19', 1, NULL, 1, 1, 7585);

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
    ) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.order_item: ~39 rows (approximately)
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
	(39, '2023-11-10 16:50:08', NULL, 13, 1, 1, 3125),
	(40, '2023-12-10 16:50:08', NULL, 14, 2, 1, 3125),
	(41, '2024-11-10 16:50:08', NULL, 15, 2, 2, 5412),
	(42, '2023-11-11 15:21:51', NULL, 16, 10, 1, 5412),
	(43, '2023-11-11 17:03:41', NULL, 17, 36, 1, 1168),
	(44, '2023-11-12 01:23:34', NULL, 18, 4, 1, 5894),
	(45, '2023-11-24 16:44:25', NULL, 19, 3, 1, 4460),
	(46, '2023-11-24 16:52:39', NULL, 20, 2, 3, 600),
	(47, '2023-11-24 16:52:39', NULL, 20, 4, 3, 800),
	(48, '2023-11-24 16:52:39', NULL, 20, 3, 3, 1000),
	(49, '2023-11-24 16:52:39', NULL, 20, 6, 3, 1000),
	(50, '2023-11-24 16:52:39', NULL, 20, 8, 2, 1100),
	(51, '2023-11-24 16:52:39', NULL, 20, 3, 1, 4460),
	(52, '2023-11-25 03:24:03', NULL, 21, 4, 1, 5894),
	(53, '2023-11-25 03:25:12', NULL, 22, 5, 1, 3990),
	(54, '2023-11-25 04:18:34', NULL, 23, 1, 1, 3125),
	(55, '2023-11-25 04:31:46', NULL, 24, 5, 1, 3990),
	(56, '2023-11-25 05:09:18', NULL, 25, 6, 1, 5688),
	(57, '2023-11-25 05:09:18', NULL, 25, 5, 1, 4988),
	(67, '2023-11-27 16:27:59', NULL, 35, 3, 5, 4460),
	(68, '2023-11-27 16:29:19', NULL, 36, 1, 1, 3125),
	(69, '2023-11-27 16:29:19', NULL, 36, 3, 1, 4460);

-- Dumping structure for table danny-store-db.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
    `id` bigint(20) NOT NULL,
    `description` varchar(4000) DEFAULT NULL,
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
    `created_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.product: ~36 rows (approximately)
REPLACE INTO `product` (`id`, `description`, `manufacturer_id`, `modified_at`, `name`, `price`, `product_type`, `promotion_id`, `src`, `create_time`, `modified_time`, `quantity`, `status`, `created_at`) VALUES
	(1, '123', 1, NULL, '12345', '12345.0', 1, 4, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_225.jpg', '', '', 123, b'1', NULL),
	(2, 'iảm 20% với hóa đơn trên 50 triệu & tặng củ sạc và airpod pro', 1, NULL, 'iPhone 12 promax', '3000.0', 1, 2, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_m_18.png', '', '', 1000, b'1', NULL),
	(3, 'iảm 20% với hóa đơn trên 50 triệu', 1, NULL, 'iPhone 13 promax', '3568.0', 1, 2, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_241_2.jpg', '', '', 999, b'1', NULL),
	(4, 'Giảm 20% với hóa đơn trên 50 triệu + Tặng sạc dự phòng và balo Danny Store', 1, NULL, 'iPhone 14 promax', '4715.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_51_1_3.jpg', '', '', 1000, b'1', NULL),
	(5, 'Hàng sắp về hãy đặt hàng trước', 2, NULL, 'Samsung Galaxy Z Fold5', '3990.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/b/4/b48cd136-7366-4d01-8d58-8ee3d5dc93b7_1.jpg', '', '', 1000, b'1', NULL),
	(6, '"Tặng sạc dự phòng và balo Danny Store\n\nMàn hình\n\nKích thước màn hình\n\n6.8 inches\nCông nghệ màn hình\n\nDynamic AMOLED 2X\nĐộ phân giải màn hình\n\n1440 x 3088 pixels (QHD+)\nTính năng màn hình\n\n120Hz, HDR10+, 1750 nits, Gorilla Glass Victus 2\nTần số quét\n\n120Hz\nKiểu màn hình\n\nGiọt nước\nCamera sau\n\nCamera sau\n\nSiêu rộng: 12MP F2.2 (Dual Pixel AF)\nChính: 200MP F1.7 OIS ±3° (Super Quad Pixel AF)\nTele 1: 10MP F4.9 (10X, Dual Pixel AF) OIS,\nTele 2: 10MP F2.4 (3X, Dual Pixel AF) OIS Thu phóng chuẩn không gian 100X\nQuay video\n\n8K@24/30fps, 4K@30/60fps, 1080p@30/60/240fps, 720p@960fps, HDR10+, stereo sound rec., gyro-EIS\nTính năng camera\n\nQuay Siêu chậm (Super Slow Motion)\nChuyên nghiệp (Pro)\nHDR\nZoom quang học\nLàm đẹp\nLive Photo\nBộ lọc màu\nTrôi nhanh thời gian (Time Lapse)\nGóc siêu rộng (Ultrawide)\nGóc rộng (Wide)\nToàn cảnh (Panorama)\nChống rung quang học\nCamera trước\n\nCamera trước\n\n12MP F2.2 (Dual Pixel AF)\nQuay video trước\n\n4K@30/60fps, 1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon 8 Gen 2 (4 nm)\nLoại CPU\n\n1x3.36 GHz Cortex-X3 & 2x2.8 GHz Cortex-A715 & 2x2.8 GHz Cortex-A710 & 3x2.0 GHz Cortex-A510\nGPU\n\nAdreno 740\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n5.000mAh\nCông nghệ sạc\n\nSạc có dây: 45W có dây\nSạc không dây: 15W (Qi/PMA)\nChia sẻ pin không dây\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 Nano SIM hoặc 1 Nano + 1 eSIM\nHệ điều hành\n\nAndroid\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi 802.11 a/b/g/n/ac/6e, tri-band, Wi-Fi Direct\nBluetooth\n\n5.3, A2DP, LE\nGPS\n\nGPS, GLONASS, BDS, GALILEO\nThiết kế & Trọng lượng\n\nKích thước\n\n163.4 x 78.1 x 8.9 mm\nTrọng lượng\n\n234 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhôm\nThông số khác\n\nTương thích\n\nBút S-Pen\nChỉ số kháng nước, bụi\n\nIP68\nTiện ích khác\n\nSamsung DeX, Samsung Wireless DeX, trợ lí ảo Bixby, Samsung Pay ,Màn hình luôn hiển thị AOD, Mở rộng bộ nhớ RAM,Thu nhỏ màn hình sử dụng một tay\nCông nghệ âm thanh\n\nLoa kép\nÂm thanh AKG\nÂm thanh Dolby Atmos\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Sạc không dây, Bảo mật vân tay, Nhận diện khuôn mặt, Kháng nước, kháng bụi\nThông tin chung\n\nThời điểm ra mắt\n\n02/2023"\r\n', 2, NULL, 'Samsung Galaxy S23 Ultra', '4550.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/4/d4a672c5-4709-4056-9f7f-72d6d70c2c1d_1.jpg', '', '', 12, b'1', NULL),
	(7, '"Giảm 1 triệu với khách hàng vip\n\nMàn hình\n\nKích thước màn hình\n\n6.7 inches\nCông nghệ màn hình\n\nDynamic AMOLED 2X\nTính năng màn hình\n\nMàn hình chính: 6.7 inches, Dynamic AMOLED 2X\nMàn hình ngoài: 1.9 inches, Super AMOLED\n120Hz, HDR10+, 1200 nits (peak)\nTần số quét\n\n120Hz\nKiểu màn hình\n\nMàn hình gập\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 12 MP, f/1.8, PDAF, OIS\nCamera góc siêu rộng: 12 MP, f/2.2, 123˚\nQuay video\n\n4K@30/60fps, 1080p@60/240fps, 720p@960fps, HDR10+\nTính năng camera\n\nĐèn Flash, Quay Siêu chậm (Super Slow Motion), AI Camera, Zoom quang học\nCamera trước\n\nCamera trước\n\n10 MP, f/2.4\nQuay video trước\n\n4K@30fps\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon 8+ Gen 1 8 nhân\nLoại CPU\n\n1 nhân 3.18 GHz, 3 nhân 2.7 GHz & 4 nhân 2 GHz\nGPU\n\nAdreno 670\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n3700 mAh\nCông nghệ sạc\n\nSạc nhanh 25W\nSạc nhanh không dây 10W\nSạc không dây ngược 4,5W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (nano‑SIM và eSIM)\nHệ điều hành\n\nAndroid 12\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nKhông\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\n802.11 a/b/g/n/ac/ax, dual-band, Wi-Fi Direct, hotspot\nBluetooth\n\nv5.2, A2DP, LE\nGPS\n\nGLONASS, GPS, GALILEO, QZSS, BEIDOU\nThiết kế & Trọng lượng\n\nKích thước\n\nKhi mở: 165.2 x 71.9 x 6.9mm\nKhi gâp: 84.9 x 71.9 x 15.9-17.1 mm\nTrọng lượng\n\n187 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhôm\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIPX8\nTiện ích khác\n\nSamsung Pay\nChế độ đơn giản (Giao diện đơn giản)\nThu nhỏ màn hình sử dụng một tay\nTrợ lý ảo Samsung Bixby\nSamsung DeX (Kết nối màn hình sử dụng giao diện tương tự PC)\nĐa cửa sổ (chia đôi màn hình)\nTối ưu game (Game Booster)\nCông nghệ âm thanh\n\nÂm thanh Dolby Atmos\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay, Nhận diện khuôn mặt, Kháng nước, kháng bụi\nThông tin chung\n\nThời điểm ra mắt\n\n08/2022"\r\n', 2, NULL, 'Samsung Galaxy Z Flip4', '3412.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/samsung-galaxy-20-fe_4_.jpg', '', '', 9, b'1', NULL),
	(8, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.8 inches\nCông nghệ màn hình\n\nDynamic AMOLED 2X\nĐộ phân giải màn hình\n\n1440 x 3088 pixels (QHD+)\nTính năng màn hình\n\nTần số quét 120Hz\nCông nghệ HDR10+, 1750 nits\nTần số quét\n\n120Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\n108 MP, f/1.8 góc rộng\n10 MP, f/4.9\n10 MP, f/2.4\n12 MP, f/2.2 góc siêu rộng\nQuay video\n\n8K@24fps, 4K@30/60fps, 1080p@30/60/240fps, 720p@960fps, HDR10+\nTính năng camera\n\nĐèn LED kép, Quay video hiển thị kép, Chuyên nghiệp (Pro), Tự động lấy nét (AF) , HDR , Toàn cảnh (Panorama), Quay Siêu chậm (Super Slow Motion) , Làm đẹp\nCamera trước\n\nCamera trước\n\n40 MP, f/2.2\nQuay video trước\n\n4K@30/60fps, 1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon 8 Gen 1 (4 nm)\nLoại CPU\n\n1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510\nGPU\n\nAdreno 730\nRAM & lưu trữ\n\nDung lượng RAM\n\n12 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n5000 mAh\nCông nghệ sạc\n\nSạc pin nhanh 45W\nSạc không dây Qi\nSạc không dây ngược 4,5W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 Nano-SIM + eSIM\nHệ điều hành\n\nAndroid 12, One UI 4.1\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nKhông\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot\nBluetooth\n\n5.2, A2DP, LE\nGPS\n\nGPS GLONASS GALILEO QZSS BEIDOU\nThiết kế & Trọng lượng\n\nKích thước\n\n163.3 x 77.9 x 8.9 mm\nTrọng lượng\n\n229 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nKim loại\nThông số khác\n\nTương thích\n\nBút Spen\nChỉ số kháng nước, bụi\n\nIP68\nTiện ích khác\n\nTrợ lý ảo Samsung Bixby\nChặn cuộc gọi\nChặn tin nhắn\nThu nhỏ màn hình sử dụng một tay\nSamsung Pay\nĐa cửa sổ (chia đôi màn hình)\nSamsung DeX (Kết nối màn hình sử dụng giao diện tương tự PC)\nTối ưu game (Game Booster)\nCông nghệ âm thanh\n\nÂm thanh AKG\nÂm thanh Dolby Atmos\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Sạc không dây, Bảo mật vân tay, Nhận diện khuôn mặt, Kháng nước, kháng bụi\nThông tin chung\n\nThời điểm ra mắt\n\n02/2022"\r\n', 2, NULL, 'Samsung Galaxy S22 Ultra', '3141.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/m/sm-s908_galaxys22ultra_front_phantomblack_211119_2.jpg', '', '', 12, b'1', NULL),
	(9, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.67 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 120Hz, độ sáng 1200nits\nCorning® Gorilla® Glass 3\nTần số quét\n\n120Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nCamera chính: 50MP, f/1.8\nCamera góc rộng: 8MP, f/2.2\nCamera Macro: 2MP, f/2.4\nQuay video\n\n1080p@30fps, 720p@30fps\nTính năng camera\n\nChân dung\nToàn cảnh\nChế độ chuyên nghiệp\nChế độ ban đêm\nHình mờ tùy chỉnh\nChế độ tài liệu\nHDR\nPhát hiện cảnh AI\nBùng nổ thời gian\nGoogle Ống kính\nHình mờ AI\nChế độ Video ngắn\nThời Gian Trôi Đi\nkhung phim\nVideo vĩ\nCamera trước\n\nCamera trước\n\n13MP, f/2.45\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nQualcomm Snapdragon 685\nLoại CPU\n\n2X Cortex-A78 @ 2.0GHz ; 6X Cortex-A55 @ 1.8GHz\nGPU\n\nAdreno™ 619\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nMicro SD\nPin & công nghệ sạc\n\nPin\n\n5000mAh\nCông nghệ sạc\n\nSạc nhanh 33W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12\nHồng ngoại\n\nCó\nJack tai nghe 3.5\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n802.11 a/b/g/n/ac\nBluetooth\n\nv5.1\nGPS\n\nGPS/AGPS, Glonass\nThiết kế & Trọng lượng\n\nKích thước\n\n165.66 x 75.96 x 7.85 mm\nTrọng lượng\n\n183.5 g\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP53\nTiện ích khác\n\nMở khoá khuôn mặt, Mở khoá vân tay cạnh viền\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt"\r\n', 3, NULL, 'Xiaomi Redmi Note 12', '4123', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/7/_76666_7__3-3.jpg', '', '', 10, b'1', NULL),
	(10, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.67 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 120Hz, độ sáng 1200nits\nCorning® Gorilla® Glass 3\nTần số quét\n\n120Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nCamera chính: 50MP, f/1.8\nCamera góc rộng: 8MP, f/2.2\nCamera Macro: 2MP, f/2.4\nQuay video\n\n1080p@30fps, 720p@30fps\nTính năng camera\n\nChân dung\nToàn cảnh\nChế độ chuyên nghiệp\nChế độ ban đêm\nHình mờ tùy chỉnh\nChế độ tài liệu\nHDR\nPhát hiện cảnh AI\nBùng nổ thời gian\nGoogle Ống kính\nHình mờ AI\nChế độ Video ngắn\nThời Gian Trôi Đi\nkhung phim\nVideo vĩ\nCamera trước\n\nCamera trước\n\n13MP, f/2.45\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nQualcomm Snapdragon 685\nLoại CPU\n\n2X Cortex-A78 @ 2.0GHz ; 6X Cortex-A55 @ 1.8GHz\nGPU\n\nAdreno™ 619\nRAM & lưu trữ\n\nDung lượng RAM\n\n4 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nMicro SD\nPin & công nghệ sạc\n\nPin\n\n5000mAh\nCông nghệ sạc\n\nSạc nhanh 33W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12\nHồng ngoại\n\nCó\nJack tai nghe 3.5\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n802.11 a/b/g/n/ac\nBluetooth\n\nv5.1\nGPS\n\nGPS/AGPS, Glonass\nThiết kế & Trọng lượng\n\nKích thước\n\n165.66 x 75.96 x 7.85 mm\nTrọng lượng\n\n183.5 g\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP53\nTiện ích khác\n\nMở khoá khuôn mặt, Mở khoá vân tay cạnh viền\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt"\r\n', 3, NULL, 'Xiaomi Redmi Note 12 4G', '5412.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/g/t/gtt_7766_3__1.jpg', '', '', 6, b'1', NULL),
	(11, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.67 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét: 120Hz\nDolby Vision, HDR10+, 500 nit, 900 nit\nKính cường lực Corning Gorilla Glass 5\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50MP, f/1.9, PDAF, OIS\nCamera góc siêu rộng: 8 MP, f/1.9, 119˚\nCamera macro: 2 MP, f/2.4\nQuay video\n\n4K@30fps, 1080p@30/60/120fps, 720p@960fps\nTính năng camera\n\nToàn cảnh (Panorama)\nBan đêm (Night Mode)\nSiêu độ phân giải\nXóa phông\nTrôi nhanh thời gian (Time Lapse)\nCamera trước\n\nCamera trước\n\nCamera góc rộng: 16 MP\nQuay video trước\n\n1080p@30/60fps\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek Dimensity 1080 8 nhân\nLoại CPU\n\n2x2,6 GHz Cortex-A78 & 6x2,0 GHz Cortex-A55\nGPU\n\nMali-G68 MC4\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n5.000 mAh\nCông nghệ sạc\n\n67W có dây, PD3.0\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12\nHồng ngoại\n\nCó\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\n802.11 a/b/g/n/ac/6\nBluetooth\n\nv5.2\nGPS\n\nGPS, GLONASS , BDS, GALILEO, QZSS\nThiết kế & Trọng lượng\n\nKích thước\n\n162,9 x 76 x 7,9 mm\nTrọng lượng\n\n187 g\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP53\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế"\r\n', 3, NULL, 'Xiaomi Redmi Note 12 Pro', '3123.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/x/i/xiaomi-12t-den_1.jpg', '', '', 9, b'1', NULL),
	(12, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.67 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1220 x 2712 pixels\nTính năng màn hình\n\n1 tỉ màu, 120Hz, Dolby Vision, HDR10+\nTần số quét\n\n120Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\n108MP + 8MP + 2MP\nQuay video\n\n4K 3840x2160 ở tốc độ 30fps\n1080p 1920x1080 ở tốc độ 60fps\n1080p 1920x1080 ở tốc độ 30fps\n720p 1280x720 ở tốc độ 30fps\nTính năng camera\n\nTrôi nhanh thời gian (Time Lapse) Quay chậm (Slow Motion) Ảnh Raw Chống rung quang học (OIS) Siêu độ phân giải Toàn cảnh (Panorama) Làm đẹp, Nhận diện khuôn mặt, Google Lens, Xóa phông, Ban đêm (Night Mode), Chạm lấy nét, Chuyên nghiệp (Pro), HDR,\nCamera trước\n\nCamera trước\n\n20MP\nQuay video trước\n\n1080p 1920x1080 ở tốc độ 60fps\n1080p 1920x1080 ở tốc độ 30fps\n720p 1280x720 ở tốc độ 30fps\nVideo chuyển động chậm: 120fps, 720p\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek Dimensity 8100 Ultra\nLoại CPU\n\nTốc độ CPU 2.8 GHz\nGPU\n\nMali G610 MC6\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nPin & công nghệ sạc\n\nPin\n\n5000mAh\nCông nghệ sạc\n\nSạc nhanh 120W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12, MIUI 13\nJack tai nghe 3.5\n\nKhông\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot\nBluetooth\n\nv5.2, A2DP, LE\nGPS\n\nA-GPS (GLONASS (1), BDS (3), GALILEO (2), QZSS (2), NavIC)\nThiết kế & Trọng lượng\n\nKích thước\n\n163.1 x 75.9 x 8.6 mm\nTrọng lượng\n\n202 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nKim loại\nThông số khác\n\nHệ thống làm mát\n\nHệ thống làm mát bằng chất lỏng (Buồng hơi siêu lớn + Tấm graphit nhiều lớp + màng Boron Nitride)\nChỉ số kháng nước, bụi\n\nKhông có\nTiện ích khác\n\nĐa cửa sổ (chia đôi màn hình)\nTối ưu game (Game Turbo)\nTheo dõi nhịp tim bằng cảm biến vân tay\nBáo rung khi kết nối cuộc gọi\nChặn cuộc gọi\nChặn tin nhắn\nTrợ lý ảo Google Assistant\nMở rộng bộ nhớ RAM\nCông nghệ âm thanh\n\nLoa kép\nDolby Atmos\nÂm thanh Hi-Res Audio\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay, Nhận diện khuôn mặt\nThông tin chung\n\nThời điểm ra mắt\n\n10/2022"\r\n', 3, NULL, 'Xiaomi 12T 8GB 128GB', '2314', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/redmi-note-12-pro-4g-1-den.jpg', '', '', 10, b'1', NULL),
	(13, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.7 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2412 pixels\nTính năng màn hình\n\n1.07 tỷ màu, tần số quét 120Hz, HDR10+, tỷ lệ hiển thị 93%, 950 nits , viền cong 3D\nTần số quét\n\n120Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 64MP; f/1.7, PDAF\nChụp Telephoto chân dung: 32 MP, f/2.0\nCamera góc siêu rộng: 8 MP, f/2.2, Zoom quang lai 2X× và Xoom kỹ thuật số 20X\nQuay video\n\n4K@30fps, 1080P@60fps/30fps, and 720P@60fps/30fps\nTính năng camera\n\nQuay video hiển thị kép\nTrôi nhanh thời gian (Time Lapse)\nGóc siêu rộng\nZoom kỹ thuật số\nQuét tài liệu\nQuay chậm\nXóa phông\nToàn cảnh (Panorama)\nChống rung quang học (OIS)\nBan đêm\nChuyên nghiệp (Pro)\nHDR\nZoom quang học\nCamera trước\n\nCamera trước\n\nCamera góc rộng: 32 MP, f/2.4\nQuay video trước\n\n1080P/720P@30fps\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek Dimensity 7050\nLoại CPU\n\n8 cores\nGPU\n\nARM Mail-G68 MC4\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nMicroSD, hỗ trợ tối đa 2 TB\nPin & công nghệ sạc\n\nPin\n\n5000 mAh\nCông nghệ sạc\n\nSạc nhanh SUPERVOOCTM 67W, SUPERVOOCTM 2.0, SUPERVOOCTM, VOOC 3.0, PD3.0（9V/2A）\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nHồng ngoại\n\nCó\nJack tai nghe 3.5\n\nKhông\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi MIMO\nWi-Fi 6\nWi-Fi Direct\nWi-Fi hotspot\nDual-band (2.4 GHz/5 GHz)\nBluetooth\n\n5.3\nGPS\n\nGPS, GLONASS, GALILEO, BDS, QZSS\nThiết kế & Trọng lượng\n\nKích thước\n\n162.4 x 74.2 x 7.6 mm\nTrọng lượng\n\n180 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIPX4\nCông nghệ - Tiện ích\n\nChế độ đơn giản\nCử chỉ thông minh\nMở rộng bộ nhớ RAM\nMàn hình luôn hiển thị AOD\nỨng dụng kép (Nhân bản ứng dụng)\nĐa cửa sổ\nChế độ trẻ em\nKhoá ứng dụng\nTrợ lý ảo Google Assistant\nCử chỉ màn hình tắt\nCông nghệ âm thanh\n\nLoa kép\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay, Nhận diện khuôn mặt\nThông tin chung\n\nThời điểm ra mắt\n\n05/2023"\r\n', 4, NULL, 'OPPO Reno10 5G 8GB 256GB', '2214.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/reno10_5g_-_combo_product_-_blue.png', '', '', 9, b'1', NULL),
	(14, '"Tặng củ sạc và airpod pro \n\nMàn hình\n\nKích thước màn hình\n\n6.4 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 90Hz, Độ sáng tối đa: 430 nits\nMặt kính cảm ứng: Kính cường lực Corning Gorilla Glass 5\nTần số quét\n\n90Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\n50 MP (chính) + 2 MP (Xóa phông)\nQuay video\n\nHD 720p@120fps\nFullHD 1080p@30fps\nHD 720p@30fps\nTính năng camera\n\nChuyên nghiệp (Pro)\nLàm đẹp\nGoogle Lens\nTrôi nhanh thời gian (Time Lapse)\nToàn cảnh (Panorama)\nTự động lấy nét (AF)\nBan đêm (Night Mode)\nQuay chậm (Slow Motion)\nXóa phông\nCamera trước\n\nCamera trước\n\n8 MP\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nQualcomm Snapdragon 680, tối đa 2.4GHz\nLoại CPU\n\n4 nhân 2.4 GHz & 4 nhân 1.9 GHz\nGPU\n\nAdreno 610\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nMicroSD, hỗ trợ tối đa 1 TB\nPin & công nghệ sạc\n\nPin\n\n5000 mAh\nCông nghệ sạc\n\nSiêu sạc nhanh SUPERVOOC 67W , tiết kiệm pin\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nColorOS 13.1.1, nền tảng Android 13\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\nDual-band (2.4 GHz/5 GHz)\nWi-Fi hotspot\nWi-Fi Direct\nWi-Fi 802.11 a/b/g/n/ac\nBluetooth\n\nv5.0\nGPS\n\nGLONASS, GPS, GALILEO, QZSS\nThiết kế & Trọng lượng\n\nKích thước\n\nĐen: 160 x 73.23 x 7.93 mm\nXanh: 160 x 73.23 x 7.99 mm\nTrọng lượng\n\n180g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nKim loại\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP54\nCông nghệ - Tiện ích\n\nCử chỉ thông minh, Ứng dụng kép (Nhân bản ứng dụng), Mở rộng bộ nhớ RAM\nCông nghệ âm thanh\n\nLoa kép\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến ánh sáng, La bàn\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt, Kháng nước, kháng bụi\nThông tin chung\n\nThời điểm ra mắt\n\n2023"\r\n', 4, NULL, 'OPPO A78 4G (8GB 256GB)', '2200', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/o/combo_a78_-_black_-_rgb.jpg', '', '', 10, b'1', NULL),
	(15, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.8 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2520 pixels\nTính năng màn hình\n\nCó thể gập lại\nMàn hình chính: FHD+ (2520×1080), 120Hz, 16,7 triệu màu, 403 PPI, 1200nit, AMOLED, Kính siêu mỏng UTG\nMàn hình phụ: 720×382, 30/60Hz, 250 PPI, 800nit, Corning Gorilla Glass 5\nTần số quét\n\n120Hz\nKiểu màn hình\n\nMàn hình gập\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50MP, f/1.8, 23mm, PDAF\nCamera góc siêu rộng 8MP, f/2.2, 112˚\nQuay video\n\n4K@30/60fps, 1080p@30/60/240fps\nTính năng camera\n\nĐèn flash LED, HDR, toàn cảnh\nCamera trước\n\nCamera trước\n\nCamera góc rộng: 32MP, f/2.4, 22mm, AF\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek 9000+ (4nm)\nLoại CPU\n\n1x3.20 GHz Cortex-X2 & 3x3.20 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510\nGPU\n\nMali-G710 MC10\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n4300 mAh\nCông nghệ sạc\n\nSạc nhanh 44W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nJack tai nghe 3.5\n\nKhông\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\n802.11 a/b/g/n/ac/6\nBluetooth\n\nv5.3\nGPS\n\nGPS (L1+L5), GLONASS (G1), BDS (B1I+B1c+B2a), GALILEO (E1+E5a), QZSS (L1+L5)\nThiết kế & Trọng lượng\n\nKích thước\n\nKhi mở: 166,2 x 75,2 x 7,5 mm\nKhi gập: 85,5 x 75,2 x 16 mm\nTrọng lượng\n\n191 g\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay, Nhận diện khuôn mặt"\r\n', 4, NULL, 'OPPO Find N2 Flip', '1387', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/2/n2_flip_-_combo_product_-_black.png', '', '', 10, b'1', NULL),
	(16, '"Giảm 20% với hóa đơn trên 50 triệu \n\nMàn hình\n\nKích thước màn hình\n\n6.7 inches\nCông nghệ màn hình\n\nAMOLED\nTính năng màn hình\n\nTần số quét 120Hz, 1.07 tỷ màu\nCamera sau\n\nCamera sau\n\n108MP\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon 695\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nPin & công nghệ sạc\n\nPin\n\n4800 mAh\nCông nghệ sạc\n\nSạc nhanh 67W\nGiao tiếp & kết nối\n\nHệ điều hành\n\nColoros 13\nHỗ trợ mạng\n\n5G\nThiết kế & Trọng lượng\n\nKích thước\n\nSiêu mỏng 7.7mm\nTrọng lượng\n\n172g"\r\n', 4, NULL, 'OPPO Reno8 T 5G (8GB - 128GB)', '4321', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02t.png', '', '', 10, b'1', NULL),
	(17, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.62 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 120Hz\nTần số quét\n\n120Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 64MP, f/1.8, PDAF, OIS\nCamera macro: 2MP, f/2.4\nCamera đo độ sâu: 2MP, f/2.4\nQuay video\n\n4K@30fps, 1080p@30fps\nTính năng camera\n\nCamera trước: Chụp Đêm, Chân Dung, Photo, Quay Video, Micro Movie, Phơi Sáng Kép, Video Hiển Thị Kép, Live Photo\nCamera sau: Chụp Đêm, Chân Dung, Photo, Quay Video, 64 MP, Toàn Cảnh, Tài Liệu, Chuyển Động Chậm, Tua Nhanh Thời Gian, Chế Độ Chuyên Nghiệ\nCamera trước\n\nCamera trước\n\nTrước 32MP\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nMediatek MT8781 Helio G99 (6nm)\nLoại CPU\n\n2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55\nGPU\n\nMali-G57 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nmicroSDXC\nPin & công nghệ sạc\n\nPin\n\n4600 mAh\nCông nghệ sạc\n\nSạc nhanh 66W, 19 phút sạc đầy 50%, thuật toán bảo vệ tuổi thọ pin x2\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nFuntouch OS 13\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nKhông\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n802.11 a/b/g/n/ac/6\nBluetooth\n\nv5.2\nGPS\n\nGPS, GLONASS, GALILEO, BDS\nThiết kế & Trọng lượng\n\nKích thước\n\n162.51 × 75.81 × 7.70 mm (Đen Tinh Tú)\n162.51 × 75.81 × 7.80 mm (Tím Lavender)\nTrọng lượng\n\n185g (Đen Tinh Tú)\n186g (Tím Lavender)\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nHệ thống làm mát\n\nHệ thống tản nhiệt bằng hợp kim nhôm\nChỉ số kháng nước, bụi\n\nIP54\nTiện ích khác\n\nĐa nhiệm 27 ứng dụng chạy ngầm cùng lúc, Vòng sáng Aura nhận diện môi trường tối và bổ sung ánh sáng\nChế độ đơn giản (Giao diện đơn giản)\nCử chỉ thông minh\nChạm 2 lần tắt/sáng màn hình\nỨng dụng kép (Nhân bản ứng dụng)\nTối ưu game (Multi T\nCông nghệ âm thanh\n\n2 loa, Tính Năng Tăng Cường Âm Thanh Toàn Diện\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến trọng lực\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay\nThông tin chung\n\nThời điểm ra mắt\n\n5/2023"\r\n', 5, NULL, 'Vivo V27e 8GB 256GB', '1143', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/_/t_i_xu_ng_23__4_6.png', '', '', 10, b'1', NULL),
	(18, '"Giảm 20% với hóa đơn trên 50 triệu \n\nMàn hình\n\nKích thước màn hình\n\n6.51 inches\nCông nghệ màn hình\n\nIPS LCD\nĐộ phân giải màn hình\n\n1600 x 720 pixels (HD+)\nKiểu màn hình\n\nGiọt nước\nLoại màn hình\n\nMàn hình\nCamera sau\n\nCamera sau\n\n8 MP, f/2.0\nQuay video\n\nFullHD 1080p@30fpsHD 720p@30fps\nTính năng camera\n\nĐèn Flash camera sau, Chế độ làm đẹp, Chụp ảnh, Quay video, Quay tua nhanh thời gian\nCamera trước\n\nCamera trước\n\n5 MP, f/2.2\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek Helio P35\nLoại CPU\n\n4 nhân 2.3 GHz & 4 nhân 1.8 GHz\nGPU\n\nIMG PowerVR GE8320\nRAM & lưu trữ\n\nDung lượng RAM\n\n4 GB\nBộ nhớ trong\n\n64 GB\nKhe cắm thẻ nhớ\n\nmicroSD\nPin & công nghệ sạc\n\nPin\n\n5.000 mAh\nCông nghệ sạc\n\nSạc nhah 10W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n2.4 GHz/ 5 GHz\nBluetooth\n\nv5.0\nGPS\n\nQZSS, GPS, BeiDou, GLONASS, Galileo\nThiết kế & Trọng lượng\n\nKích thước\n\n163.99 × 75.63 × 8.49 mm\nTrọng lượng\n\n186g\nChất liệu mặt lưng\n\nNhựa\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP52\nTiện ích khác\n\nChế độ đơn giản (Giao diện đơn giản)\nChạm 2 lần tắt/sáng màn hình\nChặn cuộc gọi\nChặn tin nhắn\nTrợ lý ảo Google Assistant\nMở khoá khuôn mặt\nTiện ích khác\n\nCác loại cảm biến\n\nCảm biến tiệm cận, Cảm biến ánh sáng, Cảm biến trọng lực\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt"\r\n', 5, NULL, 'Vivo Y02t 4GB 64GB', '1500', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y02t.png', '', '', 10, b'1', NULL),
	(19, '"Tặng củ sạc và airpod pro \n\nMàn hình\n\nKích thước màn hình\n\n6.64 inches\nCông nghệ màn hình\n\nIPS LCD\nĐộ phân giải màn hình\n\n1080 x 2388 pixels\nTính năng màn hình\n\nTần số quét 90 Hz, 650 nits\nTần số quét\n\n90Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nLoại màn hình\n\nMàn hình\nCamera sau\n\nCamera sau\n\nCamera chính: 50 MP, f/1.8\nCamera phụ: 2 MP, f/2.4\nQuay video\n\n1080p@30fpsHD 720p@30fps\nTính năng camera\n\nPhơi sáng kép\nChuyên nghiệp (Pro)\nSiêu độ phân giải\nTrôi nhanh thời gian (Time Lapse)\nToàn cảnh (Panorama)\nTự động lấy nét (AF)\nBan đêm (Night Mode)\nQuay chậm (Slow Motion)\nXóa phông\nCamera trước\n\nCamera trước\n\n16 MP, f/2.45\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon 680 8 nhân\nLoại CPU\n\n4 nhân 2.4 GHz & 4 nhân 1.9 GHz\nGPU\n\nAdreno 610\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nMicroSD, hỗ trợ tối đa 1 TB\nPin & công nghệ sạc\n\nPin\n\n5.000 mAh\nCông nghệ sạc\n\nSạc nhanh 44 W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nWi-Fi\n\nDual-band (2.4 GHz/5 GHz)\nWi-Fi hotspot\nWi-Fi Direct\nWi-Fi 802.11 a/b/g/n/ac\nBluetooth\n\nv5.0\nGPS\n\nGPS, BEIDOU, GLONASS, GALILEO, QZSS\nThiết kế & Trọng lượng\n\nKích thước\n\n164.06 x 76.17 x 8.07 mm\nTrọng lượng\n\n202 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nKim loại\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP54\nTiện ích khác\n\nỨng dụng kép (Nhân bản ứng dụng)\nĐa cửa sổ (chia đôi màn hình)\nTối ưu game (Multi Turbo)\nMở rộng bộ nhớ RAM\nCông nghệ âm thanh\n\nÂm thanh Hi-Res Audio\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến trọng lực\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt\nThông tin chung\n\nThời điểm ra mắt\n\n06/2023"\r\n', 5, NULL, 'Vivo Y36', '1256', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/i/vivo-y36_2.jpg', '', '', 10, b'1', NULL),
	(20, '"Tặng củ sạc và airpod pro \n\nMàn hình\n\nKích thước màn hình\n\n6.44 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nCamera sau\n\nCamera sau\n\nCamera chính: 64MP AF\nCamera góc siêu rộng: 8MP, f/2.2\nCamera siêu cận: 2MP, f/2.4\nTính năng camera\n\nấy Nét Theo Mắt, Chế Độ Siêu Chụp Đêm, Chế Độ Chụp Đêm Góc Siêu Rộng, Siêu Cận, Chân Dung Xóa Phông, Chân Dung Phong Cách, Chân Dung Bokeh Flare, 64MP, Live Photo, AR Sticker, Quay Chuyển Động Chậm, Quay Tua Nhanh Thời Gian, Video Hiển Thị Kép, Phơi Sáng\nCamera trước\n\nCamera trước\n\n50MP AF, f/2.0\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek Helio G96\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nPin & công nghệ sạc\n\nPin\n\n4050mAh\nCông nghệ sạc\n\nSạc nhanh 44W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 11\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n2.4GHz, 5GHz\nBluetooth\n\nv5.2\nGPS\n\nGPS, BEIDOU, GALILEO, GLONASS\nThiết kế & Trọng lượng\n\nKích thước\n\n160.87*74.28*7.36 - 7.41mm\nTrọng lượng\n\n172g\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt"\r\n', 5, NULL, 'vivo V23e', '1789.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/c/9/c91ba5bf721d5b2d4eae4f821b8e4ced.png', '', '', 8, b'1', NULL),
	(21, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.4 inches\nCông nghệ màn hình\n\nSuper AMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\n90Hz, dộ sáng tối đa 1000nit, mặt kính Corning Gorilla Glass 5,16.7 triệu màu\nTần số quét\n\n90Hz\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nChính Prolight 108MP + Chân dung 2MP\nQuay video\n\n1080p@30fps\nTính năng camera\n\nChế độ 108MP, Chụp đêm, Toàn cảnh, Chuyên gia, HDR, Nhận dạng cảnh AI, Làm đẹp AI, Bộ lọc màu, Tùy chỉnh hiệu ứng Bokeh, Chụp đường phố, Quét lấy dữ liệu, Mô hình, Chế độ ảnh\nCamera trước\n\nCamera trước\n\n16MP\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nChip Helio G99\nLoại CPU\n\nLõi tám nhân, 2*A76 2.2 GHz，6*A55 2.0 GHz\nGPU\n\nARM G57 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8GB + Mở rộng 8GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nHỗ trợ tối đa 1 TB\nPin & công nghệ sạc\n\nPin\n\n5.000 mAh\nCông nghệ sạc\n\nSạc nhanh SuperVOOC 67W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nrealme UI 4.0 Trên nền tảng Android 13\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nHỗ trợ mạng\n\n4G\nBluetooth\n\nBluetooth 5.3\nGPS\n\nGPS, GALILEO, GLONASS, BDS, QZSS\nThiết kế & Trọng lượng\n\nKích thước\n\n159.9mm x 73.3mm x 7.95mm\nTrọng lượng\n\n178g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhựa\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, La bàn, Cảm biến áp kế\nTính năng đặc biệt\n\nBảo mật vân tay\nThông tin chung\n\nThời điểm ra mắt\n\n07/2023"\r\n', 6, NULL, 'realme 11 8GB 128GB', '2313.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-11-vang-1.jpg', '', '', 9, b'1', NULL),
	(22, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.4 inches\nCông nghệ màn hình\n\nSuper AMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 90 Hz, 16,7 triệu màu, Độ tương phản: 4,000,000:1, kính cường lực: Corning Gorilla Glass 5\nCamera sau\n\nCamera sau\n\nCamera chính AI: 50MP, f/1.8\nCamera chân dung: 2MP, f/2.4\nQuay video\n\n1080p@30fps\nTính năng camera\n\nChế độ 50MP, Quay video chống rung, Quay video chống rung tối đa, Chụp đêm , Toàn cảnh, Chuyên gia, Tua nhanh thời gian, Chân dung, HDR , Nhận dạng cảnh AI, Làm đẹp AI, Bộ lọc màu, Tăng cường màu sắc, Chuyển động chậm, Tùy chỉnh hiệu ứng Bokeh\nCamera trước\n\nCamera trước\n\n16 MP, f/2.5\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nHelio G99 (6nm)\nLoại CPU\n\n2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55\nGPU\n\nMali-G57 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nPin & công nghệ sạc\n\nPin\n\n5.000 mAh\nCông nghệ sạc\n\nSạc nhanh 33 W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12, Realme UI 3.0\nJack tai nghe 3.5\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\nWi-Fi 802.11 a/b/g/n/ac, dual-band\nBluetooth\n\n5.3, A2DP, LE, aptX HD, aptX Adaptive\nGPS\n\nGPS/AGPS/Beidou/Glonass/Galileo\nThiết kế & Trọng lượng\n\nKích thước\n\n159.9 x 73.3 x 7.95 mm\nTrọng lượng\n\n178 g\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển\nThông số khác\n\nTiện ích khác\n\nChứng nhận âm thanh chất lượng cao"\r\n', 6, NULL, 'realme 10 8GB 256GB', '2367.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/w/h/white-7e6a0f537b.png', '', '', 9, b'1', NULL),
	(23, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.4 inches\nCông nghệ màn hình\n\nSuper AMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 90Hz, Corning® Gorilla® Glass 5\nCamera sau\n\nCamera sau\n\nCamera chính: 50MP, f/1.8\nCamera macro: 2MP, f/2.4\nCamera góc rộng: 8MP, 119°, f/2.2\nQuay video\n\nFullHD 1080p@60fps\nFullHD 1080p@30fps\n4K 2160p@30fps\nHD 720p@30fps\nHD 720p@60fps\nTính năng camera\n\nChụp chống rung, chụp đêm, toàn cảnh, chuyên gia, tua nhanh thời gian, chân dung, HDR, góc rộng, chụp macro, nhận dạng cảnh AI, làm đẹp AI, bộ lọc màu, tăng sống động, chụp chậm, hiệu ứng Bokeh, phim, video kép, quét lấy dữ liệu, bầu trời, mô hình, chụp đ\nCamera trước\n\nCamera trước\n\n16MP, f/2.4\nQuay video trước\n\nMặc định 720P/30fps\nHỗ trợ 1080P/30fps\nVi xử lý & đồ họa\n\nChipset\n\nMediaTek Dimensity 920 5G\nLoại CPU\n\nTiến trình 6nm, lõi 8 nhân, xung nhịp lên đến 2.5GHz\nGPU\n\nMali-G68 MC4\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n4500mAh\nCông nghệ sạc\n\nSạc nhanh SuperDart 60W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nUI 3.0, Android 12\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi 6 (IEEE802.11 a/b/g/n/ac/ax)\nBluetooth\n\n5.2\nGPS\n\nGPS/AGPS、Beidou、Glonass\nThiết kế & Trọng lượng\n\nKích thước\n\n160.2 x 73.3 x 7.99mm\nTrọng lượng\n\n182g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nHệ thống làm mát\n\nHệ thống làm mát 5 lớp\nChỉ số kháng nước, bụi\n\nKhông\nTiện ích khác\n\nCông nghệ Linear tăng tốc phần mềm X-axis\nKhoá ứng dụng\nĐa cửa sổ (chia đôi màn hình)\nMàn hình luôn hiển thị AOD\nChạm 2 lần sáng màn hình\nCông nghệ âm thanh\n\nLoa âm thanh kép Dolby Atmos\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, Con quay hồi chuyển\nThông tin chung\n\nThời điểm ra mắt\n\n3/2022"\r\n', 6, NULL, 'realme 9 Pro Plus', '1890', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/9/_/9_ro_plus.png', '', '', 10, b'1', NULL),
	(24, '"Giảm 1 triệu với khách hàng vip \n\nMàn hình\n\nKích thước màn hình\n\n6.5 inches\nCông nghệ màn hình\n\nIPS LCD\nĐộ phân giải màn hình\n\n720 x 1600 pixel\nTính năng màn hình\n\n60Hz, độ sáng tối đa 400 nits, 16,7 triệu màu\nTần số quét\n\n60Hz\nKiểu màn hình\n\nGiọt nước\nCamera sau\n\nCamera sau\n\n8MP\nQuay video\n\nHỗ trợ quay phim 1080P/30fps\nHỗ trợ quay phim 720P/30fps\nHỗ trợ quay phim 480P/30fps\nTính năng camera\n\nLàm đẹp, Bộ lọc, HDR, Góc nhìn toàn cảnh, Chân dung, Tua nhanh thời gian, Siêu chụp đêm, Chuyên gia\nCamera trước\n\nCamera trước\n\n5MP\nQuay video trước\n\nHỗ trợ quay phim 720P/30fps\nHỗ trợ quay phim 480P/30fps\nVi xử lý & đồ họa\n\nChipset\n\nUnisoc SC9863A1\nLoại CPU\n\nARM Cortex-A55, lên đến 1.6GHz\nGPU\n\nGE8322\nRAM & lưu trữ\n\nDung lượng RAM\n\n2 GB\nBộ nhớ trong\n\n32 GB\nKhe cắm thẻ nhớ\n\nMicroSD, hỗ trợ tối đa 1 TB\nPin & công nghệ sạc\n\nPin\n\n5000mAh\nCông nghệ sạc\n\nSạc thường với công suất 10W, Siêu tiết kiệm pin\nCổng sạc\n\nMicro-USB\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nrealme UI Go Edition trên nền tảng Android 12\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n2.4GHz\nBluetooth\n\n4.2\nGPS\n\nGLONASS, GPS\nThiết kế & Trọng lượng\n\nKích thước\n\n164.2 x 75.7 x 8.5mm\nTrọng lượng\n\n186 gram\nChất liệu mặt lưng\n\nNhựa\nChất liệu khung viền\n\nKim loại\nThông số khác\n\nHệ thống làm mát\n\nKhông\nChỉ số kháng nước, bụi\n\nKhông\nCông nghệ âm thanh\n\nCông nghệ Dirac 3.0\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng\nTính năng đặc biệt\n\nBảo mật vân tay, Nhận diện khuôn mặt\nThông tin chung\n\nThời điểm ra mắt\n\n09/2022"\r\n', 6, NULL, 'realme C30s 2GB 32GB', '1900', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/e/realme-c30s-den-glr--009.jpg', '', '', 10, b'1', NULL),
	(25, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.52 inches\nCông nghệ màn hình\n\nTFT LCD\nTính năng màn hình\n\nTần số quét 90 Hz, 500 nits\nCorning® Gorilla® Glass 3\nCamera sau\n\nCamera sau\n\nCamera chính: 50 MP, f/1.8\nCamera macro: 2 MP\nCamera đo độ sâu: 2 MP\nTính năng camera\n\nChế độ ban đêm\nChế độ chân máy\nChân dung AI\nCamera trước\n\nCamera trước\n\n8 MP, FF f/2.0, 1.12µm CMOS\nVi xử lý & đồ họa\n\nChipset\n\nUnisoc T606\nLoại CPU\n\n2 x A75 and 2 x A55 @ 1.6GHz\nRAM & lưu trữ\n\nDung lượng RAM\n\n4 GB\nBộ nhớ trong\n\n128 GB\nPin & công nghệ sạc\n\nPin\n\n5050 mAh\nCông nghệ sạc\n\nSạc nhanh 20W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nHệ điều hành\n\nAndroid™ 12\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n802.11 a/b/g/n/ac\nBluetooth\n\nv5.0\nGPS\n\nGPS/AGPS, GLONASS, BDS, Galileo\nThiết kế & Trọng lượng\n\nKích thước\n\n8.48 x 165 x 76.19 mm\nTrọng lượng\n\n195.23 g\nChất liệu mặt lưng\n\nNhựa\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP52\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, Cảm biến áp kế"\r\n', 7, NULL, 'Nokia G22 4GB 128GB', '578', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/d/g/dgtyi8899_.jpg', '', '', 10, b'1', NULL),
	(26, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.5 inches\nCông nghệ màn hình\n\nIPS LCD\nĐộ phân giải màn hình\n\n720 x 1600 pixel\nKiểu màn hình\n\nGiọt nước\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50MP, AF\nCamera macro: 2 MP\nQuay video\n\n1080p@30fps\nTính năng camera\n\nChế độ ban đêm, Chế độ chân dung, Auto HDR\nCamera trước\n\nCamera trước\n\n8 MP\nVi xử lý & đồ họa\n\nChipset\n\nUnisoc SC9863A (28nm)\nLoại CPU\n\nOcta-Core xung nhịp lên đến 1.6 GHz\nGPU\n\nIMG8322\nRAM & lưu trữ\n\nDung lượng RAM\n\n4 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nMicroSD lên đến 256GB (khe cắm riêng biệt)\nPin & công nghệ sạc\n\nPin\n\n5050 mAh\nCông nghệ sạc\n\nSạc 10W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n802.11 b/g/n\nBluetooth\n\nv5.2\nGPS\n\nGPS/AGPS/Galileo\nThiết kế & Trọng lượng\n\nKích thước\n\n164.6mm x 75.9mm x 8.55mm |\nTrọng lượng\n\n199.4g\nChất liệu mặt lưng\n\nKính\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP52\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, Cảm biến áp kế"\r\n', 7, NULL, 'Nokia C32 4GB 128GB', '987', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-c32_3_.png', '', '', 10, b'1', NULL),
	(27, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.7 inches\nCông nghệ màn hình\n\nTFT LCD\nĐộ phân giải màn hình\n\n720 x 1600 pixel\nTính năng màn hình\n\nTần số quét 60 Hz\nMặt kính cong 2.5D, 400 nits\nCamera sau\n\nCamera sau\n\nCamera sau: 13MP + 2MP độ sâu trường ảnh + 2MP macro, đèn flash\nQuay video\n\n1080p@30fps\nTính năng camera\n\nChế độ chụp đêm, Chế độ chân dung, HDR, Ứng dụng camera từ Google\nCamera trước\n\nCamera trước\n\n5 MP\nVi xử lý & đồ họa\n\nChipset\n\nUnisoc 9863A1\nLoại CPU\n\n4 nhân 1.6 GHz & 4 nhân 1.2 GHz\nGPU\n\nIMG PowerVR GE8322\nRAM & lưu trữ\n\nDung lượng RAM\n\n4 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nHỗ trợ thẻ nhớ mở rộng MicroSD lên đến 256GB\nPin & công nghệ sạc\n\nPin\n\n5050 mAh\nCông nghệ sạc\n\nSạc 10W, Chế độ siêu tiết kiệm pin\nCổng sạc\n\nMicro-USB\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nWi-Fi\n\nWIFI 802.11 b/g/n\nBluetooth\n\nv4.2\nGPS\n\nGPS/AGPS\nThiết kế & Trọng lượng\n\nKích thước\n\n169.2mm x 77.98mm x 8.6mm\nTrọng lượng\n\n200gr\nChất liệu mặt lưng\n\nNhựa\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP52\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay mặt lưng\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, Cảm biến áp kế\nThông tin chung\n\nThời điểm ra mắt\n\n10/2022"\r\n', 7, NULL, 'Nokia C31 4GB 128GB', '1100', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_250_1.jpg', '', '', 10, b'1', NULL),
	(28, '"Tặng sạc dự phòng và balo Danny Store  \n\nMàn hình\n\nKích thước màn hình\n\n2.4 inches\nCông nghệ màn hình\n\nTFT LCD\nĐộ phân giải màn hình\n\n240 x 320 pixels\nCamera sau\n\nCamera sau\n\n0.3 MP\nVi xử lý & đồ họa\n\nChipset\n\nUnisoc T107 (22 nm)\nLoại CPU\n\n1.0 GHz Cortex-A7\nRAM & lưu trữ\n\nBộ nhớ trong\n\n128 MB\nKhe cắm thẻ nhớ\n\nmicroSDHC, hỗ trợ thẻ nhớ mở rộng lên đến 32GB\nPin & công nghệ sạc\n\nPin\n\nLi-Ion 1450 mAh\nThời gian đàm thoại trên điện thoại lên đến 6 tiếng với 4G\nTai nghe earbuds lên đến 2.4 tiếng đàm thoại và đến 4 tiếng nghe nhạc\nCông nghệ sạc\n\nSạc 2.75W\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nS30+\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nBluetooth\n\n5.0, A2DP, LE\nGPS\n\nKhông\nThiết kế & Trọng lượng\n\nKích thước\n\n138.9 x 57.7 x 16.2 mm\nTrọng lượng\n\n129.1 g"\r\n', 7, NULL, 'Nokia 5710 XpressAudio', '980', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/n/o/nokia-5701.jpg', '', '', 10, b'1', NULL),
	(29, '"Giảm 20% với hóa đơn trên 50 triệu \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2448 pixels (FullHD+)\nTính năng màn hình\n\nCorning® Gorilla® Glass Victus, Delta-E < 1, 165Hz\nTần số quét\n\nTừ 144Hz trở lên\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50 MP, f/1.9\nCamera góc siêu rộng: 13 MP\nCamera Macro: 5 MP\nQuay video\n\n8K@24fps, 4K@30/60fps, 1080p@30/60fps, 720p@480fps\nTính năng camera\n\nHDR, toàn cảnh\nCamera trước\n\nCamera trước\n\n32 MP\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nQualcomm Snapdragon 8 Gen2\nLoại CPU\n\nQcta-core CPUs,3.2 Ghz\nGPU\n\nAdreno 740\nRAM & lưu trữ\n\nDung lượng RAM\n\n16 GB\nBộ nhớ trong\n\n512 GB\nPin & công nghệ sạc\n\nPin\n\n6000 mAh\nCông nghệ sạc\n\nSạc nhanh 65W, hỗ trợ Quick Charge 5.0 và PD Charging\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\n802.11 be/ax/ac/a/b/g/n\nBluetooth\n\nv5.3\nGPS\n\nGNSS, Glonass (L1), Galileo (E1/E5a), BeiDou(B1i/B1c/B2a), QZSS (L1/L5) and NavIC\nThiết kế & Trọng lượng\n\nTrọng lượng\n\n246g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhôm\nThông số khác\n\nChỉ số kháng nước, bụi\n\nIP54\nTiện ích khác\n\nCảm biến siêu âm cho AirTrigger và tay cầm\nCông nghệ âm thanh\n\nDirac HD Sound,Hi-Res Audio, 2 loa\nBa micrô với Công nghệ Giảm tiếng ồn của ASUS\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay, Nhận diện khuôn mặt, Kháng nước, kháng bụi"\r\n', 8, NULL, 'ASUS ROG Phone 7 Ultimate', '3367', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_365.jpg', '', '', 10, b'1', NULL),
	(30, '"Giảm 20% với hóa đơn trên 50 triệu \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2448 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 165 Hz\nCorning® Gorilla® Glass Victus\nDelta-E < 1\nTần số quét\n\nTừ 144Hz trở lên\nKiểu màn hình\n\nĐục lỗ (Nốt ruồi)\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50 MP, f/1.9\nCamera góc siêu rộng: 13 MP\nCamera Macro: 5 MP\nQuay video\n\n8K@24fps, 4K@30/60fps, 1080p@30/60fps, 720p@480fps\nTính năng camera\n\nHDR, toàn cảnh\nCamera trước\n\nCamera trước\n\n32 MP\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nQualcomm Snapdragon 8 Gen2\nGPU\n\nAdreno 740\nRAM & lưu trữ\n\nDung lượng RAM\n\n16 GB\nBộ nhớ trong\n\n512 GB\nPin & công nghệ sạc\n\nPin\n\n6.000 mAh\nCông nghệ sạc\n\nSạc nhanh 65 W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\n802.11 be/ax/ac/a/b/g/n\nBluetooth\n\nv5.3\nGPS\n\nGNSS, Glonass (L1), Galileo (E1/E5a), BeiDou(B1i/B1c/B2a), QZSS (L1/L5) and NavIC\nThiết kế & Trọng lượng\n\nTrọng lượng\n\n239g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nNhôm\nThông số khác\n\nHệ thống làm mát\n\nAeroActive Cooler 7\nChỉ số kháng nước, bụi\n\nIP54\nTiện ích khác\n\nCảm biến siêu âm cho AirTrigger và tay cầm\nCông nghệ âm thanh\n\nDirac HD Sound\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay, Nhận diện khuôn mặt, Kháng nước, kháng bụi"\r\n', 8, NULL, 'ASUS ROG Phone 7 16GB 512GB', '3341', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_366.jpg', '', '', 10, b'1', NULL),
	(31, '"Giảm 15% với hóa đơn trên 35 triệu \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2448 pixels (FullHD+)\nTính năng màn hình\n\n1 tỷ màu, Tần số quét màn hình 165Hz, HDR10+, Độ sáng màn hình 800 nits (typ) và 1200 nits (peak), Corning Gorilla Glass Victus, Delta-E < 1\nCamera sau\n\nCamera sau\n\nCamera chính góc rộng: 50 MP, f/1.9, PDAF\nCamera góc siêu rộng:13 MP, f/2.2\nCamera macro: 5 MP\nQuay video\n\n8K@24fps, 4K@30/60/120fps, 1080p@30/60/120/240fps, 720p@480fps; gyro-EIS\nTính năng camera\n\nLED flash, HDR, panorama, lấy nét theo pha\nCamera trước\n\nCamera trước\n\n12 MP\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon® 8+ Gen 1\nLoại CPU\n\n1 nhân 3.19 GHz Cortex-X2\n3 nhân 2.75 GHz Cortex-A710\n4 nhân 1.80 GHz Cortex-A510\nGPU\n\nAdreno 730\nRAM & lưu trữ\n\nDung lượng RAM\n\n16 GB\nBộ nhớ trong\n\n512 GB\nPin & công nghệ sạc\n\nPin\n\n6000 mAh\nCông nghệ sạc\n\nSạc nhanh 65W\nSạc ngược 10W\nPower Delivery 3.0\nQuick Charge 5\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 12\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi 802.11 a/b/g/n/ac/6e, tri-band, Wi-Fi Direct, hotspot\nBluetooth\n\n5.2, A2DP, LE, aptX HD, aptX Adaptive\nGPS\n\nGPS, A-GPS. Up to dual-band: GLONASS (1), BDS (2), GALILEO (2), QZSS (2), NavIC\nThiết kế & Trọng lượng\n\nKích thước\n\n173 x 77x 10.4 mm\nTrọng lượng\n\n239g\nChất liệu mặt lưng\n\nKính\nThông số khác\n\nHệ thống làm mát\n\nGameCool 6 với 3 cơ chế làm mát\nChỉ số kháng nước, bụi\n\nIPX4\nTiện ích khác\n\nHệ thống đèn nhiều lựa chọn màu sắc, Công nghệ AIRTRIGGER\nCông nghệ âm thanh\n\nHệ thống âm thanh GameFX, công nghệ Snapdragon Sound™ và bộ phần mềm mã hóa aptX™ Adaptive, loa stereo kép\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nThông tin chung\n\nThời điểm ra mắt\n\n08/2022"\r\n', 8, NULL, 'ASUS ROG Phone 6 16GB 512GB ', '3678', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/s/asus-rog-phone-6-12gb-256gb_2.png', '', '', 10, b'1', NULL),
	(32, '"Giảm 15% với hóa đơn trên 35 triệu \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2448 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 144Hz, hỗ trợ hiển thị 1 tỷ màu, HDR10+, độ sáng tối đa 1200 nits\nTần số quét\n\nTừ 144Hz trở lên\nKiểu màn hình\n\nTràn viền (Không khiếm khuyết)\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 64 MP, f/1.8, PDAF\nCamera góc siêu rộng: 13 MP, f/2.4, 11mm, 125˚\nCamera macro"" 5 MP, f/2.0\nQuay video\n\n8K@30fps, 4K@30/60/120fps, 1080p@30/60/120/240fps, 720p@480fps\nTính năng camera\n\nHDR, Siêu cận (Macro), Góc siêu rộng (Ultrawide), Toàn cảnh (Panorama)\nCamera trước\n\nCamera trước\n\n24 MP, f/2.5\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nSnapdragon 888 (5 nm)\nLoại CPU\n\n1x2.84 GHz Kryo 680 & 3x2.42 GHz Kryo 680 & 4x1.80 GHz Kryo 680\nGPU\n\nAdreno 660\nRAM & lưu trữ\n\nDung lượng RAM\n\n16 GB\nBộ nhớ trong\n\n256 GB\nKhe cắm thẻ nhớ\n\nKhông\nPin & công nghệ sạc\n\nPin\n\n6000 mAh\nCông nghệ sạc\n\nSạc nhanh 65W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 11, ROG UI\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n5G\nWi-Fi\n\nWi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot\nBluetooth\n\n5.2, A2DP, LE, aptX HD, aptX Adaptive\nGPS\n\n2 băng tần, hỗ trợ A-GPS, GLONASS, GALILEO, BDS, QZSS, NavIC\nThiết kế & Trọng lượng\n\nKích thước\n\n172.8 x 77.3 x 10.3 mm\nTrọng lượng\n\n238 g\nChất liệu mặt lưng\n\nKính\nChất liệu khung viền\n\nKim loại\nThông số khác\n\nHệ thống làm mát\n\nAeroActive Cooler 5\nCông nghệ âm thanh\n\nDirac HD Sound, The GameFX, Hi-res Audio\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến áp kế\nTính năng đặc biệt\n\nHỗ trợ 5G, Bảo mật vân tay\nThông tin chung\n\nThời điểm ra mắt\n\n03/2021"\r\n', 8, NULL, 'ASUS ROG Phone 5', '4000', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/s/asus-rog-phone-5_0002_gsmarena_001.jpg', '', '', 10, b'1', NULL),
	(33, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nTFT LCD\nĐộ phân giải màn hình\n\n1080x2460 pixels\nTính năng màn hình\n\nTần số quét 120Hz, tần số cảm ứng 240Hz, 580 nits\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50 MP, f/1.66, PDAF\nCamera chiều sâu: f/2.0\nQuay video\n\n1440p@30fps, 1080p@30fps\nTính năng camera\n\nDual LED flash\nCamera trước\n\nCamera trước\n\n8 MP, f/2.0\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nMediatek MT8781 Helio G99 (6nm)\nLoại CPU\n\n2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55\nGPU\n\nMali-G52 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nPin & công nghệ sạc\n\nPin\n\n6000mAh\nCông nghệ sạc\n\nSạc nhanh 45W\nSạc ngược 10W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nHỗ trợ mạng\n\n4G\nBluetooth\n\nv5.0\nThiết kế & Trọng lượng\n\nKích thước\n\n168.6 x 76.6 x 9 mm\nChất liệu mặt lưng\n\nNhựa\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nHệ thống làm mát\n\nLàm mát bằng chất lỏng VC\nCông nghệ âm thanh\n\nLoa âm thanh nổi\nÂm thanh DTS loa kép\nChứng nhận Hi-Res\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nThông tin chung\n\nThời điểm ra mắt\n\n06/2023"\r\n', 9, NULL, 'Tecno POVA 5 8GB 128GB', '567', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-pova-5_2_.png', '', '', 10, b'1', NULL),
	(34, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nTFT LCD\nĐộ phân giải màn hình\n\n1080x2460 pixels\nTính năng màn hình\n\nTần số quét 120Hz, tần số cảm ứng 240Hz, 580 nits\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 50 MP, f/1.66, PDAF\nCamera chiều sâu: f/2.0\nQuay video\n\n1440p@30fps, 1080p@30fps\nTính năng camera\n\nDual LED flash\nCamera trước\n\nCamera trước\n\n8 MP, f/2.0\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nMediatek MT8781 Helio G99 (6nm)\nLoại CPU\n\n2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55\nGPU\n\nMali-G52 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nPin & công nghệ sạc\n\nPin\n\n6000mAh\nCông nghệ sạc\n\nSạc nhanh 45W\nSạc ngược 10W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nHỗ trợ mạng\n\n4G\nBluetooth\n\nv5.0\nThiết kế & Trọng lượng\n\nKích thước\n\n168.6 x 76.6 x 9 mm\nChất liệu mặt lưng\n\nNhựa\nChất liệu khung viền\n\nNhựa\nThông số khác\n\nHệ thống làm mát\n\nLàm mát bằng chất lỏng VC\nCông nghệ âm thanh\n\nLoa âm thanh nổi\nÂm thanh DTS loa kép\nChứng nhận Hi-Res\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nThông tin chung\n\nThời điểm ra mắt\n\n06/2023"\r\n', 9, NULL, 'Tecno POVA 5 8GB 256GB', '478', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-pova-5_2__1.png', '', '', 10, b'1', NULL),
	(35, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.67 inches\nCông nghệ màn hình\n\nAMOLED\nĐộ phân giải màn hình\n\n1080 x 2400 pixels (FullHD+)\nTính năng màn hình\n\nTần số quét 120Hz\nMàn chắn nắng HBM\nLoại màn hình\n\nMàn hình\nCamera sau\n\nCamera sau\n\nCamera góc rộng: 64 MP, f/1.7, 25mm, 1/1.7"", 0.8µm, PDAF\nMáy ảnh đo chiều sâu: 2 MP, f/2.4\nQuay video\n\n1080p@30fps\nTính năng camera\n\nĐèn flash LED vòng, toàn cảnh, HDR\nCamera trước\n\nCamera trước\n\nCamera góc rộng: 32 MP, f/2.5, 24mm, 1/2.8"", 0.8µm\nQuay video trước\n\n1080p@30fps\nVi xử lý & đồ họa\n\nChipset\n\nHelio G99 (6nm)\nLoại CPU\n\n2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55\nGPU\n\nMali-G57 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n256 GB\nPin & công nghệ sạc\n\nPin\n\n5000 mAh\nCông nghệ sạc\n\nSạc nhanh 33W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid 13\nHồng ngoại\n\nKhông\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nKhông\nHỗ trợ mạng\n\n4G\nThiết kế & Trọng lượng\n\nKích thước\n\n163.4 x 76.7 x 8.2 mm\nChất liệu mặt lưng\n\nKim loại\nChất liệu khung viền\n\nKim loại\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay trong màn hình\nCác loại cảm biến\n\nCảm biến gia tốc, Cảm biến tiệm cận, La bàn, Cảm biến áp kế\nThông số khác\n\nCông nghệ - Tiện ích\n\nThư viện AL v5.0\nMàn hình luôn hiển thị\nCông nghệ âm thanh\n\nLoa âm thanh nổi\nThông tin chung\n\nThời điểm ra mắt\n\n05/2023"\r\n', 9, NULL, 'Tecno Camon 20 Pro', '689', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-camon-20-1_2.png', '', '', 10, b'1', NULL),
	(36, '"Tặng sạc dự phòng và balo Danny Store \n\nMàn hình\n\nKích thước màn hình\n\n6.78 inches\nCông nghệ màn hình\n\nIPS LCD\nĐộ phân giải màn hình\n\n2460x1080 pixels\nTính năng màn hình\n\nTốc độ làm tươi 90Hz, 580 nit\nCamera sau\n\nCamera sau\n\n50MP\nTính năng camera\n\nĐèn flash, HDR, Quay video Time Lapse 2k, chế độ làm đẹp, chế độ chụp đêm, quay phim chế độ chuyên nghiệp, Chụp AR, video chân dung, lấy nét thông minh,\nCamera trước\n\nCamera trước\n\n32MP\nVi xử lý & đồ họa\n\nChipset\n\nHelio G88\nGPU\n\nMali-G57 MC2\nRAM & lưu trữ\n\nDung lượng RAM\n\n8 GB\nBộ nhớ trong\n\n128 GB\nKhe cắm thẻ nhớ\n\nCó hỗ trợ\nPin & công nghệ sạc\n\nPin\n\n5000mAh\nCông nghệ sạc\n\nSạc nhanh 18W\nCổng sạc\n\nUSB Type-C\nGiao tiếp & kết nối\n\nThẻ SIM\n\n2 SIM (Nano-SIM)\nHệ điều hành\n\nAndroid™ T\nJack tai nghe 3.5\n\nCó\nCông nghệ NFC\n\nCó\nHỗ trợ mạng\n\n4G\nWi-Fi\n\n2.4G/5G\nBluetooth\n\n5.3\nGPS\n\nGPS+GLONASS+Beidou+Galileo\nThiết kế & Trọng lượng\n\nKích thước\n\n168.41 x 76.21 x 8.46mm\nTrọng lượng\n\n191 g\nTiện ích khác\n\nCảm biến vân tay\n\nCảm biến vân tay cạnh bên\nCác loại cảm biến\n\nCảm biến tiệm cận, Cảm biến ánh sáng, La bàn, Con quay hồi chuyển, Cảm biến trọng lực"\r\n', 9, NULL, 'Tecno Spark 10 8GB 128GB', '934.0', 1, 1, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/tecno-spark-10_5_.png', '', '', 9, b'1', NULL);

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
    `start_day_promotion` datetime DEFAULT NULL,
    `percent_value` float DEFAULT NULL,
    `description_promotion` varchar(255) DEFAULT NULL,
    `name_promotion` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.promotion: ~7 rows (approximately)
REPLACE INTO `promotion` (`id`, `end_day_promotion`, `start_day_promotion`, `percent_value`, `description_promotion`, `name_promotion`) VALUES
	(1, NULL, NULL, 0, 'Giữ nguyên giá', 'Mặc định'),
	(2, NULL, NULL, 5, 'Giảm 5% giá trị sản phẩm', 'Chào mừng hè'),
	(3, NULL, NULL, 12, 'Giảm 12% giá trị sản phẩm', 'Xả hàng cuối năm'),
	(4, NULL, NULL, 15, 'Giảm 15% giá trị sản phẩm', 'Kỉ niệm 1 năm thành lập'),
	(5, NULL, NULL, 25, 'Giảm 25% giá trị sản phẩm', 'Khuyến mại tuần'),
	(6, NULL, NULL, 25, 'Giảm 25% giá trị sản phẩm', 'Khuyến mại tuần'),
	(7, NULL, NULL, 50, 'Giảm giá tận 50% luôn', 'Giảm giá cực sốc');

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
    ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table danny-store-db.user: ~13 rows (approximately)
REPLACE INTO `user` (`id`, `active`, `address`, `avatar`, `created_at`, `gender`, `modified_at`, `name`, `password`, `password_reset_token`, `password_reset_token_expiry_date`, `phone`, `role`, `username`) VALUES
	(1, b'1', 'Nam Dinh', 'None', '2023-11-15 15:00:19', '1', NULL, 'Đạt pro vip', '$2a$10$.mHniwHnIa0QrR.UXC4Y4.c2gAA6/mFmCbJg3to28SGxJaJbb1HPm', NULL, NULL, '1234567890', 'admin', 'admin@gmail.com'),
	(2, b'1', 'Ha noi', 'None', '2023-10-11 13:42:21', '1', NULL, 'Nam', '$2a$10$L1ivD7VswYqLXaP7bUM3NOvQFFxQNnuyOztsxbS5vYnsYTd8TpMYC', NULL, NULL, '1234567890', 'warehouse', 'warehouse@gmail.com'),
	(3, b'1', 'Nghe An', 'None', '2023-10-11 13:42:27', '1', NULL, 'Hieu', '$2a$10$g0Iu28fkjnfbAKO7RrdjhOA71mxjNfjkKNUFnq5IVeKd6QKmrlo6.', NULL, NULL, '1234567890', 'sales', 'sales@gmail.com'),
	(4, b'1', 'Hai phong', 'None', '2023-10-11 13:42:32', '1', NULL, 'Vu', '$2a$10$yqtSK81T16bro8QI5LKs3uWtn.n7xTEgK3a9uyr39D6HBYmRlvyIO', NULL, NULL, '1234567890', 'customer', 'customer@gmail.com'),
	(5, b'1', 'Nam Dinh', 'None', '2023-10-11 14:19:17', '1', NULL, 'Hoang', '$2a$10$dZ5cgij0mhq7bTpE5W8IL.ZXgUpJXKv/bYvvXF0SlMpO3YKDb/Bbq', NULL, NULL, '1234567890', 'customer', 'customer2@gmail.com'),
	(6, b'1', 'TP HCM', NULL, '2023-10-25 15:37:49', '1', NULL, 'Hai', '$2a$10$kM3.oYwcDwekxQxeM1ZAdelQL0dbcA7oGFAP3bRoCKRLpa7f09uo2', NULL, NULL, '1234567890', 'customer', 'dat123@gmail.com'),
	(7, b'1', NULL, NULL, '2023-11-09 13:49:08', '1', NULL, 'Chien', '$2a$10$MlNFjaBFG66hNpq/uoqiC.aTObdaGDl7IGEvSQ5KB.XY1G4yd6PI.', NULL, NULL, '12345', 'customer', 'pqc@gmail.com'),
	(8, b'1', 'XXX', NULL, '2023-11-15 14:48:08', '', NULL, 'dat', '$2a$10$CKpcvlLYWmvJUxgMuje8XOPbPDsadhW.FHjypcPXhjOx3TotbXN5W', NULL, NULL, '1234567890', 'customer', 'dat12333@gmail.com'),
	(9, b'1', 'XXX', NULL, '2023-11-15 14:53:51', 'female', NULL, 'dat', '$2a$10$Xwgl9Fv1lnM8DdqCAnntKup3h9hwGqgo9qbRxAXnaMk8wF30mecRi', NULL, NULL, '1234567890', 'customer', 'dat123334444@gmail.com'),
	(10, b'1', 'XXXXXXXX', NULL, '2023-11-15 14:58:06', '', NULL, 'dat', '$2a$10$QTlAeq/IIpuVJwJh.scL5us0nv7UlSzcbjtwSXdnV4xL8yUpmNqwy', NULL, NULL, '1234567890', 'customer', '123123123@gmail.com'),
	(11, b'1', 'aaaaaaa', NULL, '2023-11-15 14:54:39', 'female', NULL, 'dat222222333', '$2a$10$.wDI5I95MF1j.87hiKTZU.JOc6LjWnGbM3BgAd3QLt/ZjvUBkUCnO', NULL, NULL, '123123524123', 'customer', '234234234234@gmail.comm'),
	(12, b'1', 'Hà Nội', NULL, '2023-11-25 03:23:29', '1', NULL, 'Customer', '$2a$10$qI6aqHQrrpge7AXIr2Z70eSQ0Q6AYfEnEQuom0Vpxz2H1aHcjhHni', NULL, NULL, '12345', 'customer', 'customer112233'),
	(13, b'1', 'Ha Noi', NULL, '2023-11-25 05:06:04', '1', NULL, 'Nguyen Thanh Dat', '$2a$10$Eay3yGOiAHGsftNC.q2YnOeCmCF2K2gW18H9HLJYjWN9myM.FzDSW', NULL, NULL, '12345', 'customer', 'dat123');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
