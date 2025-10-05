import { useState, useEffect } from 'react';
import axios from 'axios';

function Companies() {
  const [companies, setCompanies] = useState([]); // State to store companies
  const [loading, setLoading] = useState(true);   // Loading state
  const [error, setError] = useState('');         // Error state

  useEffect(() => {
    // Fetch companies when component mounts
    axios.get('https://fake-json-api.mock.beeceptor.com/companies')
      .then((response) => {
        console.log('API Response:', response.data);
        setCompanies(response.data); // Store the array of companies
        setLoading(false);           // Stop loading spinner
      })
      .catch((err) => {
        console.error('Error fetching companies:', err);
        setError('Failed to load companies');
        setLoading(false);
      });
  }, []);

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <h1 className="text-3xl font-bold text-center text-indigo-600 mb-6">Companies List</h1>

      {loading && <p className="text-center text-gray-500">Loading companies...</p>}
      {error && <p className="text-center text-red-500">{error}</p>}

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        {companies.map((company) => (
          <div key={company.id} className="bg-white rounded-lg shadow-md p-4 hover:shadow-lg transition-shadow">
            <img src={company.logo} alt={company.name} className="w-full h-32 object-contain mb-4" />
            <h2 className="text-xl font-semibold text-gray-800">{company.name}</h2>
            <p className="text-gray-600 text-sm mb-2">{company.address}, {company.zip}</p>
            <p className="text-gray-600 text-sm mb-2">{company.country}</p>
            <p className="text-gray-600 text-sm mb-2">Industry: {company.industry}</p>
            <p className="text-gray-600 text-sm mb-2">Employees: {company.employeeCount}</p>
            <p className="text-gray-600 text-sm mb-2">CEO: {company.ceoName}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Companies;
