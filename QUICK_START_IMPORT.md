# Quick Start - Import Excel Feature

## 🚀 5 Menit Setup

### 1️⃣ Start Backend & Frontend
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend  
cd frontend
npm start
```

### 2️⃣ Login & Akses Import
- Buka: `http://localhost:3000`
- Login dengan akun kamu
- Klik tombol **"📊 Import Excel"** di Dashboard
- Atau langsung: `http://localhost:3000/import`

### 3️⃣ Download Template
- Pilih salah satu template button:
  - 📥 **products** - untuk menu/item
  - 📥 **customers** - untuk pelanggan
  - 📥 **sales** - untuk transaksi
  - 📥 **inventory** - untuk stok
  - 📥 **expenses** - untuk biaya

### 4️⃣ Siapkan Data
- Edit file Excel yang didownload
- Isi dengan data kamu
- Save file

### 5️⃣ Upload & Import
1. Klik "Upload File"
2. Pilih file Excel
3. Klik tombol "Upload File"
4. Preview akan muncul
5. Pilih tabel target
6. Klik "Generate SQL"
7. Review SQL
8. Klik "✅ Execute SQL"
9. ✅ Selesai!

---

## 📝 Contoh Data

### Products (CSV Format)
```
name,category,price,cost,description
Espresso,Coffee,20000,5000,Single shot
Latte,Coffee,35000,11000,Smooth
Cappuccino,Coffee,32000,10000,Creamy
Donut,Pastry,35000,10000,Fresh
```

### Customers (CSV Format)
```
name,email,phone,address,loyalty_points
Budi,budi@email.com,081234567,Jl. A,100
Siti,siti@email.com,082345678,Jl. B,200
Ahmad,ahmad@email.com,083456789,Jl. C,150
```

### Sales (CSV Format)
```
quantity,price,total,payment_method,notes,created_at
2,35000,70000,Cash,Morning,2026-01-22 08:00:00
1,32000,32000,Card,Afternoon,2026-01-22 14:00:00
3,20000,60000,E-wallet,Group,2026-01-22 09:15:00
```

---

## 💡 Tips

✅ **Format Dates**: `YYYY-MM-DD HH:MM:SS`
✅ **Numbers**: Hanya angka (25000), bukan format currency
✅ **Text**: Boleh spasi dan karakter khusus
✅ **File Size**: Max 5MB
✅ **Format File**: .xlsx, .xls, atau .csv

---

## ⚠️ Jangan Lupa

❌ Jangan add/remove kolom
❌ Jangan ganti nama kolom
❌ Jangan format number dengan Rp
❌ Jangan ada baris kosong di tengah data
❌ Pastikan data sesuai tipe kolom

---

## 🔍 Verify Import Success

### Via Dashboard
1. Login
2. Lihat KPI Cards berubah
3. Lihat charts update dengan data baru

### Via Database
```bash
# Connect ke PostgreSQL
psql -U postgres -d cafe_analytics

# Check data
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM inventory;
```

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| "File is empty" | Pastikan ada data di Sheet 1 |
| "Column not found" | Gunakan nama kolom yang benar dari template |
| Upload stuck | Refresh page, cek file size < 5MB |
| SQL error | Review SQL preview, cek format data |
| Data tidak muncul | Refresh browser, cek database |

---

## 🎓 Learning Path

1. **Beginner**: Import products dengan template sample
2. **Intermediate**: Import sales dengan format tanggal benar
3. **Advanced**: Import semua tabel untuk month closing

---

**Need Help?** Baca: [IMPORT_EXCEL_GUIDE.md](IMPORT_EXCEL_GUIDE.md)
