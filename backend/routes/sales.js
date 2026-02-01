const express = require('express');
const router = express.Router();
const pool = require('../config/database');
const { auth } = require('../middleware/auth');

// Get all sales
router.get('/', auth, async (req, res) => {
  try {
    const { startDate, endDate } = req.query;
    
    let query = 'SELECT * FROM sales WHERE user_id = $1';
    const params = [req.user.id];

    if (startDate && endDate) {
      query += ' AND DATE(created_at) BETWEEN $2 AND $3';
      params.push(startDate, endDate);
    }

    query += ' ORDER BY created_at DESC';
    
    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create sale
router.post('/', auth, async (req, res) => {
  try {
    const { product_id, quantity, price, customer_id, payment_method, notes } = req.body;
    const total = quantity * price;

    const result = await pool.query(
      'INSERT INTO sales (user_id, product_id, quantity, price, total, customer_id, payment_method, notes) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *',
      [req.user.id, product_id, quantity, price, total, customer_id, payment_method, notes]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get sales summary
router.get('/summary/daily', auth, async (req, res) => {
  try {
    const { days = 30 } = req.query;

    const result = await pool.query(`
      SELECT 
        DATE(created_at) as date,
        COUNT(*) as transaction_count,
        SUM(total) as total_sales,
        SUM(quantity) as total_items
      FROM sales
      WHERE user_id = $1 AND created_at >= NOW() - INTERVAL '1 day' * $2
      GROUP BY DATE(created_at)
      ORDER BY date DESC
    `, [req.user.id, days]);

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
