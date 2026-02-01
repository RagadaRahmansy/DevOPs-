# API Documentation

## Base URL
```
http://localhost:5000/api
```

## Authentication
Semua endpoint (kecuali register & login) memerlukan JWT token di header:
```
Authorization: Bearer <token>
```

---

## Auth Endpoints

### Register
```
POST /auth/register
Content-Type: application/json

Body:
{
  "username": "string",
  "email": "string",
  "password": "string",
  "cafe_name": "string"
}

Response (201):
{
  "message": "User registered successfully",
  "user": {
    "id": 1,
    "username": "...",
    "email": "..."
  }
}
```

### Login
```
POST /auth/login
Content-Type: application/json

Body:
{
  "email": "string",
  "password": "string"
}

Response (200):
{
  "message": "Login successful",
  "token": "eyJhbGc...",
  "user": {
    "id": 1,
    "username": "...",
    "email": "...",
    "cafe_name": "..."
  }
}
```

---

## Products Endpoints

### Get All Products
```
GET /products
Headers: Authorization: Bearer <token>

Response (200):
[
  {
    "id": 1,
    "user_id": 1,
    "name": "Espresso",
    "category": "Beverages",
    "price": 25000,
    "cost": 8000,
    "description": "Classic Italian espresso",
    "created_at": "2024-01-15T10:00:00Z",
    "updated_at": "2024-01-15T10:00:00Z"
  },
  ...
]
```

### Create Product
```
POST /products
Headers: Authorization: Bearer <token>
Content-Type: application/json

Body:
{
  "name": "string",
  "category": "string",
  "price": number,
  "cost": number,
  "description": "string" (optional)
}

Response (201):
{
  "id": 2,
  "user_id": 1,
  "name": "Cappuccino",
  "category": "Beverages",
  "price": 35000,
  "cost": 12000,
  "created_at": "2024-01-15T10:05:00Z"
}
```

### Update Product
```
PUT /products/:id
Headers: Authorization: Bearer <token>
Content-Type: application/json

Body:
{
  "name": "string",
  "category": "string",
  "price": number,
  "cost": number,
  "description": "string"
}

Response (200):
{
  "id": 1,
  "user_id": 1,
  "name": "Updated Name",
  "price": 30000,
  "updated_at": "2024-01-15T11:00:00Z"
}
```

### Delete Product
```
DELETE /products/:id
Headers: Authorization: Bearer <token>

Response (200):
{
  "message": "Product deleted successfully"
}
```

---

## Sales Endpoints

### Get All Sales
```
GET /sales
Headers: Authorization: Bearer <token>
Query Parameters:
  - startDate: YYYY-MM-DD (optional)
  - endDate: YYYY-MM-DD (optional)

Response (200):
[
  {
    "id": 1,
    "user_id": 1,
    "product_id": 1,
    "customer_id": 1,
    "quantity": 2,
    "price": 25000,
    "total": 50000,
    "payment_method": "Cash",
    "notes": "Morning order",
    "created_at": "2024-01-15T08:30:00Z"
  },
  ...
]
```

### Create Sale
```
POST /sales
Headers: Authorization: Bearer <token>
Content-Type: application/json

Body:
{
  "product_id": number,
  "quantity": number,
  "price": number,
  "customer_id": number (optional),
  "payment_method": "Cash | Card | E-wallet",
  "notes": "string" (optional)
}

Response (201):
{
  "id": 2,
  "user_id": 1,
  "product_id": 1,
  "quantity": 2,
  "price": 25000,
  "total": 50000,
  "payment_method": "Cash",
  "created_at": "2024-01-15T08:35:00Z"
}
```

### Get Daily Sales Summary
```
GET /sales/summary/daily
Headers: Authorization: Bearer <token>
Query Parameters:
  - days: number (default: 30)

Response (200):
[
  {
    "date": "2024-01-15",
    "transaction_count": 15,
    "total_sales": 750000,
    "total_items": 45
  },
  {
    "date": "2024-01-14",
    "transaction_count": 18,
    "total_sales": 820000,
    "total_items": 52
  }
]
```

---

## Inventory Endpoints

### Get Inventory
```
GET /inventory
Headers: Authorization: Bearer <token>

Response (200):
[
  {
    "id": 1,
    "user_id": 1,
    "product_id": 1,
    "product_name": "Espresso",
    "quantity": 150,
    "min_stock": 20,
    "unit_price": 25000,
    "status": "in-stock",
    "created_at": "2024-01-15T10:00:00Z"
  },
  ...
]
```

### Update Stock
```
PUT /inventory/:id
Headers: Authorization: Bearer <token>
Content-Type: application/json

Body:
{
  "quantity": number,
  "status": "in-stock | low-stock | out-of-stock"
}

Response (200):
{
  "id": 1,
  "product_name": "Espresso",
  "quantity": 150,
  "status": "in-stock",
  "updated_at": "2024-01-15T11:00:00Z"
}
```

