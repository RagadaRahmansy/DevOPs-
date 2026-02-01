-- Data Dummy untuk User Baru: ragaskal123@gmail.com
-- Script ini akan auto-assign ke user ID berdasarkan email

-- Get user ID dari email (untuk reference di script ini)
-- SELECT id FROM users WHERE email = 'ragaskal123@gmail.com';

-- Insert Products untuk user baru
INSERT INTO products (user_id, name, category, price, cost, description) 
SELECT id, 'Espresso Single Shot', 'Coffee', 20000, 5000, 'Classic espresso shot' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Espresso Double Shot', 'Coffee', 28000, 7000, 'Double espresso' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Americano', 'Coffee', 22000, 6000, 'Espresso with hot water' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Cappuccino', 'Coffee', 32000, 10000, 'Espresso with steamed milk' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Latte', 'Coffee', 35000, 11000, 'Smooth and creamy' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Macchiato', 'Coffee', 30000, 9000, 'Espresso with milk foam' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Flat White', 'Coffee', 35000, 11000, 'Velvety microfoam' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Mocha', 'Coffee', 38000, 12000, 'Coffee with chocolate' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Caramel Latte', 'Coffee', 40000, 13000, 'Latte with caramel' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Vanilla Latte', 'Coffee', 38000, 12000, 'Latte with vanilla' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Iced Americano', 'Iced Coffee', 25000, 7000, 'Cold americano' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Iced Latte', 'Iced Coffee', 35000, 11000, 'Cold latte' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Iced Cappuccino', 'Iced Coffee', 35000, 11000, 'Cold cappuccino' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Iced Mocha', 'Iced Coffee', 40000, 13000, 'Cold mocha' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Fresh Orange Juice', 'Beverages', 28000, 8000, 'Freshly squeezed' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Mango Juice', 'Beverages', 30000, 9000, 'Fresh mango juice' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Smoothie Banana', 'Beverages', 35000, 12000, 'Banana smoothie' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Smoothie Strawberry', 'Beverages', 38000, 13000, 'Strawberry smoothie' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Croissant Butter', 'Pastry', 45000, 15000, 'Fresh butter croissant' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Pain au Chocolate', 'Pastry', 50000, 16000, 'Chocolate pastry' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Almond Croissant', 'Pastry', 52000, 17000, 'Almond croissant' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Donut Glazed', 'Pastry', 35000, 10000, 'Classic glazed donut' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Donut Chocolate', 'Pastry', 38000, 11000, 'Chocolate donut' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Chocolate Cake', 'Cake', 60000, 20000, 'Rich chocolate cake' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Cheesecake', 'Cake', 65000, 22000, 'New York cheesecake' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Carrot Cake', 'Cake', 55000, 18000, 'Moist carrot cake' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Lemon Cake', 'Cake', 50000, 17000, 'Zesty lemon cake' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Red Velvet Cake', 'Cake', 70000, 23000, 'Red velvet classic' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Sandwich Ham & Cheese', 'Food', 55000, 18000, 'Classic sandwich' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Club Sandwich', 'Food', 65000, 22000, 'Triple decker' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Panini Caprese', 'Food', 60000, 20000, 'Tomato mozzarella' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Caesar Salad', 'Food', 50000, 15000, 'With grilled chicken' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Blueberry Muffin', 'Pastry', 40000, 13000, 'Fresh blueberry' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Banana Bread', 'Pastry', 38000, 12000, 'Homemade banana bread' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Cookies Chocolate Chip', 'Pastry', 25000, 8000, 'Pack of 3' FROM users WHERE email = 'ragaskal123@gmail.com';

