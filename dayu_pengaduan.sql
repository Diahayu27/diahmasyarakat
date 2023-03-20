-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Mar 2023 pada 05.26
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dayu_pengaduan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'asdasdasd'),
(2, 'dsa'),
(3, 'Kejahatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `id` int(11) NOT NULL,
  `nik` int(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(128) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `active` enum('active','suspend') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`id`, `nik`, `nama`, `username`, `password`, `telepon`, `active`) VALUES
(4, 234862, 'Heri', 'herimau', '$2y$10$4q0zV0xIxWTm1dhcVC9gBu46C', '89023482', 'suspend'),
(5, 25823, 'IKA', 'TOON', '$2y$10$qB68JwzkoSn0zyThCejiKuKiF', '3542324323', 'active'),
(6, 234234234, 'caco', 'caco', '$2y$10$ezzQlQOE6fACTYLTzuTiUumqx', '25463454', 'suspend'),
(7, 234728934, 'haris', 'harisbalap', '$2y$10$5XIZ7HTooGgaWxuDKPF8oeC.EDFbApt/3z9.cxLrLL0vIvt.AAiKG', '9023743', 'active'),
(8, 2147483647, 'test 1', 'test1', '$2y$10$HD./OI0cOrRGUJLNoDyhaOSnz.SZrWnqtyqY9LyOayTzwqZxKFKiC', '12312313', 'active'),
(9, 98012332, 'dimas', 'dimas', '$2y$10$00nDxryK9xCBacxXasxoSe1BPpx6.Dcc9IaIf0bqkH3ylC4L9GJdO', '089266123', 'active'),
(10, 112732123, 'anang', 'anang', '$2y$10$RxZLMoSdalpCqbE2ZsIJbu40Xs9Xwew9k6uKII/xbbLsiP3mycrTG', '097857234', 'active'),
(11, 123, 'asd', 'asd', '$2y$10$ID2.2FDv2gAtBCoKPFi7r.MD1bACeyBgM0nyTzDpSARE00M9yi2OG', '123', 'active'),
(12, 82734234, 'ajis', 'ajis', '$2y$10$68QpkjZG6roTFI7xh3XbMOI697mDX1XWhAlAhYFD0B58oKyP5gMJS', '0823479234', 'active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tanggal_pengaduan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `kategori` varchar(128) NOT NULL,
  `subkategori` varchar(128) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('0','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tanggal_pengaduan`, `nik`, `kategori`, `subkategori`, `isi_laporan`, `foto`, `status`) VALUES
(7, '2023-02-14', '234728934', ' 2', '4', 'gyuyut87', 'Adit-PBO.PNG', 'proses'),
(9, '2023-02-08', '234728934', ' 2', '4', 'asdwa312', 'tool_bar1.PNG', 'proses'),
(10, '2023-02-02', '234728934', ' 3', '6', 'adqasd123', 'Silver_Surfer.jpg', 'proses'),
(11, '2023-02-20', '234728934', ' 2', '4', 'asd21312asd', 'SIKEL_SENG_KIWO_NOMER_2.png', 'proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(128) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL,
  `active` enum('active','suspend') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp`, `level`, `active`) VALUES
(11, 'admin', 'admin', '$2y$10$iLX74czhlV53iW5wJ6lcEeUx9LFrzpII4OSa6Gqj001lfwVWbAqIu', '08953459234', 'admin', 'active'),
(12, 'haris', 'haris', '$2y$10$R8ymOYyLlaFHY3HoB3xaJuiaQRhGMTaSs7HO6vNIBE5wxldQ66fGa', '09832341', 'petugas', 'active'),
(13, 'nanik', 'nanik', '$2y$10$iH8KGZ3tnONEpxoUQWkPQODYLK3dYOVT6/PLhJ8Rm1v7T6uC7X2Jq', '082934212', 'petugas', 'suspend'),
(14, 'mahesa', 'mahesa', '$2y$10$1mHastw1pEKL2e0T3llaa.TkVcyyQhuuApJaA7aMJcuXJw18OaBMK', '0298347234', 'petugas', 'suspend');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkategori`
--

CREATE TABLE `subkategori` (
  `id_subkategori` int(128) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `sub_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `subkategori`
--

INSERT INTO `subkategori` (`id_subkategori`, `id_kategori`, `sub_kategori`) VALUES
(1, 1, 'asdasdads'),
(2, 1, 'asdasd'),
(3, 2, 'dsasdasdasdasd'),
(4, 2, '213123213'),
(5, 3, 'Jambret'),
(6, 3, 'Maling asd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `tanggapan`, `id_petugas`) VALUES
(14, 7, '2023-02-20', 'kasian dek', 11),
(15, 9, '2023-02-20', 'aisodjoiwwoasd', 11),
(16, 11, '2023-02-21', 'asd2w13sdfsd', 11),
(17, 10, '2023-02-21', 'd213as123', 14),
(18, 10, '2023-02-21', 'sdfsdfse', 11);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `subkategori`
--
ALTER TABLE `subkategori`
  ADD PRIMARY KEY (`id_subkategori`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `subkategori`
--
ALTER TABLE `subkategori`
  MODIFY `id_subkategori` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
