import Dexie from 'dexie';

// Membuat instance database baru dengan nama 'posDatabase'.
// Nama ini akan digunakan untuk database lokal di dalam browser.
export const db = new Dexie('posDatabase');

// Mendefinisikan skema (struktur tabel) untuk database.
// Ini seperti mendesain tabel di database tradisional.
db.version(1).stores({
  // Tabel 'transactions' untuk menyimpan ringkasan setiap penjualan.
  // '++id' berarti ID akan dibuat secara otomatis dan bertambah (auto-incrementing).
  // 'timestamp' adalah kolom yang akan kita gunakan untuk mencari/mengurutkan data berdasarkan waktu.
  transactions: '++id, timestamp',

  // Tabel 'transactionItems' untuk menyimpan setiap barang yang terjual dalam satu transaksi.
  // '++id' adalah primary key untuk setiap baris.
  // 'transactionId' adalah foreign key yang menghubungkan item ini ke transaksi spesifik di tabel 'transactions'.
  // 'productId' adalah ID dari produk yang terjual.
  transactionItems: '++id, transactionId, productId',
});
