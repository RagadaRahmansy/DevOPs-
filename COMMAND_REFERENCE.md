# 🎯 Cafe Analytics - Command Reference

Referensi cepat untuk semua command yang sering digunakan.

---

## 📁 Navigasi Folder

```bash
# Ke project root
cd tugaswebback_1

# Ke backend
cd backend

# Ke frontend
cd frontend

# Kembali ke parent
cd ..
```

---

## 🔧 Setup Commands

### Database Setup
```bash
# Connect ke PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE cafe_analytics;

# Switch database
\c cafe_analytics

# Import schema (dari dalam psql)
\i 'C:/full/path/to/database/schema.sql'

# Import sample data
\i 'C:/full/path/to/database/sample_data.sql'

# List tables
\dt

# Quit
\q
```

### Backend Setup
```bash
# Navigate
cd backend

# Copy env template
cp .env.example .env

# Edit .env (ubah password PostgreSQL)

# Install dependencies
npm install

# Run database migrations
npm run migrate

# Start in development
npm run dev

# Start in production
npm start
```

### Frontend Setup
```bash
# Navigate
cd frontend

# Install dependencies
npm install

# Start dev server
npm start

# Build for production
npm build

# Run tests
npm test
```

---

## 🚀 Running Project

### Terminal 1 - Backend
```bash
cd backend
npm run dev
# Output: "Server running on port 5000"
```

### Terminal 2 - Frontend
```bash
cd frontend
npm start
# Browser opens http://localhost:3000
```

---

## 📊 Database Commands

### Connect to Database
```bash
psql -U postgres -d cafe_analytics
```

### Useful Queries
```sql
-- List all users
SELECT * FROM users;

-- Count sales
SELECT COUNT(*) FROM sales;

-- Top products
SELECT p.name, COUNT(*) FROM products p
JOIN sales s ON p.id = s.product_id
GROUP BY p.id, p.name
ORDER BY COUNT(*) DESC;

-- Revenue by day
SELECT DATE(created_at), SUM(total)
FROM sales
GROUP BY DATE(created_at)
ORDER BY DATE(created_at) DESC;

-- Low stock items
SELECT * FROM inventory WHERE quantity < 20;
```

### Reset Database
```bash
# Drop database
psql -U postgres -c "DROP DATABASE cafe_analytics;"

# Recreate
psql -U postgres -c "CREATE DATABASE cafe_analytics;"

# Reimport schema
psql -U postgres -d cafe_analytics < database/schema.sql
psql -U postgres -d cafe_analytics < database/sample_data.sql
```

---

## 🔌 Testing API

### With Postman
1. Buka Postman
2. New Request
3. Paste URL & select method

### With curl

**Register**
```bash
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser",
    "email": "test@cafe.com",
    "password": "password123",
    "cafe_name": "Test Cafe"
  }'
```

**Login**
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@cafe.com",
    "password": "password123"
  }'
```

**Get Products** (replace TOKEN)
```bash
curl -X GET http://localhost:5000/api/products \
  -H "Authorization: Bearer TOKEN"
```

**Create Sale** (replace TOKEN)
```bash
curl -X POST http://localhost:5000/api/sales \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "product_id": 1,
    "quantity": 2,
    "price": 25000,
    "customer_id": 1,
    "payment_method": "Cash"
  }'
```

---

## 🔄 Restart Commands

### Restart Backend
```bash
# Ctrl+C (di terminal backend)
# Kemudian jalankan lagi:
npm run dev
```

### Restart Frontend
```bash
# Ctrl+C (di terminal frontend)
# Kemudian jalankan lagi:
npm start
```

### Restart Database
```bash
# Stop & start PostgreSQL service
# Windows: Services > PostgreSQL
# Mac: PostgreSQL.app stop/start
# Linux: sudo systemctl restart postgresql
```

---

## 🧹 Clean Commands

### Clean Backend
```bash
cd backend
rm -rf node_modules
rm package-lock.json
npm install
```

### Clean Frontend
```bash
cd frontend
rm -rf node_modules
rm package-lock.json
npm cache clean --force
npm install
```

### Reset Everything
```bash
# 1. Reset database
psql -U postgres -c "DROP DATABASE cafe_analytics;"

# 2. Reinstall backend
cd backend && rm -rf node_modules && npm install

# 3. Reinstall frontend
cd frontend && rm -rf node_modules && npm install

# 4. Recreate database & run migrations
npm run migrate
```

---

## 📝 Editor Commands

### VS Code
```bash
# Open project
code .

# Open backend
code backend

