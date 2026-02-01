const express = require('express');
const router = express.Router();
const { auth } = require('../middleware/auth');

// POST /logout
router.post('/logout', auth, (req, res) => {
  try {
    // Token akan otomatis invalid di client-side
    // Ini bisa diperluas untuk server-side token blacklist jika diperlukan
    res.json({
      success: true,
      message: 'Logout successful'
    });
  } catch (error) {
    console.error('Logout error:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
