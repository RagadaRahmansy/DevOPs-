import React, { useState } from 'react';
import axios from 'axios';
import './ImportExcel.css';

const ImportExcel = () => {
  const [file, setFile] = useState(null);
  const [data, setData] = useState(null);
  const [sql, setSql] = useState('');
  const [tableName, setTableName] = useState('products');
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [step, setStep] = useState(1); // 1: Upload, 2: Preview, 3: Generate SQL, 4: Execute

  const tableTypes = ['products', 'customers', 'sales', 'inventory', 'expenses'];

  const handleFileChange = (e) => {
    const selectedFile = e.target.files[0];
    if (selectedFile) {
      setFile(selectedFile);
      setError('');
    }
  };

  const handleUpload = async () => {
    if (!file) {
      setError('Please select a file');
      return;
    }

    setLoading(true);
    setError('');
    setMessage('');

    try {
      const formData = new FormData();
      formData.append('file', file);

      const response = await axios.post('/api/import/upload', formData, {
        headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });

      setData(response.data.allData);
      setMessage(`✅ File uploaded! Found ${response.data.totalRows} rows`);
      setStep(2);
    } catch (err) {
      setError(`Upload error: ${err.response?.data?.error || err.message}`);
    } finally {
      setLoading(false);
    }
  };

  const handleGenerateSQL = async () => {
    if (!data || !tableName) {
      setError('Missing data or table name');
      return;
    }

    setLoading(true);
    setError('');
    setMessage('');

    try {
      const response = await axios.post('/api/import/generate-sql', {
        tableName,
        data
      }, {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });

      setSql(response.data.sql);
      setMessage(`✅ SQL generated for ${response.data.rowCount} rows`);
      setStep(3);
    } catch (err) {
      setError(`Generation error: ${err.response?.data?.error || err.message}`);
    } finally {
      setLoading(false);
    }
  };

  const handleExecuteSQL = async () => {
    if (!sql) {
      setError('No SQL to execute');
      return;
    }

    if (!window.confirm('Are you sure? This will insert data into the database.')) {
      return;
    }

    setLoading(true);
    setError('');
    setMessage('');

    try {
      const response = await axios.post('/api/import/execute-sql', {
        sql
      }, {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });

      setMessage(`✅ ${response.data.message} (${response.data.rowsAffected} rows inserted)`);
      setStep(4);
    } catch (err) {
      setError(`Execution error: ${err.response?.data?.error || err.message}`);
    } finally {
      setLoading(false);
    }
  };

  const downloadTemplate = (type) => {
    window.location.href = `/api/import/template/${type}`;
  };

  const reset = () => {
    setFile(null);
    setData(null);
    setSql('');
    setTableName('products');
    setMessage('');
    setError('');
    setStep(1);
  };

  return (
    <div className="import-container">
      <div className="import-card">
        <h2>📊 Import Excel to Database</h2>

        {/* Step Indicator */}
        <div className="step-indicator">
          <div className={`step ${step >= 1 ? 'active' : ''}`}>1. Upload</div>
          <div className={`step ${step >= 2 ? 'active' : ''}`}>2. Preview</div>
          <div className={`step ${step >= 3 ? 'active' : ''}`}>3. SQL</div>
          <div className={`step ${step >= 4 ? 'active' : ''}`}>4. Done</div>
        </div>

        {/* Messages */}
        {message && <div className="success-message">{message}</div>}
        {error && <div className="error-message">{error}</div>}

        {/* Step 1: Upload */}
        {step === 1 && (
          <div className="step-content">
            <h3>Step 1: Upload Excel File</h3>

            {/* Template Downloads */}
            <div className="templates-section">
              <p><strong>Download Templates:</strong></p>
              <div className="template-buttons">
                {tableTypes.map(type => (
                  <button
                    key={type}
                    className="btn-template"
                    onClick={() => downloadTemplate(type)}
                  >
                    📥 {type}
                  </button>
                ))}
              </div>
            </div>

            {/* File Upload */}
            <div className="upload-section">
              <input
                type="file"
                accept=".xlsx,.xls,.csv"
                onChange={handleFileChange}
                className="file-input"
              />
              {file && <p className="file-name">Selected: {file.name}</p>}

              <button
                onClick={handleUpload}
                disabled={!file || loading}
                className="btn-primary"
              >
                {loading ? 'Uploading...' : 'Upload File'}
              </button>
            </div>
          </div>
        )}

        {/* Step 2: Preview */}
        {step === 2 && data && (
          <div className="step-content">
            <h3>Step 2: Preview Data</h3>

            <div className="table-section">
              <p><strong>Total Rows:</strong> {data.length}</p>
              <p><strong>Columns:</strong> {Object.keys(data[0]).join(', ')}</p>

              <table className="preview-table">
                <thead>
                  <tr>
                    {Object.keys(data[0]).map(col => (
                      <th key={col}>{col}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {data.slice(0, 5).map((row, idx) => (
                    <tr key={idx}>
                      {Object.values(row).map((val, i) => (
                        <td key={i}>{String(val).substring(0, 30)}</td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
              {data.length > 5 && (
                <p className="more-rows">... and {data.length - 5} more rows</p>
              )}
            </div>

            <div className="table-select">
              <label>Select Target Table:</label>
              <select
                value={tableName}
                onChange={(e) => setTableName(e.target.value)}
                className="select-input"
              >
                {tableTypes.map(type => (
                  <option key={type} value={type}>{type}</option>
                ))}
              </select>
            </div>

            <div className="button-group">
              <button
                onClick={handleGenerateSQL}
                disabled={loading}
                className="btn-primary"
              >
                {loading ? 'Generating...' : 'Generate SQL'}
              </button>
              <button onClick={reset} className="btn-secondary">
                Back
              </button>
            </div>
          </div>
        )}

        {/* Step 3: SQL Review */}
        {step === 3 && sql && (
          <div className="step-content">
            <h3>Step 3: Review SQL</h3>

            <div className="sql-section">
              <textarea
                value={sql}
                readOnly
                className="sql-textarea"
                rows="10"
              />
            </div>

            <div className="button-group">
              <button
                onClick={handleExecuteSQL}
                disabled={loading}
                className="btn-primary"
              >
                {loading ? 'Executing...' : '✅ Execute SQL'}
              </button>
              <button onClick={reset} className="btn-secondary">
                New Import
              </button>
            </div>
          </div>
        )}

        {/* Step 4: Complete */}
        {step === 4 && (
          <div className="step-content">
            <h3>✅ Import Complete!</h3>
            <p>Your data has been successfully imported to the database.</p>
            <button onClick={reset} className="btn-primary">
              Import More Data
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default ImportExcel;
