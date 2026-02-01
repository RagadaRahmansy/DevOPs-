const express = require('express');
const router = express.Router();
const pool = require('../config/database');
const { auth } = require('../middleware/auth');

// Revenue Analytics
router.get('/revenue/summary', auth, async (req, res) => {
  try {
    const { days = 30 } = req.query;

    const result = await pool.query(`
      SELECT
        SUM(total) as total_revenue,
        AVG(total) as avg_transaction,
        COUNT(*) as total_transactions,
        COUNT(DISTINCT DATE(created_at)) as trading_days
      FROM sales
      WHERE user_id = $1 AND created_at >= NOW() - INTERVAL '1 day' * $2
    `, [req.user.id, days]);

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Top Products
router.get('/products/top', auth, async (req, res) => {
  try {
    const { limit = 10 } = req.query;

    const result = await pool.query(`
      SELECT
        p.id,
        p.name,
        COUNT(s.id) as total_sold,
        SUM(s.quantity) as total_quantity,
        SUM(s.total) as total_revenue
      FROM products p
      LEFT JOIN sales s ON p.id = s.product_id
      WHERE p.user_id = $1
      GROUP BY p.id, p.name
      ORDER BY total_revenue DESC
      LIMIT $2
    `, [req.user.id, limit]);

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Customer Analytics
router.get('/customers/top', auth, async (req, res) => {
  try {
    const { limit = 10 } = req.query;

    const result = await pool.query(`
      SELECT
        c.id,
        c.name,
        c.email,
        COUNT(s.id) as total_purchases,
        SUM(s.total) as total_spent,
        AVG(s.total) as avg_spent
      FROM customers c
      LEFT JOIN sales s ON c.id = s.customer_id
      WHERE c.user_id = $1
      GROUP BY c.id, c.name, c.email
      ORDER BY total_spent DESC
      LIMIT $2
    `, [req.user.id, limit]);

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Payment Methods Analysis
router.get('/payment/methods', auth, async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT
        payment_method,
        COUNT(*) as total_transactions,
        SUM(total) as total_amount,
        AVG(total) as avg_amount
      FROM sales
      WHERE user_id = $1 AND created_at >= NOW() - INTERVAL '30 days'
      GROUP BY payment_method
      ORDER BY total_amount DESC
    `, [req.user.id]);

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Hourly Sales Analysis
router.get('/sales/hourly', auth, async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT
        EXTRACT(HOUR FROM created_at)::INT as hour,
        COUNT(*) as transaction_count,
        SUM(total) as total_sales
      FROM sales
      WHERE user_id = $1 AND created_at >= NOW() - INTERVAL '7 days'
      GROUP BY EXTRACT(HOUR FROM created_at)
      ORDER BY hour
    `, [req.user.id]);

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
