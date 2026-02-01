-- Data Dummy Realistis untuk Testing Analytics
-- Cafe dengan data penjualan selama sebulan

-- Clear existing data (optional - uncomment jika ingin reset)
-- DELETE FROM sales;
-- DELETE FROM inventory;
-- DELETE FROM products;
-- DELETE FROM customers;
-- DELETE FROM expenses;
-- DELETE FROM users;
-- ALTER SEQUENCE users_id_seq RESTART WITH 1;

-- Insert Users (Cafe/Restoran)
INSERT INTO users (username, email, password, cafe_name) VALUES
('owner_kopi_nikmat', 'owner@kopinikmat.com', '$2a$10$encrypted1', 'Kopi Nikmat');

-- Get user_id for reference
-- SELECT id FROM users WHERE username = 'owner_kopi_nikmat'; -- Should be 1

-- Insert Products (lebih realistis dan banyak)
INSERT INTO products (user_id, name, category, price, cost, description) VALUES
(1, 'Espresso Single Shot', 'Coffee', 20000, 5000, 'Classic espresso shot'),
(1, 'Espresso Double Shot', 'Coffee', 28000, 7000, 'Double espresso'),
(1, 'Americano', 'Coffee', 22000, 6000, 'Espresso with hot water'),
(1, 'Cappuccino', 'Coffee', 32000, 10000, 'Espresso with steamed milk'),
(1, 'Latte', 'Coffee', 35000, 11000, 'Smooth and creamy'),
(1, 'Macchiato', 'Coffee', 30000, 9000, 'Espresso with milk foam'),
(1, 'Flat White', 'Coffee', 35000, 11000, 'Velvety microfoam'),
(1, 'Mocha', 'Coffee', 38000, 12000, 'Coffee with chocolate'),
(1, 'Caramel Latte', 'Coffee', 40000, 13000, 'Latte with caramel'),
(1, 'Vanilla Latte', 'Coffee', 38000, 12000, 'Latte with vanilla'),

(1, 'Iced Americano', 'Iced Coffee', 25000, 7000, 'Cold americano'),
(1, 'Iced Latte', 'Iced Coffee', 35000, 11000, 'Cold latte'),
(1, 'Iced Cappuccino', 'Iced Coffee', 35000, 11000, 'Cold cappuccino'),
(1, 'Iced Mocha', 'Iced Coffee', 40000, 13000, 'Cold mocha'),

(1, 'Fresh Orange Juice', 'Beverages', 28000, 8000, 'Freshly squeezed'),
(1, 'Mango Juice', 'Beverages', 30000, 9000, 'Fresh mango juice'),
(1, 'Smoothie Banana', 'Beverages', 35000, 12000, 'Banana smoothie'),
(1, 'Smoothie Strawberry', 'Beverages', 38000, 13000, 'Strawberry smoothie'),

(1, 'Croissant Butter', 'Pastry', 45000, 15000, 'Fresh butter croissant'),
(1, 'Pain au Chocolate', 'Pastry', 50000, 16000, 'Chocolate pastry'),
(1, 'Almond Croissant', 'Pastry', 52000, 17000, 'Almond croissant'),
(1, 'Donut Glazed', 'Pastry', 35000, 10000, 'Classic glazed donut'),
(1, 'Donut Chocolate', 'Pastry', 38000, 11000, 'Chocolate donut'),

(1, 'Chocolate Cake', 'Cake', 60000, 20000, 'Rich chocolate cake'),
(1, 'Cheesecake', 'Cake', 65000, 22000, 'New York cheesecake'),
(1, 'Carrot Cake', 'Cake', 55000, 18000, 'Moist carrot cake'),
(1, 'Lemon Cake', 'Cake', 50000, 17000, 'Zesty lemon cake'),
(1, 'Red Velvet Cake', 'Cake', 70000, 23000, 'Red velvet classic'),

(1, 'Sandwich Ham & Cheese', 'Food', 55000, 18000, 'Classic sandwich'),
(1, 'Club Sandwich', 'Food', 65000, 22000, 'Triple decker'),
(1, 'Panini Caprese', 'Food', 60000, 20000, 'Tomato mozzarella'),
(1, 'Caesar Salad', 'Food', 50000, 15000, 'With grilled chicken'),

(1, 'Blueberry Muffin', 'Pastry', 40000, 13000, 'Fresh blueberry'),
(1, 'Banana Bread', 'Pastry', 38000, 12000, 'Homemade banana bread'),
(1, 'Cookies Chocolate Chip', 'Pastry', 25000, 8000, 'Pack of 3');

