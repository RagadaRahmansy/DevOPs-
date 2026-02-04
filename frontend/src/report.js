import React, { useState, useEffect } from 'react';
import { db } from './db'; // Menggunakan database yang sama dengan kasir

// Helper function untuk format mata uang
function formatRupiah(number) {
  return new Intl.NumberFormat('id-ID', {
    style: 'currency',
    currency: 'IDR',
    minimumFractionDigits: 0,
  }).format(number);
}

function ReportPage({ onBackToPos }) {
  const [reportData, setReportData] = useState({
    totalRevenue: 0,
    transactionCount: 0,
    transactions: [],
    productAnalysis: [], // Untuk menyimpan analisis per produk
  });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Fungsi untuk mengambil dan menganalisis data
    async function fetchReport() {
      try {
        // 1. Ambil semua data yang diperlukan dari database
        const allTransactions = await db.transactions.orderBy('timestamp').reverse().toArray();
        const allItems = await db.transactionItems.toArray();

        // 2. Lakukan analisis ringkasan
        const totalRevenue = allTransactions.reduce((sum, tx) => sum + tx.totalAmount, 0);
        const transactionCount = allTransactions.length;

        // 3. Lakukan analisis penjualan per item
        const productCounts = allItems.reduce((acc, item) => {
          acc[item.name] = (acc[item.name] || 0) + 1;
          return acc;
        }, {});

        const productAnalysis = Object.entries(productCounts)
          .map(([name, quantity]) => ({ name, quantity }))
          .sort((a, b) => b.quantity - a.quantity); // Urutkan dari yang paling laku

        // 4. Simpan semua hasil analisis ke dalam state
        setReportData({
          totalRevenue: totalRevenue,
          transactionCount: transactionCount,
          transactions: allTransactions,
          productAnalysis: productAnalysis,
        });
      } catch (error) {
        console.error("Gagal mengambil data laporan:", error);
        alert("Gagal memuat laporan.");
      } finally {
        setLoading(false);
      }
    }

    fetchReport();
  }, []); // Array kosong berarti efek ini hanya berjalan sekali saat komponen dimuat

  if (loading) {
    return <div>Memuat laporan...</div>;
  }

  return (
    <div className="report-container">
      <header className="report-header">
        <h1>Laporan Penjualan</h1>
        <button onClick={onBackToPos} className="btn-back">
          Kembali ke Kasir
        </button>
      </header>

      <div className="summary-cards">
        <div className="summary-card">
          <h2>Total Pendapatan</h2>
          <p>{formatRupiah(reportData.totalRevenue)}</p>
        </div>
        <div className="summary-card">
          <h2>Jumlah Transaksi</h2>
          <p>{reportData.transactionCount}</p>
        </div>
      </div>

      <div className="details-grid">
        <div className="transaction-list">
          <h2>Penjualan per Item</h2>
          <table>
            <thead>
              <tr>
                <th>Produk</th>
                <th>Jumlah Terjual</th>
              </tr>
            </thead>
            <tbody>
              {reportData.productAnalysis.map(item => (
                <tr key={item.name}>
                  <td>{item.name}</td>
                  <td>{item.quantity}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div className="transaction-list">
          <h2>Daftar Transaksi Terakhir</h2>
          <table>
            <thead>
              <tr>
                <th>ID Transaksi</th>
                <th>Waktu</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              {reportData.transactions.map(tx => (
                <tr key={tx.id}>
                  <td>{tx.id}</td>
                  <td>{new Date(tx.timestamp).toLocaleString('id-ID')}</td>
                  <td>{formatRupiah(tx.totalAmount)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default ReportPage;