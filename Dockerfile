# Tahap 1: Membangun aplikasi
# Menggunakan base image Node.js versi 18 yang ringan (alpine)
FROM node:18-alpine AS builder

# Menetapkan direktori kerja di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json dari folder backend
COPY backend/package*.json ./

# Instal semua dependensi (termasuk devDependencies untuk build jika ada)
RUN npm ci

# Salin sisa kode aplikasi dari folder backend
COPY backend/ .

# ---

# Tahap 2: Menyiapkan image produksi yang ramping
FROM node:18-alpine

WORKDIR /app

# Salin hanya dependensi produksi dari tahap 'builder'
COPY --from=builder /app/node_modules ./node_modules
# Salin file package.json untuk referensi
COPY --from=builder /app/package.json ./
# Salin kode aplikasi yang sudah dibangun/siap
COPY --from=builder /app/ ./

# Beri tahu Docker port mana yang akan diekspos oleh aplikasi
# Saya asumsikan port 3000. Jika aplikasi Anda menggunakan port lain, silakan ubah di sini.
EXPOSE 3000

# Perintah untuk menjalankan aplikasi saat container dimulai
CMD [ "node", "index.js" ]