-- Insert Customers (lebih banyak dan realistic)
INSERT INTO customers (user_id, name, email, phone, address, loyalty_points) VALUES
(1, 'Budi Santoso', 'budi@email.com', '08123456789', 'Jl. Merdeka, Jakarta', 500),
(1, 'Siti Nurhaliza', 'siti@email.com', '08234567890', 'Jl. Sudirman, Jakarta', 450),
(1, 'Ahmad Wijaya', 'ahmad@email.com', '08345678901', 'Jl. Gatot Subroto, Jakarta', 380),
(1, 'Dewi Lestari', 'dewi@email.com', '08456789012', 'Jl. Pemuda, Jakarta', 420),
(1, 'Rinto Harahap', 'rinto@email.com', '08567890123', 'Jl. Ahmad Yani, Jakarta', 350),
(1, 'Lisa Manobal', 'lisa@email.com', '08678901234', 'Jl. Diponegoro, Jakarta', 480),
(1, 'Bambang Irawan', 'bambang@email.com', '08789012345', 'Jl. Thamrin, Jakarta', 300),
(1, 'Citra Dewi', 'citra@email.com', '08890123456', 'Jl. Rasuna Said, Jakarta', 410),
(1, 'Eko Prasetyo', 'eko@email.com', '08901234567', 'Jl. Hayam Wuruk, Jakarta', 290),
(1, 'Fatimah Rahman', 'fatimah@email.com', '08012345678', 'Jl. Imam Bonjol, Jakarta', 360),
(1, 'Gita Saputra', 'gita@email.com', '08123344556', 'Jl. Dr. Satrio, Jakarta', 400),
(1, 'Hendro Kristanto', 'hendro@email.com', '08234455667', 'Jl. Kuningan, Jakarta', 320),
(1, 'Iris Kusuma', 'iris@email.com', '08345566778', 'Jl. Benda, Jakarta', 370),
(1, 'Jaka Pratama', 'jaka@email.com', '08456677889', 'Jl. Wolter Monginsidi, Jakarta', 440),
(1, 'Kartini Mustika', 'kartini@email.com', '08567788990', 'Jl. Senayan, Jakarta', 390);

-- Insert Sales Transactions (realistic dengan dates spread selama bulan)
-- Week 1
INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at) VALUES
(1, 5, 1, 2, 35000, 70000, 'Cash', 'Morning regular customer', '2026-01-01 08:15:00'),
(1, 3, 2, 1, 22000, 22000, 'Card', '', '2026-01-01 09:30:00'),
(1, 20, 3, 1, 45000, 45000, 'Cash', '', '2026-01-01 10:00:00'),
(1, 7, 4, 2, 35000, 70000, 'E-wallet', '', '2026-01-01 11:00:00'),
(1, 4, 5, 1, 32000, 32000, 'Card', '', '2026-01-01 12:30:00'),

(1, 6, 6, 2, 30000, 60000, 'Cash', '', '2026-01-02 07:45:00'),
(1, 15, 7, 1, 28000, 28000, 'Card', '', '2026-01-02 09:00:00'),
(1, 8, 8, 1, 38000, 38000, 'E-wallet', '', '2026-01-02 10:15:00'),
(1, 2, 9, 2, 28000, 56000, 'Cash', '', '2026-01-02 14:30:00'),
(1, 24, 10, 2, 60000, 120000, 'Card', 'Birthday cake', '2026-01-02 16:00:00'),

(1, 5, 1, 1, 35000, 35000, 'E-wallet', '', '2026-01-03 08:00:00'),
(1, 9, 2, 1, 40000, 40000, 'Cash', '', '2026-01-03 09:30:00'),
(1, 3, 3, 3, 22000, 66000, 'Card', '', '2026-01-03 11:00:00'),
(1, 21, 4, 1, 52000, 52000, 'E-wallet', '', '2026-01-03 12:00:00'),
(1, 12, 5, 2, 35000, 70000, 'Cash', '', '2026-01-03 15:30:00'),

(1, 4, 6, 1, 32000, 32000, 'Card', '', '2026-01-04 08:30:00'),
(1, 13, 7, 1, 35000, 35000, 'E-wallet', '', '2026-01-04 09:45:00'),
(1, 26, 8, 1, 65000, 65000, 'Cash', '', '2026-01-04 11:00:00'),
(1, 8, 9, 2, 38000, 76000, 'Card', '', '2026-01-04 13:30:00'),
(1, 19, 10, 2, 50000, 100000, 'E-wallet', '', '2026-01-04 15:00:00'),

