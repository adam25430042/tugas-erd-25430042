-- Database: db_pemandian_air_panas
-- Nama : Adam Maulana Firmansyah | NPM : 25430042

CREATE DATABASE IF NOT EXISTS db_pemandian_air_panas
  CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE db_pemandian_air_panas;

-- Tabel 1: Master Subjek
CREATE TABLE pengunjung (
  id_pengunjung     INT NOT NULL AUTO_INCREMENT,
  nama_pengunjung   VARCHAR(100) NOT NULL,
  no_hp_pengunjung  VARCHAR(15)  NOT NULL,
  email_pengunjung  VARCHAR(100) DEFAULT NULL,
  alamat_pengunjung VARCHAR(150) DEFAULT NULL,
  PRIMARY KEY (id_pengunjung)
) ENGINE=InnoDB;

-- Tabel 2: Master Objek
CREATE TABLE kolam (
  id_kolam         INT NOT NULL AUTO_INCREMENT,
  nama_kolam       VARCHAR(50)   NOT NULL,
  suhu_kolam       DECIMAL(4,1)  NOT NULL,
  kapasitas_kolam  INT           NOT NULL,
  harga_kolam      DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_kolam)
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
CREATE TABLE tiket (
  id_tiket             INT NOT NULL AUTO_INCREMENT,
  id_pengunjung_tiket  INT NOT NULL,
  id_kolam_tiket       INT NOT NULL,
  id_kasir_tiket       INT NOT NULL,
  tanggal_tiket        DATE NOT NULL,
  jumlah_tiket         INT NOT NULL,
  total_bayar_tiket    DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (id_tiket),
  CONSTRAINT fk_tiket_pengunjung FOREIGN KEY (id_pengunjung_tiket)
    REFERENCES pengunjung (id_pengunjung) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_tiket_kolam FOREIGN KEY (id_kolam_tiket)
    REFERENCES kolam (id_kolam) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_tiket_kasir FOREIGN KEY (id_kasir_tiket)
    REFERENCES kasir (id_kasir) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Data contoh (opsional, boleh dihapus)
INSERT INTO pengunjung (nama_pengunjung, no_hp_pengunjung, email_pengunjung, alamat_pengunjung) VALUES
('Budi Santoso', '081234567890', 'budi@example.com', 'Bandar Lampung'),
('Siti Rahma',   '082345678901', 'siti@example.com', 'Metro');

INSERT INTO kolam (nama_kolam, suhu_kolam, kapasitas_kolam, harga_kolam) VALUES
('Kolam Dewasa', 40.5, 30, 25000.00),
('Kolam Anak',   36.0, 20, 15000.00);

INSERT INTO kasir (nama_kasir, no_hp_kasir, shift_kasir) VALUES
('Rina Wulandari', '083456789012', 'Pagi'),
('Andi Pratama',   '084567890123', 'Siang');

INSERT INTO tiket (id_pengunjung_tiket, id_kolam_tiket, id_kasir_tiket, tanggal_tiket, jumlah_tiket, total_bayar_tiket) VALUES
(1, 1, 1, '2026-10-23', 2, 50000.00),
(2, 2, 2, '2026-10-23', 3, 45000.00);
