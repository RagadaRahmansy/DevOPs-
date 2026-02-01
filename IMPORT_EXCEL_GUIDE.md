# Import Excel to SQL Guide

## Overview
Fitur Import Excel memungkinkan kamu untuk import data dari file Excel langsung ke database PostgreSQL tanpa perlu menulis SQL secara manual.

## Fitur Utama
✅ Upload file Excel (.xlsx, .xls, .csv)
✅ Preview data sebelum import
✅ Generate SQL otomatis
✅ Review SQL sebelum execute
✅ Download template untuk setiap tabel
✅ Security checks (hanya INSERT yang diijinkan)

## Cara Menggunakan

### Step 1: Akses Fitur Import
1. Login ke aplikasi
2. Klik tombol **"📊 Import Excel"** di Dashboard
3. Atau navigasi ke: `http://localhost:3000/import`

### Step 2: Download Template (Opsional)
- Klik salah satu tombol template sesuai data yang ingin diimport:
  - **📥 products** - untuk data produk/menu
  - **📥 customers** - untuk data pelanggan
  - **📥 sales** - untuk data penjualan
  - **📥 inventory** - untuk data stok
  - **📥 expenses** - untuk data pengeluaran
  
- Template akan otomatis download dengan struktur kolom yang benar

### Step 3: Persiapkan File Excel
Gunakan template yang sudah didownload atau buat file Excel dengan struktur berikut:

#### Products Table
```
| name | category | price | cost | description |
|------|----------|-------|------|-------------|
| Espresso | Coffee | 25000 | 8000 | Single shot |
| Latte | Coffee | 35000 | 11000 | Smooth latte |
```

#### Customers Table
```
| name | email | phone | address | loyalty_points |
|------|-------|-------|---------|----------------|
| Budi | budi@email.com | 0812345 | Jl. A | 100 |
```

#### Sales Table
```
| quantity | price | total | payment_method | notes | created_at |
|----------|-------|-------|-----------------|-------|-----------|
| 2 | 35000 | 70000 | Cash | Morning order | 2026-01-22 08:00:00 |
```

#### Inventory Table
```
| product_name | quantity | min_stock | unit_price | status |
|--------------|----------|-----------|-----------|--------|
| Espresso | 250 | 50 | 25000 | in-stock |
```

#### Expenses Table
```
| category | amount | description | created_at |
|----------|--------|-------------|-----------|
| Rent | 10000000 | Monthly rent | 2026-01-22 |
```

### Step 4: Upload File
1. Klik area upload atau pilih file dari komputer
2. Pilih file Excel yang sudah disiapkan
3. Klik tombol **"Upload File"**
4. Tunggu hingga file berhasil diupload

### Step 5: Preview Data
- Sistem akan menampilkan preview dari 5 baris pertama
- Lihat jumlah total baris yang akan diimport
- Pilih target table dari dropdown
- Verifikasi kolom yang sesuai dengan tabel
- Klik **"Generate SQL"** untuk lanjut

### Step 6: Review SQL
- Sistem secara otomatis generate SQL INSERT statement
- Review statement SQL yang akan dijalankan
- Pastikan syntax benar dan data sesuai
- Klik **"✅ Execute SQL"** untuk import data

### Step 7: Konfirmasi
- Akan ada dialog konfirmasi sebelum execute
- Klik OK untuk proceed atau Cancel untuk batal
- Tunggu hingga proses selesai
- Sistem akan menampilkan jumlah baris yang berhasil diinsert

## Contoh Praktis

### Import Data Products
1. Download template **products**
2. Isi dengan data menu cafe:
```
name,category,price,cost,description
Espresso Single,Coffee,20000,5000,Classic single shot
Cappuccino,Coffee,32000,10000,With steamed milk
Latte,Coffee,35000,11000,Smooth and creamy
Donut Glazed,Pastry,35000,10000,Glazed donut
```
3. Upload file Excel
4. Preview data → 3 rows
5. Pilih table: **products**
6. Generate SQL
7. Review → Execute
8. ✅ Done! 3 produk berhasil diimport

### Import Data Sales
1. Download template **sales**
2. Isi dengan transaksi penjualan:
```
quantity,price,total,payment_method,notes,created_at
2,35000,70000,Cash,Morning order,2026-01-22 08:00:00
1,32000,32000,Card,Afternoon,2026-01-22 14:30:00
3,20000,60000,E-wallet,Office order,2026-01-22 09:15:00
```
3. Upload file Excel
4. Preview → pilih **sales** table
5. Generate SQL → Execute
6. ✅ 3 transaksi berhasil dicatat

## Tips & Trik

### 💡 Format Data
- Dates: Gunakan format `YYYY-MM-DD` atau `YYYY-MM-DD HH:MM:SS`
- Numbers: Jangan gunakan format currency (Rp) - hanya angka
- Text: Bisa menggunakan spasi dan karakter khusus
- Email: Gunakan format valid `nama@domain.com`
- Phone: Bisa dengan atau tanpa format tertentu

### ⚠️ Batasan
- File max: 5MB
- Format: .xlsx, .xls, .csv
- Hanya INSERT statement yang diijinkan (safety)
- Kolom harus sesuai dengan nama di template
- Jangan ada kolom kosong untuk primary key

### 🔐 Security
- Semua request harus terautentikasi (JWT token)
- Hanya akun pengguna sendiri yang bisa import data
- File upload disimpan sementara dan dihapus setelah proses
- Validasi SQL sebelum execute

### 🐛 Troubleshooting

**Error: "File is empty"**
- Pastikan Excel memiliki data di Sheet 1
- Header harus di baris pertama

**Error: "Invalid column names"**
- Gunakan nama kolom yang sesuai template
- Pastikan spelling benar (case-sensitive di SQL)

**Error: "Only INSERT statements allowed"**
- Fitur ini hanya support INSERT
- Gunakan database tools untuk UPDATE/DELETE

**Data tidak muncul setelah import**
- Refresh browser
- Cek database langsung: `SELECT COUNT(*) FROM products;`
- Pastikan user_id sesuai

## Alternatif: Batch Import via SQL

Jika ingin import banyak data sekaligus, bisa juga:

1. Siapkan file SQL manual
2. Buka pgAdmin atau psql CLI
3. Run file SQL:
```bash
psql -U postgres -d cafe_analytics -f data.sql
```

## Advanced: Template Kustom

Jika ingin custom template dengan data dummy lebih banyak:

```sql
-- Edit file: database/custom_template.sql
INSERT INTO products (user_id, name, category, price, cost) VALUES
(1, 'Espresso', 'Coffee', 20000, 5000),
(1, 'Americano', 'Coffee', 22000, 6000),
(1, 'Cappuccino', 'Coffee', 32000, 10000);

-- Import dengan:
psql -U postgres -d cafe_analytics -f custom_template.sql
```

## FAQ

**Q: Bisa import dari Google Sheets?**
A: Ya! Export Google Sheet ke Excel format (.xlsx) terlebih dahulu

**Q: Gimana kalau ada error di tengah proses?**
A: Semua or nothing - jika ada error, semua data tidak jadi diimport

**Q: Bisa update data yang sudah ada?**
A: Tidak. Fitur ini hanya INSERT. Untuk update, gunakan API endpoint atau database tools

**Q: Data saya banyak, perlu berapa lama?**
A: Tergantung ukuran file, tapi biasanya < 10 detik untuk 1000 rows

---

## Support
Jika ada masalah:
1. Cek browser console (F12) untuk error details
2. Lihat backend logs di terminal
3. Validasi format Excel sesuai template
4. Coba dengan data sample terlebih dahulu
