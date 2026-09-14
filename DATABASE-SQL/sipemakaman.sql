-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Sep 2026 pada 08.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipemakaman`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `uptd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tpu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_type`, `user_id`, `user_name`, `action`, `model`, `model_id`, `description`, `uptd_id`, `tpu_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 'AdminTpu', 1, 'Admin TPU Pandu', 'create', NULL, NULL, 'Menambah makam TEST-APROVE-01', 4, 1, '127.0.0.1', '2026-09-07 01:21:04', '2026-09-08 00:58:52'),
(2, 'AdminTpu', 1, 'Admin TPU Pandu', 'approve', NULL, NULL, 'Mengajukan permintaan hapus', 4, 1, '127.0.0.1', '2026-09-07 01:21:10', '2026-09-08 00:58:52'),
(3, 'SuperAdmin', 1, 'Super Administrator', 'delete', NULL, NULL, 'Menyetujui & menghapus Makam', NULL, NULL, '127.0.0.1', '2026-09-07 01:21:33', '2026-09-07 01:21:33'),
(4, 'AdminTpu', 1, 'Admin TPU Pandu', 'create', NULL, NULL, 'Menambah almarhum Test Langsung Hapus', 4, 1, '127.0.0.1', '2026-09-07 01:22:09', '2026-09-08 00:58:52'),
(5, 'AdminTpu', 1, 'Admin TPU Pandu', 'delete', NULL, NULL, 'Menghapus almarhum Test Langsung Hapus', 4, 1, '127.0.0.1', '2026-09-07 01:22:40', '2026-09-08 00:58:52'),
(6, 'AdminTpu', 1, 'Admin TPU Pandu', 'create', NULL, NULL, 'Menambah makam TEST-REJECT-01', 4, 1, '127.0.0.1', '2026-09-07 01:22:58', '2026-09-08 00:58:52'),
(7, 'AdminTpu', 1, 'Admin TPU Pandu', 'approve', NULL, NULL, 'Mengajukan permintaan hapus', 4, 1, '127.0.0.1', '2026-09-07 01:22:58', '2026-09-08 00:58:52'),
(8, 'Uptd', 1, 'UPTD I Kota Bandung', 'reject', NULL, NULL, 'Menolak permintaan hapus', 1, NULL, '127.0.0.1', '2026-09-07 01:22:59', '2026-09-07 01:22:59'),
(9, 'SuperAdmin', 1, 'Super Administrator', 'delete', NULL, NULL, 'Menghapus makam TEST-REJECT-01', NULL, 1, '127.0.0.1', '2026-09-07 01:23:05', '2026-09-07 01:23:05'),
(10, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 19:33:32', '2026-09-07 19:33:32'),
(11, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah Admin TPU Admin TPU Pandu', NULL, 1, '127.0.0.1', '2026-09-07 19:36:49', '2026-09-07 19:36:49'),
(12, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-07 19:38:54', '2026-09-08 00:58:52'),
(13, 'AdminTpu', 1, 'Admin TPU Pandu', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 0 diperbarui, 483 dilewati', 4, 1, '127.0.0.1', '2026-09-07 19:39:27', '2026-09-08 00:58:52'),
(14, 'AdminTpu', 1, 'Admin TPU Pandu', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 0 diperbarui, 483 dilewati', 4, 1, '127.0.0.1', '2026-09-07 19:40:52', '2026-09-08 00:58:52'),
(15, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-07 19:49:13', '2026-09-07 19:49:13'),
(16, 'Uptd', 3, 'UPTD II Kota Bandung', 'import', NULL, NULL, 'Import Excel almarhum: 1 dibuat, 0 diperbarui, 0 dilewati', 3, NULL, '127.0.0.1', '2026-09-07 20:42:21', '2026-09-07 20:42:21'),
(17, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 20:47:19', '2026-09-07 20:47:19'),
(18, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-07 20:51:49', '2026-09-07 20:51:49'),
(19, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 20:53:33', '2026-09-07 20:53:33'),
(20, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-07 20:54:18', '2026-09-08 00:58:52'),
(21, 'AdminTpu', 1, 'Admin TPU Pandu', 'approve', NULL, NULL, 'Mengajukan permintaan hapus', 4, 1, '127.0.0.1', '2026-09-07 20:55:15', '2026-09-08 00:58:52'),
(22, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 20:55:49', '2026-09-07 20:55:49'),
(23, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 21:06:49', '2026-09-07 21:06:49'),
(24, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah TPU TPU Pandu', 1, 1, '127.0.0.1', '2026-09-07 21:14:47', '2026-09-07 21:14:47'),
(25, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-07 21:25:13', '2026-09-07 21:25:13'),
(26, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-07 21:29:38', '2026-09-08 00:58:52'),
(27, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 21:47:12', '2026-09-07 21:47:12'),
(28, 'SuperAdmin', 2, 'Super Admin Utama', 'reject', NULL, NULL, 'Menolak permintaan hapus', NULL, NULL, '127.0.0.1', '2026-09-07 21:55:14', '2026-09-07 21:55:14'),
(29, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-07 21:56:19', '2026-09-08 00:58:52'),
(30, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 22:00:22', '2026-09-07 22:00:22'),
(31, 'SuperAdmin', 2, 'Super Admin Utama', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 0 diperbarui, 483 dilewati', NULL, NULL, '127.0.0.1', '2026-09-07 22:00:48', '2026-09-07 22:00:48'),
(32, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-07 22:14:32', '2026-09-07 22:14:32'),
(33, 'SuperAdmin', 2, 'Super Admin Utama', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 0 diperbarui, 483 dilewati', NULL, NULL, '127.0.0.1', '2026-09-07 22:14:54', '2026-09-07 22:14:54'),
(34, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 00:01:01', '2026-09-08 00:58:52'),
(35, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 00:04:31', '2026-09-08 00:04:31'),
(36, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 00:05:50', '2026-09-08 00:05:50'),
(37, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 00:07:08', '2026-09-08 00:58:52'),
(38, 'AdminTpu', 1, 'Admin TPU Pandu', 'approve', NULL, NULL, 'Mengajukan permintaan hapus', 4, 1, '127.0.0.1', '2026-09-08 00:17:42', '2026-09-08 00:58:52'),
(39, 'Uptd', 1, 'UPTD I Kota Bandung', 'reject', NULL, NULL, 'Menolak permintaan hapus', 1, NULL, '127.0.0.1', '2026-09-08 00:18:10', '2026-09-08 00:18:10'),
(40, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 00:24:17', '2026-09-08 00:24:17'),
(41, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 00:26:18', '2026-09-08 00:26:18'),
(42, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 00:27:00', '2026-09-08 00:58:52'),
(43, 'AdminTpu', 1, 'Admin TPU Pandu', 'create', NULL, NULL, 'Menambah ahli waris Jujun', 4, 1, '127.0.0.1', '2026-09-08 00:29:02', '2026-09-08 00:58:52'),
(44, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 00:29:42', '2026-09-08 00:29:42'),
(45, 'AdminTpu', 1, 'Admin TPU Pandu', 'approve', NULL, NULL, 'Mengajukan permintaan hapus', 4, 1, '127.0.0.1', '2026-09-08 00:30:23', '2026-09-08 00:58:52'),
(46, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 00:31:33', '2026-09-08 00:31:33'),
(47, 'SuperAdmin', 2, 'Super Admin Utama', 'reject', NULL, NULL, 'Menolak permintaan hapus', NULL, NULL, '127.0.0.1', '2026-09-08 00:32:30', '2026-09-08 00:32:30'),
(48, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 00:33:22', '2026-09-08 00:58:52'),
(49, 'AdminTpu', 1, 'Admin TPU Pandu', 'create', NULL, NULL, 'Menambah makam MKM-A1-004', 4, 1, '127.0.0.1', '2026-09-08 00:35:25', '2026-09-08 00:58:52'),
(50, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 00:36:00', '2026-09-08 00:36:00'),
(51, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 00:37:26', '2026-09-08 00:37:26'),
(54, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 00:45:03', '2026-09-08 00:45:03'),
(55, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 00:46:15', '2026-09-08 00:58:52'),
(56, 'AdminTpu', 1, 'Admin TPU Pandu', 'approve', NULL, NULL, 'Mengajukan permintaan hapus', 4, 1, '127.0.0.1', '2026-09-08 00:47:21', '2026-09-08 00:58:52'),
(57, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 00:47:43', '2026-09-08 00:47:43'),
(60, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-08 01:01:04', '2026-09-08 01:01:04'),
(61, 'Uptd', 4, 'UPTD Wilayah 1', 'reject', NULL, NULL, 'Menolak permintaan hapus', 4, NULL, '127.0.0.1', '2026-09-08 01:01:56', '2026-09-08 01:01:56'),
(62, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 20:01:16', '2026-09-08 20:01:16'),
(63, 'SuperAdmin', 2, 'Super Admin Utama', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 0 diperbarui, 484 dilewati', NULL, NULL, '127.0.0.1', '2026-09-08 20:03:50', '2026-09-08 20:03:50'),
(64, 'SuperAdmin', 2, 'Super Admin Utama', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 0 diperbarui, 484 dilewati', NULL, NULL, '127.0.0.1', '2026-09-08 20:05:09', '2026-09-08 20:05:09'),
(65, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 21:14:56', '2026-09-08 21:14:56'),
(66, 'SuperAdmin', 2, 'Super Admin Utama', 'import', NULL, NULL, 'Import Excel almarhum: 483 dibuat, 0 diperbarui, 0 dilewati', NULL, NULL, '127.0.0.1', '2026-09-08 21:15:55', '2026-09-08 21:15:55'),
(67, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah ahli waris Siti Maesaroh', NULL, 1, '127.0.0.1', '2026-09-08 21:26:21', '2026-09-08 21:26:21'),
(68, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 21:27:34', '2026-09-08 21:27:34'),
(69, 'Uptd', 4, 'UPTD Wilayah 1', 'import', NULL, NULL, 'Import Excel almarhum: 1 dibuat, 0 diperbarui, 0 dilewati', 4, NULL, '127.0.0.1', '2026-09-08 21:38:44', '2026-09-08 21:38:44'),
(70, 'Uptd', 4, 'UPTD Wilayah 1', 'import', NULL, NULL, 'Import Excel almarhum: 1 dibuat, 0 diperbarui, 0 dilewati', 4, NULL, '127.0.0.1', '2026-09-08 21:43:10', '2026-09-08 21:43:10'),
(71, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-08 21:45:31', '2026-09-08 21:45:31'),
(72, 'Uptd', 4, 'UPTD Wilayah 1', 'import', NULL, NULL, 'Import Excel almarhum: 0 dibuat, 1 diperbarui, 0 dilewati', 4, NULL, '127.0.0.1', '2026-09-08 22:53:06', '2026-09-08 22:53:06'),
(73, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-08 22:58:02', '2026-09-08 22:58:02'),
(74, 'SuperAdmin', 2, 'Super Admin Utama', 'import', NULL, NULL, 'Import Excel almarhum: 470 dibuat, 13 diperbarui, 0 dilewati', NULL, NULL, '127.0.0.1', '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(75, 'SuperAdmin', 2, 'Super Admin Utama', 'delete', NULL, NULL, 'Menghapus almarhum Ahmad Abdul Somad', NULL, 1, '127.0.0.1', '2026-09-08 23:20:15', '2026-09-08 23:20:15'),
(76, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah blok Zona Uji Temp', 4, 1, '127.0.0.1', '2026-09-08 23:43:28', '2026-09-08 23:43:28'),
(77, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah blok Zona Uji Temp', 4, 1, '127.0.0.1', '2026-09-08 23:43:28', '2026-09-08 23:43:28'),
(78, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus blok Zona Uji Temp', 4, 1, '127.0.0.1', '2026-09-08 23:43:29', '2026-09-08 23:43:29'),
(79, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah makam BLK-A1-MELATI-P9001', 4, 1, '127.0.0.1', '2026-09-08 23:43:44', '2026-09-08 23:43:44'),
(80, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus makam BLK-A1-MELATI-P9001', 4, 1, '127.0.0.1', '2026-09-08 23:44:37', '2026-09-08 23:44:37'),
(81, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah makam BLK-A1-MELATI-P9001', 4, 1, '127.0.0.1', '2026-09-08 23:44:59', '2026-09-08 23:44:59'),
(82, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah almarhum Suebah', 4, 1, '127.0.0.1', '2026-09-08 23:45:00', '2026-09-08 23:45:00'),
(83, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah makam BLK-A1-MELATI-P9002', 4, 1, '127.0.0.1', '2026-09-08 23:46:08', '2026-09-08 23:46:08'),
(84, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah almarhum TEST PETA XYZ', 4, 1, '127.0.0.1', '2026-09-08 23:46:08', '2026-09-08 23:46:08'),
(85, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus almarhum TEST PETA XYZ', 4, 1, '127.0.0.1', '2026-09-08 23:46:21', '2026-09-08 23:46:21'),
(86, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus makam BLK-A1-MELATI-P9002', 4, 1, '127.0.0.1', '2026-09-08 23:46:22', '2026-09-08 23:46:22'),
(87, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-09 00:08:43', '2026-09-09 00:08:43'),
(88, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 00:10:59', '2026-09-09 00:10:59'),
(89, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:12:45', '2026-09-09 00:12:45'),
(90, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:12:50', '2026-09-09 00:12:50'),
(91, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:12:55', '2026-09-09 00:12:55'),
(92, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:12:59', '2026-09-09 00:12:59'),
(93, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:13:02', '2026-09-09 00:13:02'),
(94, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:13:07', '2026-09-09 00:13:07'),
(95, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:13:12', '2026-09-09 00:13:12'),
(96, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok Blok A1 - Melati', NULL, 1, '127.0.0.1', '2026-09-09 00:13:17', '2026-09-09 00:13:17'),
(97, 'SuperAdmin', 2, 'Super Admin Utama', 'create', NULL, NULL, 'Menambah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:13:40', '2026-09-09 00:13:40'),
(98, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:13:46', '2026-09-09 00:13:46'),
(99, 'SuperAdmin', 2, 'Super Admin Utama', 'delete', NULL, NULL, 'Menghapus blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:13:49', '2026-09-09 00:13:49'),
(100, 'SuperAdmin', 2, 'Super Admin Utama', 'create', NULL, NULL, 'Menambah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:14:42', '2026-09-09 00:14:42'),
(101, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:15:10', '2026-09-09 00:15:10'),
(102, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:15:23', '2026-09-09 00:15:23'),
(103, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:15:44', '2026-09-09 00:15:44'),
(104, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:15:48', '2026-09-09 00:15:48'),
(105, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:15:52', '2026-09-09 00:15:52'),
(106, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:15:56', '2026-09-09 00:15:56'),
(107, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:16:05', '2026-09-09 00:16:05'),
(108, 'SuperAdmin', 2, 'Super Admin Utama', 'delete', NULL, NULL, 'Menghapus blok CB/B', NULL, 1, '127.0.0.1', '2026-09-09 00:17:11', '2026-09-09 00:17:11'),
(109, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah blok Blok Uji Persis', 4, 1, '127.0.0.1', '2026-09-09 00:33:04', '2026-09-09 00:33:04'),
(110, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus blok Blok Uji Persis', 4, 1, '127.0.0.1', '2026-09-09 00:33:05', '2026-09-09 00:33:05'),
(111, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah almarhum Tex Penguji Peta', 4, NULL, '127.0.0.1', '2026-09-09 00:42:30', '2026-09-09 00:42:30'),
(112, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah makam BLK-TEST-P9001', 4, 1, '127.0.0.1', '2026-09-09 00:42:31', '2026-09-09 00:42:31'),
(113, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah almarhum Tex Penguji Peta', 4, 1, '127.0.0.1', '2026-09-09 00:42:31', '2026-09-09 00:42:31'),
(114, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus almarhum Tex Penguji Peta', 4, 1, '127.0.0.1', '2026-09-09 00:43:13', '2026-09-09 00:43:13'),
(115, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus makam BLK-TEST-P9001', 4, 1, '127.0.0.1', '2026-09-09 00:43:13', '2026-09-09 00:43:13'),
(116, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 00:46:35', '2026-09-09 00:46:35'),
(117, 'SuperAdmin', 2, 'Super Admin Utama', 'create', NULL, NULL, 'Menambah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:48:47', '2026-09-09 00:48:47'),
(118, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:01', '2026-09-09 00:49:01'),
(119, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:06', '2026-09-09 00:49:06'),
(120, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:09', '2026-09-09 00:49:09'),
(121, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:11', '2026-09-09 00:49:11'),
(122, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:15', '2026-09-09 00:49:15'),
(123, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:18', '2026-09-09 00:49:18'),
(124, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:24', '2026-09-09 00:49:24'),
(125, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah blok CB/K/II', NULL, 1, '127.0.0.1', '2026-09-09 00:49:28', '2026-09-09 00:49:28'),
(126, 'SuperAdmin', 2, 'Super Admin Utama', 'create', NULL, NULL, 'Menambah makam BLK-CB/K/II-P7036', NULL, 1, '127.0.0.1', '2026-09-09 00:56:19', '2026-09-09 00:56:19'),
(127, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah almarhum UKUR MALEM TARIGAN', NULL, 1, '127.0.0.1', '2026-09-09 00:56:19', '2026-09-09 00:56:19'),
(128, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-09 01:01:20', '2026-09-09 01:01:20'),
(129, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 01:05:09', '2026-09-09 01:05:09'),
(130, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 02:34:07', '2026-09-09 02:34:07'),
(131, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-09 02:36:31', '2026-09-09 02:36:31'),
(132, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah blok CB/B', 4, 1, '127.0.0.1', '2026-09-09 02:38:43', '2026-09-09 02:38:43'),
(133, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 02:40:56', '2026-09-09 02:40:56'),
(134, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-09 02:41:38', '2026-09-09 02:41:38'),
(135, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-09 03:10:11', '2026-09-09 03:10:11'),
(136, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-09 03:11:46', '2026-09-09 03:11:46'),
(137, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 03:13:16', '2026-09-09 03:13:16'),
(138, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 19:06:13', '2026-09-09 19:06:13'),
(139, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-09 19:12:16', '2026-09-09 19:12:16'),
(140, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-09 19:21:39', '2026-09-09 19:21:39'),
(141, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-09 19:49:15', '2026-09-09 19:49:15'),
(142, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-09 19:52:01', '2026-09-09 19:52:01'),
(143, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-13 21:29:57', '2026-09-13 21:29:57'),
(144, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-13 21:34:10', '2026-09-13 21:34:10'),
(145, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-13 21:36:50', '2026-09-13 21:36:50'),
(146, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-13 21:48:45', '2026-09-13 21:48:45'),
(147, 'Uptd', 4, 'UPTD Wilayah 1', 'create', NULL, NULL, 'Menambah fasilitas FacTest', 4, 1, '127.0.0.1', '2026-09-13 21:58:25', '2026-09-13 21:58:25'),
(148, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah fasilitas FacTest2', 4, 1, '127.0.0.1', '2026-09-13 21:58:27', '2026-09-13 21:58:27'),
(149, 'Uptd', 4, 'UPTD Wilayah 1', 'update', NULL, NULL, 'Mengubah fasilitas FacTest2', 4, 1, '127.0.0.1', '2026-09-13 21:58:27', '2026-09-13 21:58:27'),
(150, 'Uptd', 4, 'UPTD Wilayah 1', 'delete', NULL, NULL, 'Menghapus fasilitas FacTest2', 4, 1, '127.0.0.1', '2026-09-13 21:58:28', '2026-09-13 21:58:28'),
(151, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah fasilitas Musholla Utama', NULL, 1, '127.0.0.1', '2026-09-13 21:59:59', '2026-09-13 21:59:59'),
(152, 'SuperAdmin', 2, 'Super Admin Utama', 'create', NULL, NULL, 'Menambah fasilitas Kantor TPU Pandu', NULL, 1, '127.0.0.1', '2026-09-13 22:00:44', '2026-09-13 22:00:44'),
(153, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah fasilitas Kantor TPU Pandu', NULL, 1, '127.0.0.1', '2026-09-13 22:01:07', '2026-09-13 22:01:07'),
(154, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah fasilitas Musholla Utama', NULL, 1, '127.0.0.1', '2026-09-13 22:01:11', '2026-09-13 22:01:11'),
(155, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah fasilitas Musholla Utama', NULL, 1, '127.0.0.1', '2026-09-13 22:01:46', '2026-09-13 22:01:46'),
(156, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah fasilitas Kantor TPU Pandu', NULL, 1, '127.0.0.1', '2026-09-13 22:01:50', '2026-09-13 22:01:50'),
(157, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-13 22:04:29', '2026-09-13 22:04:29'),
(158, 'Uptd', 4, 'UPTD Wilayah 1', 'login', NULL, NULL, 'Login ke sistem', 4, NULL, '127.0.0.1', '2026-09-13 22:05:51', '2026-09-13 22:05:51'),
(159, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-13 22:24:24', '2026-09-13 22:24:24'),
(160, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-13 22:31:44', '2026-09-13 22:31:44'),
(161, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-13 22:50:19', '2026-09-13 22:50:19'),
(162, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-13 22:52:44', '2026-09-13 22:52:44'),
(163, 'SuperAdmin', 2, 'Super Admin Utama', 'login', NULL, NULL, 'Login ke sistem', NULL, NULL, '127.0.0.1', '2026-09-13 23:03:24', '2026-09-13 23:03:24'),
(164, 'SuperAdmin', 2, 'Super Admin Utama', 'delete', NULL, NULL, 'Menghapus UPTD UPTD I Kota Bandung', 1, NULL, '127.0.0.1', '2026-09-13 23:13:39', '2026-09-13 23:13:39'),
(165, 'SuperAdmin', 2, 'Super Admin Utama', 'delete', NULL, NULL, 'Menghapus UPTD UPTD II Kota Bandung', 3, NULL, '127.0.0.1', '2026-09-13 23:13:44', '2026-09-13 23:13:44'),
(166, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah UPTD UPTD I Kota Bandung', 4, NULL, '127.0.0.1', '2026-09-13 23:14:07', '2026-09-13 23:14:07'),
(167, 'SuperAdmin', 2, 'Super Admin Utama', 'update', NULL, NULL, 'Mengubah TPU TPU Cibarunai', 4, 3, '127.0.0.1', '2026-09-13 23:17:49', '2026-09-13 23:17:49'),
(168, 'AdminTpu', 1, 'Admin TPU Pandu', 'login', NULL, NULL, 'Login ke sistem', 4, 1, '127.0.0.1', '2026-09-13 23:25:52', '2026-09-13 23:25:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_tpus`
--

CREATE TABLE `admin_tpus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tpu_id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admin_tpus`
--

INSERT INTO `admin_tpus` (`id`, `tpu_id`, `nip`, `username`, `password`, `nama_lengkap`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, '20261008', 'admintpu1', '$2y$12$b.7Xzlz5MmBEwYmVGDOItuvsvjVofY8TgCx67ZTMDKnef/YA0hxZG', 'Admin TPU Pandu', 'admintpu1@sipemakaman.test', NULL, '2026-08-31 19:55:39', '2026-09-07 19:36:49'),
(2, 1, '3245678', 'admin123', '$2y$12$VXqleVKc.5c3XrJtS2vihuoiZfCw7qg2G/CIVU/dp8/xpWbT1cX1K', 'Khalid Kasmiri', 'admin@pemakaman', NULL, '2026-09-01 00:47:20', '2026-09-01 00:47:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ahli_waris`
--

CREATE TABLE `ahli_waris` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `almarhum_id` bigint(20) UNSIGNED NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `hubungan` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `no_rumah` varchar(255) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kota_kabupaten` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ahli_waris`
--

INSERT INTO `ahli_waris` (`id`, `almarhum_id`, `nama_lengkap`, `nik`, `hubungan`, `alamat`, `alamat_jalan`, `no_rumah`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota_kabupaten`, `provinsi`, `no_telepon`, `created_at`, `updated_at`) VALUES
(2, 1, 'Siti Maesaroh', '3201010101010002', 'Ahli Waris', 'Jl. Kulon belah wetan', 'Jl. Cihanjuang', '12', '1', '2', 'Ledeng', 'Cidadap', 'Bandung', 'Jawa Barat', '08123456701', '2026-09-06 20:36:11', '2026-09-08 21:26:21'),
(7, 3, 'Jujun', '3234576890', 'Keluarga', 'Jl. Cibenying Kidul', 'Jl. Padjajaran', '367', '05', '08', 'Babakan Ciamis', 'Cicendo', 'Bandung', 'Jawa Barat', '02293502554', '2026-09-08 00:29:02', '2026-09-08 00:29:02'),
(493, 500, 'OREMA CHRISTIANTA', NULL, 'Ahli Waris', 'JL.KOMP TAMAN CILEUNYI RT 08/22 KEL CILEUNYI BANDUNG', 'JL.KOMP TAMAN CILEUNYI RT 08/22 KEL CILEUNYI BANDUNG', 'null', '8', '22', 'Kelurahan Cileunyi', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(494, 501, 'DONN RITHALNA SANDI', NULL, 'Ahli Waris', 'JL.SCORPIO NO.17 RT 04/09 KEL.GUMURUH BANDUNG', 'JL.SCORPIO NO.17 RT 04/09 KEL.GUMURUH BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(495, 502, 'ANDRIYAS', NULL, 'Ahli Waris', 'JL.MUH IZEN GG MUZDALIFAH NO.98 RT 01/01 RIAU', 'JL.MUH IZEN GG MUZDALIFAH NO.98 RT 01/01 RIAU', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(496, 503, 'ARNOLD EO HUTABARAT', NULL, 'Ahli Waris', 'JL.KP PARONGPONG RT 04/10 KEL KARYAWANGI BANDUNG', 'JL.KP PARONGPONG RT 04/10 KEL KARYAWANGI BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(497, 504, 'EDDY MARTIANDI KOSIM', NULL, 'Ahli Waris', 'JL.SARIMANAH II NO.03 RT 011/08 KEL.SARIJADI BANDUNG', 'JL.SARIMANAH II NO.03 RT 011/08 KEL.SARIJADI BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(498, 505, 'EMMANUEL FEBIANO SIGIT B.P', NULL, 'Ahli Waris', 'JL.SARIJADI BLOK.14 RT 03/05 KEL.SARIJADI BANDUNG', 'JL.SARIJADI BLOK.14 RT 03/05 KEL.SARIJADI BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(499, 506, 'MAGDALENA SUBAIDA WALLONG', NULL, 'Ahli Waris', 'JL.PAJAJARAN DALAM NO.112B RT 08/03 KEL.HUSEIN BANDUNG', 'JL.PAJAJARAN DALAM NO.112B RT 08/03 KEL.HUSEIN BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(500, 507, 'DIANI', NULL, 'Ahli Waris', 'JL.PARAKAN WAAS II NO.10 RT 01/01 KEL.BATUNUNGGAL KEC.BANDUNG KIDUL BANDUNG', 'JL.PARAKAN WAAS II NO.10 RT 01/01 KEL.BATUNUNGGAL KEC.BANDUNG KIDUL BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(501, 508, 'FERRY', NULL, 'Ahli Waris', 'JL.GG.JAKSA NO.46 RT 05/02 KEL.PUNGKUR KEC.REGOL BANDUNG', 'JL.GG.JAKSA NO.46 RT 05/02 KEL.PUNGKUR KEC.REGOL BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(502, 509, 'GRACESIA ELIZABETH', NULL, 'Ahli Waris', 'JL.TAMAN CIBADUYUT INDAH BLOK 6  RT 02/20 KEL.CANGKUANG KULON KEC.DAYEUH KOLOT BANDUNG', 'JL.TAMAN CIBADUYUT INDAH BLOK 6  RT 02/20 KEL.CANGKUANG KULON KEC.DAYEUH KOLOT BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(503, 510, 'MAMAN KAMAJAYA', NULL, 'Ahli Waris', 'JL.SIDOMULYO NO.37 RT 04/07 KEL.SUKALUYU KEC.CIBEUNYING KALER BANDUNG', 'JL.SIDOMULYO NO.37 RT 04/07 KEL.SUKALUYU KEC.CIBEUNYING KALER BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(504, 511, 'THELMA YUNIAR', NULL, 'Ahli Waris', 'JL.GG.ADIKACIH NO.3 RT 03/01 KEL.NYENGSERET KEC.ASTANAANYAR BANDUNG', 'JL.GG.ADIKACIH NO.3 RT 03/01 KEL.NYENGSERET KEC.ASTANAANYAR BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(505, 512, 'LAURENTIUS REINALDO LEONARD', NULL, 'Ahli Waris', 'JL.JEND.SUDIRMAN NO.415 RT 01/03 KEL.JAMIKA KEC.BOJONGLOA KALER BANDUNG', 'JL.JEND.SUDIRMAN NO.415 RT 01/03 KEL.JAMIKA KEC.BOJONGLOA KALER BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(506, 513, 'AGUSTINA TRI RAHAYU', NULL, 'Ahli Waris', 'JL.MULYA SARI NO.55 RT 01/04 KEL.SUKAGALIH KEC.SUKAJADI BANDUNG', 'JL.MULYA SARI NO.55 RT 01/04 KEL.SUKAGALIH KEC.SUKAJADI BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(507, 514, 'ISAR', NULL, 'Ahli Waris', 'JL.MARGAHAYU KENCANA A 7-6 RT 02/14 KEL.MARGAHAYU SELATAN KEC.MARGAHAYU BANDUNG', 'JL.MARGAHAYU KENCANA A 7-6 RT 02/14 KEL.MARGAHAYU SELATAN KEC.MARGAHAYU BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(508, 515, 'JANNUARD JP FOSTHA', NULL, 'Ahli Waris', 'JL.PASIRLUYU GG NATA III RT 01/01 KEL.PASIRLUYU KEC.REGOL  BANDUNG', 'LAMHOOD JENNI R.F SIRAIT', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(509, 516, 'DRS.EDWARD SITORUS', NULL, 'Ahli Waris', 'JL.GUNTUR NO.20 RT 03/07 KEL.MALABAR KEC.LENGKONG BANDUNG', 'JL.GUNTUR NO.20 RT 03/07 KEL.MALABAR KEC.LENGKONG BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(510, 517, 'RYADI SARIPUTRA', NULL, 'Ahli Waris', 'JL.TAMAN HOLIS INDAH B2 NO.55 RT 08/11 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON BANDUNG', 'JL.TAMAN HOLIS INDAH B2 NO.55 RT 08/11 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON BANDUNG', 'null', 'null', 'null', 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(511, 518, 'BERTON PAKPAHAN', NULL, 'Ahli Waris', 'JL.KOMP.BUMI BOL G 10 NO.26 RT 03/16 KEL.BOJONG MALAKA KEC.BALEENDAH BANDUNG', 'JL.KOMP.BUMI BOL G 10 NO.26 RT 03/16 KEL.BOJONG MALAKA KEC.BALEENDAH BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(512, 519, 'SONDANG SIREGAR', NULL, 'Ahli Waris', 'JL.PASIRLEUTIK RT 05/09 KEL.SUKAPADA KEC.CIBEUNYING KIDUL BANDUNG', 'JL.PASIRLEUTIK RT 05/09 KEL.SUKAPADA KEC.CIBEUNYING KIDUL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(513, 520, 'KRISTIANI OKTAVIA', NULL, 'Ahli Waris', 'JL.GAJAH LUMANTUNG NO.33 RT 01/02 KEL.TAMANSARI KEC.BDGWETAN BANDUNG', 'JL.GAJAH LUMANTUNG NO.33 RT 01/02 KEL.TAMANSARI KEC.BDGWETAN BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(514, 521, 'YUSI', NULL, 'Ahli Waris', 'JL.GG.AWI WULUNG NO.48/22 RT 01/09 KEL.KARANG ANYAR KEC.ASTANAANYAR BANDUNG', 'JL.GG.AWI WULUNG NO.48/22 RT 01/09 KEL.KARANG ANYAR KEC.ASTANAANYAR BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(515, 522, 'ATIHUTA BELLI', NULL, 'Ahli Waris', 'JL.JURANG NO.905 RT 04/05 KEL.PASTEUR KEC.SUKAJADI BANDUNG', 'JL.JURANG NO.905 RT 04/05 KEL.PASTEUR KEC.SUKAJADI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(516, 523, 'KOSASIH', NULL, 'Ahli Waris', 'JL.SITI MARIAH RT 04/01 KEL.JAMIKA KEC.BOJONGLOA KALER BANDUNG', 'JL.SITI MARIAH RT 04/01 KEL.JAMIKA KEC.BOJONGLOA KALER BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(517, 524, 'ROSMELIA DAMARIS', NULL, 'Ahli Waris', 'JL.DR JUNJUNAN RT 08/01 KEL.PAMOYANAN KEC.CICENDO BANDUNG', 'JL.DR JUNJUNAN RT 08/01 KEL.PAMOYANAN KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(518, 525, 'BAMBANG SETYONO', NULL, 'Ahli Waris', 'JL.MELONG RAYA GG ANIS NO.192 RT 05/011 KEL.MELONG KEC.CIMAHI SELATAN CIMAHI', 'JL.MELONG RAYA GG ANIS NO.192 RT 05/011 KEL.MELONG KEC.CIMAHI SELATAN CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(519, 526, 'DHINDIEN C EFFENDY', NULL, 'Ahli Waris', 'JL.CIJERAH II BLOK 16 NO.03 RT 01/03 KEL.MELONG KEC.CIMAHI SELATAN CIMAHI', 'JL.CIJERAH II BLOK 16 NO.03 RT 01/03 KEL.MELONG KEC.CIMAHI SELATAN CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(520, 527, 'VICKY MARIYANTO', NULL, 'Ahli Waris', 'JL.PERUM PERMATA SINDANG PANON BLOK C7 NO.6 RT 05/15 KEL.SINDANG PANON KEC.BANJARAN BANDUNG', 'JL.PERUM PERMATA SINDANG PANON BLOK C7 NO.6 RT 05/15 KEL.SINDANG PANON KEC.BANJARAN BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(521, 528, 'ALBERT DOANRIK SILABAN', NULL, 'Ahli Waris', 'JL.SAGARAHIANG NO.2 RT 04/07 KEL.ANTAPANI KIDUL KEC.ANTAPANI BANDUNG', 'JL.SAGARAHIANG NO.2 RT 04/07 KEL.ANTAPANI KIDUL KEC.ANTAPANI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(522, 529, 'ANDREW CURVET', NULL, 'Ahli Waris', 'JL.BP.NALIM NO.14 RT 03/03 KEL.PALEDANG KEC.LENGKONG BANDUNG', 'JL.BP.NALIM NO.14 RT 03/03 KEL.PALEDANG KEC.LENGKONG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(523, 530, 'REINALDO PARLUHUTAN', NULL, 'Ahli Waris', 'JL.KOMP BUMI ASRI B31 RT 02/06 KEL.BANDUNG KULON KEC.PANYILEUKAN BANDUNG', 'JL.KOMP BUMI ASRI B31 RT 02/06 KEL.BANDUNG KULON KEC.PANYILEUKAN BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(524, 531, 'IRWAN', NULL, 'Ahli Waris', 'JL.PERMATA PADALARANG F3 NO.5 RT 03/25 KEL.JAYAMEKAR KEC.PADALARANG BANDUNG BARAT', 'JL.PERMATA PADALARANG F3 NO.5 RT 03/25 KEL.JAYAMEKAR KEC.PADALARANG BANDUNG BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(525, 532, 'DAVID STEFANUS', NULL, 'Ahli Waris', 'JL.LEUWIPANJANG NO.7 RT 01/03 KEL.SITUSAEUR KEC.BOJONGLOA KALER BANDUNG', 'JL.LEUWIPANJANG NO.7 RT 01/03 KEL.SITUSAEUR KEC.BOJONGLOA KALER BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(526, 533, 'CHARLES SIREGAR', NULL, 'Ahli Waris', 'JL.BOSCHA ABRAMA KODAM III SILIWANGI RT 06/07 KEL.PASTEUR KEC.SUKAJADI BANDUNG', 'JL.BOSCHA ABRAMA KODAM III SILIWANGI RT 06/07 KEL.PASTEUR KEC.SUKAJADI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(527, 534, 'DAVID HOTARY PANGARIBOEAN', NULL, 'Ahli Waris', 'JL.TERUSAN RANCAGOONG II NO.15 RT 02/04 KEL.GUMURUH KEC.BATUNUNGGAL BANDUNG', 'JL.TERUSAN RANCAGOONG II NO.15 RT 02/04 KEL.GUMURUH KEC.BATUNUNGGAL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(528, 535, 'CLARISSA FRISKA ANGGRAENI', NULL, 'Ahli Waris', 'JL.CITEPUS II GG.BAGJA NO.21B RT 09/06 KEL.PAJAJARAN KEC.CICENDO BANDUNG', 'JL.CITEPUS II GG.BAGJA NO.21B RT 09/06 KEL.PAJAJARAN KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(529, 536, 'DIDA RAHMAT MURYANA', NULL, 'Ahli Waris', 'JL.BALADEWA II GG.VII RT 05/08 KEL.PAJAJARAN KEC.CICENDO BANDUNG', 'JL.BALADEWA II GG.VII RT 05/08 KEL.PAJAJARAN KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(530, 537, 'MURPHY FRANCISCUS', NULL, 'Ahli Waris', 'JL.KOMP MERPATI DUTA D-1 /6 RT 03/21 KEL.CIMENYAN KEC.CIMENYAN BANDUNG', 'JL.KOMP MERPATI DUTA D-1 /6 RT 03/21 KEL.CIMENYAN KEC.CIMENYAN BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(531, 538, 'RIZKI AKBAR KARMAEN', NULL, 'Ahli Waris', 'JL.SETRA SARI KULON VII NO.21 RT 03/03 KEL.SUKARASA KEC.SUKASARI BANDUNG', 'JL.SETRA SARI KULON VII NO.21 RT 03/03 KEL.SUKARASA KEC.SUKASARI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(532, 539, 'HENDRY MARINGAN NAIBAHO', NULL, 'Ahli Waris', 'JL.BOJONG KALER RT 04/12 KEL.CIGADUNG KEC.CIBEUNYING KALER BANDUNG', 'JL.BOJONG KALER RT 04/12 KEL.CIGADUNG KEC.CIBEUNYING KALER BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(533, 540, 'TITA MULIATI', NULL, 'Ahli Waris', 'JL.ANDIR GG SWADAYA 2 NO.75 RT 04/09 KEL.CIROYOM KEC.ANDIR BANDUNG', 'JL.ANDIR GG SWADAYA 2 NO.75 RT 04/09 KEL.CIROYOM KEC.ANDIR BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(534, 541, 'HERISON', NULL, 'Ahli Waris', 'JL.ANGGADIREJA NO.57 RT 03/09 KEL.BALEENDAH KEC.BALEENDAH BANDUNG', 'JL.ANGGADIREJA NO.57 RT 03/09 KEL.BALEENDAH KEC.BALEENDAH BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(535, 542, 'STEEVEN ADRIAN', NULL, 'Ahli Waris', 'JL.PASIRMALAKA NO.2A RT 02/10 KEL.CIGERELENG KEC.REGOL BANDUNG', 'JL.PASIRMALAKA NO.2A RT 02/10 KEL.CIGERELENG KEC.REGOL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(536, 543, 'DHARMALI', NULL, 'Ahli Waris', 'JL.GG.SEREH NO.68/9B RT 10/02 KEL.CIBADAK KEC.ASTANANAYAR BANDUNG', 'JL.GG.SEREH NO.68/9B RT 10/02 KEL.CIBADAK KEC.ASTANANAYAR BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(537, 544, 'LIA SANDI', NULL, 'Ahli Waris', 'JL.SITU GUNTING RT 01/01 KEL.SUKAHAJI KEC.BABAKAN CIPARAY BANDUNG', 'JL.SITU GUNTING RT 01/01 KEL.SUKAHAJI KEC.BABAKAN CIPARAY BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(538, 545, 'YAKIN SOMANO', NULL, 'Ahli Waris', 'JL.GG.PAELAS VI NO.249 RT 04/08 KEL.CIPEDES KEC.SUKAJADI BANDUNG', 'JL.GG.PAELAS VI NO.249 RT 04/08 KEL.CIPEDES KEC.SUKAJADI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(539, 546, 'SAMUEL YAPRIANTO', NULL, 'Ahli Waris', 'JL.KOMP.SETRADUTA BLOK G3-15 RT 03/14 KEL.SARIWANGI KEC.PARONGPONG BANDUNG BARAT', 'JL.KOMP.SETRADUTA BLOK G3-15 RT 03/14 KEL.SARIWANGI KEC.PARONGPONG BANDUNG BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(540, 547, 'BINTON BARU S SILALAHI', NULL, 'Ahli Waris', 'JL.KIARAASRI SELATAN NO.50 RT 03/12 KEL.SUKAPURA KEC.KIARACONDONG BANDUNG', 'JL.KIARAASRI SELATAN NO.50 RT 03/12 KEL.SUKAPURA KEC.KIARACONDONG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(541, 548, 'MULYANA DJAJA', NULL, 'Ahli Waris', 'JL.HALIMUN NO.11 RT 06/07 KEL.MALABAR KEC.LENGKONG BANDUNG', 'JL.HALIMUN NO.11 RT 06/07 KEL.MALABAR KEC.LENGKONG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(542, 549, 'MONICA PERMATA RAHAYU', NULL, 'Ahli Waris', 'JL.PLERED 9 NO.19 RT 03/11 KEL.ANTAPANI TENGAH KEC.ANTAPANI BANDUNG', 'JL.PLERED 9 NO.19 RT 03/11 KEL.ANTAPANI TENGAH KEC.ANTAPANI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(543, 550, 'YOHANES CANDRA WIJAYA', NULL, 'Ahli Waris', 'JL.TERUSAN JAMIKA RT 03/06 KEL.BABAKAN TAROGONG KEC.BOJONGLOA KALER BANDUNG', 'JL.TERUSAN JAMIKA RT 03/06 KEL.BABAKAN TAROGONG KEC.BOJONGLOA KALER BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(544, 551, 'RONNY', NULL, 'Ahli Waris', 'JL.TAMAN KOPO INDAH BLOK N31 RT 03/11 KEL.MARGAHAYU TENGAH KEC.MARGAHAYU BANDUNG', 'JL.TAMAN KOPO INDAH BLOK N31 RT 03/11 KEL.MARGAHAYU TENGAH KEC.MARGAHAYU BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(545, 552, 'ANDAR MESAK YEREMIA', NULL, 'Ahli Waris', 'JL.TOPAZ BLOK 04 NO.10 RT 04/05 KEL.TANI MULYA KEC.NGAMPRAH CIMAHI', 'JL.TOPAZ BLOK 04 NO.10 RT 04/05 KEL.TANI MULYA KEC.NGAMPRAH CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(546, 553, 'ERNI HERAWATI', NULL, 'Ahli Waris', 'JL.SITI MARIAH VI NO.399/86A RT.10/01 KEL.JAMIKA KEC.BJLOA KALER KOTA BANDUNG', 'JL.SITI MARIAH VI NO.399/86A RT.10/01 KEL.JAMIKA KEC.BJLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(547, 554, 'ARDIANTO TANADINATA', NULL, 'Ahli Waris', 'JL.MILENIUM REG.NO.9A RT.04/07 KEL.PADJAJARAN KEC.CICENDO KOTA BANDUNG', 'JL.MILENIUM REG.NO.9A RT.04/07 KEL.PADJAJARAN KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(548, 555, 'YUDITHA MERIENDRASARI', NULL, 'Ahli Waris', 'JL.GARDENIA BLOK M.04 EST.HILLS RT.07/13 KEL.CIPADUNG KEC.CIBIRU BANDUNG', 'JL.GARDENIA BLOK M.04 EST.HILLS RT.07/13 KEL.CIPADUNG KEC.CIBIRU BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(549, 556, 'DANIEL FIELCA', NULL, 'Ahli Waris', 'JL.TARUMANEGARA TIMUR NO..26 RT.01/04 KEL.MEKARWANGI KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.TARUMANEGARA TIMUR NO..26 RT.01/04 KEL.MEKARWANGI KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(550, 557, 'SAOR.EZEN F.L.TOBING', NULL, 'Ahli Waris', 'JL.RANCAMANYAR 2 NO.10 RT.02/08 KEL.GUMURUH KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.RANCAMANYAR 2 NO.10 RT.02/08 KEL.GUMURUH KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(551, 558, 'JEFFRY STEVIANUS LATUPUTTY', NULL, 'Ahli Waris', 'JL.NAKULA III BLOK C NO.85 RT.02/07 KEL.JAKASETIA KEC.BEKASI SELATAN KOTA BEKASI', 'JL.NAKULA III BLOK C NO.85 RT.02/07 KEL.JAKASETIA KEC.BEKASI SELATAN KOTA BEKASI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(552, 559, 'RANAP SAMUEL', NULL, 'Ahli Waris', 'JL.TERS.JAKARTA NO.25B RT.02/16 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.TERS.JAKARTA NO.25B RT.02/16 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(553, 560, 'KRISWANGSA B.K YUDHA', NULL, 'Ahli Waris', 'JL.GG.PA YAHYA NO.38/89 RT.02/04 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'JL.GG.PA YAHYA NO.38/89 RT.02/04 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(554, 561, 'STEFEN STEFANUS', NULL, 'Ahli Waris', 'JL.POJOK SELATAN NO.121 RT.03/12 KEL.SETIAMANAH KEC.CIMAHI TENGAH KOTA CIMAHI', 'JL.POJOK SELATAN NO.121 RT.03/12 KEL.SETIAMANAH KEC.CIMAHI TENGAH KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(555, 562, 'LIOE SOEPJIN', NULL, 'Ahli Waris', 'JL.NATAWIJAYA NO.49 RT.01/03 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'JL.NATAWIJAYA NO.49 RT.01/03 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(556, 563, 'HANNI MEGASATIANI', NULL, 'Ahli Waris', 'GG.EMPI NO.2 RT.06/03 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'GG.EMPI NO.2 RT.06/03 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(557, 564, 'HOKKY YUDIANA', NULL, 'Ahli Waris', 'JL.BOJONG RAYA GG.SANUSI RT.07/01 KEL.CARINGIN KEC.BANDUNG KULON KOTA BANDUNG', 'JL.BOJONG RAYA GG.SANUSI RT.07/01 KEL.CARINGIN KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(558, 565, 'GRACERAQUEL', NULL, 'Ahli Waris', 'JL.NYENGSERET NO.71A RT.02/03 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.NYENGSERET NO.71A RT.02/03 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(559, 566, 'YOSY PURWANTI', NULL, 'Ahli Waris', 'PURI CIPAGERAN INDAH 2 E-3 NO.32 RT.04/22 KEL.TANIMULYA KEC.NGAMPRAH KAB.BANDUNG BARAT', 'PURI CIPAGERAN INDAH 2 E-3 NO.32 RT.04/22 KEL.TANIMULYA KEC.NGAMPRAH KAB.BANDUNG BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(560, 567, 'SAHATA IMMANUEL', NULL, 'Ahli Waris', 'GG.SAMSI II NO.297/125A RT.08/01 KEL.KEBONWARU KEC.BATUNUNGGAL KOTA BANDUNG', 'GG.SAMSI II NO.297/125A RT.08/01 KEL.KEBONWARU KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(561, 568, 'NICKOLAS', NULL, 'Ahli Waris', 'JL.KARAPITAN NO.2A RT.03/04 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'JL.KARAPITAN NO.2A RT.03/04 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(562, 569, 'LENNY MARLINA', NULL, 'Ahli Waris', 'JL.KRAMAT LONTAR II NO.43 RT.19/01 KEL.PASEBAN KEC.SENEN JAKARTA PUSAT', 'JL.KRAMAT LONTAR II NO.43 RT.19/01 KEL.PASEBAN KEC.SENEN JAKARTA PUSAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(563, 571, 'WAWAN HERYAWAN', NULL, 'Ahli Waris', 'JL.SITI MARIAH NO.505/86 RT.07/02 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'JL.SITI MARIAH NO.505/86 RT.07/02 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(564, 572, 'DENI DIBAGJA', NULL, 'Ahli Waris', 'JL.TELOKDENGKLOK RT.03/12 KEL.PASANGRAHAN KEC.UJUNG BERUNG KOTA BANDUNG', 'JL.TELOKDENGKLOK RT.03/12 KEL.PASANGRAHAN KEC.UJUNG BERUNG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(565, 573, 'RACHMAT DANIEL', NULL, 'Ahli Waris', 'KOMP.PERMATA KOPO BLOK GA NO.31A RT.05/17 KEL.SAYATI KEC.MARGAHAYU', 'KOMP.PERMATA KOPO BLOK GA NO.31A RT.05/17 KEL.SAYATI KEC.MARGAHAYU', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(566, 574, 'BINSAR OKTAVIDWIN TAMBUNAN', NULL, 'Ahli Waris', 'JL.PALAPA V NO.17 RT.01/02 KEL.TANJUNG PINGGRIR KEC.SEKUPANG BATAM', 'JL.PALAPA V NO.17 RT.01/02 KEL.TANJUNG PINGGRIR KEC.SEKUPANG BATAM', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(567, 575, 'MARTHYN UHS', NULL, 'Ahli Waris', 'JL.KINABALU II NO.06 RT.01/08 KEL.BABAKAN PENGHULU KEC.CINAMBO KOTA BANDUNG', 'JL.KINABALU II NO.06 RT.01/08 KEL.BABAKAN PENGHULU KEC.CINAMBO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(568, 576, 'JEFFRY SUHENDI', NULL, 'Ahli Waris', 'JL.LEMAH NEUNDET II RT.05/08 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'JL.LEMAH NEUNDET II RT.05/08 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(569, 578, 'ANGELIN PURNAMA DAIRI.MA', NULL, 'Ahli Waris', 'JL.BANGKA VIII/36 RT.07/12 KEL.PELA MAMPANG KEC.MAMPANG PRAPATAN KOTA JAKARTA SELATAN', 'JL.BANGKA VIII/36 RT.07/12 KEL.PELA MAMPANG KEC.MAMPANG PRAPATAN KOTA JAKARTA SELATAN', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(570, 579, 'METY AGUSTINA', NULL, 'Ahli Waris', 'GG.SUKAPAKIR DLM II NO.170C/87 RT.05/11 KEL.JAMIKA KEC.BOJONGLOA KALER BANDUNG', 'GG.SUKAPAKIR DLM II NO.170C/87 RT.05/11 KEL.JAMIKA KEC.BOJONGLOA KALER BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(571, 580, 'OKY GUNAWAN', NULL, 'Ahli Waris', 'JL.ASTER NO.17 K.LEUWIGAJAH PERMAI RT.02/15 KEL.LEUWIGAJAH KEC.CIMAHI SELATAN CIMAHI', 'JL.ASTER NO.17 K.LEUWIGAJAH PERMAI RT.02/15 KEL.LEUWIGAJAH KEC.CIMAHI SELATAN CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(572, 581, 'KUNKUN TATANG PERMANA', NULL, 'Ahli Waris', 'JL.PALEDANG NO.73 RT.06/04 KEL.PALEDANG KEC.LENGKONG BANDUNG', 'JL.PALEDANG NO.73 RT.06/04 KEL.PALEDANG KEC.LENGKONG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(573, 582, 'SUGIARTO BONNY', NULL, 'Ahli Waris', 'KOMP.PESONA LEMBAH CIDAKU BLOK.A NO.11 RT.07/01 KEL.TANIMULYA KEC.NGAMPRAH KAB.BDG BARAT', 'KOMP.PESONA LEMBAH CIDAKU BLOK.A NO.11 RT.07/01 KEL.TANIMULYA KEC.NGAMPRAH KAB.BDG BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(574, 583, 'DRS.PSI.FREDERICK O.SIMON', NULL, 'Ahli Waris', 'JL.SANINTEN NO.27 RT.01/5 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'JL.SANINTEN NO.27 RT.01/5 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(575, 584, 'HENGKI SETIADI', NULL, 'Ahli Waris', 'JL.BBK TAROGONG GG.TANJUNG 6 RT.05/15 KEL.SUKAASIH KEC.BOJONGLOA KALER BANDUNG', 'JL.BBK TAROGONG GG.TANJUNG 6 RT.05/15 KEL.SUKAASIH KEC.BOJONGLOA KALER BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(576, 585, 'RICHARD LUMBAN TOBING', NULL, 'Ahli Waris', 'KOMP.BUMI PUSAKA CINERE JL.PUSAKA V/B-24 RT.35/10 KLE.GANDUL KEC.CINERE DEPOK', 'KOMP.BUMI PUSAKA CINERE JL.PUSAKA V/B-24 RT.35/10 KLE.GANDUL KEC.CINERE DEPOK', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(577, 586, 'FEBE MAUREEN D SIREGAR', NULL, 'Ahli Waris', 'KOMP JAKA PURWA JL.JAKA UTAMA M-9 RT.01/05 KEL.KUJANGSARI KEC.BANDUNNG KIDUL BDG', 'KOMP JAKA PURWA JL.JAKA UTAMA M-9 RT.01/05 KEL.KUJANGSARI KEC.BANDUNNG KIDUL BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(578, 587, 'NATANAEL SETIADI', NULL, 'Ahli Waris', 'JL.KELAPA SAWIT II BLOK CC NO.12 A RT.06/17 KEL.KELAPA GADING TIMUR KEC.KELAPA GADING', 'JL.KELAPA SAWIT II BLOK CC NO.12 A RT.06/17 KEL.KELAPA GADING TIMUR KEC.KELAPA GADING', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(579, 588, 'ARDI TRIAWAN', NULL, 'Ahli Waris', 'JL.KADIPATEN 17 NO.11 RT.02/02 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.KADIPATEN 17 NO.11 RT.02/02 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(580, 589, 'PAULINA ROULI', NULL, 'Ahli Waris', 'JL.SETIA NO.26 RT.01/12 KEL.PADASUKA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'JL.SETIA NO.26 RT.01/12 KEL.PADASUKA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(581, 590, 'VENNY NATALIA ANDRIAS', NULL, 'Ahli Waris', 'JL.KOPO PERMAI I BLOK B.12 RT.01/01 KEL.SUKAMENAK KEC.MARGAHAYU KOTA BANDUNG', 'JL.KOPO PERMAI I BLOK B.12 RT.01/01 KEL.SUKAMENAK KEC.MARGAHAYU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(582, 591, 'ANDRY SITORUS', NULL, 'Ahli Waris', 'JL.KP CIHERANG RT.05/04 KEL.CIGONDEWAH RAHAYU KEC.BANDUNG KULON KOTA BANDUNG', 'JL.KP CIHERANG RT.05/04 KEL.CIGONDEWAH RAHAYU KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(583, 592, 'JAHOMBANG SITUMORANG', NULL, 'Ahli Waris', 'JL.BOUGENVILLE VI NO.04 RT.02/04 KEL.GEMPOL SARI KEC.BANDUNG KULON KOTA BANDUNG', 'JL.BOUGENVILLE VI NO.04 RT.02/04 KEL.GEMPOL SARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(584, 593, 'DIANA MELIANA THAHER', NULL, 'Ahli Waris', 'JL.BABAKAN GARUT RT.01/10 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.BABAKAN GARUT RT.01/10 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(585, 594, 'REGINA BUDI HARTINI', NULL, 'Ahli Waris', 'KP.SUKAMANDI RT.05/05 KEL.LEMBANG KEC.LEMBANG BANDUNG BARAT', 'KP.SUKAMANDI RT.05/05 KEL.LEMBANG KEC.LEMBANG BANDUNG BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(586, 595, 'TAN TJOEN HOEIJ', NULL, 'Ahli Waris', 'GG.IBU AISAH NO.22/9A RT.02/03 KEL.CIBADAK KEC.ASTANAANYAR BANDUNG', 'GG.IBU AISAH NO.22/9A RT.02/03 KEL.CIBADAK KEC.ASTANAANYAR BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(587, 596, 'NANCY HELENA PIETER', NULL, 'Ahli Waris', 'JL.BAPAK SUPI NO.23 RT.04/03 KEL.PALEDANG KEC.LENGKONG BANDUNG', 'JL.BAPAK SUPI NO.23 RT.04/03 KEL.PALEDANG KEC.LENGKONG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(588, 597, 'NANDA.O.LISA SANTOSO', NULL, 'Ahli Waris', 'JL.MALEBER UTARA RT.02/06 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'JL.MALEBER UTARA RT.02/06 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(589, 598, 'RONY SUTEJA', NULL, 'Ahli Waris', 'JL.MELONG KALER NO.27A RT.04/03 KEL.CIKAWAO KEC.LENGKONG KOTA BANDUNG', 'JL.MELONG KALER NO.27A RT.04/03 KEL.CIKAWAO KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(590, 599, 'BAYU SRI HANDOKO', NULL, 'Ahli Waris', 'KOMP.SINDANG SARI RT.02/06 KEL.CILULUK KEC.CIKANCUNG KAB.BANDUNG', 'KOMP.SINDANG SARI RT.02/06 KEL.CILULUK KEC.CIKANCUNG KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(591, 600, 'JOSEPHINE A SETYARINI', NULL, 'Ahli Waris', 'APT.MEDITERINA G TWR B-26 D/J RT.01/08 KEL.TANJUNG DUREN KEC.GROGOL PETAMBURAN', 'APT.MEDITERINA G TWR B-26 D/J RT.01/08 KEL.TANJUNG DUREN KEC.GROGOL PETAMBURAN', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(592, 601, 'RIKY SETIAWAN', NULL, 'Ahli Waris', 'GG.PA YAHYA NO.30/89 RT.03/04 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'GG.PA YAHYA NO.30/89 RT.03/04 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(593, 602, 'ARTURO T.LEIWAKABESSY', NULL, 'Ahli Waris', 'JL.RUGBY NO.14 RT.05/14 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'JL.RUGBY NO.14 RT.05/14 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(594, 603, 'WAWAN CHRISTIAN.S', NULL, 'Ahli Waris', 'JL.GG.MESJID DARUSALAM I RT.03*04 KEL.PELINDUNG HEWAN KEC.ASTANAANYAR KOTA BANDUNG', 'JL.GG.MESJID DARUSALAM I RT.03*04 KEL.PELINDUNG HEWAN KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(595, 604, 'ANDRE ANTONIUS', NULL, 'Ahli Waris', 'JL.NAWAWI NO.153 RT.07/10 KEL.SUKAHAJI KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.NAWAWI NO.153 RT.07/10 KEL.SUKAHAJI KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(596, 605, 'JULIAN DANIEL PARLUHUTAN L.T', NULL, 'Ahli Waris', 'JL.SEKELOA SELATAN NO.4-B RT.05/15 KEL.LEBAKGEDE KEC.COBLONG KOTA BANDUNG', 'JL.SEKELOA SELATAN NO.4-B RT.05/15 KEL.LEBAKGEDE KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(597, 606, 'DANIEL SUHARNA', NULL, 'Ahli Waris', 'JL.SAWAH KURUNG NO.18 RT.01/03 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'JL.SAWAH KURUNG NO.18 RT.01/03 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(598, 607, 'HELMI RIAMA SIBARANI', NULL, 'Ahli Waris', 'JL.PLERED IV NO.1 RT.03/10 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.PLERED IV NO.1 RT.03/10 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(599, 608, 'PUJIYANTO', NULL, 'Ahli Waris', 'JL.CIBUNTU BARAT RT.05/01 KEL.CARINGIN KEC.BANDUNG KULON', 'JL.CIBUNTU BARAT RT.05/01 KEL.CARINGIN KEC.BANDUNG KULON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(600, 609, 'DAVID DANIEL PAHALA', NULL, 'Ahli Waris', 'JL.GOLF BARAT I NO.09 RT,01/09 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'JL.GOLF BARAT I NO.09 RT,01/09 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(601, 610, 'ANNEKE HERAWATI', NULL, 'Ahli Waris', 'JL.BALADEWA GG.II NO.18 RT.06/09 KEL.PADJAJARAN KEC.CICENDO KOTA BANDUNG', 'JL.BALADEWA GG.II NO.18 RT.06/09 KEL.PADJAJARAN KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(602, 611, 'RUTH ELVIKA NOVIANTY', NULL, 'Ahli Waris', 'JL.ADI SUREN NO.4 RT.04/03 KEL.BALONGGEDE KEC.REGOL KOTA BANDUNG', 'JL.ADI SUREN NO.4 RT.04/03 KEL.BALONGGEDE KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(603, 612, 'THEODORA BIRE', NULL, 'Ahli Waris', 'JL.SAPTA MARGA BLOK Y-4 RT.01/04 KEL.CAMPAKA KEC.ANDIR KOTA BANDUNG', 'JL.SAPTA MARGA BLOK Y-4 RT.01/04 KEL.CAMPAKA KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(604, 613, 'THIAN SHIE TZONG', NULL, 'Ahli Waris', 'JL.PAGARSIH NO.239 RT.03/06 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'JL.PAGARSIH NO.239 RT.03/06 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(605, 614, 'DEDI PERMANA', NULL, 'Ahli Waris', 'GG.SALEH NO.779/66A RT.02/05 KELARJUNA KEC.CICENDO KOTA BANDUNG', 'GG.SALEH NO.779/66A RT.02/05 KELARJUNA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(606, 615, 'JOPPY JACOB SYAHALATUA', NULL, 'Ahli Waris', 'JL.CIHAMPELAS NO.161 RT.02/05 KEL.CIPAGANTI KEC.COBLONG KOTA BANDUNG', 'JL.CIHAMPELAS NO.161 RT.02/05 KEL.CIPAGANTI KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(607, 616, 'SANNUR BETTI HUTABARAT', NULL, 'Ahli Waris', 'KAV.RANCA MAS BLOK D NO.5 RT.01/19 KEL.RANCAMANYAR KEC.BLEENDAH KAB.BANDUNG', 'KAV.RANCA MAS BLOK D NO.5 RT.01/19 KEL.RANCAMANYAR KEC.BLEENDAH KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(608, 617, 'GUNAWAN', NULL, 'Ahli Waris', 'KO.RUKO ITC KOSAMBI C-29 RT.05/10 KEL.KEBON PISAN KEC.SUMUR BANDUNG', 'KO.RUKO ITC KOSAMBI C-29 RT.05/10 KEL.KEBON PISAN KEC.SUMUR BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(609, 618, 'JEREMIA HENRY', NULL, 'Ahli Waris', 'JL.SEPAKBOLA NO.24 RT.02/14 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'JL.SEPAKBOLA NO.24 RT.02/14 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(610, 619, 'SINDY NATALIA ARIPIN', NULL, 'Ahli Waris', 'JL.CIBUNUT NO.198/34 RT.03/11 KEL.KEBON PISANG KEC.SUMUR BANDUNG KOTA BANDUNG', 'JL.CIBUNUT NO.198/34 RT.03/11 KEL.KEBON PISANG KEC.SUMUR BANDUNG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(611, 620, 'JIMMY PARLIN', NULL, 'Ahli Waris', 'JL.PARAHYANGAN 1/3 RT.04/16 KEL.PORIS PLAWAD INDAH KEC.CIPONDOH TANGERANG', 'JL.PARAHYANGAN 1/3 RT.04/16 KEL.PORIS PLAWAD INDAH KEC.CIPONDOH TANGERANG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(612, 621, 'ELIA IBRAHIM', NULL, 'Ahli Waris', 'JL.TAMAN HOLIS INDAH B.3/43 RT.09/01 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON', 'JL.TAMAN HOLIS INDAH B.3/43 RT.09/01 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(613, 622, 'LINA MARLINA', NULL, 'Ahli Waris', 'JL.PERM HEGAR MANAH ASRI RT.05/01 KEL.HEGARMANAH KEC.CIKANCUNG KAB.BANDUNG', 'JL.PERM HEGAR MANAH ASRI RT.05/01 KEL.HEGARMANAH KEC.CIKANCUNG KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(614, 623, 'DWI RAHAYU MARTIANA', NULL, 'Ahli Waris', 'JL.JATIHANDAP RT.01/16 KEL.JATIHANDAP KEC.MANDALAJATI KOTA BANDUNG', 'JL.JATIHANDAP RT.01/16 KEL.JATIHANDAP KEC.MANDALAJATI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(615, 624, 'PUDJI OKTAVIANI', NULL, 'Ahli Waris', 'JL.SUKATMA GG.KENCANA 3 NO.90 RT.01/09 KEL.PASIRLAYUNNG KEC.CIBEUNYING KIDUL BDG', 'JL.SUKATMA GG.KENCANA 3 NO.90 RT.01/09 KEL.PASIRLAYUNNG KEC.CIBEUNYING KIDUL BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(616, 625, 'DANIEL FARREL WIDYA', NULL, 'Ahli Waris', 'JL.SUKA KARYA RT.03/12 KEL.CICAHEUM KEC.KIARACONDONG KOTA BANDUNG', 'JL.SUKA KARYA RT.03/12 KEL.CICAHEUM KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(617, 626, 'HITLER NAINGGOLAN', NULL, 'Ahli Waris', 'JL.SUKAGALIH GG.PA ELAS 108 RT.04/08 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'JL.SUKAGALIH GG.PA ELAS 108 RT.04/08 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(618, 627, 'RICKY PERMADI SURYAMAN', NULL, 'Ahli Waris', 'JL.TAMAN KOPO INDAH II BLOK D.4 NO.2 RT.04/19 KEL.MEKAR RAHAYU KEC.MARGAASIH', 'JL.TAMAN KOPO INDAH II BLOK D.4 NO.2 RT.04/19 KEL.MEKAR RAHAYU KEC.MARGAASIH', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(619, 628, 'DICKY SUGIARTO', NULL, 'Ahli Waris', 'CILAND CIWASTRA PARK CENDANA 2 NO.5 RT.03/01 KEL.BUAHBATU KEC.BOJONGSOANG BANDUNG', 'CILAND CIWASTRA PARK CENDANA 2 NO.5 RT.03/01 KEL.BUAHBATU KEC.BOJONGSOANG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(620, 629, 'KICKY', NULL, 'Ahli Waris', 'GG.CIKAWAO DLM III NO.83/36A RT.02/07 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'GG.CIKAWAO DLM III NO.83/36A RT.02/07 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(621, 630, 'BILLY FERRYAN TUNGGAL', NULL, 'Ahli Waris', 'JL.SARITEM NO.59/8B RT.05/09 KEL.KEBON JERUK KEC.ANDIR KOTA BANDUNG', 'JL.SARITEM NO.59/8B RT.05/09 KEL.KEBON JERUK KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(622, 631, 'ANNY LIDYAWATI KURNIAWAN', NULL, 'Ahli Waris', 'JL.TRS.PASIRKOJA NO.14B RT.07/06 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'JL.TRS.PASIRKOJA NO.14B RT.07/06 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(623, 632, 'ANGELLITA.A SIAHAAN', NULL, 'Ahli Waris', 'PER.BUAHBATU SEMARE JL.APPLE KEL.CIPAGALO KEC.BOJONGSOANG BANDUNG', 'PER.BUAHBATU SEMARE JL.APPLE KEL.CIPAGALO KEC.BOJONGSOANG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(624, 633, 'ERWIN GUNAWAN', NULL, 'Ahli Waris', 'KP.MARGA ENDAH NO.87 RT.03/03 KEL.CIMAHI KEC.CIMAHI TENGAH KOTA CIMAHI', 'KP.MARGA ENDAH NO.87 RT.03/03 KEL.CIMAHI KEC.CIMAHI TENGAH KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(625, 634, 'MELA SINTHIA KARTIKA', NULL, 'Ahli Waris', 'GG.SALEH NO.254/66 RT.03/06 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'GG.SALEH NO.254/66 RT.03/06 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(626, 635, 'INDRIYANI MEGAWATI', NULL, 'Ahli Waris', 'GG AWIWULUNG NO.48/22 C RT.01/09 KEL.KARANGANYR KEC.ASTAANYAR KOTA BANDUNG', 'GG AWIWULUNG NO.48/22 C RT.01/09 KEL.KARANGANYR KEC.ASTAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(627, 636, 'BUDJONO', NULL, 'Ahli Waris', 'JL.SUMBERR ASIH 7-23 RT.01/09 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.SUMBERR ASIH 7-23 RT.01/09 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(628, 637, 'IRWAN IRAWAN', NULL, 'Ahli Waris', 'JL.SUMBER RESIK NO.75 RT.07/11 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.SUMBER RESIK NO.75 RT.07/11 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(629, 638, 'ROSANA TEHA SANTOSA', NULL, 'Ahli Waris', 'JL.SALAM NO.44 RT.01/06 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'JL.SALAM NO.44 RT.01/06 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(630, 639, 'DESSY', NULL, 'Ahli Waris', 'JL.SRIGUNTING SELATAN NO.22 RT.04/07 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'JL.SRIGUNTING SELATAN NO.22 RT.04/07 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(631, 640, 'R.YOGA IRAWAN', NULL, 'Ahli Waris', 'JL.SARIJADI BARU II NO.6/21 RT.02/06 KEL.SUKARASA KEC.SUKASARI KOTA BANDUNG', 'JL.SARIJADI BARU II NO.6/21 RT.02/06 KEL.SUKARASA KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(632, 641, 'YUSUF TJIPTADJAYA', NULL, 'Ahli Waris', 'JL.PAGARSIH GG.WD SASTRA NO.329/87 KEL.JAMIKA KEC.BOJONGLOAKALER KOTA BANDUNG', 'JL.PAGARSIH GG.WD SASTRA NO.329/87 KEL.JAMIKA KEC.BOJONGLOAKALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(633, 642, 'ARIGATO SIMASMATA', NULL, 'Ahli Waris', 'JL.BABAKAN SARI RT.03/014 KEL.BABAKAN SARI KEC.KIARACONDONG KOTA BANDUNG', 'JL.BABAKAN SARI RT.03/014 KEL.BABAKAN SARI KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(634, 643, 'DANIEL PRS SIAGIAN', NULL, 'Ahli Waris', 'JL.TIDORE RAYA NO.05 RT.05/23 KEL.BENCONGAN KEC.KELAPA DUA TANGERANG', 'JL.TIDORE RAYA NO.05 RT.05/23 KEL.BENCONGAN KEC.KELAPA DUA TANGERANG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(635, 644, 'THIAN SIE AL.RACHMAT.M', NULL, 'Ahli Waris', 'JL.SUKAWARNA BLOK A II NO.5 RT.03/02 KEL.HUSEINSASTRANEGARA KEC.CICENDO BANDUNG', 'JL.SUKAWARNA BLOK A II NO.5 RT.03/02 KEL.HUSEINSASTRANEGARA KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(636, 645, 'GUSNIASI PAULINA', NULL, 'Ahli Waris', 'JL.CIBUNTU T IMUR NO.21 RT.06/04 KEL.WARUNG MUNCANG KEC.BANDUNG KULON KOTA BANDUNG', 'JL.CIBUNTU T IMUR NO.21 RT.06/04 KEL.WARUNG MUNCANG KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(637, 646, 'GLORIAN ARGADAHA', NULL, 'Ahli Waris', 'JL.NEGLASARI UTARA RT.02/04 KEL.SUKAPDA KEC.CIEBUNYING KIDUL KOTA BANDUNG', 'JL.NEGLASARI UTARA RT.02/04 KEL.SUKAPDA KEC.CIEBUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(638, 647, 'IMMANUEL HALIM', NULL, 'Ahli Waris', 'JL.PABAIKI NO.23 RT.03/04 KEL.PANJUNAN KEC.ASTANAANYAR KOTA BANDUNG', 'JL.PABAIKI NO.23 RT.03/04 KEL.PANJUNAN KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(639, 648, 'AGUNG GUNAWAN', NULL, 'Ahli Waris', 'KP.CIWALEN RT.03/09 KEL.KAWUNG LUWUK KEC.SUKARESMI CIANJUR', 'KP.CIWALEN RT.03/09 KEL.KAWUNG LUWUK KEC.SUKARESMI CIANJUR', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(640, 649, 'TANIAWIJAYA PUTRI', NULL, 'Ahli Waris', 'JL.PLERED XI NO.14 RT.05/11 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.PLERED XI NO.14 RT.05/11 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(641, 650, 'HERLINA KUSUMAWATI', NULL, 'Ahli Waris', 'JL.BBK CISEUREUH TIMUR RT.04/07 KEL.CISEUREUH KEC.REGOL KOTA BANDUNG', 'JL.BBK CISEUREUH TIMUR RT.04/07 KEL.CISEUREUH KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(642, 651, 'ENIE RAHAJU', NULL, 'Ahli Waris', 'JL.MANIKMAYA NO.16 RT.06/03 KEL.CIBADUYUT WETAN KEC.BOJONGLOA KIDUL BANDUNG', 'JL.MANIKMAYA NO.16 RT.06/03 KEL.CIBADUYUT WETAN KEC.BOJONGLOA KIDUL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(643, 652, 'MEGA CAHYAWATI', NULL, 'Ahli Waris', 'JL.MUARA TIMUR I NO.12 RT.05/05 KRL.PRLINDUNG HEWAN KEC.AS', 'JL.MUARA TIMUR I NO.12 RT.05/05 KRL.PRLINDUNG HEWAN KEC.AS', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(644, 653, 'IRWAN NURHARMANSYAH', NULL, 'Ahli Waris', 'JL.BABAKAN JATI NO.1 RT.07/11 KEL.GUMURUH KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.BABAKAN JATI NO.1 RT.07/11 KEL.GUMURUH KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(645, 654, 'ELVISON  JAYA', NULL, 'Ahli Waris', 'JL.KEMBAR TENGAH V/I A RT.04/12 KEL.CIGERELENG KEC.REGOL KOTA BANDUNG', 'JL.KEMBAR TENGAH V/I A RT.04/12 KEL.CIGERELENG KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(646, 655, 'YESAYA YOHANES', NULL, 'Ahli Waris', 'JL.SADIREJA V NO.23 RT.06/03 KEL.SUKAHAJI KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.SADIREJA V NO.23 RT.06/03 KEL.SUKAHAJI KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(647, 656, 'SONYA AGNES MARTHA', NULL, 'Ahli Waris', 'JL.GEMPOL ASRI V NO.12 RT.05/10 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'JL.GEMPOL ASRI V NO.12 RT.05/10 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(648, 657, 'SHERLY', NULL, 'Ahli Waris', 'GG.SUKAPAKIR DLM I NO.180/87 KEL.JAMIKA KEC.BOJONG KALER KOTA BANDUNG', 'GG.SUKAPAKIR DLM I NO.180/87 KEL.JAMIKA KEC.BOJONG KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(649, 658, 'WILLIAM PERMANA', NULL, 'Ahli Waris', 'JL.KIARSARI PERMAI VI NO.3 RT.06/01 KEL.MARGAASIH KEC.BUAH BATU KOTA BANDUNG', 'JL.KIARSARI PERMAI VI NO.3 RT.06/01 KEL.MARGAASIH KEC.BUAH BATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(650, 659, 'FRANSISCUS SEMBIRING', NULL, 'Ahli Waris', 'JL.CIBEUNYING KOLOT NO.19 RT.03/11 KEL.CIGADUNG KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.CIBEUNYING KOLOT NO.19 RT.03/11 KEL.CIGADUNG KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(651, 660, 'WINHARD JULIUS SERMON', NULL, 'Ahli Waris', 'JL.CISARANTEN KULON IX NO.5 RT.08/05 KEL.CISARANTEN KULON KEC.ARCAMANIK BANDUNG', 'JL.CISARANTEN KULON IX NO.5 RT.08/05 KEL.CISARANTEN KULON KEC.ARCAMANIK BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(652, 661, 'SHERLI APRIANI', NULL, 'Ahli Waris', 'JL.CIBANGKONG DALAM NO.48 RT.07/08 KEL.CIBANGKONG KEC.BATUNUNGGAL BANDUNG', 'JL.CIBANGKONG DALAM NO.48 RT.07/08 KEL.CIBANGKONG KEC.BATUNUNGGAL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(653, 662, 'ANDI DHARMAWAN', NULL, 'Ahli Waris', 'JL.BUDHI RT.08/03 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'JL.BUDHI RT.08/03 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23');
INSERT INTO `ahli_waris` (`id`, `almarhum_id`, `nama_lengkap`, `nik`, `hubungan`, `alamat`, `alamat_jalan`, `no_rumah`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota_kabupaten`, `provinsi`, `no_telepon`, `created_at`, `updated_at`) VALUES
(654, 663, 'MERRY ELLEN', NULL, 'Ahli Waris', 'JL.JOGING RAYA NO.7 RT.03/13 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'JL.JOGING RAYA NO.7 RT.03/13 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(655, 664, 'HIZKIA MARULI TUA.M', NULL, 'Ahli Waris', 'JL.SOLO NO.54 RT.05/11 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.SOLO NO.54 RT.05/11 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(656, 665, 'KURNIAWAN HANDY SAPUTRA', NULL, 'Ahli Waris', 'JL.CIATEUL KIDUL NO.17 RT.09/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'JL.CIATEUL KIDUL NO.17 RT.09/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(657, 666, 'HARRY', NULL, 'Ahli Waris', 'JL.MARGAHAYU RAYA BRT C.III NO.119 RT.09/06 KEL.SEKEJATI KEC.BUAHBATU KOTA BANDUNG', 'JL.MARGAHAYU RAYA BRT C.III NO.119 RT.09/06 KEL.SEKEJATI KEC.BUAHBATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(658, 667, 'WILLEM CORNELIS KUMAJAS', NULL, 'Ahli Waris', 'JL.SARIWATES IV NO.15 RT.04/14 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.SARIWATES IV NO.15 RT.04/14 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(659, 668, 'DANIEL ERAWAN', NULL, 'Ahli Waris', 'JL.DURMAN NO.48 RT.08/05KEL.KEBON JERUK KEC.ANDIR KOTA BANDUNG', 'JL.DURMAN NO.48 RT.08/05KEL.KEBON JERUK KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(660, 669, 'FELICIANA SUHARYANTI.W', NULL, 'Ahli Waris', 'JL.ANGGREK NO.52 RT.05/07 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'JL.ANGGREK NO.52 RT.05/07 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(661, 670, 'MICHEE ANGEL PRISCILA', NULL, 'Ahli Waris', 'JL.NYENGSERET UTARA GG.YEYESURYA NO.109/198B RT.07/02 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL', 'JL.NYENGSERET UTARA GG.YEYESURYA NO.109/198B RT.07/02 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(662, 671, 'JOHANES HARTONO', NULL, 'Ahli Waris', 'JL.TRS SOMA NO.09 RT.03/13 KEL.BBK SURABAYA KEC.KIARACONDONG KOTA BANDUNG', 'JL.TRS SOMA NO.09 RT.03/13 KEL.BBK SURABAYA KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(663, 672, 'PETER WIDAYAT', NULL, 'Ahli Waris', 'KOMP.SUKAMENAK INDAH BLOK R.24 RT.10/07 KEL.SUKAMENAK KEC.MARGAHAYU KOTA BANDUNG', 'KOMP.SUKAMENAK INDAH BLOK R.24 RT.10/07 KEL.SUKAMENAK KEC.MARGAHAYU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(664, 673, 'JOHANES MAILOA', NULL, 'Ahli Waris', 'PULO GANGSA RT.03/04 KEL.URITERU KEC.SIRIMAU AMBON', 'PULO GANGSA RT.03/04 KEL.URITERU KEC.SIRIMAU AMBON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(665, 674, 'HENDRIK.M.PANGGABEAN', NULL, 'Ahli Waris', 'JL.ERMAWAR NO.24/10 RT.04/04 KEL.MERDEKA KEC.SUMUR BANDUNG KOTA BANDUNG', 'JL.ERMAWAR NO.24/10 RT.04/04 KEL.MERDEKA KEC.SUMUR BANDUNG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(666, 675, 'BEDMAN SIREGAR', NULL, 'Ahli Waris', 'JL.HOLIS NO.95/82 KEL.WARUNG MUNCANG KEC.BANDUNG KULON BANDUNG', 'JL.HOLIS NO.95/82 KEL.WARUNG MUNCANG KEC.BANDUNG KULON BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(667, 676, 'HERU IRAWAN JAHJA', NULL, 'Ahli Waris', 'JL.GG.SALEH NO.216/66   RT.04/06 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'JL.GG.SALEH NO.216/66   RT.04/06 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(668, 677, 'NATHALIA AGUSTIN', NULL, 'Ahli Waris', 'GG.SALUYU I NO.26 RT.05/06 KEL.CIBADAK KEC.ASTANA ANYAR', 'GG.SALUYU I NO.26 RT.05/06 KEL.CIBADAK KEC.ASTANA ANYAR', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(669, 678, 'TRIBUDI KRISTIANTO', NULL, 'Ahli Waris', 'JL.SUNGAI TIRAI NO.01 RT.08/02 KEL.MARUNDA KEC.CILINCING BANDUNG', 'JL.SUNGAI TIRAI NO.01 RT.08/02 KEL.MARUNDA KEC.CILINCING BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(670, 679, 'MIDIAN HUTAPEA', NULL, 'Ahli Waris', 'JL.TRS CISOKAN NO.3 RT.01/08 KEL.CIHAUR GEULIS KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.TRS CISOKAN NO.3 RT.01/08 KEL.CIHAUR GEULIS KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(671, 680, 'SAMUEL ZAINUDDIN DAMBARU', NULL, 'Ahli Waris', 'JL.JERUK NO.07 RT.03/08 KEL.CIHAPIT KEC.BADNDUNG WETAN KOTA BANDUNG', 'JL.JERUK NO.07 RT.03/08 KEL.CIHAPIT KEC.BADNDUNG WETAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(672, 681, 'RONY RONALDO FAAH', NULL, 'Ahli Waris', 'JL.TAMAN KOPO INDAH I BLOK E-45 KEL.MARGAHAYU SELATAN KEC.MARGAHAYU KOTA BANDUNG', 'JL.TAMAN KOPO INDAH I BLOK E-45 KEL.MARGAHAYU SELATAN KEC.MARGAHAYU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(673, 682, 'SAMUEL RICHARD HABINSARAN', NULL, 'Ahli Waris', 'JL.TERS.CIKAJANG RAYA II NO.F1 RT.01/15 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'JL.TERS.CIKAJANG RAYA II NO.F1 RT.01/15 KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(674, 683, 'JERRY WERINUSSA', NULL, 'Ahli Waris', 'JL.CILACAP NO.09 RT.02/12 KEL.ANTAPANI KIDULKEC.ANTAPANI KOTA BANDUNG', 'JL.CILACAP NO.09 RT.02/12 KEL.ANTAPANI KIDULKEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(675, 684, 'DEBORA.F.AMBAT', NULL, 'Ahli Waris', 'JL.CILAKI NO,19 RT.07/04 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'JL.CILAKI NO,19 RT.07/04 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(676, 685, 'STEFANUS SUSANTO', NULL, 'Ahli Waris', 'GG.SEMAR DLM IV NO.76C RT.08/05 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'GG.SEMAR DLM IV NO.76C RT.08/05 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(677, 686, 'REGINA ELISABETH SONDAKH', NULL, 'Ahli Waris', 'JL.H SIMANG NO.97F RT.10/08 KEL.SRENGSENG SAWAH  KEC.JAGAKARSA JAKARTA SELATAN', 'JL.H SIMANG NO.97F RT.10/08 KEL.SRENGSENG SAWAH  KEC.JAGAKARSA JAKARTA SELATAN', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(678, 687, 'CHRISTINA TJIOE', NULL, 'Ahli Waris', 'JL.ARIA TIMUR I NO.1 RT.06/02 KLE.CIPAMOKOLAN KEC.RANCASARI KAB.BANDUNG', 'JL.ARIA TIMUR I NO.1 RT.06/02 KLE.CIPAMOKOLAN KEC.RANCASARI KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(679, 688, 'ROBERT KENNEDY MANALU', NULL, 'Ahli Waris', 'JL.PUSPA 46 RT.05/18 KEL.RANCAMANYAR KEC.BALEENDAH BANDUNG', 'JL.PUSPA 46 RT.05/18 KEL.RANCAMANYAR KEC.BALEENDAH BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(680, 689, 'DJULIANI BUNJAMIN', NULL, 'Ahli Waris', 'JL.KACAPIRING NO.17 RT.03/02 KEL.KACAPIRING KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.KACAPIRING NO.17 RT.03/02 KEL.KACAPIRING KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(681, 690, 'YANUAR YOSUA', NULL, 'Ahli Waris', 'JL.GG.H.YASIN VII RT.06/02 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'JL.GG.H.YASIN VII RT.06/02 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(682, 691, 'RICHARDUS ABRO BERLIANTO', NULL, 'Ahli Waris', 'JL.GAMBIR ANOM NO.38 RT.02/03 KEL.SUKALUYU KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.GAMBIR ANOM NO.38 RT.02/03 KEL.SUKALUYU KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(683, 692, 'JO TJOAN LIE', NULL, 'Ahli Waris', 'GG.MUKALMI NO.51/86 RT.02/03 KEL.JAMIKA KEC.BJLOAKALER KOTA BANDUNG', 'GG.MUKALMI NO.51/86 RT.02/03 KEL.JAMIKA KEC.BJLOAKALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(684, 693, 'SAMUEL.C.TOBING', NULL, 'Ahli Waris', 'KOMP.GBI BLOK H-4 NO.12A RT.03/13 KEL.BUAHBATU KEC.BOJONGSOANG KOTA BANDUNG', 'KOMP.GBI BLOK H-4 NO.12A RT.03/13 KEL.BUAHBATU KEC.BOJONGSOANG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(685, 695, 'DANI MARDANI WINOKAN', NULL, 'Ahli Waris', 'JL.KARANGSARI GG.LANGENSARI NO.72 RT.05/02 KEL.CIBEUREUM KEC.CIMAHI SELATAN KOTA CIMAHI', 'JL.KARANGSARI GG.LANGENSARI NO.72 RT.05/02 KEL.CIBEUREUM KEC.CIMAHI SELATAN KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(686, 696, 'JEAN MARYANA MARGARETA', NULL, 'Ahli Waris', 'JL.CINTAASIH NO.131/122 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.CINTAASIH NO.131/122 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(687, 697, 'ANGGIE DEBORA PANGGABEAN', NULL, 'Ahli Waris', 'JL.MEGA PERMAI NO.05 RT.06/05 KEL,SUKARAJA KEC.CICENDO KOTA BANDUNG', 'JL.MEGA PERMAI NO.05 RT.06/05 KEL,SUKARAJA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(688, 698, 'PAMELA SELY LATUMAERISSA', NULL, 'Ahli Waris', 'JL.PASIRLAYUNG TIMUR I/42 YRT.06/02 KEL.PASIRLAYUNG KEC.CIBEUNYING KIDUL BANDUNG', 'JL.PASIRLAYUNG TIMUR I/42 YRT.06/02 KEL.PASIRLAYUNG KEC.CIBEUNYING KIDUL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(689, 699, 'BERKATI MENDROFA', NULL, 'Ahli Waris', 'JL.SAWAH LEGA NO.29 RT.03/06 KEL.LEDENG KEC.CIDADAP KOTA BANDUNG', 'JL.SAWAH LEGA NO.29 RT.03/06 KEL.LEDENG KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(690, 700, 'SYLFIA', NULL, 'Ahli Waris', 'JL.BAPA SUPI NO.06 RT.01/02 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'JL.BAPA SUPI NO.06 RT.01/02 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(691, 701, 'SIE SUNAR WIDODO', NULL, 'Ahli Waris', 'JL.SETRADUTA PERMAI VI NO.08 RT.07/09 KEL.PASIRKALIKI KEC.CIMAHI UTARA KOTA CIMAHI', 'JL.SETRADUTA PERMAI VI NO.08 RT.07/09 KEL.PASIRKALIKI KEC.CIMAHI UTARA KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(692, 702, 'YERIKHO.L.SIRERA MANUTUA', NULL, 'Ahli Waris', 'JL.BAJI MINAHASA NO.06 RT.01/01 KEL.TAMARUNANG KEC.MARISO KOTA MAKASAR', 'JL.BAJI MINAHASA NO.06 RT.01/01 KEL.TAMARUNANG KEC.MARISO KOTA MAKASAR', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(693, 703, 'MARTHINUS THEODORUS', NULL, 'Ahli Waris', 'GG.SUKAMULYA NO.68/142B RT.05/09 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'GG.SUKAMULYA NO.68/142B RT.05/09 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(694, 704, 'KRISWANTO WIDJAYA', NULL, 'Ahli Waris', 'JL.SALENDRO TIMUR VII NO.14A RT.08/07 KEL.GUMURUH KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.SALENDRO TIMUR VII NO.14A RT.08/07 KEL.GUMURUH KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(695, 705, 'WILI STEPVANNI', NULL, 'Ahli Waris', 'JL.PAJAGALAN 2 NO.95/22B RT.02/03 KEL.NYENGSERET KEC.ASTANAANYAR BANDUNG', 'JL.PAJAGALAN 2 NO.95/22B RT.02/03 KEL.NYENGSERET KEC.ASTANAANYAR BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(696, 707, 'STEPHEN ANTONIUS TRIONO.D', NULL, 'Ahli Waris', 'JL.BABAKAN CIBEREUM RT.04/01 KEL.CAMPAKA KEC.ANDIR KOTA BANDUNG', 'JL.BABAKAN CIBEREUM RT.04/01 KEL.CAMPAKA KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(697, 708, 'THIAN ROPE', NULL, 'Ahli Waris', 'GRIYA CEMPAKA ARUM C.3 NO.37 RT.03/07 KEL.RANCANUMPANG KEC.GEDEBAGE BANDUNG', 'GRIYA CEMPAKA ARUM C.3 NO.37 RT.03/07 KEL.RANCANUMPANG KEC.GEDEBAGE BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(698, 709, 'SUMBER DONGORAN SIREGAR', NULL, 'Ahli Waris', 'MANTAP RAYA NO.31 RT.06/14 KEL.BABAKAN S URABAYA KEC.KIARACONDONG BANDUNG', 'MANTAP RAYA NO.31 RT.06/14 KEL.BABAKAN S URABAYA KEC.KIARACONDONG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(699, 710, 'ELISABETH MARGARETA.V', NULL, 'Ahli Waris', 'JL.KAWISTA NO.15 RT.04/01 KEL.CIGADUNG KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.KAWISTA NO.15 RT.04/01 KEL.CIGADUNG KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(700, 711, 'CHRISTINE STEPHANIE', NULL, 'Ahli Waris', 'JKOMP.CIPTA GRAHABLOK.CD-7 RT.09/03 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'JKOMP.CIPTA GRAHABLOK.CD-7 RT.09/03 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(701, 712, 'YULIAN PATHILEAMONIA', NULL, 'Ahli Waris', 'JL.PARIWISATA NO.1A RT.01/03 KEL.SUKAWARNA KEC.SUKAJADI KOTA BANDUNG', 'JL.PARIWISATA NO.1A RT.01/03 KEL.SUKAWARNA KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(702, 713, 'HOLMES SIAHAAN', NULL, 'Ahli Waris', 'KOMP.ALAM ASRI RES NO.2 RT.01/19 KEL.CITEUREUP KEC.CIMAHI UTARA KOTA CIMAHI', 'KOMP.ALAM ASRI RES NO.2 RT.01/19 KEL.CITEUREUP KEC.CIMAHI UTARA KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(703, 714, 'MELIANA IOLA RONNY', NULL, 'Ahli Waris', 'JL.CIBADAK NO.257 RT.04/03 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'JL.CIBADAK NO.257 RT.04/03 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(704, 715, 'CHERISTYNA MEYSIAN', NULL, 'Ahli Waris', 'JL.DAGO ELOS II NO.165 RT.02/02 KEL.DAGO KEC.COBLONG KOTA BANDUNG', 'JL.DAGO ELOS II NO.165 RT.02/02 KEL.DAGO KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(705, 716, 'LASWATI', NULL, 'Ahli Waris', 'JL.KARANG TINGGAL DLM RT.07.111 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'JL.KARANG TINGGAL DLM RT.07.111 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(706, 717, 'FAHRUDIN LUTRI', NULL, 'Ahli Waris', 'JL.PASIRKALIKI GG.PA ENTO NO.71B/65 RT.01/11 KEL.SUKABUNGAH KEC.SUKAJADI BANDUNG', 'JL.PASIRKALIKI GG.PA ENTO NO.71B/65 RT.01/11 KEL.SUKABUNGAH KEC.SUKAJADI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(707, 718, 'SONNY FEBRIAN TELAUMBANUA', NULL, 'Ahli Waris', 'JL.KOPO NO.67 RT.01/05 KEL.PANJUNAN KEC.ASTANAANYAR KOTA BANDUNG', 'JL.KOPO NO.67 RT.01/05 KEL.PANJUNAN KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(708, 719, 'HERRY SETYADI', NULL, 'Ahli Waris', 'JL.MALEBER UTARA NO.3 RT.04/03 KEL.GARUDA KEC.ANDIR KOTA BANDUNG', 'JL.MALEBER UTARA NO.3 RT.04/03 KEL.GARUDA KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(709, 721, 'ELINE ARNI', NULL, 'Ahli Waris', 'JL.SRISUCI NO.15 RT.04/05 KEL.ANCOL KEC.REGOL KOTA BANDUNG', 'JL.SRISUCI NO.15 RT.04/05 KEL.ANCOL KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(710, 723, 'LL.MARTA AROMA', NULL, 'Ahli Waris', 'JL.JAJAWAY BRT I NO.23 RT.01/18 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.JAJAWAY BRT I NO.23 RT.01/18 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(711, 724, 'DRS.RACHMAN', NULL, 'Ahli Waris', 'JL.DEWA WARMAN NO.37 RT.09/07 KEL.CIBADUYUT SELATA KEC.BOJONGLOA KIDUL BANDUNG', 'JL.DEWA WARMAN NO.37 RT.09/07 KEL.CIBADUYUT SELATA KEC.BOJONGLOA KIDUL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(712, 725, 'HERU JUDI HALOMOAN', NULL, 'Ahli Waris', 'JL.SUKARAJIN II NO.19 RT.01/12 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'JL.SUKARAJIN II NO.19 RT.01/12 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(713, 726, 'FRIDA YUSTIANTI', NULL, 'Ahli Waris', 'JL.KOPO BLOK G 396 RT.01/03 KEL.KOPO KEC.BOJONGLOA KIDUL', 'JL.KOPO BLOK G 396 RT.01/03 KEL.KOPO KEC.BOJONGLOA KIDUL', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(714, 727, 'NORMAULINA DOLOKSARIBU', NULL, 'Ahli Waris', 'JL.GEMPOL ASRI RAYA BABU I NO.22 J  RT.05/13 KEL.CIGONDEWAH KALER KEC.BANDUNG KULON BDG', 'JL.GEMPOL ASRI RAYA BABU I NO.22 J  RT.05/13 KEL.CIGONDEWAH KALER KEC.BANDUNG KULON BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(715, 728, 'ROBERT MARDIONO', NULL, 'Ahli Waris', 'JL.SALUYU XVI C NO.509 RT.10/09 KEL.CIGONDEWAH KALER KEC.BANDUNG KULON KOTA BANDUNG', 'JL.SALUYU XVI C NO.509 RT.10/09 KEL.CIGONDEWAH KALER KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(716, 729, 'STANLEY ZACHARIAS', NULL, 'Ahli Waris', 'JL.TENTERAM DLM NO.2 RT.08/09 KEL.PASTEUR KEC.SUKAJADI KOTA BANDUNG', 'JL.TENTERAM DLM NO.2 RT.08/09 KEL.PASTEUR KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(717, 730, 'YONATAN HALIM', NULL, 'Ahli Waris', 'JL.NAWAWI NO.3 RT.05/10 KEL.SUKAHAJI KEC.BBK CIPARAY KOTA BANDUNG', 'JL.NAWAWI NO.3 RT.05/10 KEL.SUKAHAJI KEC.BBK CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(718, 731, 'JACOBUS AAN ABEDNEGO', NULL, 'Ahli Waris', 'KOMP.PERMATA RAYA R-2 NO.2 RT.06/05 KEL.TANIMULYA KEC.NGAMPRAH BANDUNG', 'KOMP.PERMATA RAYA R-2 NO.2 RT.06/05 KEL.TANIMULYA KEC.NGAMPRAH BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(719, 732, 'HERMAWAN LUNANDY', NULL, 'Ahli Waris', 'JL.ASTINA NO.18 RT.18 RT.05/04 KEL.PAMOYANAN KEC.CICENDO KOTA BANDUNG', 'JL.ASTINA NO.18 RT.18 RT.05/04 KEL.PAMOYANAN KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(720, 734, 'RONALD MAXMILIAN', NULL, 'Ahli Waris', 'JL.PURI AYU PRATAMA IV NO.04 RT.04/14  KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'JL.PURI AYU PRATAMA IV NO.04 RT.04/14  KEL.SUKAMISKIN KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(721, 735, 'PANGARAN SINAGA', NULL, 'Ahli Waris', 'JL.KIARA ASRI UTARA NO.2 RT.07/12 KEL.SUKAPURA KEC.KIARACONDONG KOTA BANDUNG', 'JL.KIARA ASRI UTARA NO.2 RT.07/12 KEL.SUKAPURA KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(722, 736, 'FIETJE BETSIE TAMUNU', NULL, 'Ahli Waris', 'JL.SALUYU .VII/II NO.38 RT.04/09 KEL.CIPAMOKOLAN KEC.RANCASARI KOTA BANDUNG', 'JL.SALUYU .VII/II NO.38 RT.04/09 KEL.CIPAMOKOLAN KEC.RANCASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(723, 737, 'A.J MUKTI', NULL, 'Ahli Waris', 'JL.INTAN MULYA IV C.4 NO.RT.04/12 KEL.DERWATI KEC.RANCASARI KOTA BANDUNG', 'JL.INTAN MULYA IV C.4 NO.RT.04/12 KEL.DERWATI KEC.RANCASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(724, 738, 'JAMMY KURNIA TATANG', NULL, 'Ahli Waris', 'JL.SRI ELOK NO.1A RT.08/06 KEL.ANCOL KEC.REGOL KOTA BANDUNG', 'JL.SRI ELOK NO.1A RT.08/06 KEL.ANCOL KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(725, 739, 'PILIPUS KOSIMWIDJAJA', NULL, 'Ahli Waris', 'JL.MUARA BARU NO.22 RT.11/04 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.MUARA BARU NO.22 RT.11/04 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(726, 740, 'RICKY PERMADI SURYAMAN', NULL, 'Ahli Waris', 'JL.TKI.II BLOK D.4 NO.27 RT.04/19 KEL.MEKARRAHAYU KEC.MARGAASIH KOTA BANDUNG', 'JL.TKI.II BLOK D.4 NO.27 RT.04/19 KEL.MEKARRAHAYU KEC.MARGAASIH KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(727, 741, 'ANDREW RYAN PAMUNGKAS', NULL, 'Ahli Waris', 'JL.BINA ASIH UTARA NO.21 RT.02/03 KEL.CIPAMOKOLAN KEC.RANCASARI KOTA BANDUNG', 'JL.BINA ASIH UTARA NO.21 RT.02/03 KEL.CIPAMOKOLAN KEC.RANCASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(728, 742, 'KURNIATY', NULL, 'Ahli Waris', 'JL.KOPO PERMAI II BLOK  5CD NO.21 RT.04/12 KEL.SUKAMENAK KEC.MARGAHAYU KOTA BANDUNG', 'JL.KOPO PERMAI II BLOK  5CD NO.21 RT.04/12 KEL.SUKAMENAK KEC.MARGAHAYU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(729, 743, 'IIN HERRYANI', NULL, 'Ahli Waris', 'GG.SAUYUNAN III NO.9 RT.03/05 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'GG.SAUYUNAN III NO.9 RT.03/05 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(730, 744, 'ERDA LIANA', NULL, 'Ahli Waris', 'JL.TULIP III NO.20 RT.07/04 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'JL.TULIP III NO.20 RT.07/04 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(731, 745, 'YONATHAN', NULL, 'Ahli Waris', 'JL.DIAN INDAH I NO.21 RT.04/12 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.DIAN INDAH I NO.21 RT.04/12 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(732, 746, 'ELPRIDA MARBUN', NULL, 'Ahli Waris', 'GG.MARGA CINTA DLM RT.05/03 KEL.CIJAWURA KEC.BUAH BATU KOTA BANDUNG', 'GG.MARGA CINTA DLM RT.05/03 KEL.CIJAWURA KEC.BUAH BATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(733, 747, 'ANTONIUS', NULL, 'Ahli Waris', 'CLUSTER GLADISS NO.3 RT.02/22 KEL.JAYAMEKAR KEC.PADALARANG KAB.BANDUNG', 'CLUSTER GLADISS NO.3 RT.02/22 KEL.JAYAMEKAR KEC.PADALARANG KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(734, 748, 'TOTO KURNIA SOMALI', NULL, 'Ahli Waris', 'JL.KAVLING G-7 KOMP.ISTANA  REGENCY RT.02/02 KEL.HUSEINSASTRANEGARA KEC.CICENDO BDG', 'JL.KAVLING G-7 KOMP.ISTANA  REGENCY RT.02/02 KEL.HUSEINSASTRANEGARA KEC.CICENDO BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(735, 749, 'PARUN KARYA SIAGIAN', NULL, 'Ahli Waris', 'KOMP.BUMI PANYILEUKAN BLOK H-7 NO.9 RT.05/07 KEL.CIPADUNG KIDUL KEC.PANYILEUKAN KAB.BDG', 'KOMP.BUMI PANYILEUKAN BLOK H-7 NO.9 RT.05/07 KEL.CIPADUNG KIDUL KEC.PANYILEUKAN KAB.BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(736, 750, 'SETIAWAN', NULL, 'Ahli Waris', 'JL.KOPO GG.PARASDI DLM III RT.01/07 KEL.SITUSAEUR KEC.BJLOA KIDUL BANDUNG', 'JL.KOPO GG.PARASDI DLM III RT.01/07 KEL.SITUSAEUR KEC.BJLOA KIDUL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(737, 751, 'YOSEP SUGIARTO', NULL, 'Ahli Waris', 'JL.PAMEKAR BARAT I NO.11 RT.01/03 KEL.MEKARMULYA KEC.PANYILEUKAN KAB.BANDUNG', 'JL.PAMEKAR BARAT I NO.11 RT.01/03 KEL.MEKARMULYA KEC.PANYILEUKAN KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(738, 752, 'DIAN SUDIAT', NULL, 'Ahli Waris', 'JL.LEMAH NENDEUT I RT.07/07 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'JL.LEMAH NENDEUT I RT.07/07 KEL.CIKUTRA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(739, 753, 'EKO WAHYUNINGSIH', NULL, 'Ahli Waris', 'JL.PERMATA II BLOK 0-3 NO.6 RT.05/08 KEL.TANIMULYA KEC.NGAMPRAH KAB.BANDUNG', 'JL.PERMATA II BLOK 0-3 NO.6 RT.05/08 KEL.TANIMULYA KEC.NGAMPRAH KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(740, 754, 'SUDIRMAN SIANTURI', NULL, 'Ahli Waris', 'JL.CIBUNTU BARAT RT.06/01 KEL.CARINGIN KEC.BANDUNG KULON KOTA BANDUNG', 'JL.CIBUNTU BARAT RT.06/01 KEL.CARINGIN KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(741, 755, 'LYDYAWATI', NULL, 'Ahli Waris', 'GG.HASAN NO.18 RT.05/01 KEL.NYENGSERET KEC.ASTANAANYAR KOTA BANDUNG', 'GG.HASAN NO.18 RT.05/01 KEL.NYENGSERET KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(742, 756, 'BERNADUS BROLINS', NULL, 'Ahli Waris', 'JL. CIIBUNTU SAYURAN RT.09/06 KEL.WARUNG MUNCANG KEC.BANDUNG KULON KOTA BANDUNG', 'JL. CIIBUNTU SAYURAN RT.09/06 KEL.WARUNG MUNCANG KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(743, 757, 'RAJA FRANS', NULL, 'Ahli Waris', 'JL.GELANGGANG2 RT.04/02 KEL.WAENA KEC.HERAM JAYAPURA', 'JL.GELANGGANG2 RT.04/02 KEL.WAENA KEC.HERAM JAYAPURA', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(744, 758, 'BISUK AVILLA RENATO', NULL, 'Ahli Waris', 'JL.CISOKAN GG.PEMUDA NO.58D RT.02/12 KEL.SUKAMAJU KEC.CIBEUNYING KIDUL BDG', 'JL.CISOKAN GG.PEMUDA NO.58D RT.02/12 KEL.SUKAMAJU KEC.CIBEUNYING KIDUL BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(745, 759, 'TUAMBARITA SIMBOLON', NULL, 'Ahli Waris', 'JL.JUMADI NO.12 RT.04/08 KEL.CIATEUL KEC.REGOL BANDUNG', 'JL.JUMADI NO.12 RT.04/08 KEL.CIATEUL KEC.REGOL BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(746, 761, 'ETY SUHAETI', NULL, 'Ahli Waris', 'JL.CARINGIN GG.PORIB I RT.02/02 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.CARINGIN GG.PORIB I RT.02/02 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(747, 762, 'REBECCA DWI HANDAYANI', NULL, 'Ahli Waris', 'JL.CIPEDES TGH NO.125 RT.02/03 KEL.SUKAGALIH KEC.SUKAJADI KOTA BANDUNG', 'JL.CIPEDES TGH NO.125 RT.02/03 KEL.SUKAGALIH KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(748, 763, 'DANIEL KUSMARA', NULL, 'Ahli Waris', 'JL.SETRAMURNI IIII NO.10 RT.04/04 KEL.SUKARASA KEC.SUKASARI KOTA BANDUNG', 'JL.SETRAMURNI IIII NO.10 RT.04/04 KEL.SUKARASA KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(749, 764, 'PAULUS SUDIANTO', NULL, 'Ahli Waris', 'JL.EMUNG NO.79/36B RT.05/01 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'JL.EMUNG NO.79/36B RT.05/01 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(750, 765, 'INTAN PURNAMASARI D', NULL, 'Ahli Waris', 'JL.BABAKAN MANDIRI RT.08/11 KEL.SUKAPADA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'JL.BABAKAN MANDIRI RT.08/11 KEL.SUKAPADA KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(751, 766, 'HENI', NULL, 'Ahli Waris', 'JL.SUKAPAKIR DLM III RT.03/06 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'JL.SUKAPAKIR DLM III RT.03/06 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(752, 767, 'KICKY', NULL, 'Ahli Waris', 'GG.CIKAWAO DLM III NO.83/36A RT.02/07 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'GG.CIKAWAO DLM III NO.83/36A RT.02/07 KEL.PALEDANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(753, 768, 'WILLY ANDRIAN', NULL, 'Ahli Waris', 'JL.CARINGIN CIKUNKURAK RT.2/06 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.CARINGIN CIKUNKURAK RT.2/06 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(754, 769, 'VERY ROSJA ABDULLAH', NULL, 'Ahli Waris', 'JL.PINUS II NO.26 RT.01/08 KEL.RANCABOLANG KEC.GEDEBAGE KOTA BANDUNG', 'JL.PINUS II NO.26 RT.01/08 KEL.RANCABOLANG KEC.GEDEBAGE KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(755, 770, 'TIMOTIUS URIA', NULL, 'Ahli Waris', 'JL.PERMATA INDAH B-8 RT.03/06 KEL.CARINGIN KEC.BANDUNG KULON', 'JL.PERMATA INDAH B-8 RT.03/06 KEL.CARINGIN KEC.BANDUNG KULON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(756, 771, 'NICOLAS ANGWARMASE', NULL, 'Ahli Waris', 'JL.CIBADUYUT TENGAH RT.06/06 KEL.WARUNG MUNCANG KEC.BANDUNG KULON', 'JL.CIBADUYUT TENGAH RT.06/06 KEL.WARUNG MUNCANG KEC.BANDUNG KULON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(757, 772, 'ELDA PRISKILA SABAT', NULL, 'Ahli Waris', 'JL.DAGO ELOS II RT.02/02 KEL.DAGO KEC.COBLONG KOTA BANDUNG', 'JL.DAGO ELOS II RT.02/02 KEL.DAGO KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(758, 773, 'STEVANS TANDEI', NULL, 'Ahli Waris', 'JL.SETRASARI MALL B.L NO.06 RT.06/01 KEL.SUKAGALIH KEC.SUKAJADI BANDUNG', 'JL.SETRASARI MALL B.L NO.06 RT.06/01 KEL.SUKAGALIH KEC.SUKAJADI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(759, 774, 'LUSTINAR MARPAUNG', NULL, 'Ahli Waris', 'JL.CIJERAH II BLOK 14 NO.09 RT.01/20 KEL.MELONG KEC.CIMAHI KOTA CIMAHI', 'JL.CIJERAH II BLOK 14 NO.09 RT.01/20 KEL.MELONG KEC.CIMAHI KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(760, 775, 'YUYU SUTJIANA', NULL, 'Ahli Waris', 'KP.PASIRKOJA NO.153 RT,07/16 KEL.SADANG SERANG KEC.COBLONG KOTA BANDUNG', 'KP.PASIRKOJA NO.153 RT,07/16 KEL.SADANG SERANG KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(761, 776, 'VEBE SUHERLIAN', NULL, 'Ahli Waris', 'JL.MALEBER BARAT II NO.06 RT.01/06 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'JL.MALEBER BARAT II NO.06 RT.01/06 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(762, 777, 'ANDI', NULL, 'Ahli Waris', 'JL.SITI MARIAH VI NO.399/86A RT.10/01 KEL.JAMIKA KEC.BJLOA KALER KOTA BANDUNG', 'JL.SITI MARIAH VI NO.399/86A RT.10/01 KEL.JAMIKA KEC.BJLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(763, 778, 'TATANG SOERJADI SALIM', NULL, 'Ahli Waris', 'JL.CIROYOM NO.153 RT.01/02 KEL.DUNGUS CARIANG KEC.ANDIR KOTA BANDUNG', 'JL.CIROYOM NO.153 RT.01/02 KEL.DUNGUS CARIANG KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(764, 779, 'OBERINA VIONI SIMBOLON', NULL, 'Ahli Waris', 'JL.MARGACINTA DLM RT.05/03 KEL.CIJAWURA KEC.BUAH BATU KOTA BANDUNG', 'JL.MARGACINTA DLM RT.05/03 KEL.CIJAWURA KEC.BUAH BATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(765, 780, 'DENNY PILIPHUS', NULL, 'Ahli Waris', 'JL.KARANGSARI IV NO.157 RT.03/03 KEL.CIBEUREUM KEC.CIMAHI SLT BANDUNG', 'JL.KARANGSARI IV NO.157 RT.03/03 KEL.CIBEUREUM KEC.CIMAHI SLT BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(766, 781, 'RIMHOT HABEAHAN', NULL, 'Ahli Waris', 'KP. SAWO ENDAH RT.04/16 KEL.MARGASARI KEC.BUAH BATU KOTA BANDUNG', 'KP. SAWO ENDAH RT.04/16 KEL.MARGASARI KEC.BUAH BATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(767, 782, 'IRIANUS DAUD PELANGI', NULL, 'Ahli Waris', 'JL.GRIYA SLT.II/G-6 RT.04/06 KEL.SUKAWARNA KEC.SUKAJADI KOTA BANDUNG', 'JL.GRIYA SLT.II/G-6 RT.04/06 KEL.SUKAWARNA KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(768, 783, 'DONNY TRIJATMIKO', NULL, 'Ahli Waris', 'ISTANA REG.II D.23 RT.11/10 KEL.PAJAJARAN KEC.CICENDO BANDUNG', 'ISTANA REG.II D.23 RT.11/10 KEL.PAJAJARAN KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(769, 784, 'DENNY MICHAEL KURNIA LUWIA', NULL, 'Ahli Waris', 'JL.SEMAR DLM IV NO.91A/66 RT.08/05 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'JL.SEMAR DLM IV NO.91A/66 RT.08/05 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(770, 785, 'BONNA ZAKHARIA', NULL, 'Ahli Waris', 'KOMP.BANDUNG INTAN INDAH D.3 NO.9 RT.05/12 KEL.DERWATI KEC. RANCASARI KOTA BANDUNG', 'KOMP.BANDUNG INTAN INDAH D.3 NO.9 RT.05/12 KEL.DERWATI KEC. RANCASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(771, 786, 'CHRISTA BELLA', NULL, 'Ahli Waris', 'JL.PASEBAN KENCANA NO.53 RT.09/07 KEL.SUKAASIH KEC.BOJONGLOA KALER KOTA BANDUNG', 'JL.PASEBAN KENCANA NO.53 RT.09/07 KEL.SUKAASIH KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(772, 787, 'RR..THERESIA OEMINOER INDAH', NULL, 'Ahli Waris', 'JL.BATIK RENGGANIS NO.35 RT.08/07 KEL.SUKALUYU KEC.CIEBUNYING KALER KOTA BANDUNG', 'JL.BATIK RENGGANIS NO.35 RT.08/07 KEL.SUKALUYU KEC.CIEBUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(773, 788, 'ELISABETH DARENOH', NULL, 'Ahli Waris', 'JL.TULIP I NO.12 RT.06/04 KEL.GEMPOL SARI KEC.BANDUNG KULON KOTA BANDUNG', 'JL.TULIP I NO.12 RT.06/04 KEL.GEMPOL SARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(774, 789, 'BERSIS', NULL, 'Ahli Waris', 'CIMAHI', 'CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(775, 790, 'PARUNTUNGAN SIMANJUNTAK', NULL, 'Ahli Waris', 'JL.CEMPAKA NO.16 RT.05/15 KEL.LEUWI GAJAH KEC.CIMAHI SLT CIMAHI', 'JL.CEMPAKA NO.16 RT.05/15 KEL.LEUWI GAJAH KEC.CIMAHI SLT CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(776, 791, 'SUMIYATI', NULL, 'Ahli Waris', 'JL.MALEBER UTARA RT.06/06 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'JL.MALEBER UTARA RT.06/06 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(777, 792, 'MARIYAM INDRAWATI', NULL, 'Ahli Waris', 'JL.MARGAHAYU RAYA 1-2 NO.35 RT.01/09 KEL.SEKEJATI KEC.BUAHBATU KOTA BANDUNG', 'JL.MARGAHAYU RAYA 1-2 NO.35 RT.01/09 KEL.SEKEJATI KEC.BUAHBATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(778, 793, 'BILLY TANUJAYA', NULL, 'Ahli Waris', 'JL.CIBADAK BLK 144 RT.02/01 KEL.KARANG ANYAR KEC.ASTANAANYAR KOTA BANDUNG', 'JL.CIBADAK BLK 144 RT.02/01 KEL.KARANG ANYAR KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(779, 794, 'HIE FUK TAT', NULL, 'Ahli Waris', 'JL.H.KURDI SLT NO.39A RT.06/06 KEL.PELINDUNG HEWAN KEC.ASTANAANYAR KOTA BANDUNG', 'JL.H.KURDI SLT NO.39A RT.06/06 KEL.PELINDUNG HEWAN KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(780, 795, 'CHRISTINA MARSAULI', NULL, 'Ahli Waris', 'JL.MUARARAJEUN II NO.11 RT.05/10 KEL.CIHAURGEULIS KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.MUARARAJEUN II NO.11 RT.05/10 KEL.CIHAURGEULIS KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(781, 796, 'ROY GUNAWAN', NULL, 'Ahli Waris', 'GG.H.KURDI 1/13 NO.28 RT.10/01 KEL.KARASAK KEC.ASTANAANYAR KOTA BANDUNG', 'GG.H.KURDI 1/13 NO.28 RT.10/01 KEL.KARASAK KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(782, 797, 'ELIA JOHEHANAN', NULL, 'Ahli Waris', 'KOMP.PASANGGRAHAN INDAH BLOK.26 NO.09 RT.05/14 KEL.PASANGGRAHAN KEC.UJUNG BERUNG', 'KOMP.PASANGGRAHAN INDAH BLOK.26 NO.09 RT.05/14 KEL.PASANGGRAHAN KEC.UJUNG BERUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(783, 798, 'MARTEN.K.PALOHOON', NULL, 'Ahli Waris', 'JL.MUARARAJEUN LAMA GG.MUARA NO.11 RT.02/12 KEL.CIHAURGEULIS KEC.CIBEUNYING KALER', 'JL.MUARARAJEUN LAMA GG.MUARA NO.11 RT.02/12 KEL.CIHAURGEULIS KEC.CIBEUNYING KALER', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(784, 799, 'THE HUI TJEN', NULL, 'Ahli Waris', 'GG.SALEH NO.190.66 RT.09/06 KEL.ARJUNA KEC.CICENDO BANDUNG', 'GG.SALEH NO.190.66 RT.09/06 KEL.ARJUNA KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(785, 800, 'ZEFANYA WILLIAM.S', NULL, 'Ahli Waris', 'JL.BALADEWA GG.VI NO.89 RT.09/08 KEL.PAJAJARAN KEC.CICENDO KOTA BANDUNG', 'JL.BALADEWA GG.VI NO.89 RT.09/08 KEL.PAJAJARAN KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(786, 801, 'JOHAN CHRISTANTO', NULL, 'Ahli Waris', 'JL.LENGKONG BESAR NO.20A RT.05/07 KEL.CIKAWAO KEC.LENGKONG KOTA BANDUNG', 'JL.LENGKONG BESAR NO.20A RT.05/07 KEL.CIKAWAO KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(787, 802, 'LINA CRISTINA EVALIANA.M', NULL, 'Ahli Waris', 'JTAMAN HOLIS INDAH 2 C2 NO.23 RT.02/14 KEL.CIGONDEWAH KALER KEC.BDG KULON', 'JTAMAN HOLIS INDAH 2 C2 NO.23 RT.02/14 KEL.CIGONDEWAH KALER KEC.BDG KULON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(788, 803, 'NINING ANINGSIH', NULL, 'Ahli Waris', 'JL.SAMARINDA NO.46 RT.01/09 KEL.ANTAPANI KIUDL KEC.ANTAPANI KOTA BANDUNG', 'JL.SAMARINDA NO.46 RT.01/09 KEL.ANTAPANI KIUDL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(789, 804, 'DEBBY DONA KANDIO', NULL, 'Ahli Waris', 'JL.MEGARAYA 3 NO.59 RT.04/07 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'JL.MEGARAYA 3 NO.59 RT.04/07 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(790, 805, 'HOSVOR BARITA.H.MANURUNG', NULL, 'Ahli Waris', 'KOMP.JATI PERMAI NO.09 RT.04/07 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'KOMP.JATI PERMAI NO.09 RT.04/07 KEL.SUKARAJA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(791, 806, 'TJIO DENNY', NULL, 'Ahli Waris', 'PESONA TAMAN BURUNG C-2 RT.10/03 KEL.GEMPOL SARI KEC.BANDUNG KULON KOTA BANDUNG', 'PESONA TAMAN BURUNG C-2 RT.10/03 KEL.GEMPOL SARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(792, 807, 'CHERISTYNA MEYSIAN', NULL, 'Ahli Waris', 'JL.DAGO ELOS X NO.165 RT.02/02 KEL.DAGO KEC.COBLONG KOTA BANDUNG', 'JL.DAGO ELOS X NO.165 RT.02/02 KEL.DAGO KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(793, 808, 'YANTO', NULL, 'Ahli Waris', 'JL.MURNI I NO.29 RT.05/03 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'JL.MURNI I NO.29 RT.05/03 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(794, 809, 'YUDG=HI MARTINUS', NULL, 'Ahli Waris', 'JL.SUKABUNGAH NO.29 RT.03/04 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'JL.SUKABUNGAH NO.29 RT.03/04 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(795, 810, 'RONALD EUGENIE WATTIMENA', NULL, 'Ahli Waris', 'JL.CICARIANG NO.15 RT.05/07 KEL.SUKAMAJU KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.CICARIANG NO.15 RT.05/07 KEL.SUKAMAJU KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(796, 811, 'HENDRA PURBA', NULL, 'Ahli Waris', 'JL.KARANG TINEUNG DLM RT.04/04 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'JL.KARANG TINEUNG DLM RT.04/04 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(797, 812, 'NOVIE YANTI LESMANA', NULL, 'Ahli Waris', 'JL.H.SAPARI GG.SUKAASIH 236/90 RT.05/07 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'JL.H.SAPARI GG.SUKAASIH 236/90 RT.05/07 KEL.CIBADAK KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(798, 813, 'GOUW GIOK KIM', NULL, 'Ahli Waris', 'JL.BBK IRIGASI GG.REMAJA III RT.02/07 KEL.PASTEUR KEC.SUKAJADI KOTA BANDUNG', 'JL.BBK IRIGASI GG.REMAJA III RT.02/07 KEL.PASTEUR KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(799, 814, 'HERIANTO SUTEDJA', NULL, 'Ahli Waris', 'JL.SAMPURNA NO.26C RT.07/07 KEL.PASTEUR KEC.SUKAJADI KOTA BANDUNG', 'JL.SAMPURNA NO.26C RT.07/07 KEL.PASTEUR KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(800, 815, 'ANDREAS SETIAWAN', NULL, 'Ahli Waris', 'JL.CIATEUL NO.5A/20C RT.01/06 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'JL.CIATEUL NO.5A/20C RT.01/06 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(801, 816, 'MARIA LUCIA WIDIATMI', NULL, 'Ahli Waris', 'JL.TAMAN SISWA NO.4 RT.01/09 KEL.MALABAR KEC.LENGKONG KOTA BANDUNG', 'JL.TAMAN SISWA NO.4 RT.01/09 KEL.MALABAR KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(802, 817, 'NUAHTA TARIGAN', NULL, 'Ahli Waris', 'KOMP.PURI BUDI ASRI BLOK C-2 RT.05/11 KEL.CIHANJUANG KEC.PARONGPONG KAB.BDG BRT', 'KOMP.PURI BUDI ASRI BLOK C-2 RT.05/11 KEL.CIHANJUANG KEC.PARONGPONG KAB.BDG BRT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(803, 818, 'PAUL DOMINGOS', NULL, 'Ahli Waris', 'JL.KESAMBI DLM 3 RT.03/04 KEL.DRAJAT KEC.KESAMBI KOTA BANDUNG', 'JL.KESAMBI DLM 3 RT.03/04 KEL.DRAJAT KEC.KESAMBI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(804, 819, 'YAN SUGIARTO', NULL, 'Ahli Waris', 'JL.TAMAN KOPO INDAH D.4 NO.56 RT..05/19 KEL.MEKAR RAHAYU KEC.MARGAASIH BANDUNG', 'JL.TAMAN KOPO INDAH D.4 NO.56 RT..05/19 KEL.MEKAR RAHAYU KEC.MARGAASIH BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(805, 820, 'HENNY SISUANTO', NULL, 'Ahli Waris', 'GG.PASANTREN NO.14 RT.03/08 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'GG.PASANTREN NO.14 RT.03/08 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(806, 821, 'ENDI PERTAMANA', NULL, 'Ahli Waris', 'GG.MADESA I NO.60 RT.04/12 KEL.KOPO KEC.BOJONGLOA KALER KOTA BANDUNG', 'GG.MADESA I NO.60 RT.04/12 KEL.KOPO KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(807, 822, 'MANLY', NULL, 'Ahli Waris', 'GG.POLISI NO.115/5A RT.01/04 KEL.PASIRKALIKI KEC.CICENDO BANDUNG', 'GG.POLISI NO.115/5A RT.01/04 KEL.PASIRKALIKI KEC.CICENDO BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(808, 823, 'ROSIDA SINAGA', NULL, 'Ahli Waris', 'KP.PANGSOR NO.42 RT.03/07 KEL.CIGUGUR GIRANG KEC.PARONGPONG BANDUNG BARAT', 'KP.PANGSOR NO.42 RT.03/07 KEL.CIGUGUR GIRANG KEC.PARONGPONG BANDUNG BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(809, 824, 'MUTIARA PANJAITAN', NULL, 'Ahli Waris', 'KP.SEKEJULANG RT.01/02 KEL.CIUMBULEUIT KEC.CIDADAP KOTA BANDUNG', 'KP.SEKEJULANG RT.01/02 KEL.CIUMBULEUIT KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(810, 825, 'BONIFASIUS EKOCAHYO NUGROHO', NULL, 'Ahli Waris', 'JL.CIKAJANG VI NO.53 RT.03/20 KEL.ANTPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.CIKAJANG VI NO.53 RT.03/20 KEL.ANTPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(811, 826, 'YULIANA BR', NULL, 'Ahli Waris', 'PERM.SADANGSARI BLOK 6/46 RT.02/14 KEL.SEKELOA KEC.COBLONG KOTA BANDUNG', 'PERM.SADANGSARI BLOK 6/46 RT.02/14 KEL.SEKELOA KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(812, 827, 'ELVINA', NULL, 'Ahli Waris', 'JL.GARU III NO.29 RT.07/11 KEL.BABAKAN SARI KEC.KIARACONDONG KOTA BANDUNG', 'JL.GARU III NO.29 RT.07/11 KEL.BABAKAN SARI KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(813, 828, 'TJHIN TJHUI SIAN', NULL, 'Ahli Waris', 'JL.MALEBER RAYA NO.28 RT.03/04 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'JL.MALEBER RAYA NO.28 RT.03/04 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(814, 829, 'KARTINI SIMANUGKALIT', NULL, 'Ahli Waris', 'JL.CIUMBULEUIT NO.88 RT.08/01 KEL.HEGARMANAH KEC.CIDADAP KOTA BANDUNG', 'JL.CIUMBULEUIT NO.88 RT.08/01 KEL.HEGARMANAH KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(815, 830, 'ANDY KUSMANTO', NULL, 'Ahli Waris', 'JL.CIHAPIT NO.06 RT.04/01 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'JL.CIHAPIT NO.06 RT.04/01 KEL.CIHAPIT KEC.BANDUNG WETAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23');
INSERT INTO `ahli_waris` (`id`, `almarhum_id`, `nama_lengkap`, `nik`, `hubungan`, `alamat`, `alamat_jalan`, `no_rumah`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota_kabupaten`, `provinsi`, `no_telepon`, `created_at`, `updated_at`) VALUES
(816, 831, 'IVAN RENALDI', NULL, 'Ahli Waris', 'TAMAN HOLIS INDAH BLOK A-33 RT.04/04 KEL.CIGONDDEWAH  KEC.BANDUNG KULON', 'TAMAN HOLIS INDAH BLOK A-33 RT.04/04 KEL.CIGONDDEWAH  KEC.BANDUNG KULON', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(817, 832, 'JOHN VIGO ALPEYTHO T', NULL, 'Ahli Waris', 'JL.SADANG LUHUR BLOK XII NO.13 RT.01/15 KEL.SEKELOA KEC.COBLONG KOTA BANDUNG', 'JL.SADANG LUHUR BLOK XII NO.13 RT.01/15 KEL.SEKELOA KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(818, 833, 'MP.PUTRAYUDA', NULL, 'Ahli Waris', 'JL.CARINGIN BLOK KUPAT RT.03/13 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.CARINGIN BLOK KUPAT RT.03/13 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(819, 834, 'ELSYE HUTABARAT', NULL, 'Ahli Waris', 'JL.HALTEU SLT NO.289/77 RT.05/03 KEL.DUNGUS CARANG KEC.ANDIR KOTA BANDUNG', 'JL.HALTEU SLT NO.289/77 RT.05/03 KEL.DUNGUS CARANG KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(820, 835, 'ADE MARYAM', NULL, 'Ahli Waris', 'JL.BABAKAN TAROGONG GG.TANJUNG 1/53 RT.01/05 KEL.SUKAASIH KEC,BOJONGLOA KALER BDG', 'JL.BABAKAN TAROGONG GG.TANJUNG 1/53 RT.01/05 KEL.SUKAASIH KEC,BOJONGLOA KALER BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(821, 836, 'AGUSTIN RATNA INDRIANI', NULL, 'Ahli Waris', 'JL.SUKALUYU I RT.06/06 KEL.CIHAURGEULIS KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.SUKALUYU I RT.06/06 KEL.CIHAURGEULIS KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(822, 837, 'IJUL SIMANJUNTAK', NULL, 'Ahli Waris', 'GG.EMPANG CIBURUY RT.07/06 KEL.CISEUREUH KEC.REGOL KOTA BANDUNG', 'GG.EMPANG CIBURUY RT.07/06 KEL.CISEUREUH KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(823, 838, 'DEDE SUPRIATNA', NULL, 'Ahli Waris', 'JL.BARUNAYA REG NO.24 RT.04/13 KEL.CANGKUANG KLN KEC.DAYEUH KOLOT KOTA BANDUNG', 'JL.BARUNAYA REG NO.24 RT.04/13 KEL.CANGKUANG KLN KEC.DAYEUH KOLOT KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(824, 839, 'SINTHA', NULL, 'Ahli Waris', 'JL.SURYANI DALAM IV RT.07/02 KEL.WARUNG MUNCANG KEC.BANDUNG KULON BANDUNG', 'JL.SURYANI DALAM IV RT.07/02 KEL.WARUNG MUNCANG KEC.BANDUNG KULON BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(825, 840, 'NEIS NERITA DAMANIK', NULL, 'Ahli Waris', 'GG.MESJID I NO.452A RT.01/04 KEL.BABAKAN SURABAYA KEC.KIARACONDONG KOTA BANDUNG', 'GG.MESJID I NO.452A RT.01/04 KEL.BABAKAN SURABAYA KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(826, 841, 'ALOYSIUS JONES JOZAR', NULL, 'Ahli Waris', 'JL.CIPAKU INDAH I NO.5 RT.02/02 KEL.LEDENG KEC.CIDADAP KOTA BANDUNG', 'JL.CIPAKU INDAH I NO.5 RT.02/02 KEL.LEDENG KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(827, 842, 'ANTONIUS GUNAWAN', NULL, 'Ahli Waris', 'GG.SEJAHTERA VIII NO.98 RT.02/05 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'GG.SEJAHTERA VIII NO.98 RT.02/05 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(828, 843, 'JOHAN', NULL, 'Ahli Waris', 'JL.PAGARSIH I NO.172/86 RT.011/003 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'JL.PAGARSIH I NO.172/86 RT.011/003 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(829, 844, 'JULIUS JONGGI.F', NULL, 'Ahli Waris', 'JL.GEMPOL ASRI V NO.12 RT.05/10 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'JL.GEMPOL ASRI V NO.12 RT.05/10 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(830, 845, 'JAHJA KOSIM', NULL, 'Ahli Waris', 'JL.LUNA I NO.174/86 RT.04/04 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'JL.LUNA I NO.174/86 RT.04/04 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(831, 846, 'HERLINA SITUMORANG', NULL, 'Ahli Waris', 'JL.PALEM PUTRI NO.08A RT.05/07 KEL.JATISARI KEC.BUAHBATU KOTA BANDUNG', 'JL.PALEM PUTRI NO.08A RT.05/07 KEL.JATISARI KEC.BUAHBATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(832, 847, 'KUSEN', NULL, 'Ahli Waris', 'GG.H.UMAR NO.31 RT.01/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'GG.H.UMAR NO.31 RT.01/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(833, 848, 'CHUNANI LUSKA', NULL, 'Ahli Waris', 'JL.SANGGAR KENCANA X NO.39 RT.06/02 KEL.JATISARI KEC.BUAHBATU KOTA BANDUNG', 'JL.SANGGAR KENCANA X NO.39 RT.06/02 KEL.JATISARI KEC.BUAHBATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(834, 849, 'MARIA OCTAVIA', NULL, 'Ahli Waris', 'JL.TAMAN ALFA INDAH BLOK B-14/21 RT.11/07 KEL.JOGLO KEC.KEMBANGAN JAKARTA BARAT', 'JL.TAMAN ALFA INDAH BLOK B-14/21 RT.11/07 KEL.JOGLO KEC.KEMBANGAN JAKARTA BARAT', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(835, 850, 'LINDA GUNAWAN', NULL, 'Ahli Waris', 'GG.H.SYARIF NO.1 RT.02/01 KEL.BRAGA KEC.SUMUR BANDUNG KOTA BANDUNG', 'GG.H.SYARIF NO.1 RT.02/01 KEL.BRAGA KEC.SUMUR BANDUNG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(836, 851, 'DOMINI', NULL, 'Ahli Waris', 'JL.PASANTREN WETAN NO.3 KEL.06/03 KEL.PAMOYANAN KEC.CICENDO', 'JL.PASANTREN WETAN NO.3 KEL.06/03 KEL.PAMOYANAN KEC.CICENDO', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(837, 852, 'IDA KURNIATI DARMAWAN', NULL, 'Ahli Waris', 'JL.GENJER NO.7 RT.06/02 KEL.LINGKAR SELATAN KEC.LENGKONG KOTA BANDUNG', 'JL.GENJER NO.7 RT.06/02 KEL.LINGKAR SELATAN KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(838, 853, 'FEBRI AMSAL SIHALOHO', NULL, 'Ahli Waris', 'JL.CIBUNTU BARAT RT,08/04 KEL.CIBUNTU KEC.BANDUNG KULON KOTA BANDUNG', 'JL.CIBUNTU BARAT RT,08/04 KEL.CIBUNTU KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(839, 854, 'THOMAS BARNES', NULL, 'Ahli Waris', 'JL.KOSAR NO.47 RT.08/07 KEL.PASIR ENDAH KEC.UJUNG BERUNG KOTA BANDUNG', 'JL.KOSAR NO.47 RT.08/07 KEL.PASIR ENDAH KEC.UJUNG BERUNG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(840, 855, 'CHARLES TAMBUNAN', NULL, 'Ahli Waris', 'JL.CIBEUNYING KOLOT NO.44 RT.03/01 KEL.CIGADUNG KEC.CIEBUNYING KALER KOTA BANDUNG', 'JL.CIBEUNYING KOLOT NO.44 RT.03/01 KEL.CIGADUNG KEC.CIEBUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(841, 856, 'TANTI RINA.H', NULL, 'Ahli Waris', 'JATINEGARA INDAH BLOKAB2/28 RT.02/09 KEL.JATINEGARA KEC.CAKUNG JAKARTA TIMUR', 'JATINEGARA INDAH BLOKAB2/28 RT.02/09 KEL.JATINEGARA KEC.CAKUNG JAKARTA TIMUR', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(842, 857, 'RAYMOND RONALDO', NULL, 'Ahli Waris', 'KOMP.BUMI ASRI BLOK1D NO.88 RT.03/13 KEL.MEKAR RAHAYU KEC.MARGAASIH BANDUNG', 'KOMP.BUMI ASRI BLOK1D NO.88 RT.03/13 KEL.MEKAR RAHAYU KEC.MARGAASIH BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(843, 858, 'PURNAMAWATI', NULL, 'Ahli Waris', 'JL.BATURADEN IV NO.3 RT.03/01 KEL.MEKARJAYA KEC.RANCASARI BANDUNG', 'JL.BATURADEN IV NO.3 RT.03/01 KEL.MEKARJAYA KEC.RANCASARI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(844, 859, 'ROBEKKA SINAGA', NULL, 'Ahli Waris', 'JL.PADEPOKAN IV NO.28 RT.06/09 KEL.CIPADUNG KULON KEC.PANYILEUKAN KOTA BANDUNG', 'JL.PADEPOKAN IV NO.28 RT.06/09 KEL.CIPADUNG KULON KEC.PANYILEUKAN KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(845, 860, 'SAMUEL KUR NIADI S', NULL, 'Ahli Waris', 'JL.MUARASARI BLK NO.8 RT.02/11 KEL.KEBONLEGA KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.MUARASARI BLK NO.8 RT.02/11 KEL.KEBONLEGA KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(846, 861, 'RINA', NULL, 'Ahli Waris', 'GG.MUKALMI NO.28/03 RT.04/03 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'GG.MUKALMI NO.28/03 RT.04/03 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(847, 862, 'ANEKY TRIOSO', NULL, 'Ahli Waris', 'JL.MOCH TOHA NO.144 RT.03/10 KEL.PELINDUNG HEWAN KEC.ASTANAANYAR KOTA BANDUNG', 'JL.MOCH TOHA NO.144 RT.03/10 KEL.PELINDUNG HEWAN KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(848, 863, 'E.LILIS SUWIDANINGSIH', NULL, 'Ahli Waris', 'JL.SEKELOA SELATAN NO.5 RT.05/15 KEL.LEBAKGEDE KEC.COBLONG KOTA BANDUNG', 'JL.SEKELOA SELATAN NO.5 RT.05/15 KEL.LEBAKGEDE KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(849, 864, 'VINCENT WANG', NULL, 'Ahli Waris', 'JL.GATOT SUBROTO NO.441 RT.01/09 KEL.MALEER KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.GATOT SUBROTO NO.441 RT.01/09 KEL.MALEER KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(850, 865, 'FRAMSISKA GASPERZ', NULL, 'Ahli Waris', 'KP.SEKEJULANG NO.278 RT.01/02 KEL.CIUMBULEUIT KEC.CIDADAP KOTA BANDUNG', 'KP.SEKEJULANG NO.278 RT.01/02 KEL.CIUMBULEUIT KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(851, 866, 'SANDY ADYATAMA', NULL, 'Ahli Waris', 'GG.KASTURI II RT.04/11 KEL.BABAKAN SURABAYA KEC.KIARACONDONG KOTA BANDUNG', 'GG.KASTURI II RT.04/11 KEL.BABAKAN SURABAYA KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(852, 867, 'NESTI ENDRARNI', NULL, 'Ahli Waris', 'JL.BAROS INDAH NO.26 RT.02/03 KEC.CIMAHI SELATAN KOTA CIMAHI', 'JL.BAROS INDAH NO.26 RT.02/03 KEC.CIMAHI SELATAN KOTA CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(853, 868, 'YANTO', NULL, 'Ahli Waris', 'JL.TRS.BOROBUDUR NO.58 RT.04/04 KEL.CIBADUYUT KIDUL KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.TRS.BOROBUDUR NO.58 RT.04/04 KEL.CIBADUYUT KIDUL KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(854, 869, 'WINDA YULIANA', NULL, 'Ahli Waris', 'GG.H.TOPEK I NO.8 RT.06/04 KEL.PANJUNAN KEC.ASTANAANYAR KOTA BANDUNG', 'GG.H.TOPEK I NO.8 RT.06/04 KEL.PANJUNAN KEC.ASTANAANYAR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(855, 870, 'FELDI IRAWAN', NULL, 'Ahli Waris', 'J;.SAWO RAYA NO.4A RT.07/02 KEL.CIPETE UTARA KEC.KEBAYORAN BARU JAKARTA SELATAN', 'J;.SAWO RAYA NO.4A RT.07/02 KEL.CIPETE UTARA KEC.KEBAYORAN BARU JAKARTA SELATAN', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(856, 871, 'K.E WAHYUNINGSIH', NULL, 'Ahli Waris', 'JL.SUKAMANTRI II NO.176/114D RT.01/02 KEL.CIBEUNYING KALER KEC.SUKALUYU KOTA BDG', 'JL.SUKAMANTRI II NO.176/114D RT.01/02 KEL.CIBEUNYING KALER KEC.SUKALUYU KOTA BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(857, 872, 'RIMA SOELAEMAN', NULL, 'Ahli Waris', 'JL.MAYANG PADMI KULON NO.28 RT.01/12 KEL.CIMERANG KEC.PADALARANG BANDUNG', 'JL.MAYANG PADMI KULON NO.28 RT.01/12 KEL.CIMERANG KEC.PADALARANG BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(858, 873, 'L.MARIJANA NUGRAHA', NULL, 'Ahli Waris', 'JL.BBK.TAROGONG RT.03/04 KEL.BABAKAN ASIH KEC.BOJONGLOA KLER KOTA BANDUNG', 'JL.BBK.TAROGONG RT.03/04 KEL.BABAKAN ASIH KEC.BOJONGLOA KLER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(859, 874, 'TONY DJUNAIDI', NULL, 'Ahli Waris', 'JL.BUDISARI VII NO.46 RT.01/05 KEL.HEGARMANAH KEC.CIDADAP KOTA BANDUNG', 'JL.BUDISARI VII NO.46 RT.01/05 KEL.HEGARMANAH KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(860, 875, 'YANE SUPRANI', NULL, 'Ahli Waris', 'JL.CIKUDAPATEUH DLM NO.3 RT.01/02 KEL.KACAPIRING KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.CIKUDAPATEUH DLM NO.3 RT.01/02 KEL.KACAPIRING KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(861, 876, 'NICOLAS PELUPESSY', NULL, 'Ahli Waris', 'JL.KADIPATEN  XI NO.39 RT.01.02 KEL.ANTPANI KIDUL KEC.ANTPANI KOTA BANDUNG', 'JL.KADIPATEN  XI NO.39 RT.01.02 KEL.ANTPANI KIDUL KEC.ANTPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(862, 877, 'BUDI SETIAWAN MUSA', NULL, 'Ahli Waris', 'JL.ANDIR NO.45 RT.04/08 KEL.DUNGUS CARIANG KEC.ANDIR KOTA BANDUNG', 'JL.ANDIR NO.45 RT.04/08 KEL.DUNGUS CARIANG KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(863, 878, 'LIA TJANDRAWATI', NULL, 'Ahli Waris', 'JL.GG.SAUYUNAN III NO.94 RT.03/05 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'JL.GG.SAUYUNAN III NO.94 RT.03/05 KEL.MALEBER KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(864, 879, 'RIANE SIFERA', NULL, 'Ahli Waris', 'JL.FINE LIVING NO.20 RT.01/05 KEL.CIBUNTU KEC.BANDUNG KULON KOTA BANDUNG', 'JL.FINE LIVING NO.20 RT.01/05 KEL.CIBUNTU KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(865, 880, 'ANDRI GEMILANG MARPAUNG', NULL, 'Ahli Waris', 'JL.SARIRAYA BLK I NO.1 RT.02/07 KEL,MARGAHAYU UTARA KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.SARIRAYA BLK I NO.1 RT.02/07 KEL,MARGAHAYU UTARA KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(866, 881, 'MANGATAS LUMBAN TOBING', NULL, 'Ahli Waris', 'JL.MARGAHAYU RAYA BRT A.10 NO.47 RT.01/06 KEL.SEKEJATI KEC.BUAH BATU KOTA BANDUNG', 'JL.MARGAHAYU RAYA BRT A.10 NO.47 RT.01/06 KEL.SEKEJATI KEC.BUAH BATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(867, 882, 'HENDRA CARLOS HUWAE', NULL, 'Ahli Waris', 'JL.PRATISTA RAYA NO.42 RT.03/153 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.PRATISTA RAYA NO.42 RT.03/153 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(868, 883, 'UBA.K.YUDHA TAMPUBOLON', NULL, 'Ahli Waris', 'JL.PROPELAT BARAT I NO.23 RT.05/21 KEL.MARGASARI KEC.BUAH BATU KOTA BANDUNG', 'JL.PROPELAT BARAT I NO.23 RT.05/21 KEL.MARGASARI KEC.BUAH BATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(869, 884, 'YULIUS EDIWARD PATTIRANE', NULL, 'Ahli Waris', 'JL.CIKADUT DALAM NO.54 RT.03/02 KEL.KARANG PAMULANG KEC.MANDALAJTI KOTA BANDUNG', 'JL.CIKADUT DALAM NO.54 RT.03/02 KEL.KARANG PAMULANG KEC.MANDALAJTI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(870, 885, 'ALAN', NULL, 'Ahli Waris', 'JL.CIATEUL NO.5B/20C RT.01/06 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'JL.CIATEUL NO.5B/20C RT.01/06 KEL.CIATEUL KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(871, 886, 'ELSA', NULL, 'Ahli Waris', 'JL.KARANG TINEUNG INDAH III NO.11B RT.08/01 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'JL.KARANG TINEUNG INDAH III NO.11B RT.08/01 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(872, 887, 'SUMINA', NULL, 'Ahli Waris', 'GG.KANDI WIKARTA NO.49/208C RT.03/05 KEL.PADASUKA KEC.CIBEUNYING KIDUL KOTA BDG', 'GG.KANDI WIKARTA NO.49/208C RT.03/05 KEL.PADASUKA KEC.CIBEUNYING KIDUL KOTA BDG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(873, 888, 'RUSLIA RUSWANDI', NULL, 'Ahli Waris', 'JL.BUDISARI VII NO.85 RT.01/05 KEL.HEGARMANAH KEC.CIDADAP KOTA BANDUNG', 'JL.BUDISARI VII NO.85 RT.01/05 KEL.HEGARMANAH KEC.CIDADAP KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(874, 889, 'BERNANDO FRANIS SIMBOLON', NULL, 'Ahli Waris', 'JL.SITU GUNTING RT.09/01 KEL.SUKAHAJI KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.SITU GUNTING RT.09/01 KEL.SUKAHAJI KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(875, 890, 'PAUL HENDRAWAN', NULL, 'Ahli Waris', 'JL.KEMBAR TIMUR VII NO.33 RT.06/06 KEL.CIGERELENG KEC.REGOL KOTA BANDUNG', 'JL.KEMBAR TIMUR VII NO.33 RT.06/06 KEL.CIGERELENG KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(876, 891, 'WIDH HARTONO', NULL, 'Ahli Waris', 'JL.BBK GARUT NO.302/010 RT.03/10 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.BBK GARUT NO.302/010 RT.03/10 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(877, 892, 'DONNI HARDIAN PARERA', NULL, 'Ahli Waris', 'JL. CINTAASIH NO.140/122 RT.04/11 KEL.SAMOJA KEC.BATUNUNGGAL KOTA BANDUNG', 'JL. CINTAASIH NO.140/122 RT.04/11 KEL.SAMOJA KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(878, 893, 'STANLEY CHRISTIAN JUSUF', NULL, 'Ahli Waris', 'JL.MARGA KENCANA V KAV.78 RT.11/09 KEL.CIJAURA KEC.BUAHBATU KOTA BANDUNG', 'JL.MARGA KENCANA V KAV.78 RT.11/09 KEL.CIJAURA KEC.BUAHBATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(879, 894, 'TUTIK KRISTIANTI', NULL, 'Ahli Waris', 'JL.MANDALA I NO.7 RT.02/11 KEL.KEBON KANGKUNG KEC.KIARACONDONG KOTA BANDUNG', 'JL.MANDALA I NO.7 RT.02/11 KEL.KEBON KANGKUNG KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(880, 896, 'LYSTER MARPAUNG', NULL, 'Ahli Waris', 'JL.SARIMANIS BLOK 17 NO.92 RT.01/11 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'JL.SARIMANIS BLOK 17 NO.92 RT.01/11 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(881, 897, 'THEODORE MARCUS JOEL', NULL, 'Ahli Waris', 'JL.GIRI MEKAR INDAH IV BLOK B.79 RT.01/20 KEL.GIRIMEKAR KEC.CILENGKRANG KAB.BANDUNG', 'JL.GIRI MEKAR INDAH IV BLOK B.79 RT.01/20 KEL.GIRIMEKAR KEC.CILENGKRANG KAB.BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(882, 898, 'MARTALENA SITEPU', NULL, 'Ahli Waris', 'JL.CIMUNCANG BLK NO.21/21D RT.01/12 KEL.PASIRLAYUNG KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'JL.CIMUNCANG BLK NO.21/21D RT.01/12 KEL.PASIRLAYUNG KEC.CIBEUNYING KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(883, 899, 'WIRIADIHARDJA WIDJAJA', NULL, 'Ahli Waris', 'JL.RAMA NO.19 RT.01/01 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'JL.RAMA NO.19 RT.01/01 KEL.ARJUNA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(884, 900, 'LINDA', NULL, 'Ahli Waris', 'JL.LEMAH HEGAR 40 RT.11/04 KEL.SUKAPURA KEC.KIARACONDONG KOTA BANDUNG', 'JL.LEMAH HEGAR 40 RT.11/04 KEL.SUKAPURA KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(885, 901, 'SAMUEL MOKALU', NULL, 'Ahli Waris', 'JL.GATOT SUBROTO NO.243 RT.01/03 KEL..CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.GATOT SUBROTO NO.243 RT.01/03 KEL..CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(886, 902, 'EKKY ARDIPUTRA', NULL, 'Ahli Waris', 'GG.SITI MARIAH V NO.A85/88 RT.05/01 KEL.JAMIKA KEC.BJLOA KALER KOTA BANDUNG', 'GG.SITI MARIAH V NO.A85/88 RT.05/01 KEL.JAMIKA KEC.BJLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(887, 903, 'BENEDICTUS.M.MATTHEW', NULL, 'Ahli Waris', 'JL.AEROMODELING NO.58 RT.04/02 KEL.CISARANTEN ENDAH KEC.ARCAMANIK KOTA BANDUNG', 'JL.AEROMODELING NO.58 RT.04/02 KEL.CISARANTEN ENDAH KEC.ARCAMANIK KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(888, 904, 'DWIKY.Y.CHRISTOPER', NULL, 'Ahli Waris', 'JL.CIJAGRA I KOMP.PANGAIRAN NO.11 RT.02/02 KEL.CIJAGRA KEC.LENGKONG KOTA BANDUNG', 'JL.CIJAGRA I KOMP.PANGAIRAN NO.11 RT.02/02 KEL.CIJAGRA KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(889, 905, 'KASLAN TIMBUL SIMANJUNTAK', NULL, 'Ahli Waris', 'JL.FAK-FAK NO.16 RT.02/10 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.FAK-FAK NO.16 RT.02/10 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(890, 906, 'CHALOTTE.A.KRISTANTO', NULL, 'Ahli Waris', 'JL.CAKUNGJATI NO.15 RT.04/05 KEL.SAMOJA KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.CAKUNGJATI NO.15 RT.04/05 KEL.SAMOJA KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(891, 907, 'YOLANDA ENGEL RUPINGI', NULL, 'Ahli Waris', 'KOMP.IKPN BLOK G-4A RT.05/04 KEL.BINTARO KEC.PESANGGRAHAN KOTA JAKARTA SELATAN', 'KOMP.IKPN BLOK G-4A RT.05/04 KEL.BINTARO KEC.PESANGGRAHAN KOTA JAKARTA SELATAN', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(892, 908, 'ISAAC TENGKEY', NULL, 'Ahli Waris', 'JL.TM FLAMBOYAN NO.1 RT.07/08 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.TM FLAMBOYAN NO.1 RT.07/08 KEL.BABAKAN KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(893, 909, 'LIM BENG TJIE', NULL, 'Ahli Waris', 'J;.LEWI SARI RAYA NO.19 RT.02/08 KEL.KEBON LEGA KEC.BJLOA KIDUL KOTA BANDUNG', 'J;.LEWI SARI RAYA NO.19 RT.02/08 KEL.KEBON LEGA KEC.BJLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(894, 910, 'MICHAEL BUDIARTI', NULL, 'Ahli Waris', 'JL.MEKAR PESONA RAYA NO.03 RT.01/08 KEL.CIBADUYUT KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.MEKAR PESONA RAYA NO.03 RT.01/08 KEL.CIBADUYUT KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(895, 911, 'YUDI RIANTO', NULL, 'Ahli Waris', 'TAMAN HOLIS INDAH BLOK C.1 NO.26 RT.06/06 KEL.CIGONDEWAH RAHAYU KEC.BANDUNG KULON  BANDUNG', 'TAMAN HOLIS INDAH BLOK C.1 NO.26 RT.06/06 KEL.CIGONDEWAH RAHAYU KEC.BANDUNG KULON  BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(896, 912, 'GODFREY DONALD P.L.TOBING', NULL, 'Ahli Waris', 'JL.PARAKAN MAS INDAH II NO.07 RT.03/24 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.PARAKAN MAS INDAH II NO.07 RT.03/24 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(897, 913, 'STEVEN YUWONO JOE', NULL, 'Ahli Waris', 'WISATA BUKIT MAS BLOK B.1/7 RT.03/07 KEL.LIDAH WETAN KEC.LAKAR SANTRI KOTA SURABAYA', 'WISATA BUKIT MAS BLOK B.1/7 RT.03/07 KEL.LIDAH WETAN KEC.LAKAR SANTRI KOTA SURABAYA', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(898, 914, 'JAMES HARTONO', NULL, 'Ahli Waris', 'JL.TAMAN HOLIS INDAH H-2 NO.17A RT.07/05 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON KOTA BANDUNG', 'JL.TAMAN HOLIS INDAH H-2 NO.17A RT.07/05 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(899, 915, 'JEMMY KURNIADY', NULL, 'Ahli Waris', 'JL.CIATEUL KALER NO.271/19 RT.03/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'JL.CIATEUL KALER NO.271/19 RT.03/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(900, 916, 'RENCANA BR GINTING', NULL, 'Ahli Waris', 'JL.SAKUYU XV C NO.43 RT.10/09 KEL.CIPAMOKOLAN KEC.RANCASARI BANDUNG', 'JL.SAKUYU XV C NO.43 RT.10/09 KEL.CIPAMOKOLAN KEC.RANCASARI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(901, 917, 'DANIEL KURNIA', NULL, 'Ahli Waris', 'PERM.CINTA ASRI PERMAI BLOK F.2 JL.GUNUNG BATU D RT.04/01 KEL.PASIR KUNCI KEC.CIMHI UTARA KOT CIMAHI', 'PERM.CINTA ASRI PERMAI BLOK F.2 JL.GUNUNG BATU D RT.04/01 KEL.PASIR KUNCI KEC.CIMHI UTARA KOT CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(902, 918, 'HONG KEI LING', NULL, 'Ahli Waris', 'GG.WIRADIMAJA NO.15 RT.05/09 KEL.PASIRKALIKI KEC.CICENDO KOTA BANDUNG', 'GG.WIRADIMAJA NO.15 RT.05/09 KEL.PASIRKALIKI KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(903, 919, 'EVA SETIAWAN', NULL, 'Ahli Waris', 'JL.CARINGIN GG.LUMBUNG II NO.2 RT.05/03 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'JL.CARINGIN GG.LUMBUNG II NO.2 RT.05/03 KEL.BABAKAN CIPARAY KEC.BABAKAN CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(904, 920, 'ARIE PRATAMA LUANDA', NULL, 'Ahli Waris', 'JL.PASIR MALAKA NO.7 RT.02/10 KEL.CIGERELENG KEC.REGOL KOTA BANDUNG', 'JL.PASIR MALAKA NO.7 RT.02/10 KEL.CIGERELENG KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(905, 921, 'YENNI S', NULL, 'Ahli Waris', 'JL.BANJARSARI 9 NO.05 RT.04/19 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.BANJARSARI 9 NO.05 RT.04/19 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(906, 922, 'WISNOE.S.BAHDIN', NULL, 'Ahli Waris', 'JL.MATRA PERSADA NO.6 RT.04/06 KEL..PASIRKALIKI KEC.CIMAHI UTARA KOTA CIMHI', 'JL.MATRA PERSADA NO.6 RT.04/06 KEL..PASIRKALIKI KEC.CIMAHI UTARA KOTA CIMHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(907, 923, 'LIAW YOEN NIO', NULL, 'Ahli Waris', 'KP.PASIRKOJA RT.01/08 KEL.SUKAHAJI KEC.BBK CIPARAY KOTA BANDUNG', 'KP.PASIRKOJA RT.01/08 KEL.SUKAHAJI KEC.BBK CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(908, 924, 'RULLY MEGA AVRIANI', NULL, 'Ahli Waris', 'JL.TROWULAN IV T1-NI KOMP.NEW PHARMINDO RT.01/25 KEL.MELONG KEC.CIMAHI SLT CIMAHI', 'JL.TROWULAN IV T1-NI KOMP.NEW PHARMINDO RT.01/25 KEL.MELONG KEC.CIMAHI SLT CIMAHI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(909, 925, 'JOHNI SUPRIATNA', NULL, 'Ahli Waris', 'JL.TARUNA III NO.27/26 A RT.03/04 KEL.CIROYOM KEC.ANDIR KOTA BANDUNG', 'JL.TARUNA III NO.27/26 A RT.03/04 KEL.CIROYOM KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(910, 926, 'THENU AGUSTINA SURYANA', NULL, 'Ahli Waris', 'NATA GARDEN CLUSTER BLOK A NO.1 RT.07/02 KEL.JATILUHUR KEC.JATIASIH BEKASI', 'NATA GARDEN CLUSTER BLOK A NO.1 RT.07/02 KEL.JATILUHUR KEC.JATIASIH BEKASI', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(911, 927, 'ASTRIA ARDANI SUSANTI.R', NULL, 'Ahli Waris', 'JL.SARIJADI BLOK.18 NO.64 RT.01/06 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'JL.SARIJADI BLOK.18 NO.64 RT.01/06 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(912, 928, 'DAVIT FIRDAUS', NULL, 'Ahli Waris', 'GG.GAGAK HANDOKO NO.18 RT.05/01 KEL.SITUSAEUR  KEC.BJLOA KIDUL KOTA BANDUNG', 'GG.GAGAK HANDOKO NO.18 RT.05/01 KEL.SITUSAEUR  KEC.BJLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(913, 929, 'TRISNO YUWONO PUTRO', NULL, 'Ahli Waris', 'JL.TKI I BLOK M/12A RT.04/11 KEL.MARGAHAYU TENGAH KEC.MARGAHAYU KOTA BANDUNG', 'JL.TKI I BLOK M/12A RT.04/11 KEL.MARGAHAYU TENGAH KEC.MARGAHAYU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(914, 930, 'ELISABETH NARGARETA. V', NULL, 'Ahli Waris', 'JL.KAWISTA NO.15 RT.04/01 KEL.CIGADUNG KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.KAWISTA NO.15 RT.04/01 KEL.CIGADUNG KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(915, 931, 'VIOLLA PRISCILLA BR.SIPAYUNG', NULL, 'Ahli Waris', 'JL.CIPAGALO GIRANG RT.04/07 KEL.MARGASARI KEC.BUAHBATU KOTA BANDUNG', 'JL.CIPAGALO GIRANG RT.04/07 KEL.MARGASARI KEC.BUAHBATU KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(916, 932, 'LIEM HENDRIK RUSLI', NULL, 'Ahli Waris', 'JL.EMUNG NO.30 RT.07/02 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'JL.EMUNG NO.30 RT.07/02 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(917, 933, 'YAKIN SOMANO', NULL, 'Ahli Waris', 'GG.PA ELAS VI NO.249 RT.04/08 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'GG.PA ELAS VI NO.249 RT.04/08 KEL.CIPEDES KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(918, 934, 'DIKI', NULL, 'Ahli Waris', 'JL.SUKARAME I RT.01/09 KEL.CICAHEUM KEC.KIARACONDONG KOTA BANDUNG', 'JL.SUKARAME I RT.01/09 KEL.CICAHEUM KEC.KIARACONDONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(919, 935, 'YOSEF ARI NOVIANTO', NULL, 'Ahli Waris', 'JL.JEMBATAN OPAT NO.89A/119 RT.02/06 KEL.MALEER KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.JEMBATAN OPAT NO.89A/119 RT.02/06 KEL.MALEER KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(920, 936, 'ALFRED HASIHOLAN SITUMENANG', NULL, 'Ahli Waris', 'JL.LEUWI PANJANG GG.RUKUN SARI II RT.05/04 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.LEUWI PANJANG GG.RUKUN SARI II RT.05/04 KEL.SITUSAEUR KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(921, 937, 'RICKY HOOGOVENS', NULL, 'Ahli Waris', 'JL.SARIJADI BLOK 03 NO.3 RT.03/02 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'JL.SARIJADI BLOK 03 NO.3 RT.03/02 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(922, 938, 'STANLEY HANDOKO SOETIONO', NULL, 'Ahli Waris', 'JL.MANIK RAYA NO.18A RT.06/03 KEL.CIBADUYUT WETAN KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'JL.MANIK RAYA NO.18A RT.06/03 KEL.CIBADUYUT WETAN KEC.BOJONGLOA KIDUL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(923, 939, 'RICKY HOOGOVENS', NULL, 'Ahli Waris', 'JL.SARIJADI BLOK 03 NO.3 RT.03/02 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'JL.SARIJADI BLOK 03 NO.3 RT.03/02 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(924, 940, 'FLORIBERTO MANGRAYATTA.S', NULL, 'Ahli Waris', 'MUTIARA KEBAGUSAN REG.KAV A-7 RT.11/04 KEL.KEBAGUSAN KEC.PASARMINGGU JAKARTA SELATAN', 'MUTIARA KEBAGUSAN REG.KAV A-7 RT.11/04 KEL.KEBAGUSAN KEC.PASARMINGGU JAKARTA SELATAN', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(925, 941, 'RICKY NANLOHY', NULL, 'Ahli Waris', 'JL.SATURNUS BARAT X NO.3 RT.03/16 KEL.MANJAHLEGA KEC.RANCASARI BANDUNG', 'JL.SATURNUS BARAT X NO.3 RT.03/16 KEL.MANJAHLEGA KEC.RANCASARI BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(926, 943, 'AGNES FEBRINA SITUMORANG', NULL, 'Ahli Waris', 'PERM.CIJERAH II BLOK 19 N.01 RT.05/02 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'PERM.CIJERAH II BLOK 19 N.01 RT.05/02 KEL.GEMPOLSARI KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(927, 944, 'DRA. RATIH RESMIATI.W', NULL, 'Ahli Waris', 'JL.SETRSARI PLAZA B9 RT.06/01 KEL.SUKAGALIH KEC.SUKAJADI KOTA BANDUNG', 'JL.SETRSARI PLAZA B9 RT.06/01 KEL.SUKAGALIH KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(928, 945, 'RIVELI JUAN TATUHEY', NULL, 'Ahli Waris', 'JL.BATIK RUCITA NO.4 RT.08/07 KEL.SUKALUYU KEC.CIBEUNYING KALER KOTA BANDUNG', 'JL.BATIK RUCITA NO.4 RT.08/07 KEL.SUKALUYU KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(929, 946, 'WILLY FERNANDEZ', NULL, 'Ahli Waris', 'PINUS REG CLUSTER FUJIYAMA NO.20 RT.03/01 KEL.BBK PENGHULU KEC.CINAMBO KOTA BANDUNG', 'PINUS REG CLUSTER FUJIYAMA NO.20 RT.03/01 KEL.BBK PENGHULU KEC.CINAMBO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(930, 947, 'JOHANES LAURENTIUS OLIMAWIDJAYA', NULL, 'Ahli Waris', 'JL.SUKAJADI NO.53 RT.01/04 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'JL.SUKAJADI NO.53 RT.01/04 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(931, 948, 'JISMAN  SIMARE MARE', NULL, 'Ahli Waris', 'JL.ANDIR GG.SSTRA NO.211/78 RT.05/07 KEL.CIROYOM KEC.ANDIR KOTA BANDUNG', 'JL.ANDIR GG.SSTRA NO.211/78 RT.05/07 KEL.CIROYOM KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(932, 949, 'ELVINA PRADELLA', NULL, 'Ahli Waris', 'JL.TAMANSARI NO.107/56 RT.02/07 KEL.LEBAK SILIWANGI KEC.COBLONG KOTA BANDUNG', 'JL.TAMANSARI NO.107/56 RT.02/07 KEL.LEBAK SILIWANGI KEC.COBLONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(933, 942, 'JOANE LOUIS L MALAU', NULL, 'Ahli Waris', 'BBK CIKUTRA RT.03/08 KEL.NEGLASARI KEC.CIBEUNYING KALER KOTA BANDUNG', 'BBK CIKUTRA RT.03/08 KEL.NEGLASARI KEC.CIBEUNYING KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(934, 950, 'JEFTA LEWI', NULL, 'Ahli Waris', 'GG.SASTRA NO.11 RT.08/09 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'GG.SASTRA NO.11 RT.08/09 KEL.JAMIKA KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(935, 951, 'HARI HANDERAYANA', NULL, 'Ahli Waris', 'JL.EMUNG NO.103/36B RT.08/02 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'JL.EMUNG NO.103/36B RT.08/02 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(936, 952, 'SARIFAH', NULL, 'Ahli Waris', 'JL.CIBARENGKOK NO.125/182C RT.03/07 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'JL.CIBARENGKOK NO.125/182C RT.03/07 KEL.SUKABUNGAH KEC.SUKAJADI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(937, 954, 'RIKA MEIRAWATI HERAWAN', NULL, 'Ahli Waris', 'JL.SUKAWARNA II NO.52A RT.02/01 KEL.PAJAJARAN KEC.CICENDO KOTA BANDUNG', 'JL.SUKAWARNA II NO.52A RT.02/01 KEL.PAJAJARAN KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(938, 955, 'LEONARDO CIPTA SETIA', NULL, 'Ahli Waris', 'JL.BBK PRIANGAN II NO.16 RT.03/07 KEL.CISEUREUH KEC.REGOL KOTA BANDUNG', 'JL.BBK PRIANGAN II NO.16 RT.03/07 KEL.CISEUREUH KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(939, 956, 'BINSAR SITANGGANG', NULL, 'Ahli Waris', 'JL.RANDUSARI VII RT.01/17 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'JL.RANDUSARI VII RT.01/17 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(940, 957, 'CAROLINA SRI RAHAYUNINGSIH', NULL, 'Ahli Waris', 'JL.GG SUKARELA NO.33A/66 RT.06/04 KEL.PAMOYANAN KEC.CICENDO KOTA BANDUNG', 'JL.GG SUKARELA NO.33A/66 RT.06/04 KEL.PAMOYANAN KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(941, 958, 'JESSICA OLIVIA TEDJA', NULL, 'Ahli Waris', 'JL.CIATEUL TENGAH NO.22A RT.08/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'JL.CIATEUL TENGAH NO.22A RT.08/06 KEL.PUNGKUR KEC.REGOL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(942, 959, 'TENNY FEBIANTI', NULL, 'Ahli Waris', 'KOMP.BOUGENVILLE BLOK B-8 RT.06/01 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'KOMP.BOUGENVILLE BLOK B-8 RT.06/01 KEL.ANTAPANI KIDUL KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(943, 960, 'INDRA DWI WARDHANA', NULL, 'Ahli Waris', 'JL.JATAYU DLM VI/15 RT.02/10 KEL.HUSEINSASTRANEGARA KEC.CICENDO KOTA BANDUNG', 'JL.JATAYU DLM VI/15 RT.02/10 KEL.HUSEINSASTRANEGARA KEC.CICENDO KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(944, 962, 'SUHENDI RUSLI', NULL, 'Ahli Waris', 'JL.WALIK NO.12 RT.01/13 KEL.GARUDA KEC.ANDIR KOTA BANDUNG', 'JL.WALIK NO.12 RT.01/13 KEL.GARUDA KEC.ANDIR KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(945, 963, 'SETIA ABOEN', NULL, 'Ahli Waris', 'TAMAN HOLIS INDAH I BLOK H3-8 RT.04/05 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON KOTA BANDUNG', 'TAMAN HOLIS INDAH I BLOK H3-8 RT.04/05 KEL.CIGONDEWAH KIDUL KEC.BANDUNG KULON KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(946, 964, 'SABAR', NULL, 'Ahli Waris', 'JL.CINTA ASIH NO.420/122 RT.07/12 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'JL.CINTA ASIH NO.420/122 RT.07/12 KEL.CIBANGKONG KEC.BATUNUNGGAL KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(947, 965, 'ESTER YUNILIA', NULL, 'Ahli Waris', 'JL.CIKAJANG VI NO.32 RT.04/20 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'JL.CIKAJANG VI NO.32 RT.04/20 KEL.ANTAPANI TENGAH KEC.ANTAPANI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(948, 966, 'ANANIAS ARDILES S', NULL, 'Ahli Waris', 'SARIASIH BLOK B NO.013 RT 06/09 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'SARIASIH BLOK B NO.013 RT 06/09 KEL.SARIJADI KEC.SUKASARI KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(949, 967, 'TEDDY SETIAWAN', NULL, 'Ahli Waris', 'H NAWAWI NO.006 RT 02/04 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'H NAWAWI NO.006 RT 02/04 KEL.BURANGRANG KEC.LENGKONG KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(950, 968, 'DONNY SEPTIAN DANI', NULL, 'Ahli Waris', 'BABAKAN CIPARAY RT 04/04 KEL.SUKAHAJI KEC.BBK CIPARAY KOTA BANDUNG', 'BABAKAN CIPARAY RT 04/04 KEL.SUKAHAJI KEC.BBK CIPARAY KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(951, 969, 'JHON MAMBI SIMATUPANG', NULL, 'Ahli Waris', 'GG MUCHTAR NO.287 RT 07/03 KEL.BABAKAN ASIH KEC.BOJONGLOA KALER KOTA BANDUNG', 'GG MUCHTAR NO.287 RT 07/03 KEL.BABAKAN ASIH KEC.BOJONGLOA KALER KOTA BANDUNG', 'null', 'null', NULL, 'null', 'null', 'Bandung', NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `almarhums`
--

CREATE TABLE `almarhums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_registrasi` varchar(255) DEFAULT NULL,
  `makam_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `bin_binti` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `tanggal_wafat` date DEFAULT NULL,
  `tanggal_dimakamkan` date DEFAULT NULL,
  `agama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `alamat_jalan` varchar(255) DEFAULT NULL,
  `no_rumah` varchar(255) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kota_kabupaten` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `almarhums`
--

INSERT INTO `almarhums` (`id`, `no_registrasi`, `makam_id`, `nik`, `nama_lengkap`, `bin_binti`, `jenis_kelamin`, `tanggal_lahir`, `tanggal_wafat`, `tanggal_dimakamkan`, `agama`, `alamat`, `alamat_jalan`, `no_rumah`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota_kabupaten`, `provinsi`, `created_at`, `updated_at`) VALUES
(1, 'REG-2026-03', 3, '3201010101010001', 'Ahmad Abdul Somad', 'bin', 'L', '1985-05-12', '2023-03-01', '2023-03-02', 'Islam', 'RT 01', 'Jl. Cihanjuang', '12', '1', '2', 'Ledeng', 'Cidadap', 'Bandung', 'Jawa Barat', '2026-08-31 21:47:23', '2026-09-06 23:51:34'),
(3, 'REG-2026-08-01', 1, '3308011205980001', 'Suebah', 'bin alaidrus', 'L', '1998-08-07', '2023-10-02', '2026-01-07', 'Kristen', 'Kabupaten Bandung', 'Jl. Pandu No. 12', NULL, NULL, NULL, 'Padjajaran', 'Cicendo', NULL, NULL, '2026-09-01 02:56:40', '2026-09-08 23:45:56'),
(4, 'REG-2026-08-02', 2, '3201010806980005', 'Kartiwa', 'bin Sutisna', 'L', '1965-04-12', '2022-07-15', '2026-08-31', 'Islam', 'Kota Bandung', 'Jl. Asia Afrika No. 10', NULL, NULL, NULL, 'Braga', 'Sumur Bandung', NULL, NULL, '2026-09-01 04:13:57', '2026-09-06 21:21:11'),
(500, '001', 23, '324567890', 'UKUR MALEM TARIGAN', 'Barong', 'L', '1988-02-29', '2013-01-01', '2013-01-02', 'Kristen', 'Jl. Maleber Utara', 'Jl. Pelita Karya', '13', '05', '03', 'Maleber Utara', 'Andir', 'Bandung', 'Jawa Barat', '2026-09-08 22:59:19', '2026-09-09 00:56:19'),
(501, '002', NULL, NULL, 'EDDY SUDRAJAT SETIAWAN', NULL, 'L', NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(502, '003', NULL, NULL, 'HOE TJUN NGOH', NULL, 'L', NULL, NULL, '2024-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(503, '004', NULL, NULL, 'SOEFFIENA', NULL, 'L', NULL, NULL, '2024-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(504, '005', NULL, NULL, 'IR JOHNNY PARSAULIAN GULTOM', NULL, 'L', NULL, NULL, '2024-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(505, '006', NULL, NULL, 'IGN SUGIHARDJO', NULL, 'L', NULL, NULL, '2024-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(506, '007', NULL, NULL, 'CASAMIRIUS', NULL, 'L', NULL, NULL, '2024-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(507, '008', NULL, NULL, 'LAZARUS PANGDODY WIJAYA', NULL, 'L', NULL, NULL, '2024-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(508, '009', NULL, NULL, 'ELLY HARIADI', NULL, 'L', NULL, NULL, '2024-01-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(509, '010', NULL, NULL, 'RICKY HENDRA', NULL, 'L', NULL, NULL, '2024-01-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(510, '011', NULL, NULL, 'YULIA KERTAMIHARDJA', NULL, 'L', NULL, NULL, '2024-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(511, '012', NULL, NULL, 'BENYAMIN HANDOKO', NULL, 'L', NULL, NULL, '2024-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(512, '013', NULL, NULL, 'HASAN SANTOSO', NULL, 'L', NULL, NULL, '2024-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(513, '014', NULL, NULL, 'MAHENO IGNATIUS', NULL, 'L', NULL, NULL, '2024-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(514, '015', NULL, NULL, 'TAN PEK GWAN', NULL, 'L', NULL, NULL, '2024-01-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(515, '016', NULL, NULL, 'LAMHOOD JENNI R.F SIRAIT', NULL, 'L', NULL, NULL, '2024-01-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(516, '017', NULL, NULL, 'RUSTI SIRAIT', NULL, 'L', NULL, NULL, '2024-01-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(517, '018', NULL, NULL, 'JOHANA POEDJOKERTO', NULL, 'L', NULL, NULL, '2024-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(518, '019', NULL, NULL, 'MARTHA SAMOSIR PAKPAHAN', NULL, 'L', NULL, NULL, '2024-01-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(519, '020', NULL, NULL, 'MARIA MANIK', NULL, 'L', NULL, NULL, '2024-01-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(520, '021', NULL, NULL, 'NAOMI HUWAE', NULL, 'L', NULL, NULL, '2024-01-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(521, '022', NULL, NULL, 'TJOE BIE ISHAK', NULL, 'L', NULL, NULL, '2024-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(522, '023', NULL, NULL, 'ATIHUTA MAUDY', NULL, 'L', NULL, NULL, '2024-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(523, '024', NULL, NULL, 'SURATMI', NULL, 'L', NULL, NULL, '2024-01-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(524, '025', NULL, NULL, 'LISBETH', NULL, 'L', NULL, NULL, '2024-01-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(525, '026', NULL, NULL, 'EDUARD DAVID JOHANNES', NULL, 'L', NULL, NULL, '2024-01-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(526, '027', NULL, NULL, 'AAT RAHENDRA', NULL, 'L', NULL, NULL, '2024-01-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(527, '028', NULL, NULL, 'LIE LI TJIN', NULL, 'L', NULL, NULL, '2024-01-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(528, '029', NULL, NULL, 'DRS.JUNJUNGAN SILABAN', NULL, 'L', NULL, NULL, '2024-01-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(529, '030', NULL, NULL, 'BILLY KOESJANTO HIDAJAT', NULL, 'L', NULL, NULL, '2024-01-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(530, '031', NULL, NULL, 'JHON DERRY PANGGABEAN', NULL, 'L', NULL, NULL, '2024-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(531, '032', NULL, NULL, 'ELYANI HALIM', NULL, 'L', NULL, NULL, '2024-01-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(532, '033', NULL, NULL, 'ERNIE MAGDALEVY', NULL, 'L', NULL, NULL, '2024-01-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(533, '034', NULL, NULL, 'BONAR SIREGAR', NULL, 'L', NULL, NULL, '2024-01-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(534, '035', NULL, NULL, 'SABOENGAN OSMAN PANGARIBOEAN', NULL, 'L', NULL, NULL, '2024-01-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(535, '036', NULL, NULL, 'ANTONIUS MANULLANG', NULL, 'L', NULL, NULL, '2024-01-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(536, '037', NULL, NULL, 'PAISAH', NULL, 'L', NULL, NULL, '2024-01-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(537, '038', NULL, NULL, 'GLEN U DE WIT', NULL, 'L', NULL, NULL, '2024-01-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(538, '039', NULL, NULL, 'YUSUF JULFRIATNA', NULL, 'L', NULL, NULL, '2024-01-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:19', '2026-09-08 22:59:19'),
(539, '040', NULL, NULL, 'HERMAN FERNANDO, NB', NULL, 'L', NULL, NULL, '2024-01-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(540, '041', NULL, NULL, 'YOBY DARMANSYAH', NULL, 'L', NULL, NULL, '2024-01-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(541, '042', NULL, NULL, 'ANI YUNIA', NULL, 'L', NULL, NULL, '2024-01-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(542, '043', NULL, NULL, 'LIGA SUTAMA', NULL, 'L', NULL, NULL, '2024-01-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(543, '044', NULL, NULL, 'DHARMA PUTRI', NULL, 'L', NULL, NULL, '2024-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(544, '045', NULL, NULL, 'ELLY SANDI', NULL, 'L', NULL, NULL, '2024-01-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(545, '046', NULL, NULL, 'GABRIEL NOTATEMA ZEBUA', NULL, 'L', NULL, NULL, '2024-01-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(546, '047', NULL, NULL, 'EMILIA ENIH ROHKAJA', NULL, 'L', NULL, NULL, '2024-02-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(547, '048', NULL, NULL, 'ANNA SIMATUPANG', NULL, 'L', NULL, NULL, '2024-02-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(548, '049', NULL, NULL, 'BUANITA TUNGGAL', NULL, 'L', NULL, NULL, '2024-02-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(549, '050', NULL, NULL, 'ELVIN OKTAVIANUS', NULL, 'L', NULL, NULL, '2024-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(550, '051', NULL, NULL, 'IRWAN UMAR', NULL, 'L', NULL, NULL, '2024-02-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(551, '052', NULL, NULL, 'LIDYA', NULL, 'L', NULL, NULL, '2024-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(552, '053', NULL, NULL, 'INGGRID SULAIMAN', NULL, 'L', NULL, NULL, '2024-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(553, '054', NULL, NULL, 'JO TJEN SIE', NULL, 'L', NULL, NULL, '2024-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(554, '055', NULL, NULL, 'LILIANA SASTAAMIDJAJA', NULL, 'L', NULL, NULL, '2024-02-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(555, '056', NULL, NULL, 'INDRO SODONO', NULL, 'L', NULL, NULL, '2024-02-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(556, '057', NULL, NULL, 'N.AGNES.N.REMEEUS', NULL, 'L', NULL, NULL, '2024-02-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(557, '058', NULL, NULL, 'NY.IDA R.S SIMANUNGKALIT', NULL, 'L', NULL, NULL, '2024-02-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(558, '059', NULL, NULL, 'JOPIE FRTIS LATUPUTTY', NULL, 'L', NULL, NULL, '2024-02-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(559, '060', NULL, NULL, 'DAVIT BATARA', NULL, 'L', NULL, NULL, '2024-02-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(560, '061', NULL, NULL, 'SRI KUNTI', NULL, 'L', NULL, NULL, '2024-02-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(561, '062', NULL, NULL, 'AGUS PURNAMA', NULL, 'L', NULL, NULL, '2024-02-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:20', '2026-09-08 22:59:20'),
(562, '063', NULL, NULL, 'RAPHA GABRIAN IVANDER', NULL, 'L', NULL, NULL, '2024-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(563, '064', NULL, NULL, 'SERVI USULANGI', NULL, 'L', NULL, NULL, '2024-02-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(564, '065', NULL, NULL, 'YOSCE ANTONIO', NULL, 'L', NULL, NULL, '2024-02-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(565, '066', NULL, NULL, 'SELVY NATAN', NULL, 'L', NULL, NULL, '2024-02-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(566, '067', NULL, NULL, 'YOGI YURISTIAWAN', NULL, 'L', NULL, NULL, '2024-02-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(567, '068', NULL, NULL, 'KARIAMAN SIMARMATA', NULL, 'L', NULL, NULL, '2024-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(568, '069', NULL, NULL, 'VERA', NULL, 'L', NULL, NULL, '2024-02-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(569, '070', NULL, NULL, 'SONTI DEMINA HUTAGAOL', NULL, 'L', NULL, NULL, '2024-02-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(570, '071', NULL, NULL, 'D.BR.SIAGIAN', NULL, 'L', NULL, NULL, '2024-02-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(571, '072', NULL, NULL, 'WILANI', NULL, 'L', NULL, NULL, '2024-02-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(572, '073', NULL, NULL, 'YANTO SUPRIATNA', NULL, 'L', NULL, NULL, '2024-02-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(573, '074', NULL, NULL, 'IWAN SUJONO PRADJA', NULL, 'L', NULL, NULL, '2024-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(574, '075', NULL, NULL, 'FENTI.H.TAMBUNAN', NULL, 'L', NULL, NULL, '2024-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(575, '076', NULL, NULL, 'ULIANA BR TOBING', NULL, 'L', NULL, NULL, '2024-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(576, '077', NULL, NULL, 'ANDRE', NULL, 'L', NULL, NULL, '2024-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(577, '078', NULL, NULL, 'DY.SAYUTI TARIGAN', NULL, 'L', NULL, NULL, '2024-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(578, '079', NULL, NULL, 'IR.WILFRED PANJAITAN', NULL, 'L', NULL, NULL, '2024-02-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(579, '080', NULL, NULL, 'LIE SAUW LAY', NULL, 'L', NULL, NULL, '2024-02-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(580, '081', NULL, NULL, 'CANDRA NATA SAPUTRA', NULL, 'L', NULL, NULL, '2024-02-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(581, '082', NULL, NULL, 'LINA TATANG PERMANA', NULL, 'L', NULL, NULL, '2024-02-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(582, '083', NULL, NULL, 'YAP SIN LAN', NULL, 'L', NULL, NULL, '2024-02-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(583, '084', NULL, NULL, 'FABIAN MARIO A SANCE', NULL, 'L', NULL, NULL, '2024-02-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(584, '085', NULL, NULL, 'YO BENG WAT', NULL, 'L', NULL, NULL, '2024-03-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(585, '086', NULL, NULL, 'MERRY MAYKE C.S MANUPUTTY', NULL, 'L', NULL, NULL, '2024-03-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(586, '087', NULL, NULL, 'MARIA KRISTIN INEKAWATI', NULL, 'L', NULL, NULL, '2024-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(587, '088', NULL, NULL, 'TONO KURNIAWAN', NULL, 'L', NULL, NULL, '2024-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(588, '089', NULL, NULL, 'WAHYUDI', NULL, 'L', NULL, NULL, '2024-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(589, '090', NULL, NULL, 'WARSIH AMERIAH SASTRA', NULL, 'L', NULL, NULL, '2024-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(590, '091', NULL, NULL, 'RUDY ANDREAS SUMAYKU', NULL, 'L', NULL, NULL, '2024-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(591, '092', NULL, NULL, 'RAFLES STEPENTIUS', NULL, 'L', NULL, NULL, '2024-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(592, '093', NULL, NULL, 'SAHAT NADEAK', NULL, 'L', NULL, NULL, '2024-03-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(593, '094', NULL, NULL, 'THAHER DODY RUSTANDY', NULL, 'L', NULL, NULL, '2024-03-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(594, '095', NULL, NULL, 'BUDIJONO', NULL, 'L', NULL, NULL, '2024-03-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(595, '096', NULL, NULL, 'ONG JU SIN NIO', NULL, 'L', NULL, NULL, '2024-03-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(596, '097', NULL, NULL, 'YUSEF T SURYADINATA', NULL, 'L', NULL, NULL, '2024-03-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(597, '100', NULL, NULL, 'FERRY BUDI SANTOSO', NULL, 'L', NULL, NULL, '2024-03-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(598, '101', NULL, NULL, 'SUTEJA', NULL, 'L', NULL, NULL, '2024-03-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(599, '102', NULL, NULL, 'SRI WULANDARI', NULL, 'L', NULL, NULL, '2024-03-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(600, '103', NULL, NULL, 'ANDREAS.B.SOENARTO', NULL, 'L', NULL, NULL, '2024-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(601, '104', NULL, NULL, 'INDRA', NULL, 'L', NULL, NULL, '2024-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(602, '105', NULL, NULL, 'RUDY LEIWAKABESSY', NULL, 'L', NULL, NULL, '2024-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(603, '106', NULL, NULL, 'GERHARD OSCAR.Y.S', NULL, 'L', NULL, NULL, '2024-03-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(604, '107', NULL, NULL, 'RIKA', NULL, 'L', NULL, NULL, '2024-03-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(605, '108', NULL, NULL, 'LUMBAN TOBING JAMES', NULL, 'L', NULL, NULL, '2024-03-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(606, '109', NULL, NULL, 'SUHARNA KARWITA', NULL, 'L', NULL, NULL, '2024-03-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(607, '110', NULL, NULL, 'S.R SIBARANI', NULL, 'L', NULL, NULL, '2024-03-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(608, '111', NULL, NULL, 'BY.NY SANTI RIASA', NULL, 'L', NULL, NULL, '2024-03-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(609, '121', NULL, NULL, 'TIARMA RMP SIALLAGAN', NULL, 'L', NULL, NULL, '2024-03-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(610, '122', NULL, NULL, 'ILWA SUWARNI SAHARJONO', NULL, 'L', NULL, NULL, '2024-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(611, '123', NULL, NULL, 'ANA YANTI', NULL, 'L', NULL, NULL, '2024-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(612, '124', NULL, NULL, 'MARTHEN PAH', NULL, 'L', NULL, NULL, '2024-03-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(613, '125', NULL, NULL, 'THIAN NYE LAN', NULL, 'L', NULL, NULL, '2024-03-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(614, '126', NULL, NULL, 'HENDRIK PERMANA', NULL, 'L', NULL, NULL, '2024-03-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(615, '127', NULL, NULL, 'NANCY MEGAWATI SARKOWI', NULL, 'L', NULL, NULL, '2024-03-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(616, '128', NULL, NULL, 'BERNARD DENIS UMAR', NULL, 'L', NULL, NULL, '2024-03-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(617, '129', NULL, NULL, 'MARLI', NULL, 'L', NULL, NULL, '2024-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(618, '130', NULL, NULL, 'SUMARNO', NULL, 'L', NULL, NULL, '2024-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(619, '131', NULL, NULL, 'MELLI PEGIANI', NULL, 'L', NULL, NULL, '2024-03-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(620, '132', NULL, NULL, 'NOLDY RONNI.J.KAMBEY', NULL, 'L', NULL, NULL, '2024-03-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(621, '133', NULL, NULL, 'MAGDALENA AGAVE', NULL, 'L', NULL, NULL, '2024-03-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(622, '134', NULL, NULL, 'YENNY PARAU', NULL, 'L', NULL, NULL, '2024-03-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(623, '135', NULL, NULL, 'THOMAS SANTOSO', NULL, 'L', NULL, NULL, '2024-03-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(624, '136', NULL, NULL, 'SUPARMI', NULL, 'L', NULL, NULL, '2024-03-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(625, '137', NULL, NULL, 'RENO WIDYA', NULL, 'L', NULL, NULL, '2024-03-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(626, '138', NULL, NULL, 'DORMI SITUMORANG', NULL, 'L', NULL, NULL, '2024-03-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(627, '139', NULL, NULL, 'ELSYE SARA ABIGAEL', NULL, 'L', NULL, NULL, '2024-03-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(628, '140', NULL, NULL, 'BONY SUGIARTO', NULL, 'L', NULL, NULL, '2024-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(629, '141', NULL, NULL, 'LINDA', NULL, 'L', NULL, NULL, '2024-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(630, '142', NULL, NULL, 'EMMALIA', NULL, 'L', NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(631, '143', NULL, NULL, 'HENDRA SOUW', NULL, 'L', NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(632, '144', NULL, NULL, 'MUALA SIHAAN', NULL, 'L', NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(633, '145', NULL, NULL, 'IDA FARIDA SUSILO', NULL, 'L', NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(634, '146', NULL, NULL, 'SUHARTINI', NULL, 'L', NULL, NULL, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(635, '147', NULL, NULL, 'HANNA INDRAYANA', NULL, 'L', NULL, NULL, '2024-04-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(636, '148', NULL, NULL, 'ENGAH', NULL, 'L', NULL, NULL, '2024-04-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(637, '149', NULL, NULL, 'HENGKY DANIEL', NULL, 'L', NULL, NULL, '2024-04-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(638, '150', NULL, NULL, 'BENNY TEHA', NULL, 'L', NULL, NULL, '2024-04-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(639, '151', NULL, NULL, 'NY.SIMPAN SIJABAT', NULL, 'L', NULL, NULL, '2024-04-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(640, '152', NULL, NULL, 'RR.ELISA DEWI', NULL, 'L', NULL, NULL, '2024-04-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(641, '153', NULL, NULL, 'LIM HIAN KWE', NULL, 'L', NULL, NULL, '2024-04-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(642, '154', NULL, NULL, 'DISMAN SIMARMATA', NULL, 'L', NULL, NULL, '2024-04-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(643, '155', NULL, NULL, 'YOSEFINA S TAMBUNAN', NULL, 'L', NULL, NULL, '2024-04-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(644, '156', NULL, NULL, 'MERY GUNAWAN', NULL, 'L', NULL, NULL, '2024-04-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(645, '157', NULL, NULL, 'SINDES MANUEL', NULL, 'L', NULL, NULL, '2024-04-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:22', '2026-09-08 22:59:22'),
(646, '158', NULL, NULL, 'ANDI SINUHAJI', NULL, 'L', NULL, NULL, '2024-04-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(647, '159', NULL, NULL, 'LIM TJOEN BENG', NULL, 'L', NULL, NULL, '2024-04-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(648, '160', NULL, NULL, 'TOMMY SAMITA', NULL, 'L', NULL, NULL, '2024-04-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(649, '161', NULL, NULL, 'TANDYO HARSONO', NULL, 'L', NULL, NULL, '2024-04-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(650, '162', NULL, NULL, 'SUYITNO', NULL, 'L', NULL, NULL, '2024-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(651, '163', NULL, NULL, 'LILIANDIALY', NULL, 'L', NULL, NULL, '2024-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(652, '164', NULL, NULL, 'TAN YOEL HERYANTO', NULL, 'L', NULL, NULL, '2024-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(653, '165', NULL, NULL, 'INDARDI PARLINDUNGAN', NULL, 'L', NULL, NULL, '2024-04-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(654, '166', NULL, NULL, 'ELYASA SATRIA BARATA', NULL, 'L', NULL, NULL, '2024-04-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(655, '167', NULL, NULL, 'IRENE.J.R.LOE', NULL, 'L', NULL, NULL, '2024-04-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(656, '168', NULL, NULL, 'LUKE KAYA', NULL, 'L', NULL, NULL, '2024-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(657, '169', NULL, NULL, 'LIAUW WIE HAUW', NULL, 'L', NULL, NULL, '2024-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(658, '170', NULL, NULL, 'SUKAMTO WIDODO', NULL, 'L', NULL, NULL, '2024-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(659, '171', NULL, NULL, 'FX SEDIA SEMBIRING.M', NULL, 'L', NULL, NULL, '2024-04-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(660, '172', NULL, NULL, 'ROMAULI PASARIBU', NULL, 'L', NULL, NULL, '2024-02-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(661, '173', NULL, NULL, 'WERINUSSA ADOLF', NULL, 'L', NULL, NULL, '2024-04-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(662, '174', NULL, NULL, 'EDWARD TOGAS', NULL, 'L', NULL, NULL, '2024-04-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(663, '175', NULL, NULL, 'SAHALA TOBING', NULL, 'L', NULL, NULL, '2024-04-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(664, '176', NULL, NULL, 'BONA SIANIPAR', NULL, 'L', NULL, NULL, '2024-04-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(665, '177', NULL, NULL, 'SUSILAWATI', NULL, 'L', NULL, NULL, '2024-04-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(666, '178', NULL, NULL, 'RODIAH / NY.PANGGABEAN', NULL, 'L', NULL, NULL, '2024-04-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(667, '179', NULL, NULL, 'SIMON NICODEMUS.K', NULL, 'L', NULL, NULL, '2024-04-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(668, '180', NULL, NULL, 'TJONG SWIE LIAN', NULL, 'L', NULL, NULL, '2024-04-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(669, '181', NULL, NULL, 'TARCICIUS SUNARDI', NULL, 'L', NULL, NULL, '2024-04-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(670, '182', NULL, NULL, 'BY.BRANDON LEWIS', NULL, 'L', NULL, NULL, '2024-04-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(671, '183', NULL, NULL, 'ANDREW CANFAUSIUS RAYA', NULL, 'L', NULL, NULL, '2024-04-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(672, '184', NULL, NULL, 'INDRA SETIAWAN', NULL, 'L', NULL, NULL, '2024-04-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(673, '185', NULL, NULL, 'CHARISSA JOANNA MAILOA', NULL, 'L', NULL, NULL, '2024-04-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(674, '186', NULL, NULL, 'CHRISTIANA MUKAHARIAH', NULL, 'L', NULL, NULL, '2024-04-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(675, '187', NULL, NULL, 'HENI NURHAYANI', NULL, 'L', NULL, NULL, '2024-04-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(676, '188', NULL, NULL, 'LINA LILI', NULL, 'L', NULL, NULL, '2024-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(677, '189', NULL, NULL, 'ADE WIJAYA', NULL, 'L', NULL, NULL, '2024-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(678, '190', NULL, NULL, 'NUGRAHENI SUPAPTI', NULL, 'L', NULL, NULL, '2024-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(679, '191', NULL, NULL, 'PONTIRAYA SIMANJUNTAK', NULL, 'L', NULL, NULL, '2024-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(680, '192', NULL, NULL, 'TURIYAH DAMBARU', NULL, 'L', NULL, NULL, '2024-04-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(681, '193', NULL, NULL, 'BENNY LEONARD FAAH', NULL, 'L', NULL, NULL, '2024-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(682, '194', NULL, NULL, 'SALIAN SIAHAAN ,SH', NULL, 'L', NULL, NULL, '2024-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(683, '195', NULL, NULL, 'LUSJE', NULL, 'L', NULL, NULL, '2024-05-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(684, '196', NULL, NULL, 'JOHANES.B.AMBAT', NULL, 'L', NULL, NULL, '2024-05-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(685, '197', NULL, NULL, 'EDDY ABRAM', NULL, 'L', NULL, NULL, '2024-05-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(686, '198', NULL, NULL, 'ALBERT SONDAKH', NULL, 'L', NULL, NULL, '2024-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(687, '199', NULL, NULL, 'TJOE HWI MIN', NULL, 'L', NULL, NULL, '2024-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(688, '200', NULL, NULL, 'DAVID MANALU', NULL, 'L', NULL, NULL, '2024-05-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(689, '201', NULL, NULL, 'RANTO.P.TURNIP', NULL, 'L', NULL, NULL, '2024-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(690, '202', NULL, NULL, 'SUPONO', NULL, 'L', NULL, NULL, '2024-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(691, '203', NULL, NULL, 'REYNALDI BERLIANTO', NULL, 'L', NULL, NULL, '2024-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(692, '204', NULL, NULL, 'JO TJWAN HOK', NULL, 'L', NULL, NULL, '2024-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(693, '205', NULL, NULL, 'EDDIN TOBING', NULL, 'L', NULL, NULL, '2024-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(694, '206', NULL, NULL, 'ARMAN TARIGAN SILANGIT', NULL, 'L', NULL, NULL, '2024-05-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(695, '207', NULL, NULL, 'NY.TATI', NULL, 'L', NULL, NULL, '2024-05-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(696, '208', NULL, NULL, 'RAJA JACOB', NULL, 'L', NULL, NULL, '2024-05-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(697, '209', NULL, NULL, 'DEWONOTO', NULL, 'L', NULL, NULL, '2024-05-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(698, '210', NULL, NULL, 'DERBY SAMUEL LATUMAERISSA', NULL, 'L', NULL, NULL, '2024-05-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(699, '211', NULL, NULL, 'YUPRIADIL PITER SARUMAHA', NULL, 'L', NULL, NULL, '2024-05-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(700, '212', NULL, NULL, 'TITIEN PUSPAWATI', NULL, 'L', NULL, NULL, '2024-05-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(701, '213', NULL, NULL, 'JULIANTO JEFFREY SITORUS', NULL, 'L', NULL, NULL, '2024-05-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(702, '214', NULL, NULL, 'ESTER.T.MANHUA', NULL, 'L', NULL, NULL, '2024-05-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(703, '215', NULL, NULL, 'EDITH OLGAVAN DE REHEE', NULL, 'L', NULL, NULL, '2024-05-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(704, '216', NULL, NULL, 'YEMIMA TIFFANY', NULL, 'L', NULL, NULL, '2024-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(705, '217', NULL, NULL, 'WONG TZE NJIU', NULL, 'L', NULL, NULL, '2024-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(706, '218', NULL, NULL, 'WILSON NADEAK', NULL, 'L', NULL, NULL, '2024-05-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(707, '219', NULL, NULL, 'UMI RAHAYU', NULL, 'L', NULL, NULL, '2024-05-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(708, '220', NULL, NULL, 'GAVRIEL LYLIAN.T.ROPE', NULL, 'L', NULL, NULL, '2024-05-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(709, '221', NULL, NULL, 'TIO RUMONDANG LIMBONG', NULL, 'L', NULL, NULL, '2024-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(710, '222', NULL, NULL, 'ANTONIUS DWI ANANTO', NULL, 'L', NULL, NULL, '2024-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(711, '223', NULL, NULL, 'DANIEL HIDAYAT', NULL, 'L', NULL, NULL, '2024-05-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(712, '224', NULL, NULL, 'ISTERINA YOHAN TOELLE', NULL, 'L', NULL, NULL, '2024-05-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(713, '225', NULL, NULL, 'MANDAILING SIAHAAN', NULL, 'L', NULL, NULL, '2024-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(714, '226', NULL, NULL, 'RONNY ISMAIL', NULL, 'L', NULL, NULL, '2024-05-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(715, '227', NULL, NULL, 'KENISHA ATHALIA PUTRI', NULL, 'L', NULL, NULL, '2024-05-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(716, '228', NULL, NULL, 'MARITO HUTABARAT', NULL, 'L', NULL, NULL, '2024-05-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(717, '229', NULL, NULL, 'MIEN THE LIM', NULL, 'L', NULL, NULL, '2024-05-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(718, '230', NULL, NULL, 'BY.NY WIDA TRI JELITA ZEGA', NULL, 'L', NULL, NULL, '2024-05-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(719, '231', NULL, NULL, 'THE HONG LENG', NULL, 'L', NULL, NULL, '2024-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(720, '232', NULL, NULL, 'MEXIE CANDRA', NULL, 'L', NULL, NULL, '2024-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(721, '233', NULL, NULL, 'SANGGUP SEMBIRING', NULL, 'L', NULL, NULL, '2024-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(722, '234', NULL, NULL, 'DONNY RASPATI ALBERT FORFEL', NULL, 'L', NULL, NULL, '2024-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(723, '235', NULL, NULL, 'MAHIDIN SILITONGA', NULL, 'L', NULL, NULL, '2024-06-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(724, '236', NULL, NULL, 'MULYADI HIDAYAT', NULL, 'L', NULL, NULL, '2024-06-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(725, '237', NULL, NULL, 'MANUEL NARAY', NULL, 'L', NULL, NULL, '2024-06-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(726, '238', NULL, NULL, 'WIWIEK NIRIAWIJAYA', NULL, 'L', NULL, NULL, '2024-06-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(727, '239', NULL, NULL, 'FERDINANTO', NULL, 'L', NULL, NULL, '2024-06-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(728, '240', NULL, NULL, 'DAVID BERDEKARIAS', NULL, 'L', NULL, NULL, '2024-06-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(729, '241', NULL, NULL, 'ERIC ZACHARIAS SUHARTONO', NULL, 'L', NULL, NULL, '2024-06-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(730, '242', NULL, NULL, 'TATANG HALIM', NULL, 'L', NULL, NULL, '2024-06-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(731, '243', NULL, NULL, 'LINDAWATI TIMOTHY', NULL, 'L', NULL, NULL, '2024-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(732, '244', NULL, NULL, 'LINDYAWATI LUNANDY', NULL, 'L', NULL, NULL, '2024-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(733, '245', NULL, NULL, 'CHRISTINA MARIANTHI', NULL, 'L', NULL, NULL, '2024-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(734, '246', NULL, NULL, 'MELANIE MEULEN HOFF', NULL, 'L', NULL, NULL, '2024-06-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(735, '247', NULL, NULL, 'TUMPAN SINAGA', NULL, 'L', NULL, NULL, '2024-06-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(736, '248', NULL, NULL, 'NORBERT.J.WENNEKES', NULL, 'L', NULL, NULL, '2024-06-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(737, '249', NULL, NULL, 'YUWONO MARTHA', NULL, 'L', NULL, NULL, '2024-06-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(738, '250', NULL, NULL, 'SOESI MEGAWATI', NULL, 'L', NULL, NULL, '2024-06-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(739, '251', NULL, NULL, 'TAN JO LIE', NULL, 'L', NULL, NULL, '2024-06-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(740, '252', NULL, NULL, 'JERRYMIAS PELUPESSY', NULL, 'L', NULL, NULL, '2024-06-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(741, '253', NULL, NULL, 'REYNALDI COPASA SIPAYUNG', NULL, 'L', NULL, NULL, '2024-06-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(742, '254', NULL, NULL, 'THE SOEAT HOEY', NULL, 'L', NULL, NULL, '2024-06-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(743, '255', NULL, NULL, 'JONG A TUNG', NULL, 'L', NULL, NULL, '2024-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(744, '256', NULL, NULL, 'PHOEN PHIN KHET', NULL, 'L', NULL, NULL, '2024-06-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(745, '257', NULL, NULL, 'HERMAWAN TOHIR', NULL, 'L', NULL, NULL, '2024-06-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(746, '258', NULL, NULL, 'LIDIA BR JABAT', NULL, 'L', NULL, NULL, '2024-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(747, '259', NULL, NULL, 'Y.RUDY SUTANTO', NULL, 'L', NULL, NULL, '2024-06-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(748, '260', NULL, NULL, 'NY.SRI ROSITA', NULL, 'L', NULL, NULL, '2024-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(749, '261', NULL, NULL, 'PURBA NADEAK', NULL, 'L', NULL, NULL, '2024-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(750, '262', NULL, NULL, 'MULYADI', NULL, 'L', NULL, NULL, '2024-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(751, '263', NULL, NULL, 'HANA SUKESI', NULL, 'L', NULL, NULL, '2024-06-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(752, '264', NULL, NULL, 'CHARLES WENZEL', NULL, 'L', NULL, NULL, '2024-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(753, '265', NULL, NULL, 'SILAM MULYONO', NULL, 'L', NULL, NULL, '2024-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(754, '266', NULL, NULL, 'PINTUBATU SARMUBA', NULL, 'L', NULL, NULL, '2024-06-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(755, '267', NULL, NULL, 'ENY SUWARDANI', NULL, 'L', NULL, NULL, '2024-06-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(756, '268', NULL, NULL, 'JASMAN SAGALA', NULL, 'L', NULL, NULL, '2024-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(757, '269', NULL, NULL, 'HARAHAP TAMBUNAN', NULL, 'L', NULL, NULL, '2024-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(758, '270', NULL, NULL, 'FARIDA MARLIANY', NULL, 'L', NULL, NULL, '2024-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(759, '271', NULL, NULL, 'RICHEL RARENA SIMBOLON', NULL, 'L', NULL, NULL, '2024-06-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(760, '272', NULL, NULL, 'ERIC PAUL SALAMENA', NULL, 'L', NULL, NULL, '2024-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(761, '273', NULL, NULL, 'TJONG SIN PANG', NULL, 'L', NULL, NULL, '2024-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23');
INSERT INTO `almarhums` (`id`, `no_registrasi`, `makam_id`, `nik`, `nama_lengkap`, `bin_binti`, `jenis_kelamin`, `tanggal_lahir`, `tanggal_wafat`, `tanggal_dimakamkan`, `agama`, `alamat`, `alamat_jalan`, `no_rumah`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kota_kabupaten`, `provinsi`, `created_at`, `updated_at`) VALUES
(762, '274', NULL, NULL, 'JOHAN WALTER TRI WIBOWO', NULL, 'L', NULL, NULL, '2024-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(763, '275', NULL, NULL, 'ESTHER KUSMARA', NULL, 'L', NULL, NULL, '2024-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(764, '276', NULL, NULL, 'MARYAM', NULL, 'L', NULL, NULL, '2024-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(765, '277', NULL, NULL, 'YUNI FATI ZEGA', NULL, 'L', NULL, NULL, '2024-06-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(766, '278', NULL, NULL, 'ICANG', NULL, 'L', NULL, NULL, '2024-07-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(767, '279', NULL, NULL, 'TOSIN', NULL, 'L', NULL, NULL, '2024-07-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(768, '280', NULL, NULL, 'GUNAWAN', NULL, 'L', NULL, NULL, '2024-07-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(769, '281', NULL, NULL, 'TRI AGUNG NURCAHYO', NULL, 'L', NULL, NULL, '2024-07-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(770, '282', NULL, NULL, 'TADUS URIA', NULL, 'L', NULL, NULL, '2024-07-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(771, '283', NULL, NULL, 'LEO ANGWARMASE', NULL, 'L', NULL, NULL, '2024-07-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(772, '284', NULL, NULL, 'EV. APELES MULYADI', NULL, 'L', NULL, NULL, '2024-07-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(773, '285', NULL, NULL, 'YUSANTI SULIMAN', NULL, 'L', NULL, NULL, '2024-07-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(774, '286', NULL, NULL, 'ISAK BELLA', NULL, 'L', NULL, NULL, '2024-07-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(775, '287', NULL, NULL, 'MIMI SUTJIANA', NULL, 'L', NULL, NULL, '2024-07-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(776, '288', NULL, NULL, 'JEMMY EMOR', NULL, 'L', NULL, NULL, '2024-07-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(777, '289', NULL, NULL, 'SURYATI', NULL, 'L', NULL, NULL, '2024-07-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(778, '290', NULL, NULL, 'LILIAN KURNIASIH', NULL, 'L', NULL, NULL, '2024-07-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(779, '291', NULL, NULL, 'EDISON SIMBOLON', NULL, 'L', NULL, NULL, '2024-07-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(780, '292', NULL, NULL, 'LILI HIKMAH', NULL, 'L', NULL, NULL, '2024-07-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(781, '293', NULL, NULL, 'RAYMOND HABEAHAN', NULL, 'L', NULL, NULL, '2024-07-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(782, '294', NULL, NULL, 'MARIA LODEWIJK', NULL, 'L', NULL, NULL, '2024-07-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(783, '295', NULL, NULL, 'IR.F GATOT SUDARYANTO', NULL, 'L', NULL, NULL, '2024-07-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(784, '296', NULL, NULL, 'TRIYANI HALIM', NULL, 'L', NULL, NULL, '2024-07-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(785, '297', NULL, NULL, 'TAN BIE NIO', NULL, 'L', NULL, NULL, '2024-07-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(786, '298', NULL, NULL, 'LIU SIAW LIE', NULL, 'L', NULL, NULL, '2024-07-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(787, '299', NULL, NULL, 'RB.BAMBANG WIBISONO', NULL, 'L', NULL, NULL, '2024-07-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(788, '300', NULL, NULL, 'TAUFIK IBRAHIM', NULL, 'L', NULL, NULL, '2024-07-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(789, '301', NULL, NULL, 'MARIA', NULL, 'L', NULL, NULL, '2026-07-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(790, '302', NULL, NULL, 'TM.SIMANJUNTAK', NULL, 'L', NULL, NULL, '2024-07-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(791, '303', NULL, NULL, 'TRI JOKO TOSO', NULL, 'L', NULL, NULL, '2024-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(792, '304', NULL, NULL, 'WIMPIE HITIJAHUBESSY', NULL, 'L', NULL, NULL, '2024-08-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(793, '305', NULL, NULL, 'TAN KWO TJIANG', NULL, 'L', NULL, NULL, '2024-08-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(794, '306', NULL, NULL, 'SALLY FAUSTINE', NULL, 'L', NULL, NULL, '2024-08-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(795, '307', NULL, NULL, 'T.PARULIAN', NULL, 'L', NULL, NULL, '2024-08-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(796, '308', NULL, NULL, 'LILY HELINA', NULL, 'L', NULL, NULL, '2024-08-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(797, '309', NULL, NULL, 'BOYKE.J.NAINGGOLAN', NULL, 'L', NULL, NULL, '2024-08-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(798, '310', NULL, NULL, 'FREDERIK.A.PALOHOON', NULL, 'L', NULL, NULL, '2024-08-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(799, '311', NULL, NULL, 'LILI DARMAWAN', NULL, 'L', NULL, NULL, '2024-08-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(800, '312', NULL, NULL, 'BAYI.NY.JANICE LIMMANUEL', NULL, 'L', NULL, NULL, '2024-08-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(801, '313', NULL, NULL, 'KASIOG/HARIS CHRISTANTO', NULL, 'L', NULL, NULL, '2024-08-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(802, '314', NULL, NULL, 'ESTHER LIA MARGARETHA', NULL, 'L', NULL, NULL, '2024-08-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(803, '315', NULL, NULL, 'Ir. SELO HARDY.J.SIHOMBING', NULL, 'L', NULL, NULL, '2024-08-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(804, '316', NULL, NULL, 'KAREL KANDIO', NULL, 'L', NULL, NULL, '2024-08-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(805, '317', NULL, NULL, 'JANNES MANURUNG', NULL, 'L', NULL, NULL, '2024-08-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(806, '318', NULL, NULL, 'TJIO ANG HOA', NULL, 'L', NULL, NULL, '2024-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(807, '319', NULL, NULL, 'VANILA AMBERLY ZEFANIE', NULL, 'L', NULL, NULL, '2024-08-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(808, '320', NULL, NULL, 'YEAN SETIADI', NULL, 'L', NULL, NULL, '2024-08-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(809, '321', NULL, NULL, 'LAU YAN NIO', NULL, 'L', NULL, NULL, '2024-08-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(810, '322', NULL, NULL, 'MIMIN SUKMINI WATTIMENA', NULL, 'L', NULL, NULL, '2024-08-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(811, '323', NULL, NULL, 'ASNI ELIWATI BR.GINTING', NULL, 'L', NULL, NULL, '2024-08-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(812, '324', NULL, NULL, 'LIE SONG DJIN', NULL, 'L', NULL, NULL, '2024-08-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(813, '325', NULL, NULL, 'YANI ROHAYANI', NULL, 'L', NULL, NULL, '2024-08-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(814, '326', NULL, NULL, 'SURIATI SUTEDJA', NULL, 'L', NULL, NULL, '2024-08-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(815, '327', NULL, NULL, 'SRI WULANDARI', NULL, 'L', NULL, NULL, '2024-08-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(816, '328', NULL, NULL, 'ELLEN KRISTIANI', NULL, 'L', NULL, NULL, '2024-08-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(817, '329', NULL, NULL, 'ELIZABETH BR BUKIT', NULL, 'L', NULL, NULL, '2024-08-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(818, '330', NULL, NULL, 'PONTAS HASOLOAN PARDEDE', NULL, 'L', NULL, NULL, '2024-08-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(819, '331', NULL, NULL, 'INGGRID SENJAYA', NULL, 'L', NULL, NULL, '2024-08-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(820, '332', NULL, NULL, 'BY.JOCHEVED (BY.NY HENNY)', NULL, 'L', NULL, NULL, '2024-08-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(821, '333', NULL, NULL, 'TAN KWEE NIO', NULL, 'L', NULL, NULL, '2024-08-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(822, '334', NULL, NULL, 'HILMAN PERMANA', NULL, 'L', NULL, NULL, '2024-08-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(823, '335', NULL, NULL, 'ANNA HUTABARAT', NULL, 'L', NULL, NULL, '2024-09-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(824, '336', NULL, NULL, 'B.SIMANJUNTAK', NULL, 'L', NULL, NULL, '2024-09-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(825, '337', NULL, NULL, 'YUSTINA PURWATI', NULL, 'L', NULL, NULL, '2024-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(826, '338', NULL, NULL, 'H.MARDIDI', NULL, 'L', NULL, NULL, '2024-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(827, '339', NULL, NULL, 'EMMYLA MARGARETHA', NULL, 'L', NULL, NULL, '2024-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(828, '340', NULL, NULL, 'LIE JOE SAN', NULL, 'L', NULL, NULL, '2024-09-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(829, '341', NULL, NULL, 'EBERT HUTAGALUNG', NULL, 'L', NULL, NULL, '2024-09-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(830, '342', NULL, NULL, 'MARIA KRISTINA', NULL, 'L', NULL, NULL, '2024-09-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(831, '343', NULL, NULL, 'LYDIAWATI GUNAWAN', NULL, 'L', NULL, NULL, '2024-09-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(832, '344', NULL, NULL, 'RENNY ANGGRAENY', NULL, 'L', NULL, NULL, '2024-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:23', '2026-09-08 22:59:23'),
(833, '345', NULL, NULL, 'RASMAN SITORUS', NULL, 'L', NULL, NULL, '2024-09-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(834, '346', NULL, NULL, 'HENDRA AGUSTINUS', NULL, 'L', NULL, NULL, '2024-09-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(835, '347', NULL, NULL, 'YUYUN TARMINI', NULL, 'L', NULL, NULL, '2024-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(836, '348', NULL, NULL, 'OLIVIA RAHAN AMORA .M', NULL, 'L', NULL, NULL, '2024-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(837, '349', NULL, NULL, 'ENARIA SILITONGA', NULL, 'L', NULL, NULL, '2024-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(838, '350', NULL, NULL, 'THT.MARKUS', NULL, 'L', NULL, NULL, '2024-09-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(839, '351', NULL, NULL, 'DEDE BUDHIARTI', NULL, 'L', NULL, NULL, '2024-09-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(840, '352', NULL, NULL, 'JOHN WESLY NAINGGOLAN', NULL, 'L', NULL, NULL, '2024-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(841, '353', NULL, NULL, 'SRI HANDAYANI', NULL, 'L', NULL, NULL, '2024-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(842, '354', NULL, NULL, 'DEDE SULASTRI', NULL, 'L', NULL, NULL, '2024-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(843, '355', NULL, NULL, 'HANA SETIAWATI', NULL, 'L', NULL, NULL, '2024-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(844, '356', NULL, NULL, 'SUGIHARTONO', NULL, 'L', NULL, NULL, '2024-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(845, '357', NULL, NULL, 'HANA MARJANA', NULL, 'L', NULL, NULL, '2024-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(846, '358', NULL, NULL, 'YAN HOTMAN SIPAYUNG', NULL, 'L', NULL, NULL, '2024-09-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(847, '359', NULL, NULL, 'TEMI SUHARDIMAN', NULL, 'L', NULL, NULL, '2024-09-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(848, '360', NULL, NULL, 'BY.VALERIAN', NULL, 'L', NULL, NULL, '2024-09-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(849, '361', NULL, NULL, 'KARWAN', NULL, 'L', NULL, NULL, '2024-09-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(850, '362', NULL, NULL, 'INGGITA', NULL, 'L', NULL, NULL, '2024-09-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(851, '363', NULL, NULL, 'HENRAWATY SIREGAR', NULL, 'L', NULL, NULL, '2024-09-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(852, '364', NULL, NULL, 'KUNTADI DARMAWAN', NULL, 'L', NULL, NULL, '2024-09-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(853, '365', NULL, NULL, 'MARASAL SIHALOHO', NULL, 'L', NULL, NULL, '2024-09-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(854, '366', NULL, NULL, 'KURNIATI', NULL, 'L', NULL, NULL, '2024-09-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(855, '367', NULL, NULL, 'TIARMA SITORUS', NULL, 'L', NULL, NULL, '2024-09-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(856, '368', NULL, NULL, 'TONI R.H.SITORUS', NULL, 'L', NULL, NULL, '2024-10-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(857, '369', NULL, NULL, 'D.SIMANJUNTAK', NULL, 'L', NULL, NULL, '2024-10-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(858, '370', NULL, NULL, 'Ir.Y.T.SEMBIRING', NULL, 'L', NULL, NULL, '2024-10-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(859, '371', NULL, NULL, 'ING TJOI', NULL, 'L', NULL, NULL, '2024-10-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(860, '372', NULL, NULL, 'RACHMAN SETIADJI', NULL, 'L', NULL, NULL, '2024-10-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(861, '373', NULL, NULL, 'TIONG LIN/USMAN', NULL, 'L', NULL, NULL, '2024-10-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(862, '374', NULL, NULL, 'NJOEK TJIN LILIAWATI', NULL, 'L', NULL, NULL, '2024-10-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(863, '375', NULL, NULL, 'EKLESIA.P.BATUBARA', NULL, 'L', NULL, NULL, '2024-10-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(864, '376', NULL, NULL, 'DEDI HERYADI', NULL, 'L', NULL, NULL, '2024-10-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(865, '377', NULL, NULL, 'HASTUTI GASPERZ.B', NULL, 'L', NULL, NULL, '2024-10-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(866, '378', NULL, NULL, 'AGUSTINUS HAREFA', NULL, 'L', NULL, NULL, '2024-10-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(867, '379', NULL, NULL, 'SUTIDJAH AGNES', NULL, 'L', NULL, NULL, '2024-10-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(868, '380', NULL, NULL, 'BANGGAS SIHOMBING', NULL, 'L', NULL, NULL, '2024-10-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(869, '381', NULL, NULL, 'JANIWATI', NULL, 'L', NULL, NULL, '2024-10-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(870, '382', NULL, NULL, 'ETTIE OTJE LOEKMAN', NULL, 'L', NULL, NULL, '2024-10-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(871, '383', NULL, NULL, 'JULIUS SARJONO', NULL, 'L', NULL, NULL, '2024-10-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(872, '384', NULL, NULL, 'SOELAEMAN SOEPARPADI', NULL, 'L', NULL, NULL, '2024-10-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(873, '385', NULL, NULL, 'LIEM LEE KUN', NULL, 'L', NULL, NULL, '2024-10-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(874, '389', NULL, NULL, 'ADJUN DJUNAEDI', NULL, 'L', NULL, NULL, '2024-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(875, '390', NULL, NULL, 'TOGAR PARLINDUNGAN GULTOM', NULL, 'L', NULL, NULL, '2024-10-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(876, '391', NULL, NULL, 'TINEKE PELUPESSY', NULL, 'L', NULL, NULL, '2024-10-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(877, '392', NULL, NULL, 'TJIANG EN KONG', NULL, 'L', NULL, NULL, '2024-10-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(878, '393', NULL, NULL, 'TAN ELLY', NULL, 'L', NULL, NULL, '2024-10-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(879, '394', NULL, NULL, 'RUDDY', NULL, 'L', NULL, NULL, '2024-10-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(880, '395', NULL, NULL, 'ROSMAWATI BR SAMOSIR', NULL, 'L', NULL, NULL, '2024-10-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(881, '396', NULL, NULL, 'VERIA.L..TOBING', NULL, 'L', NULL, NULL, '2024-10-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(882, '397', NULL, NULL, 'JULIANA HUWAE', NULL, 'L', NULL, NULL, '2024-10-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(883, '398', NULL, NULL, 'MARYAM INDRAWATI', NULL, 'L', NULL, NULL, '2024-10-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(884, '399', NULL, NULL, 'BATSEBA PATTIRANE', NULL, 'L', NULL, NULL, '2024-10-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(885, '400', NULL, NULL, 'JENIWATI', NULL, 'L', NULL, NULL, '2024-10-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(886, '401', NULL, NULL, 'CALVIN GLENN BUDIANTO', NULL, 'L', NULL, NULL, '2024-10-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(887, '402', NULL, NULL, 'SUTIANA', NULL, 'L', NULL, NULL, '2024-10-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(888, '403', NULL, NULL, 'LINAWATI', NULL, 'L', NULL, NULL, '2024-10-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(889, '404', NULL, NULL, 'HELMI SIDIBANG', NULL, 'L', NULL, NULL, '2024-10-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(890, '405', NULL, NULL, 'MARIA  BERNEDETH WINATA', NULL, 'L', NULL, NULL, '2024-10-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(891, '406', NULL, NULL, 'PONIYAH', NULL, 'L', NULL, NULL, '2024-10-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(892, '407', NULL, NULL, 'FRANS ABRAHAM PARERA', NULL, 'L', NULL, NULL, '2024-10-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(893, '408', NULL, NULL, 'LILIE.S.JUSUF', NULL, 'L', NULL, NULL, '2024-10-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(894, '409', NULL, NULL, 'DEWI SUSANTI', NULL, 'L', NULL, NULL, '2024-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(895, '410', NULL, NULL, 'DEVY MATHEAS', NULL, 'L', NULL, NULL, '2024-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(896, '411', NULL, NULL, 'HERLAN SITINJAK', NULL, 'L', NULL, NULL, '2024-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(897, '412', NULL, NULL, 'RUDOLF T.M ISAKH', NULL, 'L', NULL, NULL, '2024-10-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(898, '413', NULL, NULL, 'TEGOHTA PERANGIN ANGIN', NULL, 'L', NULL, NULL, '2024-10-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(899, '414', NULL, NULL, 'P.PARTI', NULL, 'L', NULL, NULL, '2024-10-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(900, '415', NULL, NULL, 'IMAN', NULL, 'L', NULL, NULL, '2024-10-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(901, '416', NULL, NULL, 'JEFRRY KRISTIAN MOKALU', NULL, 'L', NULL, NULL, '2024-11-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(902, '417', NULL, NULL, 'OEY ENG SIN', NULL, 'L', NULL, NULL, '2024-11-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(903, '418', NULL, NULL, 'MONIKA SHIRLEY.H.N', NULL, 'L', NULL, NULL, '2024-11-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(904, '419', NULL, NULL, 'ROSINTA HUTASOIT', NULL, 'L', NULL, NULL, '2024-11-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(905, '420', NULL, NULL, 'JAMOT JEFRIN SIMANJUNTAK', NULL, 'L', NULL, NULL, '2024-11-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(906, '421', NULL, NULL, 'CLARISSA ANGELINA', NULL, 'L', NULL, NULL, '2024-11-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(907, '422', NULL, NULL, 'DEDE.K.ENGEL', NULL, 'L', NULL, NULL, '2024-11-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(908, '423', NULL, NULL, 'CHRISTINA UTAMI', NULL, 'L', NULL, NULL, '2024-11-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(909, '424', NULL, NULL, 'HANDI ARIFIN', NULL, 'L', NULL, NULL, '2024-11-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(910, '425', NULL, NULL, 'DIMAN SUPRATMAN', NULL, 'L', NULL, NULL, '2024-11-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(911, '426', NULL, NULL, 'VVIENNE YUNA RIYANTO', NULL, 'L', NULL, NULL, '2024-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(912, '427', NULL, NULL, 'CHRISTY RUMONDANG', NULL, 'L', NULL, NULL, '2024-11-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(913, '428', NULL, NULL, 'JOE SIOE SAN', NULL, 'L', NULL, NULL, '2024-11-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(914, '429', NULL, NULL, 'ERNAWATI RUSTANDI', NULL, 'L', NULL, NULL, '2024-11-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(915, '430', NULL, NULL, 'SUWARNI WIDJAJA', NULL, 'L', NULL, NULL, '2024-11-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(916, '431', NULL, NULL, 'NY.MARINA BR TARIGAN', NULL, 'L', NULL, NULL, '2024-11-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(917, '432', NULL, NULL, 'ERLIN HARYANTI', NULL, 'L', NULL, NULL, '2024-11-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(918, '433', NULL, NULL, 'HONG KIAUN NIO', NULL, 'L', NULL, NULL, '2024-11-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(919, '434', NULL, NULL, 'RAFAEL WIRYAWAN', NULL, 'L', NULL, NULL, '2024-11-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(920, '435', NULL, NULL, 'LAKSANA', NULL, 'L', NULL, NULL, '2024-11-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(921, '436', NULL, NULL, 'SALMI.S', NULL, 'L', NULL, NULL, '2024-11-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(922, '437', NULL, NULL, 'BONNY BARNANDUS', NULL, 'L', NULL, NULL, '2024-11-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(923, '438', NULL, NULL, 'NICO KASTO SUKMANEGARA', NULL, 'L', NULL, NULL, '2024-11-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(924, '439', NULL, NULL, 'NOES CORNELISZ', NULL, 'L', NULL, NULL, '2024-11-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(925, '440', NULL, NULL, 'ERNAWATI TJASBIN', NULL, 'L', NULL, NULL, '2024-11-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(926, '441', NULL, NULL, 'ANTHONIA MARIA LILIPORY', NULL, 'L', NULL, NULL, '2024-11-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(927, '442', NULL, NULL, 'WILLY.M.RIMPER', NULL, 'L', NULL, NULL, '2024-11-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(928, '443', NULL, NULL, 'UNANG KAMADJAJA', NULL, 'L', NULL, NULL, '2024-11-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(929, '444', NULL, NULL, 'ONNY SOEHERLY', NULL, 'L', NULL, NULL, '2024-11-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(930, '445', NULL, NULL, 'JAMES ROONEY VILLANUEVA', NULL, 'L', NULL, NULL, '2024-11-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(931, '446', NULL, NULL, 'VICTOR SIPAYUNG', NULL, 'L', NULL, NULL, '2024-11-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(932, '447', NULL, NULL, 'TJOA SIN NIO', NULL, 'L', NULL, NULL, '2024-11-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(933, '448', NULL, NULL, 'YOSAFATI ZEBUA', NULL, 'L', NULL, NULL, '2024-11-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(934, '449', NULL, NULL, 'LILI TIRTAYANA', NULL, 'L', NULL, NULL, '2024-11-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(935, '450', NULL, NULL, 'YULIA DIAS SETIARSI', NULL, 'L', NULL, NULL, '2024-11-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(936, '451', NULL, NULL, 'SITI ROSLINA SITUMEANG', NULL, 'L', NULL, NULL, '2024-12-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(937, '452', NULL, NULL, 'RUMBI SAMOSIR TAMPUBOLON', NULL, 'L', NULL, NULL, '2024-12-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(938, '453', NULL, NULL, 'MARTA HALIM', NULL, 'L', NULL, NULL, '2024-12-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(939, '454', NULL, NULL, 'ROBERT TAMPUBOLON', NULL, 'L', NULL, NULL, '2024-12-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(940, '455', NULL, NULL, 'ROBERT SUTARDI', NULL, 'L', NULL, NULL, '2024-12-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(941, '456', NULL, NULL, 'FREDY NANLOHY', NULL, 'L', NULL, NULL, '2024-12-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(942, '457', NULL, NULL, 'BY.NY JOANE LOUISEN MALAU', NULL, 'L', NULL, NULL, '2024-12-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(943, '458', NULL, NULL, 'HOTMARIA SINAGA', NULL, 'L', NULL, NULL, '2024-12-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(944, '459', NULL, NULL, 'DRS. RACHMAN WIRAWAN', NULL, 'L', NULL, NULL, '2024-12-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(945, '460', NULL, NULL, 'MARGARETA WILHELMINA TATUHEY', NULL, 'L', NULL, NULL, '2024-12-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(946, '461', NULL, NULL, 'EDDY HARYANTO', NULL, 'L', NULL, NULL, '2024-12-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(947, '462', NULL, NULL, 'HIANA ORIANA', NULL, 'L', NULL, NULL, '2024-12-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(948, '463', NULL, NULL, 'POLTAK H.SITINJAK', NULL, 'L', NULL, NULL, '2024-12-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(949, '464', NULL, NULL, 'SAHAT BUTAR BUTAR', NULL, 'L', NULL, NULL, '2024-12-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(950, '465', NULL, NULL, 'ENIE CHANDRA', NULL, 'L', NULL, NULL, '2024-12-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(951, '466', NULL, NULL, 'DEDE SURYANI', NULL, 'L', NULL, NULL, '2024-12-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(952, '467', NULL, NULL, 'YOSEP YAHYA', NULL, 'L', NULL, NULL, '2024-12-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(953, '468', NULL, NULL, 'LILIEK WACHYUNI', NULL, 'L', NULL, NULL, '2024-12-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(954, '469', NULL, NULL, 'ANTHONY HERAWAN', NULL, 'L', NULL, NULL, '2024-12-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(955, '470', NULL, NULL, 'KASBAN ABDULAH', NULL, 'L', NULL, NULL, '2024-12-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(956, '471', NULL, NULL, 'SRI HERLINA SITEPU', NULL, 'L', NULL, NULL, '2024-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(957, '472', NULL, NULL, 'HENDRI STEVAN', NULL, 'L', NULL, NULL, '2024-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(958, '473', NULL, NULL, 'MINA BAMBANG', NULL, 'L', NULL, NULL, '2024-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(959, '474', NULL, NULL, 'IMAN SUPARMAN', NULL, 'L', NULL, NULL, '2024-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(960, '475', NULL, NULL, 'NY.YULI', NULL, 'L', NULL, NULL, '2024-12-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(961, '476', NULL, NULL, 'ISYE DAMAYANTI', NULL, 'L', NULL, NULL, '2024-12-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(962, '477', NULL, NULL, 'YOENOES SUKANDAR R', NULL, 'L', NULL, NULL, '2024-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(963, '478', NULL, NULL, 'ARIFIN SETIA', NULL, 'L', NULL, NULL, '2024-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(964, '479', NULL, NULL, 'LINTJE BORU SIMANJUNTAK', NULL, 'L', NULL, NULL, '2024-12-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(965, '480', NULL, NULL, 'LUCIHANA', NULL, 'L', NULL, NULL, '2024-12-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(966, '481', NULL, NULL, 'EFENDI BANGUN', NULL, 'L', NULL, NULL, '2024-12-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(967, '482', NULL, NULL, 'JAP IWAN SETIAWAN', NULL, 'L', NULL, NULL, '2024-12-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(968, '484', NULL, NULL, 'ZEANO EVANO DILLON', NULL, 'L', NULL, NULL, '2024-12-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24'),
(969, '485', NULL, NULL, 'FERNANDO', NULL, 'L', NULL, NULL, '2024-12-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-09-08 22:59:24', '2026-09-08 22:59:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bloks`
--

CREATE TABLE `bloks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tpu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_blok_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kode_blok` varchar(255) NOT NULL,
  `nama_blok` varchar(255) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `corners` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`corners`)),
  `status_ketersediaan` varchar(255) NOT NULL DEFAULT 'Kosong (Tersedia)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bloks`
--

INSERT INTO `bloks` (`id`, `tpu_id`, `parent_blok_id`, `kode_blok`, `nama_blok`, `keterangan`, `corners`, `status_ketersediaan`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'BLK-A1', 'CB/B', NULL, '[{\"lat\":-6.900469818378044,\"lng\":107.5923238938418},{\"lat\":-6.900563599270455,\"lng\":107.5931005046917},{\"lat\":-6.898548394788514,\"lng\":107.5933438539505},{\"lat\":-6.898454613896103,\"lng\":107.59256724310059}]', 'Kosong (Tersedia)', '2026-08-31 21:18:25', '2026-09-09 02:38:43'),
(8, 1, NULL, 'BLK-CB/K/II-2', 'CB/K/II', NULL, '[{\"lat\":-6.898923405017594,\"lng\":107.59175202686106},{\"lat\":-6.8989902775731675,\"lng\":107.59230315685275},{\"lat\":-6.898471327370115,\"lng\":107.5923661248037},{\"lat\":-6.898404454814541,\"lng\":107.59181499481201}]', 'Terisi (Aktif)', '2026-09-09 00:48:47', '2026-09-09 00:49:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `delete_requests`
--

CREATE TABLE `delete_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requestable_type` varchar(255) NOT NULL,
  `requestable_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'menunggu',
  `requested_by_type` varchar(255) DEFAULT NULL,
  `requested_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_by_type` varchar(255) DEFAULT NULL,
  `reviewed_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `review_note` text DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `uptd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tpu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `delete_requests`
--

INSERT INTO `delete_requests` (`id`, `requestable_type`, `requestable_id`, `reason`, `status`, `requested_by_type`, `requested_by_id`, `reviewed_by_type`, `reviewed_by_id`, `review_note`, `reviewed_at`, `uptd_id`, `tpu_id`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Makam', 8, 'Data uji penghapusan melalui permintaan', 'disetujui', 'App\\Models\\AdminTpu', 1, 'App\\Models\\SuperAdmin', 1, NULL, '2026-09-07 01:21:33', 4, 1, '2026-09-07 01:21:10', '2026-09-08 00:58:52'),
(2, 'App\\Models\\Makam', 9, 'uji reject', 'ditolak', 'App\\Models\\AdminTpu', 1, 'App\\Models\\Uptd', 1, 'data ini masih dipakai', '2026-09-07 01:22:59', 4, 1, '2026-09-07 01:22:58', '2026-09-08 00:58:52'),
(3, 'App\\Models\\Almarhum', 1, 'gabut', 'ditolak', 'App\\Models\\AdminTpu', 1, 'App\\Models\\SuperAdmin', 2, 'Jangan gegabah', '2026-09-07 21:55:14', 4, 1, '2026-09-07 20:55:15', '2026-09-08 00:58:52'),
(5, 'App\\Models\\AhliWaris', 7, 'geus maot', 'ditolak', 'App\\Models\\AdminTpu', 1, 'App\\Models\\SuperAdmin', 2, 'cik mikir', '2026-09-08 00:32:30', 4, 1, '2026-09-08 00:30:23', '2026-09-08 00:58:52'),
(6, 'App\\Models\\AhliWaris', 2, 'Sudah wafat', 'ditolak', 'App\\Models\\AdminTpu', 1, 'App\\Models\\Uptd', 4, 'Tidak Harus', '2026-09-08 01:01:56', 4, 1, '2026-09-08 00:47:21', '2026-09-08 01:01:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tpu_id` bigint(20) UNSIGNED NOT NULL,
  `nama_fasilitas` varchar(255) NOT NULL,
  `jenis_fasilitas` varchar(255) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `tpu_id`, `nama_fasilitas`, `jenis_fasilitas`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'Musholla Utama', 'Tempat Ibadah', -6.9024253, 107.5925767, '2026-08-31 21:26:12', '2026-09-13 22:01:46'),
(3, 1, 'Kantor TPU Pandu', 'Kantor', -6.9024572, 107.5928771, '2026-09-13 22:00:44', '2026-09-13 22:01:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koordinat_makams`
--

CREATE TABLE `koordinat_makams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `makam_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `koordinat_makams`
--

INSERT INTO `koordinat_makams` (`id`, `makam_id`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 3, -6.8988000, 107.5925000, '2026-09-06 21:20:35', '2026-09-06 23:52:40'),
(2, 1, -6.8988100, 107.5925100, '2026-09-06 21:21:10', '2026-09-06 21:21:10'),
(3, 2, -6.8987900, 107.5924900, '2026-09-06 21:21:11', '2026-09-06 21:21:11'),
(7, 18, -6.8988000, 107.5925000, '2026-09-08 21:43:10', '2026-09-08 22:53:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `makams`
--

CREATE TABLE `makams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blok_id` bigint(20) UNSIGNED NOT NULL,
  `kode_makam` varchar(255) NOT NULL,
  `nomor_makam` varchar(255) NOT NULL,
  `status` enum('kosong','terisi') NOT NULL DEFAULT 'kosong',
  `status_petak` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `makams`
--

INSERT INTO `makams` (`id`, `blok_id`, `kode_makam`, `nomor_makam`, `status`, `status_petak`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'MKM-A1-001', 'CB-04/12', 'terisi', 'Terisi (Aktif)', 'Blok A1 petak 001 dekat pintu utama', '2026-08-31 21:24:01', '2026-09-08 23:45:56'),
(2, 1, 'MKM-A1-002', '002', 'terisi', 'Terisi (Aktif)', 'Blok A1 petak 002 sisi timur', '2026-09-01 01:02:50', '2026-09-06 21:21:11'),
(3, 1, 'MKM-A1-003', '003', 'terisi', 'Terisi (Aktif)', 'Blok A1 petak 003 di ujung barat', '2026-09-02 01:44:59', '2026-09-06 23:52:40'),
(18, 1, 'MKM-A1-004', 'PND001', 'kosong', 'Kosong (Tersedia)', 'Blok A1 petak 004', '2026-09-08 00:35:25', '2026-09-08 23:20:15'),
(23, 8, 'BLK-CB/K/II-P7036', 'P7036', 'terisi', 'Terisi (Aktif)', NULL, '2026-09-09 00:56:19', '2026-09-09 00:56:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_27_035607_create_personal_access_tokens_table', 2),
(5, '2024_01_01_000001_create_super_admins_table', 3),
(6, '2024_01_01_000002_create_uptds_table', 3),
(7, '2024_01_01_000003_create_tpus_table', 3),
(8, '2024_01_01_000004_create_admin_tpus_table', 3),
(9, '2024_01_01_000005_create_pemohons_table', 3),
(10, '2024_01_01_000006_create_bloks_table', 3),
(11, '2024_01_01_000007_create_makams_table', 3),
(12, '2024_01_01_000008_create_koordinat_makams_table', 3),
(13, '2024_01_01_000009_create_almarhums_table', 3),
(14, '2024_01_01_000010_create_ahli_waris_table', 3),
(15, '2024_01_01_000011_create_pengajuans_table', 3),
(16, '2024_01_02_000001_add_parent_and_geometry_to_bloks_table', 4),
(17, '2024_01_02_000002_create_fasilitas_table', 4),
(18, '2024_01_02_000003_add_detail_fields_to_almarhums_table', 4),
(19, '2024_01_03_000001_add_status_petak_to_makams_table', 5),
(20, '2026_09_02_064328_add_coordinates_to_makams_table', 6),
(21, '2024_01_04_000001_add_detail_alamat_to_almarhums_table', 7),
(22, '2024_01_04_000002_add_detail_alamat_to_ahli_waris_table', 7),
(23, '2026_09_07_000001_add_nik_to_ahli_waris_table', 8),
(24, '2026_09_07_000010_add_logs_and_delete_requests_tables', 9),
(25, '2026_09_09_000001_make_tanggal_wafat_nullable', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemohons`
--

CREATE TABLE `pemohons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pemohons`
--

INSERT INTO `pemohons` (`id`, `nik`, `nama_lengkap`, `no_telepon`, `alamat`, `username`, `password`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '3201010806980001', 'Ginanjar pamungkas', '02294567', 'Kabupaten', 'pemohon1', '$2y$12$/zP/Sg3qbm2UD3Qo0yNGFuakm7FjNIQ.RfRUTOhjqnMsDEFmx1gN6', 'ginanjar@pemohon.test', NULL, '2026-09-01 02:44:18', '2026-09-01 02:44:18'),
(2, '3204567891011202', 'Abdinan negara', '081245678909', 'Cimahi', 'pemohon2', '$2y$12$IR09cyGaMtRouFs1WfzQLO5lpXLVMXpb6ylvOnO0fc6iUkp.wogVC', 'abdinan@pemohon.test', NULL, '2026-09-01 03:59:50', '2026-09-01 03:59:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuans`
--

CREATE TABLE `pengajuans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_pengajuan` varchar(255) NOT NULL,
  `pemohon_id` bigint(20) UNSIGNED NOT NULL,
  `tpu_id` bigint(20) UNSIGNED NOT NULL,
  `almarhum_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_tpu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('menunggu_verifikasi','disetujui','ditolak') NOT NULL DEFAULT 'menunggu_verifikasi',
  `catatan_verifikasi` text DEFAULT NULL,
  `tanggal_pengajuan` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_verifikasi` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengajuans`
--

INSERT INTO `pengajuans` (`id`, `kode_pengajuan`, `pemohon_id`, `tpu_id`, `almarhum_id`, `admin_tpu_id`, `status`, `catatan_verifikasi`, `tanggal_pengajuan`, `tanggal_verifikasi`, `created_at`, `updated_at`) VALUES
(1, 'PGJ-20260901-E4YWM', 1, 1, 3, 1, 'disetujui', 'Disetujui, silakan datang ke kantor TPU', '2026-09-01 02:56:40', '2026-09-01 03:28:56', '2026-09-01 02:56:40', '2026-09-01 03:28:56'),
(2, 'PGJ-20260901-J9QTJ', 2, 1, 4, 1, 'disetujui', 'Disetujui, silakan datang ke lokasi', '2026-09-01 04:13:57', '2026-09-01 04:24:32', '2026-09-01 04:13:57', '2026-09-01 04:24:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(9, 'App\\Models\\Pemohon', 2, 'api-token', '86ee8c1befb07145b977e4a08074052d604d1db9442bbff07435638b3f20d632', '[\"*\"]', '2026-09-01 04:33:26', NULL, '2026-09-01 04:12:15', '2026-09-01 04:33:26'),
(14, 'App\\Models\\Pemohon', 1, 'api-token', 'e14ff1c8d4ff939646e2331326047ce2e068eea16e45093cc604d93f8979c723', '[\"*\"]', '2026-09-01 20:02:02', NULL, '2026-09-01 20:01:30', '2026-09-01 20:02:02'),
(44, 'App\\Models\\Uptd', 1, 'api-token', '0b24dd6a429eae4b7d0ccdc361ed7d4290efe250fc70814bc6e6da19f1c35b09', '[\"*\"]', '2026-09-06 23:38:00', NULL, '2026-09-06 20:39:43', '2026-09-06 23:38:00'),
(150, 'App\\Models\\SuperAdmin', 2, 'api-token', '7dd3274a13f1ea12496e4f5bb6f2603215b10b16d30c813a95cf6a3800f1411f', '[\"*\"]', '2026-09-13 23:24:48', NULL, '2026-09-13 23:03:24', '2026-09-13 23:24:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('C21gBF1FKv66CXF12xMYwIMIQzQvcKMDZNHs474S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0dwVEdoYmhQZjhObXNId1RCUERhSktyeHQ4a2tkTHIyMXlieXRTYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1789367249),
('Dzr6hk3OJC9Ow0oeiqOPElmMB66qZZfePLNvmHf0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7725', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjRkOXNQaERnYzlwbk92TGFrZjdpajI1ZnM1R29jT1BRUEl0R0tURSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXRhIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1789361890),
('Hyr8yTAtDlJqNTYGPCs2hBLgrcHmW2mNcTYntFqZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG5sTDFYQXp6N2VsVjU1ck5qNXF2T1kxdU1KVExDdG9XUVZSaGRoeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789360087),
('LQqmrRUR4i6RJMZxahKsx8jx4s4QIZlvheRrGCpr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7725', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienpUQUtVRlJIdlYyTFBDQXVXaXJlWU5oR21jWEFjVlJZOHpiZU45ZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1789361272);

-- --------------------------------------------------------

--
-- Struktur dari tabel `super_admins`
--

CREATE TABLE `super_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `super_admins`
--

INSERT INTO `super_admins` (`id`, `nip`, `username`, `password`, `nama_lengkap`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, '198001012005011001', 'superadmin', '$2y$12$h5joUBuFaTilnBbgu9ioFuXaPPuGbmYUTWrel6.1Ie6B1gft8Yg3e', 'Super Admin Utama', 'superadmin@sipemakaman.go.id', NULL, '2026-09-07 19:31:43', '2026-09-07 19:31:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpus`
--

CREATE TABLE `tpus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uptd_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kode_tpu` varchar(255) NOT NULL,
  `nama_tpu` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(255) DEFAULT NULL,
  `kecamatan` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `provinsi` varchar(255) DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') NOT NULL DEFAULT 'aktif',
  `center_lat` decimal(10,7) DEFAULT NULL,
  `center_lng` decimal(10,7) DEFAULT NULL,
  `zoom_level` tinyint(3) UNSIGNED NOT NULL DEFAULT 15,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tpus`
--

INSERT INTO `tpus` (`id`, `uptd_id`, `kode_tpu`, `nama_tpu`, `alamat`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `status`, `center_lat`, `center_lng`, `zoom_level`, `created_at`, `updated_at`) VALUES
(1, 4, 'PND', 'TPU Pandu', 'Jl.Pandu', 'Pamoyanan', 'Cicendo', 'Bandung', 'Jawa Barat', 'aktif', -6.8988000, 107.5925000, 17, '2026-08-27 00:50:16', '2026-09-08 00:58:52'),
(2, 4, 'SRG', 'TPU Sirnaraga', 'Jalan Padjajaran', NULL, 'Cicendo', 'Bandung', NULL, 'aktif', -6.5413200, 107.3520200, 17, '2026-09-01 19:39:33', '2026-09-08 00:58:52'),
(3, 4, 'CBR', 'TPU Cibarunai', 'Jl.Sarijadi Raya', 'Sukarasa', 'Sukasari', 'Bandung', 'Jawa Barat', 'aktif', -6.8799212, 107.5731199, 17, '2026-09-01 19:44:14', '2026-09-13 23:17:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `uptds`
--

CREATE TABLE `uptds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(255) NOT NULL,
  `nama_uptd` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `uptds`
--

INSERT INTO `uptds` (`id`, `nip`, `nama_uptd`, `alamat`, `no_telepon`, `username`, `password`, `email`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, '198502022008021002', 'UPTD I Kota Bandung', 'Jl. Sukajadi No. 123, Bandung', '0221234567', 'adminuptd1', '$2y$12$OgPutoAedB1Bx/eEQymF7OywKmp1EwVzkvL.J8hZuyPOcuNrIV5gi', 'uptd1@sipemakaman.go.id', NULL, '2026-09-07 19:48:28', '2026-09-13 23:14:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `admin_tpus`
--
ALTER TABLE `admin_tpus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_tpus_nip_unique` (`nip`),
  ADD UNIQUE KEY `admin_tpus_username_unique` (`username`),
  ADD UNIQUE KEY `admin_tpus_email_unique` (`email`),
  ADD KEY `admin_tpus_tpu_id_foreign` (`tpu_id`);

--
-- Indeks untuk tabel `ahli_waris`
--
ALTER TABLE `ahli_waris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ahli_waris_almarhum_id_foreign` (`almarhum_id`);

--
-- Indeks untuk tabel `almarhums`
--
ALTER TABLE `almarhums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `almarhums_makam_id_unique` (`makam_id`),
  ADD UNIQUE KEY `almarhums_no_registrasi_unique` (`no_registrasi`);

--
-- Indeks untuk tabel `bloks`
--
ALTER TABLE `bloks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bloks_tpu_id_kode_blok_unique` (`tpu_id`,`kode_blok`),
  ADD KEY `bloks_parent_blok_id_foreign` (`parent_blok_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `delete_requests`
--
ALTER TABLE `delete_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delete_requests_requestable_type_requestable_id_index` (`requestable_type`,`requestable_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fasilitas_tpu_id_foreign` (`tpu_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `koordinat_makams`
--
ALTER TABLE `koordinat_makams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `koordinat_makams_makam_id_unique` (`makam_id`);

--
-- Indeks untuk tabel `makams`
--
ALTER TABLE `makams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `makams_blok_id_kode_makam_unique` (`blok_id`,`kode_makam`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pemohons`
--
ALTER TABLE `pemohons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pemohons_nik_unique` (`nik`),
  ADD UNIQUE KEY `pemohons_username_unique` (`username`),
  ADD UNIQUE KEY `pemohons_email_unique` (`email`);

--
-- Indeks untuk tabel `pengajuans`
--
ALTER TABLE `pengajuans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengajuans_kode_pengajuan_unique` (`kode_pengajuan`),
  ADD KEY `pengajuans_pemohon_id_foreign` (`pemohon_id`),
  ADD KEY `pengajuans_tpu_id_foreign` (`tpu_id`),
  ADD KEY `pengajuans_almarhum_id_foreign` (`almarhum_id`),
  ADD KEY `pengajuans_admin_tpu_id_foreign` (`admin_tpu_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `super_admins`
--
ALTER TABLE `super_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `super_admins_nip_unique` (`nip`),
  ADD UNIQUE KEY `super_admins_username_unique` (`username`),
  ADD UNIQUE KEY `super_admins_email_unique` (`email`);

--
-- Indeks untuk tabel `tpus`
--
ALTER TABLE `tpus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tpus_kode_tpu_unique` (`kode_tpu`),
  ADD KEY `tpus_uptd_id_foreign` (`uptd_id`);

--
-- Indeks untuk tabel `uptds`
--
ALTER TABLE `uptds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uptds_nip_unique` (`nip`),
  ADD UNIQUE KEY `uptds_username_unique` (`username`),
  ADD UNIQUE KEY `uptds_email_unique` (`email`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT untuk tabel `admin_tpus`
--
ALTER TABLE `admin_tpus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ahli_waris`
--
ALTER TABLE `ahli_waris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=952;

--
-- AUTO_INCREMENT untuk tabel `almarhums`
--
ALTER TABLE `almarhums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=972;

--
-- AUTO_INCREMENT untuk tabel `bloks`
--
ALTER TABLE `bloks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `delete_requests`
--
ALTER TABLE `delete_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koordinat_makams`
--
ALTER TABLE `koordinat_makams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `makams`
--
ALTER TABLE `makams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `pemohons`
--
ALTER TABLE `pemohons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengajuans`
--
ALTER TABLE `pengajuans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT untuk tabel `super_admins`
--
ALTER TABLE `super_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tpus`
--
ALTER TABLE `tpus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `uptds`
--
ALTER TABLE `uptds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin_tpus`
--
ALTER TABLE `admin_tpus`
  ADD CONSTRAINT `admin_tpus_tpu_id_foreign` FOREIGN KEY (`tpu_id`) REFERENCES `tpus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ahli_waris`
--
ALTER TABLE `ahli_waris`
  ADD CONSTRAINT `ahli_waris_almarhum_id_foreign` FOREIGN KEY (`almarhum_id`) REFERENCES `almarhums` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `almarhums`
--
ALTER TABLE `almarhums`
  ADD CONSTRAINT `almarhums_makam_id_foreign` FOREIGN KEY (`makam_id`) REFERENCES `makams` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `bloks`
--
ALTER TABLE `bloks`
  ADD CONSTRAINT `bloks_parent_blok_id_foreign` FOREIGN KEY (`parent_blok_id`) REFERENCES `bloks` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bloks_tpu_id_foreign` FOREIGN KEY (`tpu_id`) REFERENCES `tpus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_tpu_id_foreign` FOREIGN KEY (`tpu_id`) REFERENCES `tpus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `koordinat_makams`
--
ALTER TABLE `koordinat_makams`
  ADD CONSTRAINT `koordinat_makams_makam_id_foreign` FOREIGN KEY (`makam_id`) REFERENCES `makams` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `makams`
--
ALTER TABLE `makams`
  ADD CONSTRAINT `makams_blok_id_foreign` FOREIGN KEY (`blok_id`) REFERENCES `bloks` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengajuans`
--
ALTER TABLE `pengajuans`
  ADD CONSTRAINT `pengajuans_admin_tpu_id_foreign` FOREIGN KEY (`admin_tpu_id`) REFERENCES `admin_tpus` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pengajuans_almarhum_id_foreign` FOREIGN KEY (`almarhum_id`) REFERENCES `almarhums` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `pengajuans_pemohon_id_foreign` FOREIGN KEY (`pemohon_id`) REFERENCES `pemohons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pengajuans_tpu_id_foreign` FOREIGN KEY (`tpu_id`) REFERENCES `tpus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tpus`
--
ALTER TABLE `tpus`
  ADD CONSTRAINT `tpus_uptd_id_foreign` FOREIGN KEY (`uptd_id`) REFERENCES `uptds` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
