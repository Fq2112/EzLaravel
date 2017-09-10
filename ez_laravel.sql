-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2017 at 06:30 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ez_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `url`, `name`, `lastname`, `address`, `education`, `skills`, `biography`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'fq.jpg', 'Fiqy Ainuzzaqy', 'Super Admin', 'Jl. Hikmat 50A Betro, Sedati, Sidoarjo', 'D3 Manajemen Informatika, Universitas Negeri Surabaya', 'PHP, Laravel, HTML, JavaScript', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.', 'rm.rabbitmedia@gmail.com', '$2y$10$AIu5u3B2WGtsXYu/1CkfAOJMFImKEpol9yptp1UKSSmmUeLCwC.oW', 'QlQk6yDFxWuP9uw0pc0P51sUhffvrUtbghYJ0xtEVyqo6zwgStA9qtWYAcqU', '2017-05-11 08:12:42', '2017-05-27 02:42:44', NULL),
(2, 'adi.jpg', 'Adi Prasetiyo', 'Ux Designer', 'Jalan Raya Juanda, Sidoarjo', 'D3 Manajemen Informatika - Universitas Negeri Surabaya', 'HTML, CSS, JS', 'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet', 'adi@yahoo.com', '$2y$10$0b7rZUm4rQuALssoPFhv2OHpqD7BJatqP92M9I6i/rVx8vZtvvENy', 'JtGqt9g14fE02ZPYtseLOFjO8I1eDOoMbQXdht5Kg6iN7dC2mFzzIpdx3MN3', '2017-05-11 08:16:25', '2017-05-26 11:09:32', NULL),
(3, 'aguk.jpg', 'M Aguk Nur Anggraini', 'Editor', 'Bangil, Pasuruan', 'D3 Manajemen Informatika, Universitas Negeri Surabaya', 'HTML', 'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet', 'agukadmin@yahoo.com', '$2y$10$p3.PObL64KaKlbnfNGzbYuwH6CtxECIjSoqm3J5zwdJprE5zri1wu', 'bv4TQNGDP8kCbqSRzaf1FnNjM4gZHqs8bmaaMGaj3u4XeE5AJkIkDpxRB6I2', '2017-05-12 02:54:24', '2017-05-31 23:54:57', NULL),
(9, NULL, 'Rangga', 'Editor', NULL, NULL, NULL, NULL, 'rangga@yahoo.com', '$2y$10$puPC0K4I06hYt2cH5CYkXef4DJQGJDnXcRfb27EtwnaO8NfawGjAO', NULL, '2017-05-25 17:07:17', '2017-05-25 17:07:26', '2017-05-25 17:07:26'),
(10, NULL, 'Aguk', 'Editor', NULL, NULL, NULL, NULL, 'aguk@aguk.com', '$2y$10$94g.yPj/QNrlqshFyRoQ2.dYd3mM3GDxwT/e7wGnvgp/2u6nZcbeO', 'qMuzU81zzH4V5YW0uNrkopsgWp0q9yNCxOcNx8GC3SOcUrmVLb91FiDJRmLj', '2017-05-25 21:03:25', '2017-05-25 21:07:42', NULL),
(11, NULL, 'test', 'test', NULL, NULL, NULL, NULL, 'test@test.com', '$2y$10$bIXaHINudlaYe8wK/CyzUem3gkRQceLhkBaD.uYs8eY1BgJXxNyMO', NULL, '2017-05-25 21:40:16', '2017-05-25 21:40:16', NULL),
(12, NULL, 'rezky', 'Editor', NULL, NULL, NULL, NULL, 'rezky@rezky.com', '$2y$10$SS1ZIxZ9dJ81k.Ha0OW0y.Y8KUVyUkTrwTdOSgqMzfRG2qsrnxO1y', '19P7PTJMnMLUXwWKDsL1355rSUOoUdqlaJBaGBMQrJ2EYHflNngAE1h8jHHc', '2017-07-29 21:14:01', '2017-07-29 21:16:14', '2017-07-29 21:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Bali', '2017-05-08 07:42:03', '2017-05-08 07:42:03'),
(2, 'Surabaya', '2017-05-08 07:42:13', '2017-05-08 07:42:13'),
(3, 'Malang', '2017-05-08 07:42:21', '2017-05-08 07:42:21'),
(4, 'Yogyakarta', '2017-05-08 07:42:48', '2017-05-08 07:42:48'),
(5, 'Bandung', '2017-05-09 17:00:00', '2017-05-09 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Fiqy Ainuzzaqy', 'fiqy_a@yahoo.com', '8563094333', 'dasdasdas', '2017-05-11', '12:17:33'),
(2, 'Mokhamad Aguk Nur Anggraini', 'aguk@yahoo.com', '2132132', 'asdasdasdas', '2017-05-11', '12:18:33'),
(3, 'Adi Prasetiyo', 'adi@yahoo.com', '13123321', 'lorem ipsum dolor sit amet', '2017-05-03', '00:00:00'),
(5, 'Rabbit Media', 'rm.rabbitmedia@gmail.com', '08563094333', 'GGWP!', '2017-05-17', '08:46:09'),
(6, 'mokhamad anggaaa', 'ananana@gm.com', '987314987', 'ahhyasdjhgf ahgsdhjwedvnas sagfha sfdutewd sjgdfhatd j', '2017-05-24', '09:33:04'),
(7, 'rezky', 'rezky@rezky.com', '12312412', 'ashjdbaskjdbasd', '2017-07-04', '05:18:44'),
(8, 'sholeh', 'sh@yahoo.com', '8563094333', 'fuck you!!', '2017-07-30', '04:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `img_gallery` varchar(255) NOT NULL,
  `rating` float(10,1) NOT NULL,
  `category` varchar(88) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `img_gallery`, `rating`, `category`) VALUES
