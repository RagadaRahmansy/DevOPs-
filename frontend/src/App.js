import React, { useState } from 'react';
import { db } from './db'; // Impor database kita

import ReportPage from './report'; // Impor halaman laporan

import './App.css';

// --- Data Produk (Menu) ---
// Di aplikasi nyata, ini akan berasal dari database lokal
const menuData = [
  { id: 1, name: 'Kopi Hitam', price: 5000 },
  { id: 2, name: 'Es Teh', price: 4000 },
  { id: 3, name: 'Gorengan', price: 1000 },
  { id: 4, name: 'Beng-Beng Drink', price: 6000 },
  { id: 5, name: 'Good Day', price: 6000 },
  { id: 6, name: 'Es Nutrisari', price: 4000 },
  { id: 7, name: 'Rokok Eceran', price: 3000 },
];

// --- Komponen untuk satu item di menu ---
function MenuItem({ item, onAddToCart }) {
  return (
    <div className="menu-item" onClick={() => onAddToCart(item)}>
      <div className="name">{item.name}</div>
      <div className="price">{formatRupiah(item.price)}</div>
    </div>
  );
}

// --- Komponen untuk struk pesanan ---
function Receipt({ cartItems, onClearCart, onSaveTransaction }) {
  const total = cartItems.reduce((sum, item) => sum + item.price, 0);

  return (
    <div className="receipt-container">
      <h2>Pesanan Saat Ini</h2>
      <div className="receipt-items">
        {cartItems.length === 0 ? (
          <p className="empty-cart-message">Keranjang kosong</p>
        ) : (
          cartItems.map((item, index) => (
            <div className="receipt-item" key={index}>
              <span className="name">{item.name}</span>
              <span className="price">{formatRupiah(item.price)}</span>
            </div>
          ))
        )}
      </div>
      <div className="receipt-total">
        <div className="total-line">
          <span>Total</span>
          <span>{formatRupiah(total)}</span>
        </div>
        <div className="action-buttons">
          <button className="btn-clear" onClick={onClearCart} disabled={cartItems.length === 0}>
            Bersihkan
          </button>
          <button className="btn-save" disabled={cartItems.length === 0}>Simpan</button>
          <button className="btn-pay" onClick={onSaveTransaction} disabled={cartItems.length === 0}>
            Bayar
          </button>
        </div>
      </div>
    </div>
  );
}

// --- Komponen Utama Aplikasi ---
function App() {
  const [cart, setCart] = useState([]);
  const [view, setView] = useState('pos'); // 'pos' atau 'report'

  const handleAddToCart = (item) => {
    setCart(prevCart => [...prevCart, item]);
  };

  const handleClearCart = () => {
    setCart([]);
  };

  const handleSaveTransaction = async () => {
    if (cart.length === 0) return;

    try {
      // Hitung total
      const totalAmount = cart.reduce((sum, item) => sum + item.price, 0);

      // 1. Simpan transaksi utama dan dapatkan ID-nya
      const transactionId = await db.transactions.add({
        timestamp: new Date(),
        totalAmount: totalAmount,
      });

      // 2. Siapkan item-item untuk disimpan, kaitkan dengan ID transaksi
      const itemsToSave = cart.map(item => ({
        transactionId: transactionId,
        productId: item.id,
        name: item.name,
        price: item.price,
      }));

      // 3. Simpan semua item transaksi
      await db.transactionItems.bulkAdd(itemsToSave);

      // 4. Beri tahu pengguna, lalu kosongkan keranjang
      alert(`Transaksi #${transactionId} berhasil disimpan!`);
      handleClearCart();

    } catch (error) {
      console.error("Gagal menyimpan transaksi: ", error);
      alert("Terjadi kesalahan saat menyimpan transaksi.");
    }
  };

  // Logika untuk menentukan apa yang akan ditampilkan
  if (view === 'report') {
    return <ReportPage onBackToPos={() => setView('pos')} />;
  }

  return (
    <div className="pos-container">
      <div className="menu-container">
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <h2>Menu Produk</h2>
          <button onClick={() => setView('report')} className="btn-back" style={{ marginBottom: '10px' }}>
            Lihat Laporan
          </button>
        </div>
        <div className="menu-grid">
          {menuData.map(item => (
            <MenuItem key={item.id} item={item} onAddToCart={handleAddToCart} />
          ))}
        </div>
      </div>
      <Receipt cartItems={cart} onClearCart={handleClearCart} onSaveTransaction={handleSaveTransaction} />
    </div>
  );
}

// --- Helper function untuk format mata uang ---
function formatRupiah(number) {
  return new Intl.NumberFormat('id-ID', {
    style: 'currency',
    currency: 'IDR',
    minimumFractionDigits: 0,
  }).format(number);
}

export default App;