const express = require('express');
const router = express.Router();
const pool = require('../config/database');
const { auth } = require('../middleware/auth');

// Get all customers
router.get('/', auth, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT * FROM customers WHERE user_id = $1 ORDER BY created_at DESC',
      [req.user.id]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create customer
router.post('/', auth, async (req, res) => {
  try {
    const { name, email, phone, address } = req.body;
    
    const result = await pool.query(
      'INSERT INTO customers (user_id, name, email, phone, address) VALUES ($1, $2, $3, $4, $5) RETURNING *',
      [req.user.id, name, email, phone, address]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Customer profile with purchase history
router.get('/:id/profile', auth, async (req, res) => {
  try {
    const customer = await pool.query(
      'SELECT * FROM customers WHERE id = $1 AND user_id = $2',
      [req.params.id, req.user.id]
    );

    if (customer.rows.length === 0) {
      return res.status(404).json({ error: 'Customer not found' });
    }

    const purchases = await pool.query(
      'SELECT * FROM sales WHERE customer_id = $1 ORDER BY created_at DESC',
      [req.params.id]
    );

    res.json({
      ...customer.rows[0],
      purchases: purchases.rows,
      total_spent: purchases.rows.reduce((sum, sale) => sum + parseFloat(sale.total), 0),
      total_transactions: purchases.rows.length
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