(1, 'Ez Travel - Head Office', '\r\nJL. Dukuh Kupang Timur XX, Kav. 788, Kompleks Diponggo, Pakis, Kec. Sawahan, Kota SBY, Jawa Timur 60256', -7.290050, 112.717964, '', 5.0, '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_05_10_061311_create_table_cities', 1),
(4, '2017_05_10_061332_create_table_tours', 1),
(5, '2017_05_10_170735_create_table_tourforms', 2),
(6, '2017_05_11_115437_create_table_contacts', 3),
(7, '2017_05_11_134508_createAdminTable', 4),
(8, '2017_05_12_070352_create_roles_table', 5),
(9, '2017_05_12_070449_create_role_admins_table', 5),
(10, '2017_05_14_090954_create_social_providers_table', 6),
(11, '2017_05_14_095920_create_table_social_providers', 7),
(12, '2017_05_18_143821_create_travels_table', 8),
(13, '2017_05_18_145257_create_operators_table', 8),
(14, '2017_05_19_025814_create_travelforms_table', 9),
(15, '2017_05_20_101056_create_tourpicts_table', 10),
(16, '2017_06_02_032203_create_vouchers_table', 11),
(17, '2017_09_09_123741_create_payment_methods_table', 12),
(18, '2017_09_09_130152_create_form_tours_table', 13),
(19, '2017_09_09_130600_Foreign', 14),
(20, '2017_09_09_130755_Foreign2', 15),
(21, '2017_09_09_173741_TableForeignTour', 16);

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kendaraan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `no_pol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `nama`, `jenis_kendaraan`, `kapasitas`, `no_pol`, `created_at`, `updated_at`) VALUES
(1, 'PO Eka', 'Mini Bus', 32, 'W 111 W', '2017-05-15 17:00:00', '2017-05-15 17:00:00'),
(2, 'PO Putri Kembar', 'Big Bus', 60, 'W 111 SE', '2017-05-23 17:00:00', '2017-05-23 17:00:00'),
(3, 'PO Pusaka Baru', 'Micro Bus', 15, 'L 3531 XX', '2017-05-28 17:00:00', '2017-05-28 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('fiqyainuzzaqy@mhs.unesa.ac.id', '$2y$10$.uEPY/CJ8qWO0886HKUJr.a7AT2y0HpAiBxJA51ptxAU311JD3ijW', '2017-05-11 11:50:38'),
('rm.rabbitmedia@gmail.com', '$2y$10$ZTJYxfrmflb68mYHf1FISO2cpkTQXvPiardNBGWyzDmb8OB9LX.za', '2017-05-13 05:28:48'),
('test@test.com', '$2y$10$OThzVA7ggBziI6U6ZmNTb.HBzfaMDBfHzY.utVrVYcdPKlaPsCdoi', '2017-05-28 11:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `nama`, `kode`) VALUES
(1, 'BCA', 'bca'),
(2, 'BNI', 'bni'),
(3, 'Alfamart', 'alf'),
(4, 'Indomaret', 'ind');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_providers`
--

