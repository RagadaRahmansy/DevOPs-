const express = require('express');
const router = express.Router();
const pool = require('../config/database');
const { auth } = require('../middleware/auth');

// Get all products
router.get('/', auth, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT * FROM products WHERE user_id = $1 ORDER BY created_at DESC',
      [req.user.id]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create product
router.post('/', auth, async (req, res) => {
  try {
    const { name, category, price, cost, description } = req.body;
    
    const result = await pool.query(
      'INSERT INTO products (user_id, name, category, price, cost, description) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [req.user.id, name, category, price, cost, description]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update product
router.put('/:id', auth, async (req, res) => {
  try {
    const { name, category, price, cost, description } = req.body;
    
    const result = await pool.query(
      'UPDATE products SET name=$1, category=$2, price=$3, cost=$4, description=$5, updated_at=NOW() WHERE id=$6 AND user_id=$7 RETURNING *',
      [name, category, price, cost, description, req.params.id, req.user.id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Delete product
router.delete('/:id', auth, async (req, res) => {
  try {
    const result = await pool.query(
      'DELETE FROM products WHERE id=$1 AND user_id=$2 RETURNING *',
      [req.params.id, req.user.id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }

    res.json({ message: 'Product deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
