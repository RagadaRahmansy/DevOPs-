const express = require('express');
const router = express.Router();
const pool = require('../config/database');
const { auth } = require('../middleware/auth');
const XLSX = require('xlsx');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

// Setup uploads directory
const uploadDir = path.join(__dirname, '../uploads');
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

// Configure multer
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => cb(null, Date.now() + path.extname(file.originalname))
});

const fileFilter = (req, file, cb) => {
  const ext = path.extname(file.originalname).toLowerCase();
  const allowedExts = ['.xlsx', '.xls', '.csv'];
  if (allowedExts.includes(ext)) {
    cb(null, true);
  } else {
    cb(new Error('Only Excel/CSV files allowed'));
  }
};

const upload = multer({ storage, fileFilter });

// Helper: Convert Excel data to SQL INSERT
function generateInsertSQL(tableName, data) {
  if (!data || data.length === 0) return null;

  const headers = Object.keys(data[0]);
  const values = data.map(row => {
    const rowValues = headers.map(header => {
      const value = row[header];
      if (value === null || value === undefined || value === '') {
        return 'NULL';
      }
      if (typeof value === 'number') {
        return value;
      }
      if (typeof value === 'boolean') {
        return value ? 'true' : 'false';
      }
      const escaped = String(value).replace(/'/g, "''");
      return `'${escaped}'`;
    });
    return `(${rowValues.join(', ')})`;
  });

  const columns = headers.join(', ');
  return `INSERT INTO ${tableName} (${columns}) VALUES\n${values.join(',\n')};`;
}

// POST /upload - Upload Excel file
router.post('/upload', auth, (req, res, next) => {
  // Call multer middleware manually
  const uploadSingle = upload.single('file');
  uploadSingle(req, res, function(err) {
    if (err) {
      return res.status(400).json({ error: err.message });
    }
    // Continue to next handler
    handleUpload(req, res);
  });
});

// Upload handler function
async function handleUpload(req, res) {
  try {
    if (!req.file) {
      return res.status(400).json({ error: 'No file provided' });
    }

    const filePath = req.file.path;
    const workbook = XLSX.readFile(filePath);
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(worksheet);

    // Clean up uploaded file
    fs.unlinkSync(filePath);

    if (data.length === 0) {
      return res.status(400).json({ error: 'Excel file is empty' });
    }

    res.json({
      success: true,
      message: 'File uploaded successfully',
      preview: data.slice(0, 5),
      totalRows: data.length,
      columns: Object.keys(data[0]),
      allData: data
    });

  } catch (error) {
    console.error('Upload error:', error);
    if (req.file && fs.existsSync(req.file.path)) {
      fs.unlinkSync(req.file.path);
    }
    res.status(500).json({ error: error.message });
  }
}

// POST /generate-sql - Generate SQL from data
router.post('/generate-sql', auth, (req, res) => {
  try {
    const { tableName, data } = req.body;

    if (!tableName || !data || !Array.isArray(data) || data.length === 0) {
      return res.status(400).json({
        error: 'Invalid request. Provide tableName and data array'
      });
    }

    const sql = generateInsertSQL(tableName, data);
    if (!sql) {
      return res.status(400).json({ error: 'Could not generate SQL' });
    }

    res.json({
      success: true,
      sql: sql,
      rowCount: data.length,
      message: `SQL generated for ${data.length} rows`
    });

  } catch (error) {
    console.error('SQL generation error:', error);
    res.status(500).json({ error: error.message });
  }
});

// POST /execute-sql - Execute SQL in database
router.post('/execute-sql', auth, async (req, res) => {
  try {
    const { sql } = req.body;

    if (!sql) {
      return res.status(400).json({ error: 'No SQL provided' });
    }

    const trimmedSql = sql.trim().toUpperCase();
    if (!trimmedSql.startsWith('INSERT')) {
      return res.status(400).json({
        error: 'Only INSERT statements are allowed'
      });
    }

    const result = await pool.query(sql);

    res.json({
      success: true,
      message: 'SQL executed successfully',
      rowsAffected: result.rowCount
    });

  } catch (error) {
    console.error('SQL execution error:', error);
    res.status(500).json({ error: error.message });
  }
});

// GET /template/:type - Download Excel template
router.get('/template/:type', auth, (req, res) => {
  try {
    const { type } = req.params;

    const templates = {
      products: [
        { name: 'Espresso', category: 'Coffee', price: 25000, cost: 8000, description: 'Single shot' },
        { name: 'Latte', category: 'Coffee', price: 35000, cost: 11000, description: 'Smooth' }
      ],
      customers: [
        { name: 'John', email: 'john@email.com', phone: '0812345', address: 'Jakarta', loyalty_points: 0 },
        { name: 'Jane', email: 'jane@email.com', phone: '0823456', address: 'Jakarta', loyalty_points: 100 }
      ],
      sales: [
        { quantity: 2, price: 25000, total: 50000, payment_method: 'Cash', notes: 'Morning', created_at: '2026-01-22 08:00:00' },
        { quantity: 1, price: 35000, total: 35000, payment_method: 'Card', notes: 'Afternoon', created_at: '2026-01-22 14:00:00' }
      ],
      inventory: [
        { product_name: 'Espresso', quantity: 100, min_stock: 20, unit_price: 25000, status: 'in-stock' },
        { product_name: 'Latte', quantity: 50, min_stock: 20, unit_price: 35000, status: 'in-stock' }
      ],
      expenses: [
        { category: 'Rent', amount: 10000000, description: 'Monthly', created_at: '2026-01-22' },
        { category: 'Utilities', amount: 1500000, description: 'Electric', created_at: '2026-01-22' }
      ]
    };

    const templateData = templates[type];
    if (!templateData) {
      return res.status(400).json({
        error: `Template '${type}' not found. Available: ${Object.keys(templates).join(', ')}`
      });
    }

    const workbook = XLSX.utils.book_new();
    const worksheet = XLSX.utils.json_to_sheet(templateData);
    XLSX.utils.book_append_sheet(workbook, worksheet, type);

    const columns = Object.keys(templateData[0]).map(() => ({ wch: 20 }));
    worksheet['!cols'] = columns;

    const buffer = XLSX.write(workbook, { bookType: 'xlsx', type: 'buffer' });

    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', `attachment; filename="template_${type}.xlsx"`);
    res.send(buffer);

  } catch (error) {
    console.error('Template error:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
