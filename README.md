# Tugas ERD - Basis Data

- **Nama:** Adam Maulana Firmansyah
- **NIM:** 25430042
- **Kelas:** B
- **Mata kuliah:** Basis Data
- **Dosen:** Dedi Irawan, S.Kom., M.T.I.

Repositori ini berisi dua tugas perancangan ERD (notasi Crow's Foot) untuk sistem skala kecil dengan pola empat entitas: master subjek, master objek, master aktor, dan transaksi. Setiap ERD diwujudkan sebagai basis data di phpMyAdmin (MariaDB/XAMPP). Seluruh atribut memakai format penamaan `namafield_namatabel`.

## Daftar Tugas

| Tugas | Subjek | Objek | Aktor | Transaksi | Basis data |
|---|---|---|---|---|---|
| 1. Pemandian Air Panas | `pengunjung` | `kolam` | `kasir` | `tiket` | `db_pemandian_air_panas` |
| 2. Pusat Oleh-Oleh | `wisatawan` | `produk` | `kasir` | `pembelian` | `db_pusat_oleh_oleh` |

Pada kedua tugas, tabel master berelasi **One-to-Many** ke tabel transaksi, dan tabel transaksi memuat tiga foreign key serta keterangan tanggal dan jumlah.

## Struktur Repositori

```
.
├── ERD_Pemandian_Air_Panas/        gambar ERD tugas 1 (PNG dan PDF)
├── ERD_Pusat_Oleh_Oleh/            gambar ERD tugas 2 (PNG dan PDF)
├── img/                            screenshot bukti tugas 1
├── img_oleh_oleh/                  screenshot bukti tugas 2
├── db_pemandian_air_panas.sql      skrip database dan tabel tugas 1
├── db_pusat_oleh_oleh.sql          skrip database dan tabel tugas 2
├── akun_pusat_oleh_oleh.sql        skrip akun per tabel tugas 2
├── pemandian_laporan_25430042.md   laporan tugas 1
└── oleh_oleh_laporan_25430042.md   laporan tugas 2
```

## Cara Menjalankan Skrip

1. Jalankan **Apache** dan **MySQL** melalui XAMPP Control Panel, lalu buka `localhost/phpmyadmin` dan login sebagai `root`.
2. Buka tab **Import**, pilih skrip tabel, lalu klik **Import**:
   - `db_pemandian_air_panas.sql` untuk tugas 1
   - `db_pusat_oleh_oleh.sql` untuk tugas 2
3. Untuk tugas 2, akun per tabel dibuat dengan `akun_pusat_oleh_oleh.sql`:
   - Pilih database `db_pusat_oleh_oleh` di panel kiri, lalu buka tab **SQL**.
   - Ganti password pada tiga baris `CREATE USER` sesuai keinginan, tempel isi skrip, lalu klik **Go**.

Skrip tabel harus dijalankan **sebelum** skrip akun, karena hak akses diberikan pada tabel yang sudah ada. Jika database dengan nama yang sama sudah ada, hapus dulu dengan `DROP DATABASE IF EXISTS nama_database;` sebelum mengimpor ulang.

## Akun per Tabel

Setiap akun hanya diberi hak `SELECT, INSERT, UPDATE, DELETE` pada satu tabel miliknya (prinsip least privilege).

| Tugas | Akun | Tabel |
|---|---|---|
| 1 | `user_pengunjung`, `user_kolam`, `user_kasir`, `user_tiket` | masing-masing satu tabel |
| 2 | `user_wisatawan`, `user_produk`, `user_kasir_oleh`, `user_pembelian` | masing-masing satu tabel |

Akun tugas 1 dibuat langsung melalui tab SQL di phpMyAdmin, sedangkan akun tugas 2 dibuat dengan `akun_pusat_oleh_oleh.sql`. Password pada skrip hanya untuk latihan dan tidak digunakan di luar praktikum ini.

## Laporan

- [Laporan tugas 1: Pemandian Air Panas](pemandian_laporan_25430042.md)
- [Laporan tugas 2: Pusat Oleh-Oleh](oleh_oleh_laporan_25430042.md)
