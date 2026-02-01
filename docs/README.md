# Cafe & Restaurant Analytics System

Sistem manajemen data lengkap untuk cafe dan restoran dengan fitur analytics, dashboard, dan reporting.

## Fitur Utama

### 1. **Authentication & User Management**
- Registrasi dan login user
- JWT token authentication
- Password hashing dengan bcryptjs

### 2. **Product Management**
- Create, read, update, delete produk
- Kategorisasi produk
- Cost dan price tracking
- Deskripsi produk

### 3. **Sales Tracking**
- Record transaksi penjualan
- Multi-payment method support (Cash, Card, E-wallet)
- Customer association
- Sales analytics by period

### 4. **Inventory Management**
- Track stock availability
- Low stock alerts
- Unit pricing
- Stock status monitoring

### 5. **Customer Management**
- Customer database
- Purchase history
- Customer profiles
- Loyalty points tracking

### 6. **Analytics & Reporting**
- Revenue summary dan trends
- Top selling products
- Top customers
- Payment method analysis
- Hourly sales patterns
- Financial reporting

## Struktur Project

```
tugaswebback_1/
├── backend/                 # Node.js Express API
│   ├── config/             # Database & env config
│   ├── routes/             # API routes
│   ├── middleware/         # Auth middleware
│   ├── migrations/         # Database migrations
│   ├── index.js            # Main server file
│   ├── package.json        # Dependencies
│   └── .env.example        # Environment template
│
├── frontend/               # React Dashboard
│   ├── public/            # Static files
│   ├── src/
│   │   ├── components/    # React components
│   │   ├── styles/        # CSS files
│   │   ├── api.js         # API calls
│   │   ├── App.js         # Main component
│   │   └── index.js       # Entry point
│   └── package.json       # Dependencies
│
├── database/              # Database files
│   ├── schema.sql         # Database schema
│   └── sample_data.sql    # Sample data
│
└── docs/                  # Documentation
    └── README.md
```

## Persyaratan Sistem

- Node.js v14+
- PostgreSQL 12+
- npm atau yarn
- Git

## Setup & Installation

### 1. Setup Database

```bash
# Connect ke PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE cafe_analytics;

# Import schema
\c cafe_analytics
\i database/schema.sql

# Import sample data (optional)
\i database/sample_data.sql
```

### 2. Setup Backend

```bash
# Navigate ke backend
cd backend

# Copy .env.example ke .env
cp .env.example .env

# Edit .env dengan konfigurasi database Anda
# DB_HOST=localhost
# DB_PORT=5432
# DB_NAME=cafe_analytics
# DB_USER=postgres
# DB_PASSWORD=your_password

# Install dependencies
npm install

# Run database migrations
npm run migrate

# Start server
npm run dev
```

Server akan berjalan di `http://localhost:5000`

### 3. Setup Frontend

```bash
# Navigate ke frontend
cd frontend

# Install dependencies
npm install

# Start development server
npm start
```

Frontend akan berjalan di `http://localhost:3000`

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register user baru
- `POST /api/auth/login` - Login user

### Products
- `GET /api/products` - Get semua produk
- `POST /api/products` - Create produk baru
- `PUT /api/products/:id` - Update produk
- `DELETE /api/products/:id` - Delete produk

### Sales
- `GET /api/sales` - Get semua sales (dengan filter date)
- `POST /api/sales` - Create sale baru
- `GET /api/sales/summary/daily` - Get daily sales summary

### Inventory
- `GET /api/inventory` - Get inventory
- `PUT /api/inventory/:id` - Update stock
- `GET /api/inventory/low-stock/items` - Get low stock items

### Customers
- `GET /api/customers` - Get semua customers
- `POST /api/customers` - Create customer baru
- `GET /api/customers/:id/profile` - Get customer profile dengan history

### Analytics
- `GET /api/analytics/revenue/summary` - Revenue summary
- `GET /api/analytics/products/top` - Top selling products
- `GET /api/analytics/customers/top` - Top customers
- `GET /api/analytics/payment/methods` - Payment method analysis
- `GET /api/analytics/sales/hourly` - Hourly sales pattern

## Database Schema

### Users
- id, username, email, password, cafe_name, created_at, updated_at

### Products
- id, user_id, name, category, price, cost, description, created_at, updated_at

### Customers
- id, user_id, name, email, phone, address, loyalty_points, created_at, updated_at

### Sales
- id, user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at

### Inventory
- id, user_id, product_id, product_name, quantity, min_stock, unit_price, status, created_at, updated_at

### Expenses
- id, user_id, category, amount, description, created_at

## Fitur Dashboard

### KPI Cards
- Total Revenue (30 hari)
- Total Transactions
- Average Transaction Value
- Trading Days

### Charts
- Hourly Sales (Line Chart)
- Payment Methods Distribution (Doughnut Chart)

### Tables
- Top 10 Products
- Top 10 Customers

## Security Features

- JWT authentication
- Password hashing dengan bcryptjs
- CORS enabled
- Input validation
- Database connection pooling
- User data isolation

## Development Tools

### Backend Dependencies
- express - Web framework
- pg - PostgreSQL driver
- cors - Cross-origin requests
- dotenv - Environment variables
- bcryptjs - Password hashing
- jsonwebtoken - JWT auth
- joi - Data validation

### Frontend Dependencies
- react - UI library
- react-router-dom - Routing
- axios - HTTP client
- chart.js - Charts
- react-chartjs-2 - Chart components
- date-fns - Date utilities

## Performance Optimizations

- Database indexes pada frequently queried columns
- Connection pooling
- Aggregation queries untuk analytics
- Lazy loading pada frontend
- Responsive design
- Client-side caching

## Troubleshooting

### Database Connection Error
```
Pastikan PostgreSQL berjalan dan credentials di .env sudah benar
```

### Port Already in Use
```
Backend: Ubah API_PORT di .env
Frontend: Ubah port dengan npm start -- --port 3001
```

### CORS Error
```
Backend sudah memiliki CORS enabled. Pastikan frontend URL correct
```

### Migration Error
```bash
# Reset database
psql -U postgres -d cafe_analytics -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

# Jalankan migration lagi
npm run migrate
```

## Best Practices

1. **Data Entry**
   - Selalu input data customer saat transaksi
   - Update inventory secara berkala
   - Review sales daily

2. **Security**
   - Gunakan strong password
   - Jangan share JWT token
   - Update credentials secara berkala

3. **Analytics**
   - Review dashboard setiap hari
   - Track trends mingguan
   - Analyze top products reguler

## Future Enhancements

- [ ] Multi-location support
- [ ] Advanced reporting & export
- [ ] Mobile app
- [ ] Inventory purchasing system
- [ ] Staff management
- [ ] Table management (untuk resto)
- [ ] Reservation system
- [ ] QR code ordering
- [ ] Receipt printing
- [ ] Integration dengan payment gateway

## Support & Contribution

Untuk bantuan atau suggestion, silakan buat issue di repository.

## License

MIT License
