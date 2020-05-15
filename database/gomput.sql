-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Bulan Mei 2020 pada 05.05
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gomput`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `pesanan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `produk_id`, `qty`, `pesanan_id`) VALUES
(1, 1, 20, 2),
(2, 2, 20, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `info_pembayaran`
--

CREATE TABLE `info_pembayaran` (
  `id` int(11) NOT NULL,
  `info` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `info_pembayaran`
--

INSERT INTO `info_pembayaran` (`id`, `info`) VALUES
(1, 'Transaksi pembayaran bisa di bayar DP 50% dulu sebelum hari H.\r\njika tidak maka transaksi akan di batalkan .\r\n\r\nPembayaran Transaksi Bisa Melalui Rekening Di Bawah Ini\r\nBRI => 660192839102938 a/n Alwan Hafidzin F\r\n\r\nkemudian konfirmasi pembayaran bisa di menu pembayaran');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`, `deskripsi`) VALUES
(1, 'Paket', ''),
(2, 'Sambal', ''),
(3, 'Minuman', ''),
(4, 'Lainnya', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE `kontak` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id`, `nama`, `ongkir`) VALUES
(3, 'Mojokerto', 5000),
(4, 'Malang', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id_pengeluaran` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `Tanggal_pengeluaran` date NOT NULL,
  `harga` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id_pengeluaran`, `nama_barang`, `Tanggal_pengeluaran`, `harga`, `jumlah`, `total`) VALUES
(1, 'Beras', '2020-05-13', '70000', 4, 280000),
(3, 'Ayam', '2020-05-13', '25000', 4, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `status` enum('pending','verified','','') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_pesanan`, `id_user`, `file`, `total`, `status`, `keterangan`, `created_at`) VALUES
(2, 2, 15, '49eb6a44db57cba8d66b3404fa9f0ad4hot_tea.png', 525000, 'verified', 'tes', '2020-05-14 13:26:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(5) NOT NULL,
  `tanggal_pesan` datetime NOT NULL,
  `tanggal_digunakan` datetime NOT NULL,
  `user_id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `read` enum('0','1') NOT NULL,
  `status` enum('lunas','belum lunas','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal_pesan`, `tanggal_digunakan`, `user_id`, `nama`, `alamat`, `kota`, `ongkir`, `telephone`, `read`, `status`) VALUES
(2, '2020-05-14 08:26:09', '2020-05-20 15:30:00', 15, 'Alwan 2', 'Mojokerto', 'Mojokerto', 5000, '0895396143699', '1', 'lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `kategori_produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `deskripsi`, `gambar`, `harga`, `kategori_produk_id`) VALUES
(1, 'Paket 1', '1 Ayam Goreng + 1 Tahu/Tempe + Nasi + Packaging', '49eb6a44db57cba8d66b3404fa9f0ad4p1.jpg', '12500', 1),
(2, 'Paket 2', '1 Ayam Krispi + 1 Tahu/Tempe + Nasi + Packaging', '49eb6a44db57cba8d66b3404fa9f0ad4p2.jpg', '13500', 1),
(3, 'Paket 3', '1 Ayam Bakar + 1 Tahu/Tempe + Nasi + Packaging', '49eb6a44db57cba8d66b3404fa9f0ad4p3.jpg', '14000', 1),
(4, 'Paket 4', '1 Fire Chicken + Nasi + Packing', '49eb6a44db57cba8d66b3404fa9f0ad449eb6a44db57cba8d66b3404fa9f0ad4WhatsApp Image 2017-11-28 at 23.08.57.jpeg', '15000', 1),
(5, 'Paket 5', '1 Ayam Goreng + 1 Ayam Krispi + 1 Tahu/Tempe + Nasi + Packaging', '49eb6a44db57cba8d66b3404fa9f0ad449eb6a44db57cba8d66b3404fa9f0ad4WhatsApp Image 2017-11-28 at 23.18.47 (1).jpeg', '21000', 1),
(6, 'Sambal Teri', 'Sambal Teri Maknyuss', '49eb6a44db57cba8d66b3404fa9f0ad4sambal_teri.png', '2000', 2),
(7, 'Sambal Merah', 'Sambal Merah', '49eb6a44db57cba8d66b3404fa9f0ad4sambal_merah.png', '2000', 2),
(8, 'Sambal Ijo', 'Sambal Ijo', '49eb6a44db57cba8d66b3404fa9f0ad4sambal_ijo.png', '2000', 2),
(9, 'Sambal Bawang', 'Sambal Bawang+Nasi', '49eb6a44db57cba8d66b3404fa9f0ad4sambal_bawang.png', '2000', 2),
(10, 'Air Mineral 600ml', 'Aqua Suwegerr', '49eb6a44db57cba8d66b3404fa9f0ad4mineral.png', '4000', 3),
(12, 'Ice Tea', 'Ice Tea terbuat dari teh asli', '49eb6a44db57cba8d66b3404fa9f0ad4ice_tea.png', '5000', 3),
(13, 'Milo (Cold)', 'Es Milo Dingin ', '49eb6a44db57cba8d66b3404fa9f0ad4es_milo.png', '10000', 3),
(15, 'Nasi', 'Nasi warnanya putih', '49eb6a44db57cba8d66b3404fa9f0ad4nasi.png', '5000', 4),
(16, 'Tumis Kangkung', 'Kangkung yang diolah sehingga jadi tumis kangkung', '49eb6a44db57cba8d66b3404fa9f0ad4tumis kangkung.png', '8000', 4),
(17, 'Telur Dadar', 'Telur ayam asli,bukan ayam tiren', '49eb6a44db57cba8d66b3404fa9f0ad4telur dadar.png', '4000', 4),
(18, 'Jamur Crispy', 'Jamur rasanya crispy ', '49eb6a44db57cba8d66b3404fa9f0ad4jamur.png', '9000', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('user','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `telephone`, `alamat`, `password`, `status`) VALUES
(2, 'Alwan Hafidzin Firdaus', 'alwanhafidzin@gmail.com', '0895396143699', 'Mojokerto', 'd84580c2c6f8b058485dd876008f258f', 'admin'),
(7, 'vira', 'vira@gmail.com', '089617271499', 'Malang', 'e10adc3949ba59abbe56e057f20f883e', 'admin'),
(10, 'Alwan Hafidzin Firdaus', 'alwan@gmail.com', '0895396143699', 'Malang', '03576a1d034208f2a2631e9fd08798e3', 'user'),
(15, 'Alwan 2', 'alwan2@gmail.com', '0895396143699', 'Mojokerto', 'd84580c2c6f8b058485dd876008f258f', 'user'),
(16, 'Sulton Nastain', 'sulton123@gmail.com', '085476543215', 'Kediri', '25d55ad283aa400af464c76d713c07ad', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`,`produk_id`,`pesanan_id`),
  ADD KEY `pesanan_id` (`pesanan_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `info_pembayaran`
--
ALTER TABLE `info_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`,`kategori_produk_id`),
  ADD KEY `kategori_produk_id` (`kategori_produk_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `info_pembayaran`
--
ALTER TABLE `info_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pesanan_ibfk_3` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