(1, 1, 11, 3, 20000, 60000, 'Cash', 'Office order', '2026-01-05 08:00:00'),
(1, 5, 12, 1, 35000, 35000, 'Card', '', '2026-01-05 09:15:00'),
(1, 10, 13, 1, 38000, 38000, 'E-wallet', '', '2026-01-05 10:30:00'),
(1, 22, 14, 1, 55000, 55000, 'Cash', '', '2026-01-05 12:00:00'),
(1, 14, 15, 2, 40000, 80000, 'Card', '', '2026-01-05 16:00:00'),

(1, 6, 1, 2, 30000, 60000, 'E-wallet', '', '2026-01-06 07:30:00'),
(1, 2, 2, 1, 28000, 28000, 'Cash', '', '2026-01-06 09:00:00'),
(1, 11, 3, 1, 25000, 25000, 'Card', '', '2026-01-06 10:15:00'),
(1, 25, 4, 1, 70000, 70000, 'E-wallet', '', '2026-01-06 13:00:00'),
(1, 20, 5, 3, 45000, 135000, 'Cash', '', '2026-01-06 14:30:00'),

(1, 7, 6, 2, 35000, 70000, 'Card', '', '2026-01-07 08:00:00'),
(1, 3, 7, 2, 22000, 44000, 'E-wallet', '', '2026-01-07 09:30:00'),
(1, 9, 8, 1, 40000, 40000, 'Cash', '', '2026-01-07 11:00:00'),
(1, 27, 9, 1, 60000, 60000, 'Card', '', '2026-01-07 12:30:00'),
(1, 4, 10, 2, 32000, 64000, 'E-wallet', '', '2026-01-07 15:00:00');

-- Week 2
INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at) VALUES
(1, 5, 1, 1, 35000, 35000, 'Cash', '', '2026-01-08 08:15:00'),
(1, 8, 2, 2, 38000, 76000, 'Card', '', '2026-01-08 10:00:00'),
(1, 21, 3, 1, 52000, 52000, 'E-wallet', '', '2026-01-08 11:30:00'),
(1, 24, 4, 1, 60000, 60000, 'Cash', 'Celebration order', '2026-01-08 14:00:00'),

(1, 1, 5, 4, 20000, 80000, 'Card', 'Office daily order', '2026-01-09 07:30:00'),
(1, 6, 6, 2, 30000, 60000, 'E-wallet', '', '2026-01-09 09:00:00'),
(1, 12, 7, 1, 35000, 35000, 'Cash', '', '2026-01-09 10:15:00'),
(1, 22, 8, 1, 55000, 55000, 'Card', '', '2026-01-09 12:00:00'),

(1, 4, 9, 3, 32000, 96000, 'E-wallet', '', '2026-01-10 08:00:00'),
(1, 10, 10, 1, 38000, 38000, 'Cash', '', '2026-01-10 09:30:00'),
(1, 19, 11, 2, 50000, 100000, 'Card', '', '2026-01-10 11:00:00'),
(1, 25, 12, 1, 70000, 70000, 'E-wallet', '', '2026-01-10 13:30:00'),

(1, 3, 13, 2, 22000, 44000, 'Cash', '', '2026-01-11 08:30:00'),
(1, 7, 14, 1, 35000, 35000, 'Card', '', '2026-01-11 10:00:00'),
(1, 11, 15, 1, 25000, 25000, 'E-wallet', '', '2026-01-11 11:15:00'),
(1, 26, 1, 1, 65000, 65000, 'Cash', '', '2026-01-11 13:00:00'),

(1, 2, 2, 2, 28000, 56000, 'Card', '', '2026-01-12 07:45:00'),
(1, 5, 3, 1, 35000, 35000, 'E-wallet', '', '2026-01-12 09:15:00'),
(1, 9, 4, 1, 40000, 40000, 'Cash', '', '2026-01-12 10:30:00'),
(1, 20, 5, 2, 45000, 90000, 'Card', '', '2026-01-12 14:00:00'),

