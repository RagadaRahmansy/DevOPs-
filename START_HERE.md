# 🎉 Selamat Datang ke Cafe Analytics System!

Project analytics data lengkap untuk cafe & restaurant sudah siap digunakan!

---

## 📖 Mulai dari Mana?

### 1️⃣ **Baca Dulu** (5 menit)
   - Buka: [README.md](README.md) - Overview project
   - Buka: [QUICK_START.md](QUICK_START.md) - Setup cepat
   
### 2️⃣ **Setup Database** (5 menit)
   - Follow: [SETUP.md](docs/SETUP.md) - Step by step
   - Database: PostgreSQL
   - File: [schema.sql](database/schema.sql)

### 3️⃣ **Jalankan Backend** (3 menit)
   - Folder: [backend/](backend/)
   - Command: `npm install && npm run dev`
   - Port: 5000

### 4️⃣ **Jalankan Frontend** (2 menit)
   - Folder: [frontend/](frontend/)
   - Command: `npm install && npm start`
   - Port: 3000

### 5️⃣ **Login & Explore** (5 menit)
   - Register akun baru atau gunakan sample data
   - Explore dashboard & features

---

## 📚 Dokumentasi

| File | Deskripsi | Waktu |
|------|-----------|-------|
| [README.md](README.md) | Project overview & features | 10 min |
| [QUICK_START.md](QUICK_START.md) | 5-minute setup | 5 min |
| [SETUP.md](docs/SETUP.md) | Detailed installation | 15 min |
| [API.md](docs/API.md) | Complete API reference | 20 min |
| [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) | File organization | 10 min |
| [COMPLETION_SUMMARY.md](COMPLETION_SUMMARY.md) | What's included | 10 min |

---

## ⚡ Quick Setup (Copy-Paste)

```bash
# 1. Database
psql -U postgres
CREATE DATABASE cafe_analytics;
\c cafe_analytics
\i 'C:/path/to/database/schema.sql'
\i 'C:/path/to/database/sample_data.sql'
\q

# 2. Backend (Terminal 1)
cd backend
cp .env.example .env
# Edit .env dengan PostgreSQL password
npm install
npm run migrate
npm run dev

# 3. Frontend (Terminal 2)
cd frontend
npm install
npm start

# Buka: http://localhost:3000
```

---

## 🏗️ Project Structure

```
tugaswebback_1/
│
├── 📁 backend/                 # Express API Server
│   ├── config/database.js      # PostgreSQL connection
│   ├── routes/                 # API endpoints
│   │   ├── auth.js
│   │   ├── products.js
│   │   ├── sales.js
│   │   ├── inventory.js
│   │   ├── customers.js
│   │   └── analytics.js
│   ├── middleware/auth.js      # JWT authentication
│   ├── migrations/migrate.js   # Database setup
│   ├── index.js                # Server entry
│   └── package.json
│
├── 📁 frontend/                # React Dashboard
│   ├── src/
│   │   ├── api.js              # API client
│   │   ├── Auth.js             # Login/Register
│   │   ├── Dashboard.js        # Main dashboard
│   │   ├── App.js              # Router setup
│   │   ├── styles/             # CSS files
│   │   └── index.js            # Entry point
│   └── package.json
│
├── 📁 database/                # Database Files
│   ├── schema.sql              # Tables & schema
│   └── sample_data.sql         # Sample data
│
├── 📁 docs/                    # Documentation
│   ├── README.md
│   ├── SETUP.md
│   └── API.md
│
├── 📄 README.md                # Main readme
├── 📄 QUICK_START.md           # 5-min setup
├── 📄 PROJECT_STRUCTURE.md     # Architecture
└── 📄 COMPLETION_SUMMARY.md    # What's included
```

---

## 🎯 Fitur Tersedia

✅ **Authentication** - Register & Login
✅ **Product Management** - CRUD operations
✅ **Sales Tracking** - Record transactions
✅ **Inventory System** - Stock management
✅ **Customer Database** - Profile & history
✅ **Analytics** - Revenue, trends, insights
✅ **Dashboard** - Charts & visualizations
✅ **Sample Data** - Ready to explore

---

## 🔌 API Endpoints

### 📌 Base URL
```
http://localhost:5000/api
```

### 🔐 Auth
- `POST /auth/register`
- `POST /auth/login`

### 📦 Products
- `GET /products`
- `POST /products`
- `PUT /products/:id`
- `DELETE /products/:id`

### 💰 Sales
- `GET /sales`
- `POST /sales`
- `GET /sales/summary/daily`

### 📊 Analytics
- `GET /analytics/revenue/summary`
- `GET /analytics/products/top`
- `GET /analytics/customers/top`
- `GET /analytics/payment/methods`
- `GET /analytics/sales/hourly`

[Lihat full API reference](docs/API.md)

---

## 🎨 Dashboard Features

### KPI Cards
- Total Revenue (30 hari)
- Total Transactions
- Average Transaction
- Trading Days

### Charts
- Hourly Sales (Line Chart)
- Payment Methods (Doughnut Chart)

### Tables
- Top 10 Products
- Top 10 Customers

---

## 🔒 Security

