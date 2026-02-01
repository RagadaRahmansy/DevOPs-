# Cafe & Restaurant Analytics System

## Directory Structure Guide

### /backend
Node.js Express API server untuk menangani semua business logic

```
backend/
├── config/              # Konfigurasi aplikasi
│   └── database.js      # Database connection pool
├── routes/              # API route handlers
│   ├── auth.js          # Authentication routes
│   ├── products.js      # Product management
│   ├── sales.js         # Sales tracking
│   ├── inventory.js     # Inventory management
│   ├── customers.js     # Customer management
│   └── analytics.js     # Analytics & reporting
├── middleware/          # Custom middleware
│   └── auth.js          # JWT authentication
├── migrations/          # Database migrations
│   └── migrate.js       # Create tables & schema
├── index.js             # Server entry point
├── package.json         # Dependencies
├── .env.example         # Environment variables template
└── .env                 # Your environment config (not in git)
```

### /frontend
React dashboard untuk visualisasi data

```
frontend/
├── public/              # Static files
│   └── index.html       # HTML template
├── src/
│   ├── styles/          # CSS stylesheets
│   │   ├── Auth.css     # Login/Register styles
│   │   └── Dashboard.css # Dashboard styles
│   ├── api.js           # API client wrapper
│   ├── Auth.js          # Login & Register components
│   ├── Dashboard.js     # Main dashboard component
│   ├── App.js           # Main app component
│   ├── index.js         # React entry point
│   └── index.css        # Global styles
├── package.json         # Dependencies
└── .env                 # Frontend config (optional)
```

### /database
Database schema dan sample data

```
database/
├── schema.sql           # Database schema creation
└── sample_data.sql      # Sample data for testing
```

### /docs
Dokumentasi lengkap

```
docs/
├── README.md            # Features & overview
├── SETUP.md             # Installation guide
└── API.md               # API documentation
```

### Root Level
```
.
├── README.md            # Main project readme
├── package.json         # Root package.json
└── .gitignore           # Git ignore file
```

## Installation Order

1. **Database Setup**
   - Create PostgreSQL database
   - Run schema.sql
   - Import sample_data.sql

2. **Backend Setup**
   - Navigate to /backend
   - Copy .env.example to .env
   - npm install
   - npm run migrate
   - npm run dev

3. **Frontend Setup**
   - Navigate to /frontend (new terminal)
   - npm install
   - npm start

## File Descriptions

### Backend Key Files

- **index.js**: Main server file, express app setup
- **config/database.js**: PostgreSQL connection pool
- **middleware/auth.js**: JWT token verification
- **routes/**: All API endpoints organized by feature
- **migrations/migrate.js**: Database table creation

### Frontend Key Files

- **api.js**: Axios wrapper untuk API calls
- **Auth.js**: Login dan Register components
- **Dashboard.js**: Main dashboard with charts
- **App.js**: React Router configuration
- **styles/**: CSS for different pages

### Database Files

- **schema.sql**: CREATE TABLE statements
- **sample_data.sql**: INSERT sample records

## Environment Files

### backend/.env
```
DB_HOST=localhost
DB_PORT=5432
DB_NAME=cafe_analytics
DB_USER=postgres
DB_PASSWORD=your_password
API_PORT=5000
JWT_SECRET=your_secret_key
```

### frontend/.env (optional)
```
REACT_APP_API_URL=http://localhost:5000/api
```

## Quick Commands

```bash
# From root directory

# Install all dependencies
npm run install-all

# Run backend
npm run backend

# Run frontend
npm run frontend

# Run migrations
npm run migrate

# From backend directory
npm run dev         # Development mode
npm start           # Production mode
npm run migrate     # Run migrations

# From frontend directory
npm start           # Start dev server
npm build           # Build for production
npm test            # Run tests
```

## Important Notes

1. **Never commit .env files** - Use .env.example as template
2. **Backend must run first** - Frontend depends on API
3. **PostgreSQL must be running** - Before starting backend
4. **Use different terminals** - Run backend and frontend in separate terminals
5. **Port 5000 and 3000** - Make sure these ports are available

## Architecture Overview

```
┌─────────────────┐
│   React App     │
│  :3000          │
└────────┬────────┘
         │ (HTTP/REST)
         │
┌────────▼────────────────┐
│ Express API Server      │
│ :5000                   │
├─────────────────────────┤
│ - Auth routes           │
│ - Product CRUD          │
│ - Sales tracking        │
│ - Analytics endpoints   │
└────────┬────────────────┘
         │ (SQL)
┌────────▼────────────────┐
│  PostgreSQL Database    │
│  cafe_analytics         │
├─────────────────────────┤
│ - users                 │
│ - products              │
│ - sales                 │
│ - customers             │
│ - inventory             │
└─────────────────────────┘
```

## Development Workflow

1. **Frontend Development**
   - Modify React components in /frontend/src
   - Hot reload on save
   - Test in browser at :3000

2. **Backend Development**
   - Modify routes in /backend/routes
   - Modify database queries
   - Test with Postman or curl
   - Nodemon auto-restarts on file changes

3. **Database Changes**
   - Modify schema.sql
   - Run migrations: npm run migrate
   - Restart backend

## Debugging Tips

- **Frontend**: Use browser DevTools (F12)
- **Backend**: Check console logs in terminal
- **Database**: Use psql command line or DBeaver
- **API**: Use Postman or Insomnia for testing

## Performance Considerations

- Database indexes on frequently queried columns
- Connection pooling for database
- React component memoization for charts
- Lazy loading for routes
- Client-side caching of API responses

---

Untuk lebih detail, lihat dokumentasi di /docs/
