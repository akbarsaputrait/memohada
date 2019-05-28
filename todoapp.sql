-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 28 Bulan Mei 2019 pada 15.12
-- Versi server: 5.7.24
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todoapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorys`
--

DROP TABLE IF EXISTS `categorys`;
CREATE TABLE IF NOT EXISTS `categorys` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'pr', 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-12 01:03:16', '2019-05-12 01:03:16'),
(2, 'pr', 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-12 01:03:40', '2019-05-12 01:03:40'),
(3, 'pr', 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-12 01:07:44', '2019-05-12 01:07:44'),
(4, 'pr', 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-12 01:11:08', '2019-05-12 01:11:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_11_155311_create_todo', 1),
(4, '2019_05_11_155646_create_todo_category', 1),
(5, '2019_05_11_155742_create_category', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `todos`
--

DROP TABLE IF EXISTS `todos`;
CREATE TABLE IF NOT EXISTS `todos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `todos`
--

INSERT INTO `todos` (`id`, `title`, `description`, `deadline`, `color`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Tugas A', NULL, NULL, NULL, 'f5069b73-8172-43e8-9133-31469700ad59', '2019-05-12 01:21:26', '2019-05-12 01:16:36', '2019-05-12 01:21:26'),
(2, 'Tugas A', 'Ini adalah tugas A', '2019-04-21 00:00:00', NULL, 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-13 08:43:50', '2019-05-14 00:29:42'),
(3, 'Tugas B', NULL, '1970-01-01 00:00:00', '#194d33', 'f5069b73-8172-43e8-9133-31469700ad59', '2019-05-14 03:01:47', '2019-05-14 02:16:11', '2019-05-14 03:01:47'),
(4, 'Tugas C', 'Ini adalah tugas C', '2019-05-13 00:00:00', '#4D4D4D', 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-14 02:21:47', '2019-05-14 02:21:47'),
(5, 'Tugas D', 'Ini adalah tugas D', '2019-05-30 00:00:00', '#194d33', 'f5069b73-8172-43e8-9133-31469700ad59', '2019-05-14 03:10:09', '2019-05-14 02:41:59', '2019-05-14 03:10:09'),
(6, 'Tugas E', 'Ini adalah tugas E', '2019-05-22 00:00:00', '#68CCCA', 'f5069b73-8172-43e8-9133-31469700ad59', '2019-05-14 03:09:43', '2019-05-14 02:55:46', '2019-05-14 03:09:43'),
(7, 'Tugas D', 'Ini adalah tugas D', '2019-05-29 00:00:00', '#FCDC00', 'f5069b73-8172-43e8-9133-31469700ad59', NULL, '2019-05-14 03:10:47', '2019-05-14 03:10:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `todo_categorys`
--

DROP TABLE IF EXISTS `todo_categorys`;
CREATE TABLE IF NOT EXISTS `todo_categorys` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `todo_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `todo_categorys`
--

INSERT INTO `todo_categorys` (`id`, `todo_id`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, '2019-05-12 01:03:40', '2019-05-12 01:03:40'),
(2, 3, 3, NULL, '2019-05-12 01:07:44', '2019-05-12 01:07:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `photo`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'f5069b73-8172-43e8-9133-31469700ad59', 'Akbar', 'Saputra', 'akbar@gmail.com', NULL, '$2y$10$QdxWtPA2dVJlFM7PDwYchORpx6evIFnCpzM9PNoLFomc4aXkFYkqa', NULL, NULL, NULL, '2019-05-11 23:59:51', '2019-05-11 23:59:51');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
