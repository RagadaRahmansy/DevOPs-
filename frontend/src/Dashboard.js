import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { Line, Doughnut } from 'react-chartjs-2';
import './Dasboard.css';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  ArcElement
} from 'chart.js';
import { analyticsAPI, authAPI } from './api';
import './styles/Dashboard.css';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  ArcElement
);

export const Dashboard = () => {
  const navigate = useNavigate();
  const [revenue, setRevenue] = useState(null);
  const [topProducts, setTopProducts] = useState([]);
  const [topCustomers, setTopCustomers] = useState([]);
  const [paymentMethods, setPaymentMethods] = useState([]);
  const [hourlySales, setHourlySales] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [revData, prodData, custData, payData, hourData] = await Promise.all([
          analyticsAPI.getRevenueSummary(30),
          analyticsAPI.getTopProducts(10),
          analyticsAPI.getTopCustomers(10),
          analyticsAPI.getPaymentMethods(),
          analyticsAPI.getHourlySales()
        ]);

        setRevenue(revData.data);
        setTopProducts(prodData.data);
        setTopCustomers(custData.data);
        setPaymentMethods(payData.data);
        setHourlySales(hourData.data);
      } catch (error) {
        console.error('Error fetching analytics:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  const handleLogout = async () => {
    try {
      await authAPI.logout();
    } catch (error) {
      console.error('Logout error:', error);
    } finally {
      localStorage.removeItem('token');
      navigate('/login');
    }
  };

  if (loading) return <div className="loading">Loading...</div>;

  return (
    <div className="dashboard">
      <div className="dashboard-header">
        <h1>Dashboard Analytics</h1>
        <div className="header-buttons">
          <button className="btn-import" onClick={() => navigate('/import')}>
            📊 Import Excel
          </button>
          <button className="btn-templates" onClick={() => navigate('/templates')}>
            📋 Templates
          </button>
          <button className="btn-logout" onClick={handleLogout}>
            🚪 Logout
          </button>
        </div>
      </div>

      {/* KPI Cards */}
      <div className="kpi-cards">
        <div className="kpi-card">
          <h3>Total Revenue</h3>
          <p className="kpi-value">
            Rp {revenue?.total_revenue?.toLocaleString('id-ID') || 0}
          </p>
          <p className="kpi-label">Last 30 days</p>
        </div>

        <div className="kpi-card">
          <h3>Total Transactions</h3>
          <p className="kpi-value">{revenue?.total_transactions || 0}</p>
          <p className="kpi-label">Last 30 days</p>
        </div>

        <div className="kpi-card">
          <h3>Avg Transaction</h3>
          <p className="kpi-value">
            Rp {Math.round(revenue?.avg_transaction || 0).toLocaleString('id-ID')}
          </p>
          <p className="kpi-label">Average value</p>
        </div>

        <div className="kpi-card">
          <h3>Trading Days</h3>
          <p className="kpi-value">{revenue?.trading_days || 0}</p>
          <p className="kpi-label">Active days</p>
        </div>
      </div>

      {/* Charts */}
      <div className="charts-container">
        <div className="chart-section">
          <h2>Hourly Sales (Last 7 Days)</h2>
          <Line
            data={{
              labels: hourlySales.map(h => `${h.hour}:00`),
              datasets: [{
                label: 'Sales',
                data: hourlySales.map(h => h.total_sales),
                borderColor: '#4CAF50',
                backgroundColor: 'rgba(76, 175, 80, 0.1)',
                tension: 0.4
              }]
            }}
          />
        </div>

        <div className="chart-section">
          <h2>Payment Methods</h2>
          <Doughnut
            data={{
              labels: paymentMethods.map(p => p.payment_method),
              datasets: [{
                data: paymentMethods.map(p => p.total_amount),
                backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF']
              }]
            }}
          />
        </div>
      </div>

      {/* Top Products & Customers */}
      <div className="tables-container">
        <div className="table-section">
          <h2>Top Products</h2>
          <table>
            <thead>
              <tr>
                <th>Product</th>
                <th>Sold</th>
                <th>Revenue</th>
              </tr>
            </thead>
            <tbody>
              {topProducts.map(p => (
                <tr key={p.id}>
                  <td>{p.name}</td>
                  <td>{p.total_quantity}</td>
                  <td>Rp {p.total_revenue?.toLocaleString('id-ID')}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>

        <div className="table-section">
          <h2>Top Customers</h2>
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Purchases</th>
                <th>Total Spent</th>
              </tr>
            </thead>
            <tbody>
              {topCustomers.map(c => (
                <tr key={c.id}>
                  <td>{c.name}</td>
                  <td>{c.total_purchases}</td>
                  <td>Rp {c.total_spent?.toLocaleString('id-ID')}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