INSERT INTO `social_providers` (`id`, `user_id`, `provider_id`, `provider`, `created_at`, `updated_at`) VALUES
(2, 7, '74899243', 'twitter', '2017-05-14 22:17:59', '2017-05-14 22:17:59'),
(3, 7, '1739671939376625', 'facebook', '2017-05-14 22:19:30', '2017-05-14 22:19:30'),
(4, 8, '111982369979466316804', 'google', '2017-05-14 22:29:06', '2017-05-14 22:29:06'),
(6, 11, '19623652', 'github', '2017-05-16 04:47:09', '2017-05-16 04:47:09'),
(8, 13, '105969150370416569103', 'google', '2017-05-21 23:50:40', '2017-05-21 23:50:40'),
(9, 14, '113111412036858349183', 'google', '2017-05-21 23:51:10', '2017-05-21 23:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `tourforms`
--

CREATE TABLE `tourforms` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_payment` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `jml_orang` int(11) NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tourforms`
--

INSERT INTO `tourforms` (`id`, `id_payment`, `name`, `email`, `phone`, `total`, `destination`, `tgl_keberangkatan`, `jml_orang`, `catatan`, `created_at`, `updated_at`) VALUES
(0000000001, 1, 'Fiqy Ainuzzaqy', 'rm.rabbitmedia@gmail.com', '8563094333', 3002000, 'Bali, Paket A', '2017-09-14', 2, NULL, '2017-09-09', '2017-09-09 10:52:43'),
(0000000002, 1, 'Fiqy Ainuzzaqy', 'test@test.com', '08563094333', 2999990, 'Bali, Paket A', '2017-09-11', 2, NULL, '2017-09-10', '2017-09-09 21:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `tourforms2`
--

CREATE TABLE `tourforms2` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `id_payment` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `jml_orang` int(11) NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tourforms2`
--

INSERT INTO `tourforms2` (`id`, `id_payment`, `name`, `email`, `phone`, `total`, `destination`, `tgl_keberangkatan`, `jml_orang`, `catatan`, `created_at`, `updated_at`) VALUES
(0000000002, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '08563094333', 3000000, 'Malang, Paket B', '2017-05-12', 4, 'test', '2017-05-16', '2017-05-16 11:29:49'),
(0000000003, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '08563094333', 7000000, 'Yogyakarta, Paket B', '2017-05-16', 7, NULL, '2017-05-16', '2017-05-16 11:58:10'),
(0000000004, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '08563094333', 2700000, 'Yogyakarta, Paket A', '2017-06-02', 2, NULL, '2017-05-16', '2017-05-16 12:02:13'),
(0000000005, 0, 'Fiqy Ainuzzaqy', 'aguk@yahoo.com', '8563094333', 3000000, 'Bali, Paket A', '2017-05-19', 2, 'asdasdasd', '2017-05-17', '2017-05-16 19:35:16'),
(0000000006, 0, 'Mokhamad Aguk Nurrrrrr', 'aguk@yahoo.com', '2384723748324', 10500000, 'Bali, Paket A', '2017-05-18', 7, NULL, '2017-05-17', '2017-05-16 19:38:00'),
(0000000007, 0, 'Rabbit', 'fiqyainuzzaqy@mhs.unesa.ac.id', '08563094333', 10500000, 'Bali, Paket A', '2017-05-24', 7, NULL, '2017-05-18', '2017-05-18 02:06:03'),
(0000000008, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '08563094333', 7000000, 'Bali, Paket B', '2017-05-27', 7, NULL, '2017-05-18', '2017-05-18 03:41:15'),
(0000000009, 0, 'ahaj', 'aguk@yahoo.com', '7812238', 1250000, 'Malang, Paket A', '2017-05-19', 1, 'bhdshs', '2017-05-18', '2017-05-18 08:57:33'),
(0000000010, 0, 'angga aguk', 'anggapim@gmai.com', '89818738213', 5000000, 'Bali, Paket B', '2017-11-22', 5, 'akuuuuu', '2017-05-24', '2017-05-24 02:24:16'),
(0000000011, 0, 'mokhamad', 'ananana@gm.com', '123', 3000000, 'Bali, Paket A', '2017-05-11', 2, 'as', '2017-05-24', '2017-05-24 04:24:55'),
(0000000012, 0, 'test', 'test@test.com', '1321321321321', 10800000, 'Yogyakarta, Paket A', '2017-10-18', 8, NULL, '2017-05-24', '2017-05-24 09:03:09'),
(0000000013, 0, 'aaaaaa', 'asdsa@dss', '1231331', 1500000, 'Malang, Paket B', '2017-05-31', 2, 'ss', '2017-05-26', '2017-05-25 21:20:00'),
(0000000014, 0, 'Fiqy Ainuzzaqy', 'alfinnasrul11@gmail.com', '085630543214', 1000000, 'Bali, Paket B', '2017-05-27', 1, 'fgf', '2017-05-26', '2017-05-26 10:24:53'),
(0000000015, 0, 'Fiqy Ainuzzaqy', 'alfinnasrul11@gmail.com', '085630543214', 1000000, 'Bali, Paket B', '2017-05-27', 1, 'fgf', '2017-05-26', '2017-05-26 10:25:30'),
(0000000016, 0, 'Qweer Adasd', 'qwer@gmail.com', '081234567890', 2500000, 'Malang, Paket A', '2017-05-30', 2, NULL, '2017-05-28', '2017-05-28 07:29:23'),
(0000000017, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '08563094333', 6250000, 'Malang, Paket A', '2017-06-16', 5, 'tidak ada', '2017-05-30', '2017-05-29 22:37:53'),
(0000000018, 0, 'Adi', 'adi@adi.com', '743781423', 3000000, 'Bali, Paket A', '2017-06-09', 2, NULL, '2017-06-01', '2017-05-31 23:47:39'),
(0000000019, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '12312331', 3000000, 'Bali, Paket A', '2017-06-03', 2, NULL, '2017-06-02', '2017-06-01 20:17:07'),
(0000000020, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '213123123', 4500000, 'Bali, Paket A', '2017-06-03', 3, NULL, '2017-06-02', '2017-06-01 20:38:56'),
(0000000021, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '213123123', 0, 'Bali, Paket A', '2017-06-03', 3, NULL, '2017-06-02', '2017-06-01 20:43:31'),
(0000000022, 0, 'Rezky', 'rezky@rezky.com', '13213213213', 12000000, 'Bali, Paket A', '2017-07-05', 8, NULL, '2017-07-04', '2017-07-03 21:26:50'),
(0000000023, 0, 'dada', 'paha@dada.com', '21324547', 10000000, 'Bali, Paket B', '2017-07-04', 10, NULL, '2017-07-04', '2017-07-03 22:02:29'),
(0000000024, 0, 'hgdhjsda', 'hvdha@gnaua.com', '7789', 10000000, 'Bali, Paket B', '2017-07-18', 10, NULL, '2017-07-16', '2017-07-15 22:12:07'),
(0000000025, 0, 'Fiqy Ainuzzaqy', 'fqnkk2124@gmail.com', '08563094333', 7000000, 'Bali, Paket B', '2017-07-30', 7, NULL, '2017-07-30', '2017-07-29 20:56:22'),
(0000000026, 0, 'Fiqy Ainuzzaqy', 'fiqy_a@yahoo.com', '08563094333', 2000000, 'Bali, Paket B', '2017-08-03', 2, NULL, '2017-08-03', '2017-08-02 21:30:46'),
(0000000027, 0, 'Fiqy Ainuzzaqy', 'rm.rabbitmedia@gmail.com', '8563094333', 3000000, 'Bali, Paket A', '2017-12-12', 2, 'sadasd', '2017-09-02', '2017-09-02 01:44:55'),
(0000000028, 0, 'Fiqy Ainuzzaqy', 'rm.rabbitmedia@gmail.com', '8563094333', 3000000, 'Bali, Paket A', '2017-12-12', 2, 'sadasd', '2017-09-02', '2017-09-02 05:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `tourpicts`
--

CREATE TABLE `tourpicts` (
  `id` int(10) UNSIGNED NOT NULL,
  `tour_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tourpicts`
--

INSERT INTO `tourpicts` (`id`, `tour_id`, `url`, `caption`, `created_at`, `updated_at`) VALUES
(1, 1, 'tanah_lot.jpg', 'Tanah Lot', NULL, NULL),
(2, 1, 'gwk.jpg', 'GWK (Garuda Wisnu Kencana)', NULL, NULL),
(3, 1, 'bali.jpg', 'Pantai Kuta', NULL, NULL),
(4, 2, 'tanah_lot.jpg', 'Tanah Lot', NULL, NULL),
(5, 2, 'gwk.jpg', 'GWK (Garuda Wisnu Kencana)', NULL, NULL),
(6, 2, 'bali.jpg', 'Pantai Kuta', NULL, NULL),
(7, 2, 'sukawati.jpg', 'Pasar Sukowati', NULL, NULL),
(8, 2, 'pandawa.jpg', 'Pantai Pandawa', NULL, NULL),
(9, 3, 'jatimpark.jpg', 'Jatim Park 1', NULL, NULL),
(10, 3, 'jatimpark2.jpg', 'Jatim Park 2', NULL, NULL),
(11, 3, 'bns.jpg', 'BNS (Batu Night Spectacular)', NULL, NULL),
(12, 3, 'predatorfunpark.jpg', 'Predator Fun Park', NULL, NULL),
(13, 3, 'safari.jpg', 'Taman Safari Indonesia II', NULL, NULL),
(14, 4, 'jatimpark.jpg', 'Jatim Park 1', NULL, NULL),
(15, 4, 'jatimpark2.jpg', 'Jatim Park 2', NULL, NULL),
(16, 4, 'bns.jpg', 'BNS (Batu Night Spectacular)', NULL, NULL),
(17, 4, 'predatorfunpark.jpg', 'Predator Fun Park', NULL, NULL),
(18, 4, 'safari.jpg', 'Taman Safari Indonesia II', NULL, NULL),
(19, 4, 'bromo.jpg', 'Gunung Bromo', NULL, NULL),
(20, 4, 'madakaripura.jpg', 'Air Terjun Madakaripura', NULL, NULL),
(21, 5, 'malioboro.jpg', 'Malioboro', NULL, NULL),
(22, 5, 'prambanan.jpg', 'Candi Prambanan', NULL, NULL),
(23, 5, 'borobudur3.jpg', 'Candi Borobudur', NULL, NULL),
(24, 6, 'malioboro.jpg', 'Malioboro', NULL, NULL),
(25, 6, 'prambanan.jpg', 'Candi Prambanan', NULL, NULL),
(26, 6, 'borobudur3.jpg', 'Candi Borobudur', NULL, NULL),
(27, 6, 'parangtritis.jpg', 'Pantai Parangtritis', NULL, NULL),
(28, 7, 'see you on tuesday.jpg', 'TEST', '2017-06-01 00:34:28', '2017-06-01 00:34:28'),
(29, 7, 'see you on friday.jpg', 'TEST2', '2017-06-01 00:38:28', '2017-06-01 00:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `paket` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `durasi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fasilitas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transportasi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `url`, `city_id`, `paket`, `durasi`, `harga`, `keterangan`, `fasilitas`, `transportasi`, `created_at`, `updated_at`) VALUES
(1, 'gwk.jpg', 1, 'Paket B', '3 Hari 2 Malam', 1000000, 'Bali Tour, Paket B. Destinasi paket tour ini adalah Tanah Lot, Garuda Wisnu Kencana, dan Pantai Kuta.', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Pemandu Wisata atau Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Port Charger | Reclining Seat | Toilet', '2017-05-08 15:00:29', '2017-05-27 03:06:49'),
(2, 'tanah_lot.jpg', 1, 'Paket A', '4 Hari 3 Malam', 1500000, 'Bali Tour, Paket A. Destinasi paket tour ini adalah Tanah Lot, Garuda Wisnu Kencana, Pantai Kuta, Pasar Sukawati, dan Pantai Pandawa. ', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Malam ke 3 menginap di hotel bintang 3 | Pemandu Wisata / Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Wi-Fi | Port Charger | Reclining Seat | Selimut dan Bantal | Toilet | Smoking Room', '2017-05-08 15:00:29', '2017-05-08 15:00:29'),
(3, 'jatimpark.jpg', 3, 'Paket B', '3 Hari 2 Malam', 750000, 'Malang Tour, Paket B. Destinasi paket tour ini adalah Jatimpark 1, Jatimpark 2, BNS, Predator Fun Park, dan Taman Safari Indonesia II.', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Pemandu Wisata atau Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Port Charger | Reclining Seat | Toilet', '2017-05-08 15:00:29', '2017-05-27 02:27:36'),
(4, 'bromo.jpg', 3, 'Paket A', '4 Hari 3 Malam', 1250000, 'Malang Tour, Paket A. Destinasi paket tour ini adalah Jatimpark 1, Jatimpark 2, BNS, Predator Fun Park, Taman Safari Indonesia II, Gunung Bromo, dan Air Terjun Madakaripura. ', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Malam ke 3 menginap di hotel bintang 3 | Pemandu Wisata / Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Wi-Fi | Port Charger | Reclining Seat | Selimut dan Bantal | Toilet | Smoking Room', '2017-05-08 15:00:29', '2017-05-08 15:00:29'),
(5, 'malioboro.jpg', 4, 'Paket B', '3 Hari 2 Malam', 1000000, 'Yogyakarta Tour, Paket B. Destinasi paket tour ini adalah Malioboro, Candi Prambanan, dan Candi Borobudur. ', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Pemandu Wisata atau Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Port Charger | Reclining Seat | Toilet', '2017-05-08 15:00:29', '2017-05-08 15:00:29'),
(6, 'borobudur3.jpg', 4, 'Paket A', '4 Hari 3 Malam', 1350000, 'Yogyakarta Tour, Paket B. Destinasi paket tour ini adalah Malioboro, Candi Prambanan, Candi Borobudur dan Pantai Parangtritis. ', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Malam ke 3 menginap di hotel bintang 3 | Pemandu Wisata / Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Wi-Fi | Port Charger | Reclining Seat | Selimut dan Bantal | Toilet | Smoking Room', '2017-05-08 15:00:29', '2017-05-08 15:00:29'),
(7, 'Harga-Tiket-Masuk-Surabaya-Carnival.jpg', 2, 'Paket A', '2 Hari 1 Malam', 300000, 'Surabaya Tour, Paket A, Destinasi paket tour ini adalah Surabaya Nigt Carnival, Kenjeran Park, dan Wisata Mangrove Wonorejo', 'Transportasi selama tour | Makan selama tour | Penginapan selama tour | Pemandu Wisata / Tour Guide | Biaya masuk wisata, dan biaya lain selama tour (kecuali biaya pribadi)', 'Full AC | Air Suspension | TV + Music Player | Wi-Fi | Port Charger | Reclining Seat | Selimut dan Bantal | Toilet | Smoking Room', '2017-06-01 00:01:50', '2017-06-01 00:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `travelforms`
--

CREATE TABLE `travelforms` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kendaraan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_pol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tujuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handphone` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `jadwal_keberangkatan` time NOT NULL,
  `tgl_datang` date NOT NULL,
  `jadwal_datang` time NOT NULL,
  `jml_orang` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `travelforms`
--

INSERT INTO `travelforms` (`id`, `operator`, `jenis_kendaraan`, `no_pol`, `asal`, `tujuan`, `name`, `email`, `handphone`, `tgl_keberangkatan`, `jadwal_keberangkatan`, `tgl_datang`, `jadwal_datang`, `jml_orang`, `total`, `note`, `created_at`, `updated_at`) VALUES
(0000000002, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'Fiqy Ainuzzaqy', 'fqnkk2124@gmail.com', '08563094333', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 8, 440000, NULL, '2017-05-19', '2017-05-18 21:21:49'),
(0000000003, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'Fiqy Ainuzzaqy', 'fqnkk2124@gmail.com', '08563094333', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 8, 440000, 'PAKAI CATERING', '2017-05-19', '2017-05-19 00:44:16'),
(0000000004, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'Ad', 'adi@unesa.ac.id', '082230830233', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 2, 110000, 'ok', '2017-05-22', '2017-05-22 08:13:35'),
(0000000005, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'mokhamad', 'ananana@gm.com', '2314143', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 3, 165000, 'asead', '2017-05-24', '2017-05-24 02:36:17'),
(0000000006, 'PO Putri Kembar', 'Big Bus', 'W 111 SE', 'Blitar', 'Sidoarjo', 'test', 'test@test.com', '1321321321321', '2017-06-03', '05:00:00', '2017-06-03', '11:00:00', 8, 472000, NULL, '2017-05-24', '2017-05-24 09:24:49'),
(0000000007, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'Fahmi', 'fahmi@yahoo.com', '0852342342342', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 4, 220000, NULL, '2017-05-25', '2017-05-25 05:22:51'),
(0000000008, 'PO Putri Kembar', 'Big Bus', 'W 111 SE', 'Blitar', 'Sidoarjo', 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '08563094333', '2017-06-03', '05:00:00', '2017-06-03', '11:00:00', 4, 236000, NULL, '2017-05-29', '2017-05-29 09:38:45'),
(0000000009, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'Adi', 'adi@adi.com', '77213213', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 3, 165000, 'sadsadasd', '2017-06-01', '2017-05-31 23:45:48'),
(0000000010, 'PO Putri Kembar', 'Big Bus', 'W 111 SE', 'Blitar', 'Sidoarjo', 'sembarang', 'sembarang@sembarang.com', '123145345', '2017-06-03', '05:00:00', '2017-06-03', '11:00:00', 12, 708000, NULL, '2017-06-03', '2017-06-02 21:41:08'),
(0000000011, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Sidoarjo', 'Fiqy Ainuzzaqy', 'fiqy_a@icloud.com', '354', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 10, 550000, NULL, '2016-06-03', '2016-06-02 22:19:36'),
(0000000012, 'PO Eka', 'Mini Bus', 'W 111 W', 'Blitar', 'Surabaya', 'Fiqy Ainuzzaqy', 'fiqy_a@yahoo.com', '08563094333', '2017-08-03', '13:00:00', '2017-08-03', '20:00:00', 2, 120000, NULL, '2017-08-03', '2017-08-02 21:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `id` int(10) UNSIGNED NOT NULL,
  `operator_id` int(10) UNSIGNED NOT NULL,
  `asal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tujuan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_berangkat` date NOT NULL,
  `jadwal_berangkat` time NOT NULL,
  `tgl_datang` date NOT NULL,
  `jadwal_datang` time NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `travels`
--

INSERT INTO `travels` (`id`, `operator_id`, `asal`, `tujuan`, `tgl_berangkat`, `jadwal_berangkat`, `tgl_datang`, `jadwal_datang`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'Blitar', 'Sidoarjo', '2017-06-03', '07:00:00', '2017-06-03', '13:00:00', 55000, '2017-03-31 17:00:00', '2017-04-25 17:00:00'),
(2, 1, 'Blitar', 'Surabaya', '2017-06-03', '13:00:00', '2017-06-03', '20:00:00', 60000, '2017-03-31 17:00:00', '2017-04-25 17:00:00'),
(3, 2, 'Sidoarjo', 'Surabaya', '2017-06-03', '07:00:00', '2017-06-03', '09:00:00', 45000, '2017-04-04 17:00:00', '2017-04-25 17:00:00'),
(4, 2, 'Surabaya', 'Sidoarjo', '2017-06-03', '13:00:00', '2017-06-03', '15:00:00', 60000, '2017-04-05 17:00:00', '2017-04-25 17:00:00'),
(5, 3, 'Kediri', 'Surabaya', '2017-06-03', '07:00:00', '2017-06-03', '14:00:00', 65000, '2017-04-10 17:00:00', '2017-04-25 17:00:00'),
(6, 3, 'Sidoarjo', 'Kediri', '2017-06-03', '13:00:00', '2017-06-03', '19:00:00', 70000, '2017-04-19 17:00:00', '2017-04-25 17:00:00'),
(7, 2, 'Blitar', 'Sidoarjo', '2017-06-03', '05:00:00', '2017-06-03', '11:00:00', 59000, '2017-04-26 17:00:00', '2017-04-25 17:00:00'),
(8, 1, 'blitar', 'Surabaya', '2017-06-04', '12:00:00', '2017-06-04', '17:00:00', 50000, '2017-06-01 00:56:03', '2017-06-01 00:56:03'),
(9, 1, 'blitar', 'Surabaya', '2017-06-04', '07:00:00', '2017-06-04', '12:00:00', 60000, '2017-06-01 00:59:18', '2017-06-01 00:59:18'),
(10, 2, 'blitar', 'Kediri', '2017-06-03', '08:00:00', '2017-06-03', '10:00:00', 50000, '2017-06-01 01:03:09', '2017-06-01 01:03:09'),
(11, 2, 'blitar', 'Kediri', '2017-06-03', '07:00:00', '2017-06-03', '09:00:00', 50000, '2017-06-01 01:04:09', '2017-06-01 01:04:09'),
(12, 2, 'blitar', 'Kediri', '2017-06-03', '14:00:00', '2017-06-03', '16:00:00', 50000, '2017-06-01 01:05:43', '2017-06-01 01:05:43'),
(13, 1, 'blitar', 'Malang', '2017-06-03', '06:00:00', '2017-06-03', '08:00:00', 55000, '2017-06-01 01:10:18', '2017-06-01 01:10:18'),
(14, 1, 'blitar', 'Malang', '2017-06-03', '10:00:00', '2017-06-03', '12:00:00', 60000, '2017-06-01 01:12:17', '2017-06-01 01:12:17'),
(15, 2, 'blitar', 'Malang', '2017-06-03', '04:00:00', '2017-06-03', '06:00:00', 53000, '2017-06-01 01:13:21', '2017-06-01 01:13:21'),
(16, 3, 'blitar', 'Malang', '2017-06-04', '05:00:00', '2017-06-04', '07:00:00', 52000, '2017-06-01 01:15:28', '2017-06-01 01:15:28'),
(17, 2, 'blitar', 'Malang', '2017-06-04', '19:00:00', '2017-06-04', '21:00:00', 52000, '2017-06-01 01:16:24', '2017-06-01 01:16:24'),
(18, 2, 'blitar', 'Sidoarjo', '2017-06-04', '19:00:00', '2017-06-04', '21:00:00', 53000, '2017-06-01 01:18:25', '2017-06-01 01:18:25'),
(19, 3, 'kediri', 'Sidoarjo', '2017-06-03', '08:00:00', '2017-06-03', '12:00:00', 60000, '2017-06-01 01:20:45', '2017-06-01 01:20:45'),
(20, 2, 'kediri', 'Sidoarjo', '2017-06-03', '19:00:00', '2017-06-03', '23:00:00', 65000, '2017-06-01 01:21:42', '2017-06-01 01:21:42'),
(21, 2, 'kediri', 'Sidoarjo', '2017-06-04', '15:00:00', '2017-06-04', '19:00:00', 63000, '2017-06-01 01:25:44', '2017-06-01 01:25:44'),
(22, 1, 'blitar', 'Sidoarjo', '2017-06-04', '21:00:00', '2017-06-04', '13:00:00', 65000, '2017-06-01 01:27:34', '2017-06-01 01:27:34'),
(23, 3, 'blitar', 'Sidoarjo', '2017-06-04', '05:00:00', '2017-06-04', '09:00:00', 61000, '2017-06-01 01:28:37', '2017-06-01 01:28:37'),
(24, 2, 'kediri', 'Surabaya', '2017-06-03', '18:00:00', '2017-06-03', '22:00:00', 59000, '2017-06-01 01:30:22', '2017-06-01 01:30:22'),
(25, 1, 'blitar', 'Surabaya', '2017-06-04', '04:00:00', '2017-06-04', '08:00:00', 58000, '2017-06-01 01:31:26', '2017-06-01 01:31:26'),
(26, 1, 'blitar', 'Surabaya', '2017-06-04', '10:00:00', '2017-06-04', '14:00:00', 65000, '2017-06-01 01:33:17', '2017-06-01 01:33:17'),
(27, 3, 'blitar', 'Malang', '2017-06-03', '18:00:00', '2017-06-03', '19:00:00', 50000, '2017-06-01 01:34:55', '2017-06-01 01:34:55'),
(28, 1, 'blitar', 'Malang', '2017-06-03', '09:00:00', '2017-06-03', '10:00:00', 50000, '2017-06-01 01:35:37', '2017-06-01 01:35:37'),
(29, 2, 'kediri', 'Malang', '2017-06-03', '07:00:00', '2017-06-03', '09:00:00', 50000, '2017-06-01 01:36:47', '2017-06-01 01:36:47'),
(30, 1, 'kediri', 'Malang', '2017-06-03', '20:00:00', '2017-06-03', '22:00:00', 52000, '2017-06-01 01:37:42', '2017-06-01 01:37:42'),
(31, 3, 'kediri', 'Malang', '2017-06-04', '19:00:00', '2017-06-04', '23:00:00', 50000, '2017-06-01 01:43:08', '2017-06-01 01:43:08'),
(32, 3, 'kediri', 'Blitar', '2017-06-03', '09:00:00', '2017-06-03', '13:00:00', 75000, '2017-06-01 01:44:59', '2017-06-01 01:44:59'),
(33, 1, 'kediri', 'Surabaya', '2017-06-04', '08:00:00', '2017-06-04', '10:00:00', 55000, '2017-06-01 01:46:33', '2017-06-01 01:46:33'),
(34, 1, 'malang', 'Kediri', '2017-06-04', '11:00:00', '2017-06-04', '13:00:00', 80000, '2017-06-01 01:49:38', '2017-06-01 01:49:38'),
(35, 2, 'malang', 'Kediri', '2017-06-04', '09:00:00', '2017-06-04', '11:00:00', 50000, '2017-06-01 02:10:57', '2017-06-01 02:10:57'),
(36, 1, 'sidoarjo', 'Malang', '2017-06-03', '08:00:00', '2017-06-03', '09:00:00', 70000, '2017-06-01 02:11:58', '2017-06-01 02:11:58'),
(37, 1, 'Blitar', 'Surabaya', '2017-08-03', '13:00:00', '2017-08-03', '20:00:00', 60000, '2017-07-31 17:00:00', '2017-08-02 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verifyToken` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `verifyToken`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'Fiqy Ainuzzaqy', NULL, 'fiqy_a@yahoo.com', NULL, '', 0, 'CR1X44lQwbGSY1g7UKNaFdlXUWxVdUC8XTeq33CBLdrNuwBxJO8JShQByN6s', '2017-05-15', '2017-05-14 22:17:59', NULL),
(8, 'Fiqy Ainuzzaqy', NULL, 'fqnkk2124@gmail.com', NULL, '', 0, 'vSQBZrSimno6PO92mBuQXGDjwypNkMRyg7v4hD48KgyhOzFBlSTA3muleOQ1', '2017-05-15', '2017-05-14 22:29:06', NULL),
(11, 'Fiqy Ainuzzaqy', NULL, 'fiqy_a@icloud.com', NULL, '', 0, 'gBvuetIZZRtABwPPiefmWAyPgpwyD1wuSvcVXiVrKneqAFjk7Zi80MuBjAF2', '2017-05-16', '2017-05-16 04:47:09', NULL),
(12, 'test', 'test', 'test@test.com', '$2y$10$fQOSIwTH4GtjrH3HpgmToOT7zhviP1kzo1bZJUfgZ2BaOpbCi9MaW', NULL, 1, 'l2iwrSG22gxGCcGf64TLZktmxlnocVWH6aOoxwP4Qq07FzDxsQQ4FHhNhSep', '2017-05-22', '2017-05-21 23:38:31', NULL),
(13, 'Rabbit Media', NULL, 'rm.rabbitmedia@gmail.com', NULL, NULL, 0, 'lt62jrYh9UvxlegDbXcWD9wFbebvCb5EhmVdmzXg2FcAaai9AKJ8Uf8bf4No', '2017-05-22', '2017-05-21 23:50:40', NULL),
(14, 'fiqy ainuzzaqy', NULL, 'fiqyainuzzaqy@mhs.unesa.ac.id', NULL, NULL, 0, 'tBMTvUfOHZGgBieik1ou1XynYuJtPXpgFnNf2rLmk6HtKRxkwJXNVNb3E4aF', '2017-05-22', '2017-05-21 23:51:10', NULL),
(15, 'Ad', 'Proadsas', 'adi@unesa.ac.id', '$2y$10$i9YdIxwQk4JloosJIrxiHusvCeKcOQbsLWPQ3Frk041vehsu7drua', NULL, 1, NULL, '2017-05-22', '2017-05-28 07:34:49', '2017-05-28 07:34:49'),
(17, 'mokhamad', 'aguk', 'ananana@gmail.com', '$2y$10$m1/JxPASjtZKzYWAA1aocu/5uJgEdBpWMzbB1TrJDJ1hjY7Sib8C.', NULL, 1, 'KuErjFtcse5AXnrU4xvtb4H4idlhlartQyTZM8xLjBOtEcBjHpHQRArgh8dH', '2017-05-24', '2017-05-27 00:40:54', NULL),
(19, 'Fahmi', 'Rizki', 'fahmi@yahoo.com', '$2y$10$ZrJgqyP9Pm2/F/Qe1t/WGu2TJvVEmlJ0qWHzDIEcTJcpSl/mZnJ3C', NULL, 1, 'P7uQ2D3CBGHRPrjpcdvgx72ljXpPzy3OvyoRHRXHzDSN1mM9HiaFeQSqGsR8', '2017-05-25', '2017-05-25 07:21:14', '2017-05-25 07:21:14'),
(20, 'alfin', 'nasrul', 'alfinnasrul11@gmail.com', '$2y$10$o0z.GnK2jQGtMT7Qnudb3e37qME/DK8hQz5duRFog2CrzRapupggG', NULL, 1, 'hNuVuqsxw68Elibnhp3eUsir5KumCmbYlliyvp5lUoIEOcGL77izzvOZeyIG', '2017-05-26', '2017-05-27 03:43:46', NULL),
(21, 'ilham', 'puji', 'ilhamsaputra@mhs.unesa.ac.id', '$2y$10$vu7UWHnNg5TDWyfrQYkUH..AMD8uqKGWwJGg8jk3dD.4kRQkoPppq', NULL, 1, NULL, '2017-05-28', '2017-05-28 03:42:44', NULL),
(22, 'Adi', 'Prasetiyo', 'adi@adi.com', '$2y$10$.OAwjiyYNFTyTsa129gQJeKrZPEITZZBQrs7.RJxKCorWrZp2BTBi', NULL, 1, NULL, '2017-06-01', '2017-05-31 23:30:13', NULL),
(23, 'saya', 'dia', 'aa@yahoo.com', '$2y$10$XvH8Niesfot7X4nkTwbll.g3fgA7n9YDK745F6OHAInmMOPAF4UDq', NULL, 1, NULL, '2017-06-01', '2017-06-01 07:01:29', NULL),
(24, 'Irza', 'ass', 'irza@gmai.com', '$2y$10$TtHEJhsKgSSsOdMpZhOUWOAaebXwvW41eGjzNdYsZvD01QgZeamoO', NULL, 1, NULL, '2017-06-02', '2017-06-01 23:27:28', NULL),
(25, 'sembarang', 'mu', 'sembarang@sembarang.com', '$2y$10$DnDr4mRT4vlaTKpybagGve/isJOIi/uyzPY1l2Mxih19mNGjfDOVS', NULL, 1, '7QN6hKvbKBCmI0fehCxoEAqOvOWYISMdopgvZTv3R74xDiGa88oFKDpfZXxv', '2017-07-04', '2017-07-03 22:14:16', NULL),
(26, 'fikri', 'baharudin', 'fikri@yahoo.com', '$2y$10$6Gly2cOeWbuPokwG1izGsuag5a5Pu2hnNheGFar1qHC4Db0EAt1TW', NULL, 1, NULL, '2017-07-30', '2017-07-29 21:18:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `voucher` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `voucher`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'uas2016', 'diskon 10%', NULL, NULL),
(2, 'uas2017', 'diskon 100%', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tourforms`
--
ALTER TABLE `tourforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_form_id_payment_foreign` (`id_payment`);

--
-- Indexes for table `tourforms2`
--
ALTER TABLE `tourforms2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tourpicts`
--
ALTER TABLE `tourpicts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travelforms`
--
ALTER TABLE `travelforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tourforms`
--
ALTER TABLE `tourforms`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tourforms2`
--
ALTER TABLE `tourforms2`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tourpicts`
--
ALTER TABLE `tourpicts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `travelforms`
--
ALTER TABLE `travelforms`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `travels`
--
ALTER TABLE `travels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tourforms`
--
ALTER TABLE `tourforms`
  ADD CONSTRAINT `tour_form_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `payment_methods` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
