-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2020 at 11:50 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pengiriman`
--

-- --------------------------------------------------------

--
-- Table structure for table `pj_akses`
--

CREATE TABLE IF NOT EXISTS `pj_akses` (
`id_akses` tinyint(1) unsigned NOT NULL,
  `label` varchar(10) NOT NULL,
  `level_akses` varchar(15) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_akses`
--

INSERT INTO `pj_akses` (`id_akses`, `label`, `level_akses`) VALUES
(1, 'admin', 'Administrator'),
(2, 'kasir', 'Staff Kasir'),
(3, 'inventory', 'Staff Inventory'),
(4, 'keuangan', 'Staff Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `pj_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `pj_ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_ci_sessions`
--

INSERT INTO `pj_ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('3ea008064fc56fbeafb2339742ce84125647740c', '::1', 1599123684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393132333638343b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('f13d60be47f3f0359170d8f359197264e8596a07', '::1', 1599124502, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393132343530323b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('33b92f409b004b026e5a5a26554463fd0010d5d4', '::1', 1599125043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393132353034333b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('62a5188d1e17dbf11d30621e81c909e358d95a81', '::1', 1599125377, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393132353337373b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b),
('7227a4b33c5c69dad42138d81a4fcbfbed88df77', '::1', 1599125918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539393132353931383b61705f69645f757365727c733a313a2231223b61705f70617373776f72647c733a34303a2264303333653232616533343861656235363630666332313430616563333538353063346461393937223b61705f6e616d617c733a31303a2242616e672041646d696e223b61705f6c6576656c7c733a353a2261646d696e223b61705f6c6576656c5f63617074696f6e7c733a31333a2241646d696e6973747261746f72223b);

-- --------------------------------------------------------

--
-- Table structure for table `pj_data`
--

CREATE TABLE IF NOT EXISTS `pj_data` (
`id_data` int(1) unsigned NOT NULL,
  `kode_kirim` varchar(40) NOT NULL,
  `nama_barang` varchar(40) NOT NULL,
  `total_stok` mediumint(1) unsigned NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `id_jenis_kiriman` mediumint(1) unsigned NOT NULL,
  `id_ekspedisi_awal` mediumint(1) unsigned DEFAULT NULL,
  `keterangan` text NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_data`
--

INSERT INTO `pj_data` (`id_data`, `kode_kirim`, `nama_barang`, `total_stok`, `harga`, `id_jenis_kiriman`, `id_ekspedisi_awal`, `keterangan`, `dihapus`) VALUES
(1, '0001', 'SOTO AYAM', 72, '10000', 1, 1, '', 'ya'),
(2, '0002', 'SOTO PISAH', 32, '13000', 1, 1, '', 'ya'),
(3, '0003', 'ES TEH', 2, '3000', 2, 1, '', 'ya'),
(4, '0004', 'ES JERUK', 9, '7000', 2, 2, '', 'ya'),
(5, '0005', 'SATE AYAM', 57, '4000', 3, 1, '', 'ya'),
(6, '3453453', 'SATE KERANG', 45, '4000', 3, 6, '', 'ya'),
(7, '9982429', 'SATE TELUR PUYUH', 67, '4000', 3, 3, '', 'ya'),
(21, '01234', 'belut goreng', 20, '5000', 4, 5, '', 'ya'),
(22, '0008', 'SOTO AYAM', 11, '10000', 1, 2, '', 'ya'),
(23, '0001', 'soto ayam', 11, '10000', 4, NULL, '', 'ya'),
(24, '0008', 'soto ayam', 11, '10000', 4, 2, '', 'ya'),
(25, '0006', 'soto ayam', 11, '11000', 3, 2, '', 'ya'),
(26, '0007', 'paru goreng', 10, '5000', 4, 3, '', 'ya'),
(27, '0008', 'krupuk bangka', 5, '7000', 4, 5, '', 'ya'),
(28, '00123', 'amplop', 22, '1000', 4, 2, '', 'tidak'),
(29, '1111', 'amplop', 11, '11111', 3, 1, '', 'tidak'),
(30, '123', 'barang', 22, '1111', 4, 2, '', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_data_akhir`
--

CREATE TABLE IF NOT EXISTS `pj_data_akhir` (
  `id_data_akhir` tinyint(1) NOT NULL,
  `id_droppoint` tinyint(1) NOT NULL,
  `jenis_kiriman` varchar(40) NOT NULL,
  `kode_kirim` varchar(40) NOT NULL,
  `ekspedisi_awal` varchar(40) NOT NULL,
  `resi_supplier` varchar(40) NOT NULL,
  `invoice_awal` varchar(40) NOT NULL,
  `status_barang` varchar(40) NOT NULL,
  `invoice_akhir` varchar(40) NOT NULL,
  `ekspedisi_akhir` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pj_data_awal`
--

CREATE TABLE IF NOT EXISTS `pj_data_awal` (
`id_data_awal` tinyint(1) NOT NULL,
  `jenis_kiriman` varchar(40) NOT NULL,
  `kode_kirim` varchar(40) NOT NULL,
  `ekspedisi_awal` varchar(40) NOT NULL,
  `resi_supplier` varchar(40) NOT NULL,
  `invoice_awal` varchar(40) NOT NULL,
  `kode_unik` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL,
  `status_barang` varchar(40) NOT NULL,
  `invoice_akhir` varchar(40) NOT NULL,
  `ekspedisi_akhir` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_data_awal`
--

INSERT INTO `pj_data_awal` (`id_data_awal`, `jenis_kiriman`, `kode_kirim`, `ekspedisi_awal`, `resi_supplier`, `invoice_awal`, `kode_unik`, `tanggal`, `dihapus`, `status_barang`, `invoice_akhir`, `ekspedisi_akhir`) VALUES
(1, 'Barang', '002', 'JNE', '008120', 'XWWWEE3321', '15990372721', '2020-09-02 16:01:12', 'ya', '', '', ''),
(2, 'Amplop', '002', 'Sicepat', '008120', 'XWWWEE3321', '15990372871', '2020-09-02 16:01:27', 'tidak', '', '', ''),
(3, 'Amplop', '0032', 'JNE', '008120', 'XWWWEE3321', '15990373031', '2020-09-02 16:01:43', 'tidak', '', '', ''),
(4, 'Barang', '003', 'JNE', '008120', 'XWWWEE3321', '15990392421', '2020-09-02 16:34:02', 'tidak', '', '', ''),
(5, 'Barang', '0022', 'JNE', '0081222111', 'XWWWEE33214221', '15990967931', '2020-09-03 08:33:13', 'ya', '', '', ''),
(6, 'Barang', '002', 'GO Send', '0081222', 'XWWWEE3321', '15990968091', '2020-09-03 08:33:29', 'ya', '', '', ''),
(7, 'Amplop', '1233456', 'JNE', '00812022222', 'XWWWEE332111111111', '15991046871', '2020-09-03 10:44:47', 'tidak', '', '', ''),
(8, 'Barang', '002', 'JNE', '008120', 'XWWWEE3321', '15990372721', '2020-09-02 16:01:12', 'ya', '', '', ''),
(9, 'Amplop', '002', 'Sicepat', '008120', 'XWWWEE3321', '15990372871', '2020-09-02 16:01:27', 'tidak', '', '', ''),
(10, 'Amplop', '0032', 'JNE', '008120', 'XWWWEE3321', '15990373031', '2020-09-02 16:01:43', 'tidak', '', '', ''),
(11, 'Barang', '003', 'JNE', '008120', 'XWWWEE3321', '15990392421', '2020-09-02 16:34:02', 'tidak', '', '', ''),
(12, 'Barang', '0022', 'JNE', '0081222111', 'XWWWEE33214221', '15990967931', '2020-09-03 08:33:13', 'ya', '', '', ''),
(13, 'Barang', '002', 'GO Send', '0081222', 'XWWWEE3321', '15990968091', '2020-09-03 08:33:29', 'ya', '', '', ''),
(14, 'Amplop', '1233456', 'JNE', '00812022222', 'XWWWEE332111111111', '15991046871', '2020-09-03 10:44:47', 'tidak', '', '', ''),
(15, 'Barang', '002', 'JNE', '008120', 'XWWWEE3321', '15990372721', '2020-09-02 16:01:12', 'ya', '', '', ''),
(16, 'Amplop', '002', 'Sicepat', '008120', 'XWWWEE3321', '15990372871', '2020-09-02 16:01:27', 'tidak', '', '', ''),
(17, 'Amplop', '0032', 'JNE', '008120', 'XWWWEE3321', '15990373031', '2020-09-02 16:01:43', 'tidak', '', '', ''),
(18, 'Barang', '003', 'JNE', '008120', 'XWWWEE3321', '15990392421', '2020-09-02 16:34:02', 'tidak', '', '', ''),
(19, 'Barang', '0022', 'JNE', '0081222111', 'XWWWEE33214221', '15990967931', '2020-09-03 08:33:13', 'ya', '', '', ''),
(20, 'Barang', '002', 'GO Send', '0081222', 'XWWWEE3321', '15990968091', '2020-09-03 08:33:29', 'ya', '', '', ''),
(21, 'Amplop', '1233456', 'JNE', '00812022222', 'XWWWEE332111111111', '15991046871', '2020-09-03 10:44:47', 'tidak', '', '', ''),
(22, 'Barang', '002', 'JNE', '008120', 'XWWWEE3321', '15990372721', '2020-09-02 16:01:12', 'ya', '', '', ''),
(23, 'Amplop', '002', 'Sicepat', '008120', 'XWWWEE3321', '15990372871', '2020-09-02 16:01:27', 'tidak', '', '', ''),
(24, 'Amplop', '0032', 'JNE', '008120', 'XWWWEE3321', '15990373031', '2020-09-02 16:01:43', 'tidak', '', '', ''),
(25, 'Barang', '003', 'JNE', '008120', 'XWWWEE3321', '15990392421', '2020-09-02 16:34:02', 'tidak', '', '', ''),
(26, 'Barang', '0022', 'JNE', '0081222111', 'XWWWEE33214221', '15990967931', '2020-09-03 08:33:13', 'ya', '', '', ''),
(27, 'Barang', '002', 'GO Send', '0081222', 'XWWWEE3321', '15990968091', '2020-09-03 08:33:29', 'ya', '', '', ''),
(28, 'Amplop', '1233456', 'JNE', '00812022222', 'XWWWEE332111111111', '15991046871', '2020-09-03 10:44:47', 'tidak', '', '', ''),
(29, 'Barang', '002', 'JNE', '008120', 'XWWWEE3321', '15990372721', '2020-09-02 16:01:12', 'ya', '', '', ''),
(30, 'Amplop', '002', 'Sicepat', '008120', 'XWWWEE3321', '15990372871', '2020-09-02 16:01:27', 'tidak', '', '', ''),
(31, 'Amplop', '0032', 'JNE', '008120', 'XWWWEE3321', '15990373031', '2020-09-02 16:01:43', 'tidak', '', '', ''),
(32, 'Barang', '003', 'JNE', '008120', 'XWWWEE3321', '15990392421', '2020-09-02 16:34:02', 'tidak', '', '', ''),
(33, 'Barang', '0022', 'JNE', '0081222111', 'XWWWEE33214221', '15990967931', '2020-09-03 08:33:13', 'ya', '', '', ''),
(34, 'Barang', '002', 'GO Send', '0081222', 'XWWWEE3321', '15990968091', '2020-09-03 08:33:29', 'ya', '', '', ''),
(35, 'Amplop', '1233456', 'JNE', '00812022222', 'XWWWEE332111111111', '15991046871', '2020-09-03 10:44:47', 'tidak', '', '', ''),
(36, 'Barang', '002', 'JNE', '008120', 'XWWWEE3321', '15990372721', '2020-09-02 16:01:12', 'ya', '', '', ''),
(37, 'Amplop', '002', 'Sicepat', '008120', 'XWWWEE3321', '15990372871', '2020-09-02 16:01:27', 'tidak', '', '', ''),
(38, 'Amplop', '0032', 'JNE', '008120', 'XWWWEE3321', '15990373031', '2020-09-02 16:01:43', 'tidak', '', '', ''),
(39, 'Barang', '003', 'JNE', '008120', 'XWWWEE3321', '15990392421', '2020-09-02 16:34:02', 'tidak', '', '', ''),
(40, 'Barang', '0022', 'JNE', '0081222111', 'XWWWEE33214221', '15990967931', '2020-09-03 08:33:13', 'ya', '', '', ''),
(41, 'Barang', '002', 'GO Send', '0081222', 'XWWWEE3321', '15990968091', '2020-09-03 08:33:29', 'ya', '', '', ''),
(42, 'Amplop', '1233456', 'JNE', '00812022222', 'XWWWEE332111111111', '15991046871', '2020-09-03 10:44:47', 'tidak', '', '', ''),
(43, 'Amplop', '00212', 'GO Send', '00812022222', 'XWWWEE3321', '15991220921', '2020-09-03 15:34:52', 'tidak', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pj_droppoint`
--

CREATE TABLE IF NOT EXISTS `pj_droppoint` (
  `id_droppoint` tinyint(1) NOT NULL,
  `id_data_awal` tinyint(1) NOT NULL,
  `jenis_kiriman` int(11) NOT NULL,
  `kode_kirim` int(11) NOT NULL,
  `ekspedisi_awal` int(11) NOT NULL,
  `resi_supplier` int(11) NOT NULL,
  `invoice_awal` int(11) NOT NULL,
  `status_barang` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pj_ekspedisi_akhir`
--

CREATE TABLE IF NOT EXISTS `pj_ekspedisi_akhir` (
  `id_ekspedisi_akhir` mediumint(1) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pj_ekspedisi_awal`
--

CREATE TABLE IF NOT EXISTS `pj_ekspedisi_awal` (
`id_ekspedisi_awal` mediumint(1) unsigned NOT NULL,
  `ekspedisi` varchar(20) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_ekspedisi_awal`
--

INSERT INTO `pj_ekspedisi_awal` (`id_ekspedisi_awal`, `ekspedisi`, `dihapus`) VALUES
(1, 'JNE', 'tidak'),
(2, 'JNT', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_jenis_kiriman`
--

CREATE TABLE IF NOT EXISTS `pj_jenis_kiriman` (
`id_jenis_kiriman` mediumint(1) unsigned NOT NULL,
  `nama` varchar(20) NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_jenis_kiriman`
--

INSERT INTO `pj_jenis_kiriman` (`id_jenis_kiriman`, `nama`, `dihapus`) VALUES
(1, 'JNE', 'tidak'),
(2, 'JNT', 'tidak'),
(3, 'JNE CASHLESS', 'tidak'),
(4, 'SICEPAT', 'tidak'),
(5, 'GO SEND', 'tidak'),
(9, 'makanan', 'ya');

-- --------------------------------------------------------

--
-- Table structure for table `pj_pelanggan`
--

CREATE TABLE IF NOT EXISTS `pj_pelanggan` (
`id_pelanggan` mediumint(1) unsigned NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` text,
  `telp` varchar(40) DEFAULT NULL,
  `kode_unik` varchar(10) NOT NULL,
  `info_tambahan` text,
  `waktu_input` datetime NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_pelanggan`
--

INSERT INTO `pj_pelanggan` (`id_pelanggan`, `nama`, `alamat`, `telp`, `kode_unik`, `info_tambahan`, `waktu_input`, `dihapus`) VALUES
(30, 'rappen', 'Jalan Gajah Mada, KM. 7 Dukuhrejo, Bayan\r\nJalan Gajah Mada', '082223127246', '1565054918', '', '2019-08-06 08:28:38', 'tidak'),
(29, 'olip', 'Jalan Argorejo No 1, Argopeni\r\nJalan Argorejo', '082223127246', '1565054883', '', '2019-08-06 08:28:03', 'tidak'),
(28, 'Nanang Prambudi', 'Street', '0812631273123', '1565054869', '', '2019-08-06 08:27:49', 'tidak'),
(27, 'Budi Santoso', 'jl. p. diponegoro 30 kutoarjo', '085643899601', '1565021387', '', '2019-08-05 23:09:47', 'tidak'),
(26, 'Budi Santoso', 'Street', '0812631273123', '1565021290', 'sss', '2019-08-05 23:08:10', 'ya');

-- --------------------------------------------------------

--
-- Table structure for table `pj_pengeluaran`
--

CREATE TABLE IF NOT EXISTS `pj_pengeluaran` (
`id_pengeluaran` mediumint(1) unsigned NOT NULL,
  `nama` varchar(40) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `info_tambahan` text,
  `kode_unik` varchar(30) NOT NULL,
  `tanggal` datetime NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_pengeluaran`
--

INSERT INTO `pj_pengeluaran` (`id_pengeluaran`, `nama`, `total`, `info_tambahan`, `kode_unik`, `tanggal`, `dihapus`) VALUES
(1, 'pln', '10000', 'Testtt', '111', '2016-05-07 22:44:25', 'ya'),
(2, 'pdam', '20000', 'nanang elek', '112', '2016-05-07 22:44:49', 'ya'),
(3, 'wifi', '30000', '', '113', '2016-05-23 16:31:47', 'ya'),
(4, 'budi', '40000', 'Testing', '114', '2016-05-23 16:33:00', 'ya'),
(5, '', '50000', '', '115', '2016-05-23 16:36:45', 'tidak'),
(6, '', '0', 'Test', '116', '2016-05-24 20:54:58', 'ya'),
(7, '', '10000', '', '117', '2016-05-24 21:24:54', 'tidak'),
(23, '', '50000', '', '15633524081', '2019-07-17 15:33:28', 'tidak'),
(24, 'wifi', '50000', 'token', '15633674471', '2019-07-17 19:44:07', 'tidak'),
(25, 'pdam', '100000', 'yu', '15990284951', '2020-09-02 13:34:55', 'tidak'),
(26, 'pln', '10000', '', '15990293401', '2020-09-02 13:49:00', 'ya'),
(27, 'ssssssoo', '11111111', 'sss', '15990371931', '2020-09-02 15:59:53', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `pj_penjualan_detail`
--

CREATE TABLE IF NOT EXISTS `pj_penjualan_detail` (
`id_penjualan_d` int(1) unsigned NOT NULL,
  `id_penjualan_m` int(1) unsigned NOT NULL,
  `id_barang` int(1) NOT NULL,
  `jumlah_beli` smallint(1) unsigned NOT NULL,
  `harga_satuan` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_penjualan_detail`
--

INSERT INTO `pj_penjualan_detail` (`id_penjualan_d`, `id_penjualan_m`, `id_barang`, `jumlah_beli`, `harga_satuan`, `total`) VALUES
(54, 42, 1, 4, '10000', '40000'),
(55, 42, 3, 1, '3000', '3000'),
(56, 43, 1, 5, '10000', '50000'),
(58, 44, 1, 2, '10000', '20000'),
(57, 43, 3, 5, '3000', '15000'),
(61, 47, 2, 1, '13000', '13000'),
(62, 48, 3, 1, '3000', '3000'),
(59, 45, 1, 1, '10000', '10000'),
(63, 49, 1, 1, '10000', '10000'),
(64, 49, 21, 1, '5000', '5000'),
(65, 50, 1, 3, '10000', '30000'),
(66, 50, 5, 1, '4000', '4000'),
(67, 51, 1, 1, '10000', '10000'),
(68, 51, 5, 1, '4000', '4000');

-- --------------------------------------------------------

--
-- Table structure for table `pj_penjualan_master`
--

CREATE TABLE IF NOT EXISTS `pj_penjualan_master` (
`id_penjualan_m` int(1) unsigned NOT NULL,
  `nomor_nota` varchar(40) NOT NULL,
  `tanggal` datetime NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  `bayar` decimal(10,0) NOT NULL,
  `keterangan_lain` text,
  `id_pelanggan` mediumint(1) unsigned DEFAULT NULL,
  `id_user` mediumint(1) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_penjualan_master`
--

INSERT INTO `pj_penjualan_master` (`id_penjualan_m`, `nomor_nota`, `tanggal`, `grand_total`, `bayar`, `keterangan_lain`, `id_pelanggan`, `id_user`) VALUES
(42, '5D29818709E161', '2019-07-13 00:00:00', '43000', '50000', '', NULL, 1),
(43, '5D2BF7E2C20A32', '2019-07-15 00:00:00', '65000', '70000', '', NULL, 2),
(44, '5D2BF818DEC862', '2019-07-15 00:00:00', '20000', '20000', '', NULL, 2),
(45, '5D2DE24E6A0B41', '2019-07-16 00:00:00', '10000', '20000', '', NULL, 1),
(48, '5D2DF6FDF21901', '2019-07-16 00:00:00', '3000', '5000', '', NULL, 1),
(47, '5D2DE453CF58C1', '2019-07-16 00:00:00', '13000', '20000', '', NULL, 1),
(49, '5D47034EEEE0B1', '2019-08-04 00:00:00', '15000', '20000', '', NULL, 1),
(50, '5D47077A12B9D1', '2019-08-04 00:00:00', '34000', '50000', '', NULL, 1),
(51, '5D63E5B5429922', '2019-08-26 00:00:00', '14000', '20000', '', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pj_user`
--

CREATE TABLE IF NOT EXISTS `pj_user` (
`id_user` mediumint(1) unsigned NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_akses` tinyint(1) unsigned NOT NULL,
  `status` enum('Aktif','Non Aktif') NOT NULL,
  `dihapus` enum('tidak','ya') NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pj_user`
--

INSERT INTO `pj_user` (`id_user`, `username`, `password`, `nama`, `id_akses`, `status`, `dihapus`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Bang Admin', 1, 'Aktif', 'tidak'),
(2, 'CS', '1532c9f94d5ce1e0113a85a371679d44e0b5bab1', 'CS1', 2, 'Aktif', 'tidak'),
(3, 'CS2', '08dfc5f04f9704943a423ea5732b98d3567cbd49', 'CS2', 2, 'Aktif', 'tidak'),
(4, 'jaka', '2ec22095503fe843326e7c19dd2ab98716b63e4d', 'Jaka Sembung', 3, 'Aktif', 'ya'),
(5, 'jaka', '2ec22095503fe843326e7c19dd2ab98716b63e4d', 'Jaka Sembung', 3, 'Aktif', 'ya'),
(6, 'joko', '97c358728f7f947c9a279ba9be88308395c7cc3a', 'Joko Haji', 4, 'Aktif', 'tidak'),
(7, 'amir', '1dd89e5367785ba89076cd264daac0464fdf0d7b', 'amir', 3, 'Aktif', 'ya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pj_akses`
--
ALTER TABLE `pj_akses`
 ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `pj_ci_sessions`
--
ALTER TABLE `pj_ci_sessions`
 ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `pj_data`
--
ALTER TABLE `pj_data`
 ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `pj_data_awal`
--
ALTER TABLE `pj_data_awal`
 ADD PRIMARY KEY (`id_data_awal`);

--
-- Indexes for table `pj_droppoint`
--
ALTER TABLE `pj_droppoint`
 ADD PRIMARY KEY (`id_droppoint`), ADD KEY `id_data_awal` (`id_data_awal`);

--
-- Indexes for table `pj_ekspedisi_awal`
--
ALTER TABLE `pj_ekspedisi_awal`
 ADD PRIMARY KEY (`id_ekspedisi_awal`);

--
-- Indexes for table `pj_jenis_kiriman`
--
ALTER TABLE `pj_jenis_kiriman`
 ADD PRIMARY KEY (`id_jenis_kiriman`);

--
-- Indexes for table `pj_pelanggan`
--
ALTER TABLE `pj_pelanggan`
 ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pj_pengeluaran`
--
ALTER TABLE `pj_pengeluaran`
 ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `pj_penjualan_detail`
--
ALTER TABLE `pj_penjualan_detail`
 ADD PRIMARY KEY (`id_penjualan_d`);

--
-- Indexes for table `pj_penjualan_master`
--
ALTER TABLE `pj_penjualan_master`
 ADD PRIMARY KEY (`id_penjualan_m`);

--
-- Indexes for table `pj_user`
--
ALTER TABLE `pj_user`
 ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pj_akses`
--
ALTER TABLE `pj_akses`
MODIFY `id_akses` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pj_data`
--
ALTER TABLE `pj_data`
MODIFY `id_data` int(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `pj_data_awal`
--
ALTER TABLE `pj_data_awal`
MODIFY `id_data_awal` tinyint(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `pj_ekspedisi_awal`
--
ALTER TABLE `pj_ekspedisi_awal`
MODIFY `id_ekspedisi_awal` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `pj_jenis_kiriman`
--
ALTER TABLE `pj_jenis_kiriman`
MODIFY `id_jenis_kiriman` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pj_pelanggan`
--
ALTER TABLE `pj_pelanggan`
MODIFY `id_pelanggan` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `pj_pengeluaran`
--
ALTER TABLE `pj_pengeluaran`
MODIFY `id_pengeluaran` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `pj_penjualan_detail`
--
ALTER TABLE `pj_penjualan_detail`
MODIFY `id_penjualan_d` int(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `pj_penjualan_master`
--
ALTER TABLE `pj_penjualan_master`
MODIFY `id_penjualan_m` int(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `pj_user`
--
ALTER TABLE `pj_user`
MODIFY `id_user` mediumint(1) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
