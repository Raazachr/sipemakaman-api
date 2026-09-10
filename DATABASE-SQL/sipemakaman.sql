-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Sep 2026 pada 04.40
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
(1, 1, '2345678', 'admintpu1', '$2y$12$WBPPA.vL.Z/4Rk8Y8Ohefu0bA6U60gEPVvONfnrthYz0TC1Lr6at.', 'Admin TPU Pandu', 'admintpu1@sipemakaman.test', NULL, '2026-08-31 19:55:39', '2026-09-01 04:18:44'),
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
  `tanggal_wafat` date NOT NULL,
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
(1, 'REG-2026-03', 3, '3245678', 'Ahmad Abdul Somad', 'bin usman', 'L', '1945-08-17', '2018-05-12', '2018-05-13', 'Islam', 'Jl. Pandu Raya No.12,Kel.Arjuna,Kec.Cicendo', 'Jl. Pandu', '12', '04', '09', 'Cikutra', 'Cibeunying Kidal', 'Bandung', 'Jawa Barat', '2026-08-31 21:47:23', '2026-09-02 19:50:00'),
(3, 'REG-2026-08-01', 1, '3308011205980001', 'Suebah', 'bin alaidrus', 'L', '1998-08-07', '2026-01-06', '2026-01-07', 'Kristen', 'Kabupaten Bandung', 'Jl. Pandu No. 12', NULL, NULL, NULL, 'Padjajaran', 'Cicendo', NULL, NULL, '2026-09-01 02:56:40', '2026-09-02 01:36:48'),
(4, 'REG-2026-08-02', 2, '3201010806980005', 'Kartiwa', 'bin Sutisna', 'L', '1965-04-12', '2026-08-30', '2026-08-31', 'Islam', 'Kota Bandung', 'Jl. Asia Afrika No. 10', NULL, NULL, NULL, 'Braga', 'Sumur Bandung', NULL, NULL, '2026-09-01 04:13:57', '2026-09-02 01:37:31');

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
(1, 1, NULL, 'BLK-A1', 'Blok A1 - Melati', NULL, '[{\"lat\":-6.901,\"lng\":107.5916},{\"lat\":-6.901,\"lng\":107.5928},{\"lat\":-6.8985,\"lng\":107.5928},{\"lat\":-6.8985,\"lng\":107.5916}]', 'Kosong (Tersedia)', '2026-08-31 21:18:25', '2026-09-02 00:49:08');

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
(1, 1, 'Musholla Utama', 'Tempat Ibadah', -6.9007500, 107.5925500, '2026-08-31 21:26:12', '2026-09-02 00:56:06');

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
(1, 1, 'MKM-A1-001', 'CB-04/12', 'terisi', 'Terisi (Aktif)', NULL, '2026-08-31 21:24:01', '2026-09-01 03:28:56'),
(2, 1, 'MKM-A1-002', '002', 'terisi', 'Terisi (Aktif)', NULL, '2026-09-01 01:02:50', '2026-09-01 04:24:32'),
(3, 1, 'MKM-A1-003', '003', 'terisi', 'Terisi (Aktif)', NULL, '2026-09-02 01:44:59', '2026-09-02 01:44:59');

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
(23, '2026_09_07_000001_add_nik_to_ahli_waris_table', 8);

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
(40, 'App\\Models\\Uptd', 1, 'api-token', '0e7dd03817044315eecd4d3c853f270a9f1059f94ca84fcf7da86acbd36a6bfa', '[\"*\"]', '2026-09-06 19:39:59', NULL, '2026-09-06 19:39:29', '2026-09-06 19:39:59');

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
('263a8onmrotPk6FYC1mOpfGsqopxgxs2VN0k23JY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1N4aXdjTjE5bWUxazRmSDZkS3VETHVGVktHZVJIYVNuRWpTTVRLZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1788423514),
('3hpLun9G0IuxizY7lqpm2ySJQU3E4om2EL9QdMAa', NULL, '127.0.0.1', 'curl/8.13.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3VLWUljYXU0c3lIOFJZSEl0dDJyWGowVlV5WGlqWFo3Q0dlM3NtSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788423038),
('3ieSnOkn68Pr5v4t5MkpYW3DFYARgyEAlNrc24pa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1Z6ZFJYUG9Cdm1DN3dibElnZ0JvZlRBUUZtWGMyeW44QnhTVFg4QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788418182),
('6zsarzQp93iOtDh3Wg3z2iSLcWIJJVhf7QHWakKi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWZZMzIxSk9SU20wMkV4aUhYNEVCNnYzT2k1c2VQS2U5UGo5clJLZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788418582),
('bI6qPdJV3exscqs63hNsYg9WJSrCOlvMU76bxIy0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmlXbFBvQVdvY2hpamNqeUxuNGdFZkV0VzNnZ2diY2hjZFoxQ2N1YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1788423050),
('cK3yD22IFtBG8B6WOq2QfaiSOB0srEo08XyefFBI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1NDTmtCcnVqMERLUmVZb05udWphRlNGMjQzcWRPZFlQcEg2azFNVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788418181),
('cTS2scWjfN6EhmBiQkqvIckVMBSSwSwdBTNCFmyN', NULL, '127.0.0.1', 'curl/8.13.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekllZjJTUUxmaDc4RTJSb21Yem5GVnVDa0RrU2NZRGQ5ZzhXMldvYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXRhIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1788423038),
('GoMJhOsjGICSWOUVnYPKZzuGP6g1ns5TxVtruarT', NULL, '127.0.0.1', 'curl/8.13.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVRGa2pYbUszZXh1QWFvcHBZUGxaYU5WZHZGV0hDd3JwZ1c3V21reiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788748366),
('GtyZnJz4mV1LlkhgzGTBpGodwmrlrNbm2ALjR0Tz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHBEM3NxdThLZTFtMU5QRXhrb3hiUU5oSk1QMXdEZVNOcVBRNGVSeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788418922),
('ifAiTGRG3uRzgHoYmzIicCnQnHUwmBcov1vXrI7X', NULL, '127.0.0.1', 'curl/8.13.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVFBQzhOZUlTMGhDUDFQdEx6VG1VSmlFSk1ZYjFpdktaZzhDOXpqRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788747438),
('kepeLpAv4ofSq8AEymJfBmGNATkcmWW9mDdJ4oTj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVktEQ2ltazBjN2VCVnpuNEhWbFpGOGlpU09tQ3JJWHBxQm54MHgxNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1788418182),
('n2SUkrAqbtLPH8KiLAYyOFFEckP1EuASnqgF6tCO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS21IUlRzaHo1b21iSFNOSHA3a1NJTzdUSFhvOGdCOFFIZVlXeVFQQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXRhIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1788422451),
('nkn6ClrRERh3Dg2eLd1vrxrUipPO8MP5BG0s8l1Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVZEOUNOQ3Q1b21BTUZoa2UxVzllR3RUUXBqdWV6NlptcWVweXlZSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1788418922),
('nYsPfW8vZ6WiN1rqFoyLeINbztRqWzbjEZbqAWW9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGtBNVkxUkEweFpDTmRlVHpqcjROdkNSb0RBYm9DUjdVeVFKUTFYMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXRhIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1788418183),
('oHWoZCnfXSBUHUBrQwv59ivsBaB4WQJKE4xbl8zF', NULL, '127.0.0.1', 'curl/8.13.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWMxM2g5Nk5RaENiaWlwd0NjZkZMT3NETEhsa3dLSXJjWWRLQ29ycSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788423167),
('s2UoSoa4nfOgqFQUeN1P6bA6UnlviM3bPx2qdDne', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEk1N2dnZjN3ZHk1c3JFREVrektWOHFFOVNuM3N6clJZSW1VRnB5bSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788418922),
('wSi5p4eaPB31O3sQMDhl9OCZfCkILn5Vn9S9pcPL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG1ZaU1nYko4UzFVV0FzclE5bnhDSUJoQTFxUFBWYVQzaHFQRVM0RiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcHAiO3M6NToicm91dGUiO3M6MzoiYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1788748769),
('WvaAuo1coaLXEAOmqeYZ1CkVrT238ap5gpxnnN3b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; id-ID) WindowsPowerShell/5.1.19041.7663', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0Y4NVFocVVCNm1ya2RvbHhnNUNzSHEzMWFzRGk4WFB6TTBYQnJHTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wZXRhIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1788418923);

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
(1, '0000000000', 'superadmin', '$2y$12$npKaLAGBlstY2Cu24Ry1aeo2j6b1hOK8va.M9Un/5HvdxO8Rkj/fe', 'Super Administrator', 'superadmin@sipemakaman.test', NULL, '2026-08-26 23:45:50', '2026-09-01 19:22:39');

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
(1, 1, 'PND', 'TPU Pandu', 'Jl.Pandu', 'Pamoyanan', 'Cicendo', 'Bandung', 'Jawa Barat', 'aktif', -6.8988000, 107.5925000, 17, '2026-08-27 00:50:16', '2026-09-02 00:46:17'),
(2, 1, 'SRG', 'TPU Sirnaraga', 'Jalan Padjajaran', NULL, 'Cicendo', 'Bandung', NULL, 'aktif', -6.8997000, 107.6010000, 17, '2026-09-01 19:39:33', '2026-09-01 19:39:33'),
(3, 1, 'CBR', 'TPU Cibarunay', 'Jl.Sarijadi Raya', 'Sukarasa', 'Sukasari', 'Bandung', 'Jawa Barat', 'aktif', -6.8799212, 107.5731199, 17, '2026-09-01 19:44:14', '2026-09-01 19:44:14');

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
(1, '123456768', 'UPTD I Kota Bandung', 'Jl. Cianjur, Kota Bandung', '0211456789', 'Purwerjo', '$2y$12$KG.xAYSXy9nNFByTalr2kOBJ1Spp5zsZLm5FQOI9ZVONgS4bE4T8S', 'perwerjo@gmail.com', NULL, '2026-08-27 00:24:11', '2026-09-06 19:28:01');

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
-- AUTO_INCREMENT untuk tabel `admin_tpus`
--
ALTER TABLE `admin_tpus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ahli_waris`
--
ALTER TABLE `ahli_waris`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `almarhums`
--
ALTER TABLE `almarhums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `bloks`
--
ALTER TABLE `bloks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `koordinat_makams`
--
ALTER TABLE `koordinat_makams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `makams`
--
ALTER TABLE `makams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `super_admins`
--
ALTER TABLE `super_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tpus`
--
ALTER TABLE `tpus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `uptds`
--
ALTER TABLE `uptds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
