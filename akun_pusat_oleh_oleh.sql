-- Akun per tabel untuk database db_pusat_oleh_oleh
-- Nama : Adam Maulana Firmansyah | NPM : 25430042
-- PENTING: ganti ketiga password di bawah dengan password pilihanmu sendiri
--          sebelum menjalankan skrip ini. Jangan unggah password asli ke GitHub.

USE db_pusat_oleh_oleh;

-- Hapus akun lama jika ada (aman dijalankan ulang)
DROP USER IF EXISTS 'user_wisatawan'@'localhost',
                    'user_produk'@'localhost',
                    'user_kasir_oleh'@'localhost',
                    'user_pembelian'@'localhost';

-- Tiga akun master memakai password, akun transaksi tanpa password
CREATE USER 'user_wisatawan'@'localhost'  IDENTIFIED BY 'GANTI_PASSWORD_WISATAWAN';
CREATE USER 'user_produk'@'localhost'     IDENTIFIED BY 'GANTI_PASSWORD_PRODUK';
CREATE USER 'user_kasir_oleh'@'localhost' IDENTIFIED BY 'GANTI_PASSWORD_KASIR';
CREATE USER 'user_pembelian'@'localhost'  IDENTIFIED BY '';

-- Hak akses dibatasi hanya pada satu tabel per akun
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pusat_oleh_oleh.wisatawan TO 'user_wisatawan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pusat_oleh_oleh.produk    TO 'user_produk'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pusat_oleh_oleh.kasir     TO 'user_kasir_oleh'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pusat_oleh_oleh.pembelian TO 'user_pembelian'@'localhost';

FLUSH PRIVILEGES;
