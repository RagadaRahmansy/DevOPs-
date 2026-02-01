import axios from 'axios';

const API_BASE_URL = 'http://localhost:5000/api';

const getAuthHeader = () => {
  const token = localStorage.getItem('token');
  return token ? { Authorization: `Bearer ${token}` } : {};
};

export const authAPI = {
  register: (data) => axios.post(`${API_BASE_URL}/auth/register`, data),
  login: (data) => axios.post(`${API_BASE_URL}/auth/login`, data),
  logout: () => axios.post(`${API_BASE_URL}/logout/logout`, {}, { headers: getAuthHeader() }),
};

export const productsAPI = {
  getAll: () => axios.get(`${API_BASE_URL}/products`, { headers: getAuthHeader() }),
  create: (data) => axios.post(`${API_BASE_URL}/products`, data, { headers: getAuthHeader() }),
  update: (id, data) => axios.put(`${API_BASE_URL}/products/${id}`, data, { headers: getAuthHeader() }),
  delete: (id) => axios.delete(`${API_BASE_URL}/products/${id}`, { headers: getAuthHeader() }),
};

export const salesAPI = {
  getAll: (params) => axios.get(`${API_BASE_URL}/sales`, { params, headers: getAuthHeader() }),
  create: (data) => axios.post(`${API_BASE_URL}/sales`, data, { headers: getAuthHeader() }),
  getSummary: (days) => axios.get(`${API_BASE_URL}/sales/summary/daily`, { params: { days }, headers: getAuthHeader() }),
};

export const inventoryAPI = {
  getAll: () => axios.get(`${API_BASE_URL}/inventory`, { headers: getAuthHeader() }),
  update: (id, data) => axios.put(`${API_BASE_URL}/inventory/${id}`, data, { headers: getAuthHeader() }),
  getLowStock: (threshold) => axios.get(`${API_BASE_URL}/inventory/low-stock/items`, { params: { threshold }, headers: getAuthHeader() }),
};

export const customersAPI = {
  getAll: () => axios.get(`${API_BASE_URL}/customers`, { headers: getAuthHeader() }),
  create: (data) => axios.post(`${API_BASE_URL}/customers`, data, { headers: getAuthHeader() }),
  getProfile: (id) => axios.get(`${API_BASE_URL}/customers/${id}/profile`, { headers: getAuthHeader() }),
};

export const analyticsAPI = {
  getRevenueSummary: (days) => axios.get(`${API_BASE_URL}/analytics/revenue/summary`, { params: { days }, headers: getAuthHeader() }),
  getTopProducts: (limit) => axios.get(`${API_BASE_URL}/analytics/products/top`, { params: { limit }, headers: getAuthHeader() }),
  getTopCustomers: (limit) => axios.get(`${API_BASE_URL}/analytics/customers/top`, { params: { limit }, headers: getAuthHeader() }),
  getPaymentMethods: () => axios.get(`${API_BASE_URL}/analytics/payment/methods`, { headers: getAuthHeader() }),
  getHourlySales: () => axios.get(`${API_BASE_URL}/analytics/sales/hourly`, { headers: getAuthHeader() }),
};
