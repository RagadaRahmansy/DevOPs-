-- Sample data untuk Cafe Analytics

-- Insert users
INSERT INTO users (username, email, password, cafe_name) VALUES
('admin', 'admin@cafeanalytics.com', '$2a$10$encrypted_password_here', 'Coffee Corner'),
('manager', 'manager@cafeanalytics.com', '$2a$10$encrypted_password_here', 'Bakery Plus');

-- Insert products
INSERT INTO products (user_id, name, category, price, cost, description) VALUES
(1, 'Espresso', 'Beverages', 25000, 8000, 'Classic Italian espresso'),
(1, 'Cappuccino', 'Beverages', 35000, 12000, 'Espresso with steamed milk'),
(1, 'Latte', 'Beverages', 35000, 12000, 'Smooth and creamy latte'),
(1, 'Croissant', 'Pastries', 45000, 15000, 'Fresh butter croissant'),
(1, 'Chocolate Cake', 'Cakes', 60000, 20000, 'Rich chocolate cake'),
(1, 'Bread Pudding', 'Desserts', 40000, 12000, 'Homemade bread pudding');

-- Insert customers
INSERT INTO customers (user_id, name, email, phone, address) VALUES
(1, 'John Doe', 'john@example.com', '08123456789', 'Jakarta'),
(1, 'Jane Smith', 'jane@example.com', '08198765432', 'Bandung'),
(1, 'Budi Santoso', 'budi@example.com', '08567890123', 'Surabaya'),
(1, 'Siti Nurhaliza', 'siti@example.com', '08765432109', 'Yogyakarta');

-- Insert sample sales
INSERT INTO sales (user_id, product_id, customer_id, quantity, price, total, payment_method, notes) VALUES
(1, 1, 1, 2, 25000, 50000, 'Cash', 'Morning order'),
(1, 2, 2, 1, 35000, 35000, 'Card', 'Regular customer'),
(1, 4, 1, 3, 45000, 135000, 'Cash', 'Breakfast set'),
(1, 5, 3, 1, 60000, 60000, 'Card', 'Birthday celebration'),
(1, 3, 4, 2, 35000, 70000, 'E-wallet', 'Afternoon drinks');

-- Insert inventory
INSERT INTO inventory (user_id, product_id, product_name, quantity, min_stock, unit_price, status) VALUES
(1, 1, 'Espresso', 150, 20, 25000, 'in-stock'),
(1, 2, 'Cappuccino', 120, 20, 35000, 'in-stock'),
(1, 3, 'Latte', 100, 20, 35000, 'low-stock'),
(1, 4, 'Croissant', 80, 30, 45000, 'in-stock'),
(1, 5, 'Chocolate Cake', 15, 10, 60000, 'low-stock'),
(1, 6, 'Bread Pudding', 45, 20, 40000, 'in-stock');

-- Insert expenses
INSERT INTO expenses (user_id, category, amount, description) VALUES
(1, 'Rent', 10000000, 'Monthly rent for cafe'),
(1, 'Utilities', 2000000, 'Water and electricity'),
(1, 'Staff Salary', 15000000, 'Monthly staff salary'),
(1, 'Supplies', 3000000, 'Coffee beans and supplies'),
(1, 'Maintenance', 1000000, 'Equipment maintenance');