# Open frontend
code frontend
```

### Database Browser
```bash
# DBeaver (GUI for PostgreSQL)
# Or use pgAdmin web interface
```

---

## 🔐 Environment Config

### View Current .env
```bash
cd backend
cat .env
```

### Edit .env (Windows)
```bash
cd backend
notepad .env

# Or use VS Code
code .env
```

### Edit .env (Mac/Linux)
```bash
cd backend
nano .env
# Or: vim .env
```

### Required .env Values
```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cafe_analytics
DB_USER=postgres
DB_PASSWORD=YOUR_PASSWORD    ← Change this
API_PORT=5000
NODE_ENV=development
JWT_SECRET=your_secret_key
JWT_EXPIRE=24h
```

---

## 📦 Package Management

### Backend Dependencies
```bash
cd backend

# Install all
npm install

# Add new package
npm install package-name

# Remove package
npm uninstall package-name

# Update packages
npm update
```

### Frontend Dependencies
```bash
cd frontend

# Install all
npm install

# Add new package
npm install package-name

# Remove package
npm uninstall package-name

# Update packages
npm update
```

---

## 🔍 Debugging

### View Logs
```bash
# Backend logs (in terminal where npm run dev is running)
# Check for errors in console

# Frontend logs
# F12 → Console tab in browser
```

### Check Port Status
```bash
# Windows
netstat -ano | findstr :5000

# Mac/Linux
lsof -i :5000
```

### Kill Port Process
```bash
# Windows
taskkill /PID <PID> /F

# Mac/Linux
kill -9 <PID>
```

---

## 📊 URL References

| Service | URL |
|---------|-----|
| Frontend | http://localhost:3000 |
| Backend | http://localhost:5000 |
| API Base | http://localhost:5000/api |
| Health Check | http://localhost:5000/health |
| PostgreSQL | localhost:5432 |

---

## 🎯 Common Tasks

### Add New Product
```bash
# Via API (get token first)
curl -X POST http://localhost:5000/api/products \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"Coffee","category":"Beverages","price":35000,"cost":10000}'
```

### Add New Customer
```bash
curl -X POST http://localhost:5000/api/customers \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","phone":"08123456789"}'
```

### Record Sale
```bash
curl -X POST http://localhost:5000/api/sales \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"product_id":1,"quantity":2,"price":35000,"customer_id":1,"payment_method":"Cash"}'
```

### Get Analytics
```bash
curl -X GET http://localhost:5000/api/analytics/revenue/summary \
  -H "Authorization: Bearer TOKEN"
```

---

## 🐛 Error Solutions

### "Module not found"
```bash
npm install
npm run migrate
```

### "connect ECONNREFUSED"
```bash
# Start PostgreSQL service
# Check connection string in .env
```

### "listen EADDRINUSE: address already in use"
```bash
# Change port in .env
# Or kill existing process
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

### "relation does not exist"
```bash
npm run migrate
```

---

## 📋 Checklist

### First Time Setup
- [ ] PostgreSQL installed & running
- [ ] Database created
- [ ] Schema imported
- [ ] Sample data imported
- [ ] Backend .env configured
- [ ] Backend dependencies installed
- [ ] Frontend dependencies installed
- [ ] Backend running on :5000
- [ ] Frontend running on :3000
- [ ] Can login to dashboard

### Before Production
- [ ] Database backed up
- [ ] .env production values set
- [ ] JWT_SECRET changed
- [ ] Frontend built: npm build
- [ ] All tests passed
- [ ] Error handling implemented
- [ ] Logging setup complete
- [ ] SSL/HTTPS enabled
- [ ] CORS configured properly
- [ ] Documentation updated

---

## 🚀 Quick Start (Copy-Paste)

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
npm install
npm run migrate
npm run dev

# 3. Frontend (Terminal 2)
cd frontend
npm install
npm start

# Open http://localhost:3000
```

---

## 📞 Quick Reference

| Command | Purpose |
|---------|---------|
| `npm install` | Install dependencies |
| `npm run dev` | Run backend dev |
| `npm run migrate` | Setup database |
| `npm start` | Run frontend |
| `npm build` | Build for production |
| `psql -U postgres` | Connect PostgreSQL |
| `\dt` | List tables |
| `\q` | Quit psql |

---

## 📚 Documentation Files

- [README.md](README.md) - Project overview
- [QUICK_START.md](QUICK_START.md) - 5-min setup
- [SETUP.md](docs/SETUP.md) - Detailed setup
- [API.md](docs/API.md) - API reference
- [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) - Architecture

---

**Save this file for quick reference!** ⭐
