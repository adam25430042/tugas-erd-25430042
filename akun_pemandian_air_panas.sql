-- Akun per tabel untuk database db_pemandian_air_panas
-- Nama : Adam Maulana Firmansyah | NPM : 25430042
-- PENTING: ganti ketiga password di bawah dengan password pilihanmu sendiri
--          sebelum menjalankan skrip ini.
-- CATATAN: skrip ini menghapus dan membuat ulang keempat akun. Jika akun sudah
--          ada dan sedang dipakai, password lama tidak berlaku lagi setelahnya.

USE db_pemandian_air_panas;

-- Hapus akun lama jika ada (aman dijalankan ulang)
DROP USER IF EXISTS 'user_pengunjung'@'localhost',
                    'user_kolam'@'localhost',
                    'user_kasir'@'localhost',
                    'user_tiket'@'localhost';

-- Tiga akun master memakai password, akun transaksi tanpa password
CREATE USER 'user_pengunjung'@'localhost' IDENTIFIED BY 'GANTI_PASSWORD_PENGUNJUNG';
CREATE USER 'user_kolam'@'localhost'      IDENTIFIED BY 'GANTI_PASSWORD_KOLAM';
CREATE USER 'user_kasir'@'localhost'      IDENTIFIED BY 'GANTI_PASSWORD_KASIR';
CREATE USER 'user_tiket'@'localhost'      IDENTIFIED BY '';

-- Hak akses dibatasi hanya pada satu tabel per akun
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pemandian_air_panas.pengunjung TO 'user_pengunjung'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pemandian_air_panas.kolam      TO 'user_kolam'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pemandian_air_panas.kasir      TO 'user_kasir'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON db_pemandian_air_panas.tiket      TO 'user_tiket'@'localhost';

FLUSH PRIVILEGES;