(1, 6, 6, 3, 30000, 90000, 'E-wallet', '', '2026-01-13 08:00:00'),
(1, 1, 7, 3, 20000, 60000, 'Cash', 'Team meeting order', '2026-01-13 09:00:00'),
(1, 8, 8, 1, 38000, 38000, 'Card', '', '2026-01-13 11:00:00'),
(1, 24, 9, 1, 60000, 60000, 'E-wallet', 'Group celebration', '2026-01-13 14:30:00'),

(1, 4, 10, 1, 32000, 32000, 'Cash', '', '2026-01-14 08:30:00'),
(1, 13, 11, 1, 35000, 35000, 'Card', '', '2026-01-14 10:00:00'),
(1, 22, 12, 1, 55000, 55000, 'E-wallet', '', '2026-01-14 12:00:00'),
(1, 3, 13, 2, 22000, 44000, 'Cash', '', '2026-01-14 15:00:00');

-- Week 3
INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at) VALUES
(1, 5, 14, 2, 35000, 70000, 'Card', '', '2026-01-15 08:15:00'),
(1, 7, 15, 1, 35000, 35000, 'E-wallet', '', '2026-01-15 09:30:00'),
(1, 27, 1, 1, 60000, 60000, 'Cash', '', '2026-01-15 11:00:00'),
(1, 10, 2, 1, 38000, 38000, 'Card', '', '2026-01-15 13:30:00'),

(1, 1, 3, 4, 20000, 80000, 'E-wallet', 'Meeting order', '2026-01-16 07:30:00'),
(1, 6, 4, 2, 30000, 60000, 'Cash', '', '2026-01-16 09:00:00'),
(1, 11, 5, 1, 25000, 25000, 'Card', '', '2026-01-16 10:15:00'),
(1, 25, 6, 1, 70000, 70000, 'E-wallet', '', '2026-01-16 14:00:00'),

(1, 4, 7, 2, 32000, 64000, 'Cash', '', '2026-01-17 08:00:00'),
(1, 9, 8, 1, 40000, 40000, 'Card', '', '2026-01-17 09:30:00'),
(1, 19, 9, 1, 50000, 50000, 'E-wallet', '', '2026-01-17 11:00:00'),
(1, 21, 10, 1, 52000, 52000, 'Cash', '', '2026-01-17 12:30:00'),

(1, 2, 11, 2, 28000, 56000, 'Card', '', '2026-01-18 08:30:00'),
(1, 5, 12, 1, 35000, 35000, 'E-wallet', '', '2026-01-18 10:00:00'),
(1, 8, 13, 1, 38000, 38000, 'Cash', '', '2026-01-18 11:15:00'),
(1, 24, 14, 1, 60000, 60000, 'Card', '', '2026-01-18 13:00:00'),

(1, 6, 15, 3, 30000, 90000, 'E-wallet', '', '2026-01-19 08:00:00'),
(1, 3, 1, 2, 22000, 44000, 'Cash', '', '2026-01-19 09:15:00'),
(1, 7, 2, 1, 35000, 35000, 'Card', '', '2026-01-19 10:30:00'),
(1, 20, 3, 2, 45000, 90000, 'E-wallet', '', '2026-01-19 14:00:00'),

(1, 1, 4, 3, 20000, 60000, 'Cash', 'Standup meeting order', '2026-01-20 08:00:00'),
(1, 4, 5, 1, 32000, 32000, 'Card', '', '2026-01-20 09:30:00'),
(1, 12, 6, 1, 35000, 35000, 'E-wallet', '', '2026-01-20 11:00:00'),
(1, 26, 7, 1, 65000, 65000, 'Cash', '', '2026-01-20 13:30:00'),

(1, 5, 8, 1, 35000, 35000, 'Card', '', '2026-01-21 08:30:00'),
(1, 10, 9, 1, 38000, 38000, 'E-wallet', '', '2026-01-21 10:00:00'),
(1, 9, 10, 1, 40000, 40000, 'Cash', '', '2026-01-21 11:15:00'),
(1, 22, 11, 1, 55000, 55000, 'Card', '', '2026-01-21 12:00:00');

-- Week 4
INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes, created_at) VALUES
(1, 2, 12, 2, 28000, 56000, 'E-wallet', '', '2026-01-22 08:15:00'),
(1, 6, 13, 2, 30000, 60000, 'Cash', '', '2026-01-22 09:30:00'),
(1, 11, 14, 1, 25000, 25000, 'Card', '', '2026-01-22 10:45:00'),
(1, 25, 15, 1, 70000, 70000, 'E-wallet', '', '2026-01-22 13:00:00'),
(1, 1, 1, 4, 20000, 80000, 'Cash', 'Office order', '2026-01-22 14:30:00');

