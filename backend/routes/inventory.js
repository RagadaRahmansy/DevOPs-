const express = require('express');
const router = express.Router();
const pool = require('../config/database');
const { auth } = require('../middleware/auth');

// Get inventory
router.get('/', auth, async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT * FROM inventory WHERE user_id = $1 ORDER BY product_name',
      [req.user.id]
    );
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update stock
router.put('/:id', auth, async (req, res) => {
  try {
    const { quantity, status } = req.body;
    
    const result = await pool.query(
      'UPDATE inventory SET quantity=$1, status=$2, updated_at=NOW() WHERE id=$3 AND user_id=$4 RETURNING *',
      [quantity, status, req.params.id, req.user.id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Inventory not found' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get low stock items
router.get('/low-stock/items', auth, async (req, res) => {
  try {
    const { threshold = 10 } = req.query;

    const result = await pool.query(
      'SELECT * FROM inventory WHERE user_id = $1 AND quantity <= $2 ORDER BY quantity',
      [req.user.id, threshold]
    );

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
