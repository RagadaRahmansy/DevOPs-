# Cafe & Restaurant Analytics System

**Sistem manajemen data lengkap untuk cafe dan restoran dengan dashboard analytics real-time**

![License](https://img.shields.io/badge/license-MIT-green)
![Node](https://img.shields.io/badge/node-v14%2B-blue)
![React](https://img.shields.io/badge/react-18-blue)
![PostgreSQL](https://img.shields.io/badge/postgresql-12%2B-blue)

## 🎯 Deskripsi Project

Cafe & Restaurant Analytics System adalah aplikasi web lengkap yang dirancang untuk membantu pemilik cafe dan restoran mengelola bisnis mereka dengan data-driven insights. Sistem ini menyediakan:

- **Dashboard Analytics** - Visualisasi data penjualan real-time
- **Inventory Management** - Tracking stok produk
- **Sales Tracking** - Pencatatan transaksi lengkap
- **Customer Management** - Database dan history customer
- **Financial Analytics** - Revenue dan expense tracking
- **Reporting** - Export dan analisis laporan

## ✨ Fitur Utama

### 1. Authentication & Security
- ✅ User registration dan login
- ✅ JWT token authentication
- ✅ Password encryption
- ✅ User data isolation

### 2. Product Management
- ✅ CRUD produk
- ✅ Kategorisasi produk
- ✅ Cost dan pricing
- ✅ Product descriptions

### 3. Sales Management
- ✅ Point of sale (POS) tracking
- ✅ Multiple payment methods
- ✅ Customer association
- ✅ Sales history dan receipts

### 4. Inventory System
- ✅ Real-time stock tracking
- ✅ Low stock alerts
- ✅ Stock history
- ✅ Automatic status updates

### 5. Customer Management
- ✅ Customer database
- ✅ Purchase history
- ✅ Loyalty points
- ✅ Customer profiles

### 6. Advanced Analytics
- ✅ Revenue trends
- ✅ Top selling products
- ✅ Top customers
- ✅ Payment method analysis
- ✅ Hourly sales patterns
- ✅ Financial reporting

### 7. Dashboard
- ✅ KPI cards (revenue, transactions, etc)
- ✅ Line charts untuk sales trends
- ✅ Doughnut charts untuk payment distribution
- ✅ Data tables dengan sorting
- ✅ Responsive design

## 🏗️ Teknologi Stack

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: PostgreSQL
- **Authentication**: JWT + bcryptjs
- **API**: RESTful API
- **Validation**: Joi

### Frontend
- **Library**: React 18
- **Routing**: React Router v6
- **HTTP Client**: Axios
- **Charts**: Chart.js + react-chartjs-2
- **Styling**: CSS3
- **Date Handling**: date-fns

### Database
- **PostgreSQL 12+**
- **Connection Pooling**: pg pool
- **Migrations**: Custom scripts

## 📁 Struktur Project

```
tugaswebback_1/
├── backend/
│   ├── config/
│   │   └── database.js          # Database connection
│   ├── routes/
│   │   ├── auth.js              # Auth endpoints
│   │   ├── products.js          # Product CRUD
│   │   ├── sales.js             # Sales tracking
│   │   ├── inventory.js         # Inventory management
│   │   ├── customers.js         # Customer management
│   │   └── analytics.js         # Analytics endpoints
│   ├── middleware/
│   │   └── auth.js              # JWT middleware
│   ├── migrations/
│   │   └── migrate.js           # Database schema
│   ├── index.js                 # Server entry point
│   ├── package.json
│   └── .env.example
│
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── components/          # React components
│   │   ├── styles/
│   │   │   ├── Auth.css
│   │   │   └── Dashboard.css
│   │   ├── api.js               # API client
│   │   ├── Auth.js              # Login/Register
│   │   ├── Dashboard.js         # Main dashboard
│   │   ├── App.js               # App router
│   │   └── index.js             # Entry point
│   └── package.json
│
├── database/
│   ├── schema.sql               # Database schema
│   └── sample_data.sql          # Sample data
│
└── docs/
    ├── README.md                # This file
    ├── SETUP.md                 # Installation guide
    └── API.md                   # API documentation
```

## 🚀 Quick Start

### Prerequisites
- Node.js v14+
- PostgreSQL 12+
- npm atau yarn

### Installation

1. **Clone atau download project**
```bash
cd tugaswebback_1
```

2. **Setup Database**
```bash
# Create database di PostgreSQL
psql -U postgres
CREATE DATABASE cafe_analytics;
\c cafe_analytics
\i database/schema.sql
\i database/sample_data.sql
\q
```

3. **Setup Backend**
```bash
cd backend

# Copy environment file
cp .env.example .env

# Edit .env dengan database credentials Anda

# Install dependencies
npm install

# Run migrations
npm run migrate

# Start server
npm run dev
```

4. **Setup Frontend** (di terminal baru)
```bash
cd frontend

# Install dependencies
npm install

# Start development server
npm start
```

5. **Access aplikasi**
```
Frontend: http://localhost:3000
Backend: http://localhost:5000/api
```

6. **Login/Register**
- Buat akun baru di halaman register
- Login dengan email dan password

Untuk detail lengkap, lihat [docs/SETUP.md](docs/SETUP.md)

## 📚 Dokumentasi

### Setup & Installation
- [Detailed Setup Guide](docs/SETUP.md)
- Database schema
- Troubleshooting

### API Documentation
- [Complete API Reference](docs/API.md)
- Endpoint details
- Request/Response examples
- Error handling

### Features
- [Main Features](docs/README.md)
- Use cases
- Best practices

## 🔌 API Endpoints

### Authentication
```
POST /api/auth/register        # Register user baru
POST /api/auth/login            # Login user
```

### Products
```
GET /api/products               # Lihat semua produk
POST /api/products              # Tambah produk baru
PUT /api/products/:id           # Update produk
DELETE /api/products/:id        # Hapus produk
```

### Sales
```
GET /api/sales                  # Lihat semua sales
POST /api/sales                 # Catat penjualan baru
GET /api/sales/summary/daily    # Daily summary
```

### Inventory
```
GET /api/inventory              # Lihat inventory
PUT /api/inventory/:id          # Update stock
GET /api/inventory/low-stock    # Low stock alerts
```

### Customers
```
GET /api/customers              # Lihat semua customers
POST /api/customers             # Tambah customer baru
GET /api/customers/:id/profile  # Customer profile + history
```

### Analytics
```
GET /api/analytics/revenue/summary       # Revenue summary
GET /api/analytics/products/top          # Top selling products
GET /api/analytics/customers/top         # Top customers
GET /api/analytics/payment/methods       # Payment analysis
GET /api/analytics/sales/hourly          # Hourly patterns
```

Lihat [docs/API.md](docs/API.md) untuk full reference.

## 📊 Dashboard Features

### KPI Cards
- Total Revenue (30 hari terakhir)
- Total Transactions
- Average Transaction Value
- Trading Days Active

### Charts & Visualizations
- **Line Chart**: Hourly sales trends (7 hari)
- **Doughnut Chart**: Payment methods distribution
- **Data Tables**: Top products dan top customers

### Real-time Updates
- Auto-refresh analytics
- Live data synchronization
- Responsive updates

## 🔒 Security Features

- JWT token authentication
- Password hashing (bcryptjs)
- CORS enabled
- SQL injection prevention
- Input validation
- Database connection pooling
- User data isolation

## 📈 Database Schema

### Tables
- **users** - User accounts
- **products** - Product catalog
- **customers** - Customer database
- **sales** - Transaction records
- **inventory** - Stock tracking
- **expenses** - Expense records

Lihat [database/schema.sql](database/schema.sql) untuk full schema.

## 🎨 UI/UX

### Dashboard
- Modern, clean interface
- Intuitive navigation
- Responsive design
- Mobile-friendly

### Dark Mode Support
- Professional color scheme
- Good contrast
- Eye-friendly

### Performance
- Fast loading times
- Smooth animations
- Optimized queries

## 🛠️ Development

### Available Scripts

**Backend:**
```bash
npm run dev          # Development mode with nodemon
npm start            # Production mode
npm run migrate      # Database migration
```

**Frontend:**
```bash
npm start            # Start dev server
npm build            # Build for production
npm test             # Run tests
```

## 🐛 Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Check PostgreSQL is running
   - Verify credentials in .env

2. **Port Already in Use**
   - Change API_PORT in backend .env
   - Change frontend port: `npm start -- --port 3001`

3. **CORS Error**
   - Backend already has CORS enabled
   - Check frontend URL is correct

Lihat [docs/SETUP.md](docs/SETUP.md) untuk troubleshooting lengkap.

## 📋 Environment Variables

### Backend .env
```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cafe_analytics
DB_USER=postgres
DB_PASSWORD=password

API_PORT=5000
NODE_ENV=development

JWT_SECRET=your_secret_key
JWT_EXPIRE=24h
```

## 🎯 Roadmap & Future Features

- [ ] Multi-location support
- [ ] Advanced reporting & export (PDF/Excel)
- [ ] Mobile app (React Native)
- [ ] Inventory purchasing system
- [ ] Staff management
- [ ] Table management (for restaurants)
- [ ] Online reservation system
- [ ] QR code ordering
- [ ] Receipt printing
- [ ] Payment gateway integration
- [ ] Loyalty program automation
- [ ] Real-time notifications

## 💡 Use Cases

### For Cafe Owners
- Track daily sales
- Monitor best-selling products
- Manage inventory
- Analyze customer patterns
- Financial reporting

### For Managers
- Real-time dashboard monitoring
- Staff performance tracking
- Shift management
- Daily cash management

### For Data Analysts
- Sales trends analysis
- Customer segmentation
- Revenue forecasting
- Operational efficiency

## 📞 Support & Contact

Untuk bantuan atau pertanyaan:
- Review documentation di [docs/](docs/)
- Check [API reference](docs/API.md)
- Review [setup guide](docs/SETUP.md)

## 📄 License

MIT License - Bebas digunakan untuk personal dan commercial

## 👨‍💻 Author

Cafe Analytics System
Created: January 2026

## 🙏 Acknowledgments

- Express.js framework
- PostgreSQL database
- React library
- Chart.js for visualizations

---

## 📌 Quick Reference

### First Time Setup
```bash
# 1. Setup database
psql -U postgres < database/schema.sql

# 2. Backend
cd backend && cp .env.example .env && npm install && npm run migrate && npm run dev

# 3. Frontend (new terminal)
cd frontend && npm install && npm start
```

### Useful Commands
```bash
# Database
psql -U postgres -d cafe_analytics

# Backend logs
npm run dev

# Database migration
npm run migrate

# Build frontend
npm build
```

### Default Ports
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000/api
- PostgreSQL: localhost:5432

---

**Happy coding! 🚀**

Sistem Cafe Analytics siap membantu bisnis Anda berkembang dengan data insights yang akurat!
# tugaswebback_1
# tugaswebback_1