-- Insert Customers untuk user baru
INSERT INTO customers (user_id, name, email, phone, address, loyalty_points)
SELECT id, 'Budi Santoso', 'budi@email.com', '08123456789', 'Jl. Merdeka, Jakarta', 500 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Siti Nurhaliza', 'siti@email.com', '08234567890', 'Jl. Sudirman, Jakarta', 450 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Ahmad Wijaya', 'ahmad@email.com', '08345678901', 'Jl. Gatot Subroto, Jakarta', 380 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Dewi Lestari', 'dewi@email.com', '08456789012', 'Jl. Pemuda, Jakarta', 420 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Rinto Harahap', 'rinto@email.com', '08567890123', 'Jl. Ahmad Yani, Jakarta', 350 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Lisa Manobal', 'lisa@email.com', '08678901234', 'Jl. Diponegoro, Jakarta', 480 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Bambang Irawan', 'bambang@email.com', '08789012345', 'Jl. Thamrin, Jakarta', 300 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Citra Dewi', 'citra@email.com', '08890123456', 'Jl. Rasuna Said, Jakarta', 410 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Eko Prasetyo', 'eko@email.com', '08901234567', 'Jl. Hayam Wuruk, Jakarta', 290 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Fatimah Rahman', 'fatimah@email.com', '08012345678', 'Jl. Imam Bonjol, Jakarta', 360 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Gita Saputra', 'gita@email.com', '08123344556', 'Jl. Dr. Satrio, Jakarta', 400 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Hendro Kristanto', 'hendro@email.com', '08234455667', 'Jl. Kuningan, Jakarta', 320 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Iris Kusuma', 'iris@email.com', '08345566778', 'Jl. Benda, Jakarta', 370 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Jaka Pratama', 'jaka@email.com', '08456677889', 'Jl. Wolter Monginsidi, Jakarta', 440 FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Kartini Mustika', 'kartini@email.com', '08567788990', 'Jl. Senayan, Jakarta', 390 FROM users WHERE email = 'ragaskal123@gmail.com';

-- Insert Sales Data untuk user baru (50 transaksi)
-- Week 1
INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at)
SELECT u.id, p.id, c.id, 2, 35000, 70000, 'Cash', 'Morning regular', '2026-01-15 08:15:00'
FROM users u, products p, customers c 
WHERE u.email = 'ragaskal123@gmail.com' AND p.name = 'Latte' AND c.name = 'Budi Santoso' AND c.user_id = u.id
UNION ALL SELECT u.id, p.id, c.id, 1, 22000, 22000, 'Card', '', '2026-01-15 09:30:00'
FROM users u, products p, customers c 
WHERE u.email = 'ragaskal123@gmail.com' AND p.name = 'Americano' AND c.name = 'Siti Nurhaliza' AND c.user_id = u.id
UNION ALL SELECT u.id, p.id, c.id, 1, 45000, 45000, 'Cash', '', '2026-01-15 10:00:00'
FROM users u, products p, customers c 
WHERE u.email = 'ragaskal123@gmail.com' AND p.name = 'Croissant Butter' AND c.name = 'Ahmad Wijaya' AND c.user_id = u.id
UNION ALL SELECT u.id, p.id, c.id, 2, 35000, 70000, 'E-wallet', '', '2026-01-15 11:00:00'
FROM users u, products p, customers c 
WHERE u.email = 'ragaskal123@gmail.com' AND p.name = 'Flat White' AND c.name = 'Dewi Lestari' AND c.user_id = u.id
UNION ALL SELECT u.id, p.id, c.id, 1, 32000, 32000, 'Card', '', '2026-01-15 12:30:00'
FROM users u, products p, customers c 
WHERE u.email = 'ragaskal123@gmail.com' AND p.name = 'Cappuccino' AND c.name = 'Rinto Harahap' AND c.user_id = u.id;

-- Insert lebih banyak sales (simplified approach)
-- We'll use a more direct approach with multiple inserts for the new user

-- Create temp table to hold user and product IDs
DO $$
DECLARE
  v_user_id INT;
