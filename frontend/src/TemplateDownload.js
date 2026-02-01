import React from 'react';
import { useNavigate } from 'react-router-dom';
import './TemplateDownload.css';

const TemplateDownload = () => {
  const navigate = useNavigate();

  const templates = [
    {
      name: 'Products',
      description: 'Template untuk data produk/menu cafe',
      icon: '☕',
      file: 'template_products.csv',
      columns: ['name', 'category', 'price', 'cost', 'description']
    },
    {
      name: 'Customers',
      description: 'Template untuk data pelanggan',
      icon: '👥',
      file: 'template_customers.csv',
      columns: ['name', 'email', 'phone', 'address', 'loyalty_points']
    },
    {
      name: 'Sales',
      description: 'Template untuk data penjualan/transaksi',
      icon: '💰',
      file: 'template_sales.csv',
      columns: ['quantity', 'price', 'total', 'payment_method', 'notes', 'created_at']
    },
    {
      name: 'Inventory',
      description: 'Template untuk data stok/inventory',
      icon: '📦',
      file: 'template_inventory.csv',
      columns: ['product_name', 'quantity', 'min_stock', 'unit_price', 'status']
    },
    {
      name: 'Expenses',
      description: 'Template untuk data pengeluaran/biaya',
      icon: '💸',
      file: 'template_expenses.csv',
      columns: ['category', 'amount', 'description', 'created_at']
    }
  ];

  const downloadTemplate = (filename) => {
    const link = document.createElement('a');
    link.href = `/templates/${filename}`;
    link.download = filename;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <div className="template-container">
      <div className="template-header">
        <button className="btn-back" onClick={() => navigate('/dashboard')}>
          ← Back to Dashboard
        </button>
        <h1>📋 Download Templates</h1>
        <p className="subtitle">Pilih template untuk memudahkan import data ke sistem</p>
      </div>

      <div className="templates-grid">
        {templates.map((template, idx) => (
          <div key={idx} className="template-card">
            <div className="template-icon">{template.icon}</div>
            <h3>{template.name}</h3>
            <p className="description">{template.description}</p>
            
            <div className="columns-list">
              <strong>Kolom:</strong>
              <ul>
                {template.columns.map((col, i) => (
                  <li key={i}>{col}</li>
                ))}
              </ul>
            </div>

            <button 
              className="btn-download"
              onClick={() => downloadTemplate(template.file)}
            >
              📥 Download CSV
            </button>
          </div>
        ))}
      </div>

      <div className="template-guide">
        <h2>📖 Panduan Penggunaan</h2>
        <div className="guide-steps">
          <div className="step">
            <div className="step-number">1</div>
            <div className="step-content">
              <h4>Download Template</h4>
              <p>Pilih template yang sesuai dan download file CSV</p>
            </div>
          </div>

          <div className="step">
            <div className="step-number">2</div>
            <div className="step-content">
              <h4>Edit Data</h4>
              <p>Buka file dengan Excel atau Google Sheets dan isi dengan data Anda</p>
            </div>
          </div>

          <div className="step">
            <div className="step-number">3</div>
            <div className="step-content">
              <h4>Save File</h4>
              <p>Simpan file dalam format Excel (.xlsx) atau CSV</p>
            </div>
          </div>

          <div className="step">
            <div className="step-number">4</div>
            <div className="step-content">
              <h4>Import ke Sistem</h4>
              <p>Buka halaman Import Excel dan upload file Anda</p>
            </div>
          </div>
        </div>
      </div>

      <div className="template-tips">
        <h2>💡 Tips Penting</h2>
        <ul>
          <li>✅ Jangan mengubah nama kolom/header</li>
          <li>✅ Pastikan format data sesuai (tanggal, angka, dll)</li>
          <li>✅ Jangan ada baris kosong di tengah data</li>
          <li>✅ Gunakan koma untuk memisahkan nilai di CSV</li>
          <li>✅ Save file dengan encoding UTF-8</li>
          <li>❌ Jangan hapus atau tambah kolom baru</li>
          <li>❌ Jangan format currency (Rp) - gunakan angka saja</li>
        </ul>
      </div>
    </div>
  );
};

export default TemplateDownload;
