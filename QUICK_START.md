# Quick Start Guide

## ⚡ 5 Menit Setup

### Langkah 1: Persiapan (1 menit)
```bash
# Pastikan PostgreSQL sudah running
# Windows: pgAdmin atau Services
# Mac: PostgreSQL.app
# Linux: sudo systemctl start postgresql
```

### Langkah 2: Setup Database (1 menit)
```bash
# Buka Command Prompt / Terminal

# Connect ke PostgreSQL
psql -U postgres

# Copy & paste:
CREATE DATABASE cafe_analytics;
\c cafe_analytics
\i 'C:/path/to/database/schema.sql'
\i 'C:/path/to/database/sample_data.sql'
\q
```

### Langkah 3: Setup Backend (2 menit)
```bash
# Terminal 1
cd backend

# Copy file konfigurasi
cp .env.example .env

# Edit .env (ubah password PostgreSQL jika perlu)

# Install dan jalankan
npm install
npm run migrate
npm run dev

# Tunggu sampai muncul: "Server running on port 5000"
```

### Langkah 4: Setup Frontend (1 menit)
```bash
# Terminal 2 (buka terminal baru)
cd frontend

# Install dan jalankan
npm install
npm start

# Browser akan membuka otomatis ke localhost:3000
```

## ✅ Test Aplikasi

1. **Homepage akan terbuka di browser**
   - Buka: http://localhost:3000

2. **Register Akun Baru**
   - Klik "Register here"
   - Isi form dengan data Anda
   - Klik Register

3. **Login**
   - Gunakan email & password yang tadi dibuat
   - Klik Login

4. **Lihat Dashboard**
   - Anda akan melihat analytics dashboard
   - KPI cards dengan data sample
   - Charts dengan visualisasi penjualan
   - Tabel top products dan customers

## 🔍 Test API dengan Postman (Optional)

### Setup Postman
1. Download Postman: https://www.postman.com/downloads/
2. Buat workspace baru

### Test Login
```
POST http://localhost:5000/api/auth/login
Content-Type: application/json

{
  "email": "admin@cafeanalytics.com",
  "password": "password"
}
```
Response akan berisi token - copy untuk request berikutnya

### Test Get Products
```
GET http://localhost:5000/api/products
Authorization: Bearer [paste_token_here]
```

## 📱 Struktur Data Sample

### Users
- Email: admin@cafeanalytics.com
- Username: admin
- Cafe: Coffee Corner

### Products
- Espresso (Rp 25.000)
- Cappuccino (Rp 35.000)
- Latte (Rp 35.000)
- Croissant (Rp 45.000)
- Chocolate Cake (Rp 60.000)

### Customers
- John Doe
- Jane Smith
- Budi Santoso
- Siti Nurhaliza

### Sample Sales
- 5 transaksi dengan berbagai produk
- Multiple payment methods
- Customer associations

## 🚨 Troubleshooting Cepat

### Error: connect ECONNREFUSED
```
PostgreSQL belum running
→ Buka PostgreSQL service/app Anda
```

### Error: "relation does not exist"
```
Database schema belum dibuat
→ Jalankan: npm run migrate
```

### Port 5000 / 3000 sudah dipakai
```
Buka port atau ubah di .env / npm start -- --port 3001
```

### Password PostgreSQL salah
```
Ubah di backend/.env
DB_PASSWORD=password_yang_benar
Restart backend: npm run dev
```

## 📊 Fitur yang Bisa Dicoba

### 1. Dashboard
- Lihat revenue summary
- Check transaction count
- View hourly sales chart
- See payment methods distribution

### 2. Create New Sale
- POST /api/sales dengan data
- See revenue update di dashboard

### 3. Manage Products
- Add new product
- Update existing product
- Delete product
- View all products

### 4. Manage Inventory
- Check stock levels
- Update quantities
- Get low stock alerts

### 5. Customer Management
- Add new customer
- View customer profiles
- See purchase history

### 6. Analytics
- Revenue trends
- Top products
- Top customers
- Payment analysis

## 📚 File Penting

| File | Lokasi | Fungsi |
|------|--------|--------|
| .env | backend/ | Konfigurasi database |
| schema.sql | database/ | Database structure |
| index.js | backend/ | Server utama |
| Dashboard.js | frontend/src/ | Halaman dashboard |
| api.js | frontend/src/ | API client |

## 🎯 Next Steps

1. **Explore Codebase**
   - Review backend/routes untuk API logic
   - Check frontend/src untuk UI components
   - Understand database/schema.sql

2. **Customize**
   - Add your cafe name di backend/.env
   - Modify colors di frontend/src/styles/
   - Add more products ke sample_data.sql

3. **Scale Up**
   - Add more features
   - Improve UI/UX
   - Add more analytics
   - Deploy to production

4. **Learn More**
   - Read docs/README.md
   - Check docs/API.md
   - Review docs/SETUP.md

## ⚙️ Environment Variables

```
# backend/.env - WAJIB DIISI
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cafe_analytics
DB_USER=postgres
DB_PASSWORD=YOUR_PASSWORD    # <- Ubah ini
API_PORT=5000
NODE_ENV=development
JWT_SECRET=your_secret_key_here
```

## 🔗 URLs

| Service | URL |
|---------|-----|
| Frontend | http://localhost:3000 |
| Backend API | http://localhost:5000/api |
| Health Check | http://localhost:5000/health |
| PostgreSQL | localhost:5432 |

## 💡 Tips

- Keep both terminals (backend & frontend) running
- Refresh browser jika ada perubahan di frontend
- Restart backend jika ada perubahan di code
- Check console untuk error messages
- Use browser DevTools (F12) untuk debug frontend

## 🎓 Learning Path

1. Understand authentication flow
2. Learn CRUD operations
3. Explore analytics queries
4. Understand database schema
5. Customize UI components
6. Add new features
7. Deploy to production

## 📞 Common Tasks

### Restart Backend
```bash
# Terminal dimana backend running
Ctrl+C (stop)
npm run dev (start lagi)
```

### Restart Frontend
```bash
# Terminal dimana frontend running
Ctrl+C (stop)
npm start (start lagi)
```

### Reset Database
```bash
psql -U postgres -c "DROP DATABASE cafe_analytics;"
# Buat ulang dengan step 2 di atas
```

### Check Database
```bash
psql -U postgres
\c cafe_analytics
\dt           (list tables)
SELECT COUNT(*) FROM sales;  (check data)
\q
```

## ✨ Selamat!

Project Anda siap digunakan!

**Next: Buka http://localhost:3000 di browser Anda**

---

### Support
Jika ada masalah:
1. Cek docs/SETUP.md untuk detail lebih lengkap
2. Review docs/API.md untuk API reference
3. Check browser console untuk error frontend
4. Check terminal untuk error backend