### Get Low Stock Items
```
GET /inventory/low-stock/items
Headers: Authorization: Bearer <token>
Query Parameters:
  - threshold: number (default: 10)

Response (200):
[
  {
    "id": 3,
    "product_name": "Latte",
    "quantity": 8,
    "min_stock": 20,
    "status": "low-stock"
  }
]
```

---

## Customers Endpoints

### Get All Customers
```
GET /customers
Headers: Authorization: Bearer <token>

Response (200):
[
  {
    "id": 1,
    "user_id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "08123456789",
    "address": "Jakarta",
    "loyalty_points": 100,
    "created_at": "2024-01-15T09:00:00Z"
  },
  ...
]
```

### Create Customer
```
POST /customers
Headers: Authorization: Bearer <token>
Content-Type: application/json

Body:
{
  "name": "string",
  "email": "string" (optional),
  "phone": "string" (optional),
  "address": "string" (optional)
}

Response (201):
{
  "id": 5,
  "user_id": 1,
  "name": "New Customer",
  "email": null,
  "phone": null,
  "loyalty_points": 0,
  "created_at": "2024-01-15T09:30:00Z"
}
```

### Get Customer Profile
```
GET /customers/:id/profile
Headers: Authorization: Bearer <token>

Response (200):
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "08123456789",
  "address": "Jakarta",
  "loyalty_points": 100,
  "purchases": [
    {
      "id": 1,
      "product_id": 1,
      "quantity": 2,
      "total": 50000,
      "created_at": "2024-01-15T08:30:00Z"
    }
  ],
  "total_spent": 250000,
  "total_transactions": 5
}
```

---

## Analytics Endpoints

### Revenue Summary
```
GET /analytics/revenue/summary
Headers: Authorization: Bearer <token>
Query Parameters:
  - days: number (default: 30)

Response (200):
{
  "total_revenue": 5250000,
  "avg_transaction": 350000,
  "total_transactions": 15,
  "trading_days": 12
}
```

### Top Products
```
GET /analytics/products/top
Headers: Authorization: Bearer <token>
Query Parameters:
  - limit: number (default: 10)

Response (200):
[
  {
    "id": 1,
    "name": "Cappuccino",
    "total_sold": 45,
    "total_quantity": 120,
    "total_revenue": 1575000
  },
  {
    "id": 2,
    "name": "Espresso",
    "total_sold": 38,
    "total_quantity": 95,
    "total_revenue": 950000
  }
]
```

### Top Customers
```
GET /analytics/customers/top
Headers: Authorization: Bearer <token>
Query Parameters:
  - limit: number (default: 10)

Response (200):
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "total_purchases": 25,
    "total_spent": 1250000,
    "avg_spent": 50000
  }
]
```

### Payment Methods Analysis
```
GET /analytics/payment/methods
Headers: Authorization: Bearer <token>

Response (200):
[
  {
    "payment_method": "Card",
    "total_transactions": 8,
    "total_amount": 420000,
    "avg_amount": 52500
  },
  {
    "payment_method": "Cash",
    "total_transactions": 5,
    "total_amount": 280000,
    "avg_amount": 56000
  }
]
```

### Hourly Sales Analysis
```
GET /analytics/sales/hourly
Headers: Authorization: Bearer <token>

Response (200):
[
  {
    "hour": 7,
    "transaction_count": 2,
    "total_sales": 85000
  },
  {
    "hour": 8,
    "transaction_count": 8,
    "total_sales": 420000
  },
  {
    "hour": 9,
    "transaction_count": 6,
    "total_sales": 360000
  }
]
```

---

## Error Responses

### Unauthorized (401)
```json
{
  "error": "Invalid token" | "No token provided"
}
```

### Not Found (404)
```json
{
  "error": "Product not found" | "Customer not found"
}
```

### Server Error (500)
```json
{
  "error": "Internal server error" | "[Error message]"
}
```

---

## Request/Response Examples

### Example 1: Complete Sale Flow
```bash
# 1. Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"user@cafe.com","password":"password"}'

# Response: {"token":"eyJhbGc...","user":{...}}

# 2. Create Sale
curl -X POST http://localhost:5000/api/sales \
  -H "Authorization: Bearer eyJhbGc..." \
  -H "Content-Type: application/json" \
  -d '{
    "product_id": 1,
    "quantity": 2,
    "price": 25000,
    "customer_id": 1,
    "payment_method": "Cash"
  }'

# 3. Get Analytics
curl -X GET http://localhost:5000/api/analytics/revenue/summary \
  -H "Authorization: Bearer eyJhbGc..." \
  -H "Content-Type: application/json"
```

---

## Rate Limiting & Best Practices

- Tidak ada rate limiting di development
- Pada production, implementasikan rate limiting
- Batch requests jika memungkinkan
- Cache response data di client-side
- Gunakan pagination untuk large datasets

---

## Changelog

### v1.0.0
- Initial release
- Auth, Products, Sales, Inventory, Customers
- Analytics endpoints