BEGIN
  SELECT id INTO v_user_id FROM users WHERE email = 'ragaskal123@gmail.com';
  
  IF v_user_id IS NOT NULL THEN
    -- Insert sales transactions
    INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at)
    VALUES 
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Latte' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Budi Santoso' LIMIT 1), 1, 35000, 35000, 'Cash', '', '2026-01-15 08:15:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Americano' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Siti Nurhaliza' LIMIT 1), 1, 22000, 22000, 'Card', '', '2026-01-15 09:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Cappuccino' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Ahmad Wijaya' LIMIT 1), 2, 32000, 64000, 'E-wallet', '', '2026-01-15 10:45:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Croissant Butter' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Dewi Lestari' LIMIT 1), 1, 45000, 45000, 'Cash', '', '2026-01-15 11:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Mocha' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Rinto Harahap' LIMIT 1), 1, 38000, 38000, 'Card', '', '2026-01-15 12:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Iced Latte' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Lisa Manobal' LIMIT 1), 2, 35000, 70000, 'E-wallet', '', '2026-01-15 14:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Chocolate Cake' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Bambang Irawan' LIMIT 1), 1, 60000, 60000, 'Cash', 'Birthday', '2026-01-15 15:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Caesar Salad' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Citra Dewi' LIMIT 1), 1, 50000, 50000, 'Card', '', '2026-01-16 08:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Espresso Double Shot' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Eko Prasetyo' LIMIT 1), 3, 28000, 84000, 'E-wallet', 'Office order', '2026-01-16 09:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Pain au Chocolate' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Fatimah Rahman' LIMIT 1), 2, 50000, 100000, 'Cash', '', '2026-01-16 10:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Vanilla Latte' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Gita Saputra' LIMIT 1), 1, 38000, 38000, 'Card', '', '2026-01-16 11:15:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Macchiato' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Hendro Kristanto' LIMIT 1), 2, 30000, 60000, 'E-wallet', '', '2026-01-16 12:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Club Sandwich' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Iris Kusuma' LIMIT 1), 1, 65000, 65000, 'Cash', '', '2026-01-16 13:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Iced Cappuccino' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Jaka Pratama' LIMIT 1), 1, 35000, 35000, 'Card', '', '2026-01-16 14:45:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Fresh Orange Juice' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Kartini Mustika' LIMIT 1), 2, 28000, 56000, 'E-wallet', '', '2026-01-16 15:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Cheesecake' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Budi Santoso' LIMIT 1), 1, 65000, 65000, 'Cash', '', '2026-01-17 08:15:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Latte' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Siti Nurhaliza' LIMIT 1), 2, 35000, 70000, 'Card', '', '2026-01-17 09:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Panini Caprese' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Ahmad Wijaya' LIMIT 1), 1, 60000, 60000, 'E-wallet', '', '2026-01-17 10:45:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Smoothie Banana' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Dewi Lestari' LIMIT 1), 2, 35000, 70000, 'Cash', '', '2026-01-17 11:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Donut Chocolate' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Rinto Harahap' LIMIT 1), 3, 38000, 114000, 'Card', '', '2026-01-17 12:15:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Cappuccino' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Lisa Manobal' LIMIT 1), 1, 32000, 32000, 'E-wallet', '', '2026-01-17 13:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Blueberry Muffin' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Bambang Irawan' LIMIT 1), 2, 40000, 80000, 'Cash', '', '2026-01-17 14:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Americano' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Citra Dewi' LIMIT 1), 1, 22000, 22000, 'Card', '', '2026-01-17 15:15:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Mango Juice' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Eko Prasetyo' LIMIT 1), 1, 30000, 30000, 'E-wallet', '', '2026-01-18 08:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Carrot Cake' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Fatimah Rahman' LIMIT 1), 1, 55000, 55000, 'Cash', '', '2026-01-18 09:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Flat White' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Gita Saputra' LIMIT 1), 2, 35000, 70000, 'Card', '', '2026-01-18 10:45:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Sandwich Ham & Cheese' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Hendro Kristanto' LIMIT 1), 1, 55000, 55000, 'E-wallet', '', '2026-01-18 11:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Iced Americano' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Iris Kusuma' LIMIT 1), 1, 25000, 25000, 'Cash', '', '2026-01-18 12:00:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Lemon Cake' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Jaka Pratama' LIMIT 1), 1, 50000, 50000, 'Card', '', '2026-01-18 13:30:00'),
      (v_user_id, (SELECT id FROM products WHERE user_id = v_user_id AND name = 'Espresso Single Shot' LIMIT 1), (SELECT id FROM customers WHERE user_id = v_user_id AND name = 'Kartini Mustika' LIMIT 1), 4, 20000, 80000, 'E-wallet', 'Office order', '2026-01-18 14:15:00');
  END IF;
END $$;

-- Insert Inventory untuk user baru
INSERT INTO inventory (user_id, product_name, quantity, min_stock, unit_price, status)
SELECT u.id, p.name, 100, 20, p.price, 'in-stock'
FROM users u, products p
WHERE u.email = 'ragaskal123@gmail.com' AND p.user_id = u.id;

-- Insert Expenses untuk user baru
INSERT INTO expenses (user_id, category, amount, description, created_at)
SELECT id, 'Rent', 10000000, 'Monthly rent', '2026-01-15' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Staff Salary', 15000000, 'Monthly salary for staff', '2026-01-15' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Coffee Beans', 3000000, 'Premium beans', '2026-01-15' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Utilities', 1500000, 'Water, electricity, internet', '2026-01-15' FROM users WHERE email = 'ragaskal123@gmail.com'
UNION ALL SELECT id, 'Supplies', 1000000, 'Cups, napkins, packaging', '2026-01-15' FROM users WHERE email = 'ragaskal123@gmail.com';
