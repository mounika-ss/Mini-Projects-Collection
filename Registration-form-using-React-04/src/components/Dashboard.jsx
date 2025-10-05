import { useNavigate } from 'react-router-dom';

function Dashboard() {
  const navigate = useNavigate();

  const handleLogout = () => {
    navigate('/');
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-white via-blue-50 to-green-50 px-4">
      <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md text-center">
        <h1 className="text-3xl font-semibold text-blue-600 mb-4">Dashboard</h1>
        <p className="text-gray-700 mb-6">Welcome! You are now signed in.</p>
        <button onClick={handleLogout} className="bg-red-600 text-white px-6 py-3 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500">Log Out</button>
      </div>
    </div>
  );
}

export default Dashboard;