-- Insert Inventory (realistis)
INSERT INTO inventory (user_id, product_id, product_name, quantity, min_stock, unit_price, status) VALUES
(1, 1, 'Espresso Single Shot', 250, 50, 20000, 'in-stock'),
(1, 2, 'Espresso Double Shot', 200, 40, 28000, 'in-stock'),
(1, 3, 'Americano', 280, 60, 22000, 'in-stock'),
(1, 4, 'Cappuccino', 150, 40, 32000, 'in-stock'),
(1, 5, 'Latte', 120, 40, 35000, 'low-stock'),
(1, 6, 'Macchiato', 180, 40, 30000, 'in-stock'),
(1, 7, 'Flat White', 140, 35, 35000, 'in-stock'),
(1, 8, 'Mocha', 100, 30, 38000, 'low-stock'),
(1, 9, 'Caramel Latte', 110, 30, 40000, 'low-stock'),
(1, 10, 'Vanilla Latte', 130, 35, 38000, 'in-stock'),

(1, 11, 'Iced Americano', 90, 30, 25000, 'in-stock'),
(1, 12, 'Iced Latte', 75, 25, 35000, 'low-stock'),
(1, 13, 'Iced Cappuccino', 85, 25, 35000, 'in-stock'),
(1, 14, 'Iced Mocha', 60, 20, 40000, 'low-stock'),

(1, 15, 'Fresh Orange Juice', 45, 20, 28000, 'in-stock'),
(1, 16, 'Mango Juice', 40, 20, 30000, 'in-stock'),
(1, 17, 'Smoothie Banana', 50, 20, 35000, 'in-stock'),
(1, 18, 'Smoothie Strawberry', 48, 20, 38000, 'in-stock'),

(1, 19, 'Croissant Butter', 35, 15, 45000, 'in-stock'),
(1, 20, 'Pain au Chocolate', 28, 12, 50000, 'in-stock'),
(1, 21, 'Almond Croissant', 25, 12, 52000, 'in-stock'),
(1, 22, 'Donut Glazed', 60, 25, 35000, 'in-stock'),
(1, 23, 'Donut Chocolate', 55, 25, 38000, 'in-stock'),

(1, 24, 'Chocolate Cake', 12, 5, 60000, 'in-stock'),
(1, 25, 'Cheesecake', 8, 5, 65000, 'low-stock'),
(1, 26, 'Carrot Cake', 10, 5, 55000, 'in-stock'),
(1, 27, 'Lemon Cake', 15, 5, 50000, 'in-stock'),
(1, 28, 'Red Velvet Cake', 6, 3, 70000, 'low-stock'),

(1, 29, 'Sandwich Ham & Cheese', 20, 10, 55000, 'in-stock'),
(1, 30, 'Club Sandwich', 15, 8, 65000, 'in-stock'),
(1, 31, 'Panini Caprese', 18, 8, 60000, 'in-stock'),
(1, 32, 'Caesar Salad', 25, 10, 50000, 'in-stock'),

(1, 33, 'Blueberry Muffin', 40, 15, 40000, 'in-stock'),
(1, 34, 'Banana Bread', 35, 15, 38000, 'in-stock'),
(1, 35, 'Cookies Chocolate Chip', 120, 50, 25000, 'in-stock');

-- Insert Expenses (realistic monthly)
INSERT INTO expenses (user_id, category, amount, description, created_at) VALUES
(1, 'Rent', 15000000, 'Monthly rent for cafe space', '2026-01-01'),
(1, 'Coffee Beans', 5000000, 'Premium arabica and robusta beans', '2026-01-05'),
(1, 'Staff Salary', 20000000, 'Monthly salary for 5 staff members', '2026-01-10'),
(1, 'Utilities', 2500000, 'Water, electricity, internet', '2026-01-10'),
(1, 'Baking Ingredients', 3000000, 'Flour, sugar, butter, eggs', '2026-01-12'),
(1, 'Equipment Maintenance', 1000000, 'Coffee machine cleaning and maintenance', '2026-01-15'),
(1, 'Marketing', 1500000, 'Social media ads and promotions', '2026-01-18'),
(1, 'Supplies', 2000000, 'Cups, napkins, straws, packaging', '2026-01-20'),
(1, 'Cleaning', 500000, 'Cleaning services and supplies', '2026-01-22');
