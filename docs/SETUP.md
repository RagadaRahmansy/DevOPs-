# Setup dan Instalasi Lengkap

## Prasyarat

Pastikan Anda sudah install:

1. **Node.js** (v14 atau lebih baru)
   - Download dari https://nodejs.org/
   - Verifikasi: `node -v` dan `npm -v`

2. **PostgreSQL** (v12 atau lebih baru)
   - Download dari https://www.postgresql.org/download/
   - Setup database server

3. **Git** (opsional)
   - Download dari https://git-scm.com/

## Step-by-Step Setup

### Step 1: Setup Database PostgreSQL

#### Windows:
```bash
# Open Command Prompt as Administrator
# Connect to PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE cafe_analytics;

# Create user (optional)
CREATE USER cafe_user WITH PASSWORD 'cafe_password';
ALTER ROLE cafe_user SET client_encoding TO 'utf8';
ALTER ROLE cafe_user SET default_transaction_isolation TO 'read committed';
ALTER ROLE cafe_user SET default_transaction_deferrable TO on;
ALTER ROLE cafe_user CREATEDB;

# Grant privileges
GRANT ALL PRIVILEGES ON DATABASE cafe_analytics TO cafe_user;

# Connect to database
\c cafe_analytics

# Import schema
\i 'C:/path/to/database/schema.sql'

# Import sample data
\i 'C:/path/to/database/sample_data.sql'

# Verify
\dt

# Exit
\q
```

#### macOS/Linux:
```bash
# Connect to PostgreSQL
psql -U postgres

# Sama seperti Windows
```

### Step 2: Setup Backend Server

```bash
# Navigate to backend directory
cd backend

# Create .env file
cp .env.example .env

# Edit .env dengan text editor
# Ubah database credentials sesuai setup Anda
```

**Isi file .env:**
```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cafe_analytics
DB_USER=postgres
DB_PASSWORD=your_password

API_PORT=5000
NODE_ENV=development

JWT_SECRET=your_super_secret_jwt_key_12345
JWT_EXPIRE=24h
```

```bash
# Install dependencies
npm install

# Verify tables exist (run migration if needed)
npm run migrate

# Start server
npm run dev
```

**Output yang diharapkan:**
```
Server running on port 5000
```

### Step 3: Setup Frontend

```bash
# Navigate to frontend directory
cd frontend

# Install dependencies
npm install

# Start development server
npm start
```

**Output yang diharapkan:**
```
Compiled successfully!
You can now view cafe-analytics-frontend in the browser.
http://localhost:3000
```

## Verification Checklist

- [ ] PostgreSQL running
- [ ] Database `cafe_analytics` created
- [ ] Backend dependencies installed
- [ ] Backend server running on port 5000
- [ ] Frontend dependencies installed
- [ ] Frontend running on port 3000

## First Login

1. Buka browser ke `http://localhost:3000`
2. Klik "Register here" untuk membuat akun baru
3. Isi form dengan data cafe/resto Anda
4. Login dengan email dan password

### Test Account (jika menggunakan sample data):
- Email: admin@cafeanalytics.com
- Password: (sesuai yang Anda set)

## Testing API dengan Postman (optional)

### 1. Register User
```
POST http://localhost:5000/api/auth/register
Content-Type: application/json

{
  "username": "testcafe",
  "email": "test@cafe.com",
  "password": "password123",
  "cafe_name": "Test Cafe"
}
```

### 2. Login
```
POST http://localhost:5000/api/auth/login
Content-Type: application/json

{
  "email": "test@cafe.com",
  "password": "password123"
}
```

Copy token dari response untuk request berikutnya.

### 3. Get Products
```
GET http://localhost:5000/api/products
Authorization: Bearer [YOUR_TOKEN]
```

## Troubleshooting

### Error: "connect ECONNREFUSED"
**Solusi:**
- Pastikan PostgreSQL service berjalan
- Windows: Services > PostgreSQL
- macOS: PostgreSQL app running
- Linux: `sudo systemctl start postgresql`

### Error: "relation does not exist"
**Solusi:**
```bash
# Run migration
npm run migrate
```

### Error: "Module not found"
**Solusi:**
```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install
```

### Port Already in Use
**Solusi:**
```bash
# Backend: Ubah API_PORT di .env

# Frontend: 
npm start -- --port 3001

# Atau kill process
# Windows: netstat -ano | findstr :5000
# macOS/Linux: lsof -i :5000
```

### Database Password Issues
**Solusi:**
```bash
# Reset PostgreSQL password
# Windows:
# 1. Open Services
# 2. Restart PostgreSQL
# 3. Login: psql -U postgres

# Reset password:
ALTER USER postgres PASSWORD 'new_password';
```

## File Structure Reminder

```
tugaswebback_1/
├── backend/
│   ├── config/
│   ├── routes/
│   ├── middleware/
│   ├── migrations/
│   ├── index.js
│   ├── package.json
│   └── .env
├── frontend/
│   ├── public/
│   ├── src/
│   └── package.json
├── database/
│   ├── schema.sql
│   └── sample_data.sql
└── docs/
```

## Environment Variables Reference

### Backend (.env)
```
DB_HOST          - Database host (default: localhost)
DB_PORT          - Database port (default: 5432)
DB_NAME          - Database name (default: cafe_analytics)
DB_USER          - Database user (default: postgres)
DB_PASSWORD      - Database password
API_PORT         - Backend API port (default: 5000)
NODE_ENV         - Environment (development/production)
JWT_SECRET       - Secret key untuk JWT token
JWT_EXPIRE       - Token expiration time
```

## Production Deployment Notes

Sebelum production:

1. **Database:**
   - Backup database reguler
   - Use strong password
   - Enable SSL connections

2. **Backend:**
   - Set NODE_ENV=production
   - Use strong JWT_SECRET
   - Enable HTTPS
   - Setup reverse proxy (nginx)
   - Monitor logs

3. **Frontend:**
   - Run `npm build` untuk production build
   - Deploy ke web server (Netlify, Vercel, etc)
   - Update API endpoint ke production URL

## Support

Jika ada masalah:
1. Check error messages carefully
2. Review logs di terminal
3. Verify database connectivity
4. Check port availability
5. Ensure all dependencies installed

Selamat! Project siap digunakan!