- ✅ JWT Token Authentication
- ✅ Password Encryption (bcryptjs)
- ✅ CORS Enabled
- ✅ Input Validation
- ✅ User Data Isolation

---

## 📊 Database Tables

| Table | Purpose |
|-------|---------|
| users | User accounts |
| products | Product catalog |
| customers | Customer info |
| sales | Transactions |
| inventory | Stock levels |
| expenses | Expense records |

---

## 🚀 Environment Setup

### Backend .env
```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cafe_analytics
DB_USER=postgres
DB_PASSWORD=your_password
API_PORT=5000
JWT_SECRET=your_secret_key
```

### Frontend (optional)
```
REACT_APP_API_URL=http://localhost:5000/api
```

---

## 💻 System Requirements

- Node.js v14+
- PostgreSQL 12+
- npm atau yarn
- Browser modern (Chrome, Firefox, etc)

---

## 🔍 Testing API

### With Postman
1. Download Postman
2. Test endpoints dengan sample data
3. Check responses

### With curl
```bash
curl -X GET http://localhost:5000/api/products \
  -H "Authorization: Bearer YOUR_TOKEN"
```

---

## 📱 Default Ports

| Service | Port |
|---------|------|
| Frontend | 3000 |
| Backend | 5000 |
| PostgreSQL | 5432 |

---

## 🎯 Next Actions

### Immediate (Day 1)
1. Read [QUICK_START.md](QUICK_START.md)
2. Setup database
3. Run backend & frontend
4. Test login & dashboard

### Short Term (Week 1)
1. Customize cafe name
2. Add more products
3. Create test transactions
4. Explore all features

### Medium Term (Week 2-4)
1. Add more analytics
2. Improve UI/UX
3. Optimize database
4. Deploy to production

---

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Change port di backend/.env
API_PORT=5001
```

### Database Connection Error
```bash
# Check credentials di backend/.env
# Ensure PostgreSQL is running
```

### Module Not Found
```bash
npm install
npm run migrate
```

[Full troubleshooting guide](docs/SETUP.md#troubleshooting)

---

## 📞 Support Resources

1. **Setup Help**: [SETUP.md](docs/SETUP.md)
2. **API Help**: [API.md](docs/API.md)
3. **Architecture**: [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)
4. **Features**: [README.md](README.md)
5. **Summary**: [COMPLETION_SUMMARY.md](COMPLETION_SUMMARY.md)

---

## 🎓 Learning Resources

- [Express.js](https://expressjs.com/)
- [React](https://react.dev/)
- [PostgreSQL](https://www.postgresql.org/)
- [Chart.js](https://www.chartjs.org/)

---

## ✨ What's Included

✅ Complete backend API (50+ lines of code)
✅ React dashboard with charts
✅ PostgreSQL database with schema
✅ Sample data (users, products, sales, customers)
✅ Authentication system
✅ Analytics endpoints
✅ Complete documentation
✅ Responsive UI
✅ Production-ready code

---

## 🎉 You're Ready!

Semua yang Anda butuhkan sudah tersedia. 

**Mulai dengan:** [QUICK_START.md](QUICK_START.md)

Atau langsung ke: [SETUP.md](docs/SETUP.md)

---

## 📄 File Reference

| File | Action |
|------|--------|
| [README.md](README.md) | Read overview |
| [QUICK_START.md](QUICK_START.md) | 5-min setup |
| [docs/SETUP.md](docs/SETUP.md) | Detailed guide |
| [docs/API.md](docs/API.md) | API reference |
| [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) | Architecture |
| [COMPLETION_SUMMARY.md](COMPLETION_SUMMARY.md) | What's done |

---

## 🏆 Success Criteria

- [ ] Database created
- [ ] Backend running on 5000
- [ ] Frontend running on 3000
- [ ] Can login/register
- [ ] Dashboard shows data
- [ ] Charts display correctly
- [ ] API endpoints work

---

## 🚀 Ready to Begin?

### Start Here:
1. **[README.md](README.md)** - Understand the project
2. **[QUICK_START.md](QUICK_START.md)** - Setup in 5 minutes
3. **[docs/SETUP.md](docs/SETUP.md)** - Detailed steps
4. **Open http://localhost:3000** - Launch dashboard

---

## 📌 Important Notes

- Keep backend terminal running
- Keep frontend terminal running  
- PostgreSQL must be running
- Edit .env with your database credentials
- Don't commit .env files
- Check browser console for errors
- Check terminal for server logs

---

## 🎯 Pro Tips

✨ **Tip 1**: Use different terminals for backend & frontend
✨ **Tip 2**: Read docs before asking questions
✨ **Tip 3**: Test API with Postman before integration
✨ **Tip 4**: Backup database regularly
✨ **Tip 5**: Use VS Code for better development

---

## 📞 Questions?

1. Check [FAQ in docs](docs/SETUP.md#troubleshooting)
2. Review [API documentation](docs/API.md)
3. Read [project structure guide](PROJECT_STRUCTURE.md)

---

**Status**: ✅ Ready to Use
**Version**: 1.0.0
**Last Updated**: January 2026

---

## 🎊 Congratulations!

You now have a complete, production-ready Cafe Analytics System!

**Next Step**: Open [QUICK_START.md](QUICK_START.md) and begin setup 🚀
