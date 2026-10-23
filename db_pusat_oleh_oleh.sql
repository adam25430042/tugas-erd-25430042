-- Database: db_pusat_oleh_oleh
-- Nama : Adam Maulana Firmansyah | NPM : 25430042

CREATE DATABASE IF NOT EXISTS db_pusat_oleh_oleh
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE db_pusat_oleh_oleh;

-- Tabel 1: Master Subjek
CREATE TABLE wisatawan (
  id_wisatawan     INT NOT NULL AUTO_INCREMENT,
  nama_wisatawan   VARCHAR(100) NOT NULL,
  no_hp_wisatawan  VARCHAR(15)  NOT NULL,
  email_wisatawan  VARCHAR(100) DEFAULT NULL,
  asal_wisatawan   VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id_wisatawan)
) ENGINE=InnoDB;

-- Tabel 2: Master Objek
CREATE TABLE produk (
  id_produk        INT NOT NULL AUTO_INCREMENT,
  nama_produk      VARCHAR(100)  NOT NULL,
  kategori_produk  VARCHAR(50)   NOT NULL,
  harga_produk     DECIMAL(10,2) NOT NULL,
  stok_produk      INT           NOT NULL,
  PRIMARY KEY (id_produk)
) ENGINE=InnoDB;

-- Tabel 3: Master Aktor
CREATE TABLE kasir (
  id_kasir     INT NOT NULL AUTO_INCREMENT,
  nama_kasir   VARCHAR(100) NOT NULL,
  no_hp_kasir  VARCHAR(15)  NOT NULL,
  shift_kasir  VARCHAR(20)  NOT NULL,
  PRIMARY KEY (id_kasir)
) ENGINE=InnoDB;

-- Tabel 4: Transaksi
CREATE TABLE pembelian (
  id_pembelian             INT NOT NULL AUTO_INCREMENT,
  id_wisatawan_pembelian   INT NOT NULL,
  id_produk_pembelian      INT NOT NULL,
  id_kasir_pembelian       INT NOT NULL,
  tanggal_pembelian        DATE NOT NULL,
  jumlah_pembelian         INT NOT NULL,
  total_bayar_pembelian    DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_pembelian),
  CONSTRAINT fk_pembelian_wisatawan FOREIGN KEY (id_wisatawan_pembelian)
    REFERENCES wisatawan (id_wisatawan) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_pembelian_produk FOREIGN KEY (id_produk_pembelian)
    REFERENCES produk (id_produk) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_pembelian_kasir FOREIGN KEY (id_kasir_pembelian)
    REFERENCES kasir (id_kasir) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Data contoh (opsional, boleh dihapus)
INSERT INTO wisatawan (nama_wisatawan, no_hp_wisatawan, email_wisatawan, asal_wisatawan) VALUES
('Budi Santoso', '081234567890', 'budi@example.com', 'Jakarta'),
('Siti Rahma',   '082345678901', 'siti@example.com', 'Bandung');

INSERT INTO produk (nama_produk, kategori_produk, harga_produk, stok_produk) VALUES
('Keripik Pisang', 'Makanan', 20000.00, 100),
('Kain Tapis',     'Kerajinan', 150000.00, 25);

INSERT INTO kasir (nama_kasir, no_hp_kasir, shift_kasir) VALUES
('Rina Wulandari', '083456789012', 'Pagi'),
('Andi Pratama',   '084567890123', 'Siang');

INSERT INTO pembelian (id_wisatawan_pembelian, id_produk_pembelian, id_kasir_pembelian, tanggal_pembelian, jumlah_pembelian, total_bayar_pembelian) VALUES
(1, 1, 1, '2026-10-23', 3, 60000.00),
(2, 2, 2, '2026-10-23', 1, 150000.00);
