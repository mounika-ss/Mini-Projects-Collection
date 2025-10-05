// import axios from 'axios';
// import { useState } from 'react';
// import { Link, useNavigate } from 'react-router-dom';

// function SignUp() {
//   const navigate = useNavigate();

//   const handleSubmit = (e) => {
//     e.preventDefault();
//     navigate('/dashboard');
//   };

//   return (
//     <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-green-50 via-blue-50 to-white px-4">
//       <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
//         <h1 className="text-3xl font-semibold text-center text-green-600 mb-6">Sign Up</h1>
//         <form onSubmit={handleSubmit} className="space-y-4">
//           <input type="text" placeholder="Full Name" className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500" required />
//           <input type="email" placeholder="Email" className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500" required />
//           <input type="password" placeholder="Password" className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500" required />
//           <button type="submit" className="w-full bg-green-600 text-white p-3 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500">Sign Up</button>
//         </form>
//         <p className="text-center mt-4 text-gray-600">
//           Already have an account? <Link to="/" className="text-green-600 hover:underline">Sign In</Link>
//         </p>
//       </div>
//     </div>
//   );
// }

// export default SignUp;






// import { Link, useNavigate } from 'react-router-dom';
// import { useState } from 'react';
// import axios from 'axios';

// function SignUp() {
//   const navigate = useNavigate();

//   // State to store form inputs
//   const [fullName, setFullName] = useState('');
//   const [email, setEmail] = useState('');
//   const [password, setPassword] = useState('');

//   // State for feedback messages
//   const [message, setMessage] = useState('');
//   const [error, setError] = useState('');

//   const handleSubmit = async (e) => {
//     e.preventDefault();

//     // Prepare the data to send
//     const userData = {
//       fullName: fullName,
//       email: email,
//       password: password
//     };

//     try {
//       // Send POST request to the API
//       const response = await axios.post('https://fake-json-api.mock.beeceptor.com/companies', userData);

//       console.log('API Response:', response.data);

//       // Show success message and navigate after a delay
//       setMessage('Registration successful!');
//       setError('');

//       setTimeout(() => {
//         navigate('/dashboard');
//       }, 1500);

//     } catch (err) {
//       console.error('API Error:', err);
//       setError('Something went wrong. Please try again.');
//       setMessage('');
//     }
//   };

//   return (
//     <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-green-50 via-blue-50 to-white px-4">
//       <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
//         <h1 className="text-3xl font-semibold text-center text-green-600 mb-6">Sign Up</h1>
//         {message && <div className="mb-4 text-green-600 text-center">{message}</div>}
//         {error && <div className="mb-4 text-red-600 text-center">{error}</div>}
//         <form onSubmit={handleSubmit} className="space-y-4">
//           <input
//             type="text"
//             placeholder="Full Name"
//             className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
//             value={fullName}
//             onChange={(e) => setFullName(e.target.value)}
//             required
//           />
//           <input
//             type="email"
//             placeholder="Email"
//             className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
//             value={email}
//             onChange={(e) => setEmail(e.target.value)}
//             required
//           />
//           <input
//             type="password"
//             placeholder="Password"
//             className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
//             value={password}
//             onChange={(e) => setPassword(e.target.value)}
//             required
//           />
//           <button
//             type="submit"
//             className="w-full bg-green-600 text-white p-3 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500"
//           >
//             Sign Up
//           </button>
//         </form>
//         <p className="text-center mt-4 text-gray-600">
//           Already have an account? <Link to="/" className="text-green-600 hover:underline">Sign In</Link>
//         </p>
//       </div>
//     </div>
//   );
// }

// export default SignUp;



import { Link, useNavigate } from 'react-router-dom';
import { useState } from 'react';
import axios from 'axios';

function SignUp() {
  const navigate = useNavigate();

  // Form input states
  const [fullName, setFullName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  // Feedback states
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false); // Loading state

  // Validate email using regex
  const isValidEmail = (email) => {
    return /\S+@\S+\.\S+/.test(email);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Input validation
    if (!fullName || !email || !password) {
      setError('All fields are required.');
      setMessage('');
      return;
    }

    if (!isValidEmail(email)) {
      setError('Please enter a valid email address.');
      setMessage('');
      return;
    }

    if (password.length < 6) {
      setError('Password must be at least 6 characters.');
      setMessage('');
      return;
    }

    setLoading(true);
    setError('');
    setMessage('');

    const userData = {
      fullName: fullName,
      email: email,
      password: password
    };

    try {
      const response = await axios.post('https://fake-json-api.mock.beeceptor.com/companies', userData);
      console.log('API Response:', response.data);

      setMessage('Registration successful!');
      setError('');

      // Navigate after short delay
      setTimeout(() => {
        navigate('/dashboard');
      }, 1500);

    } catch (err) {
      console.error('API Error:', err);
      setError('Something went wrong. Please try again.');
      setMessage('');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-green-50 via-blue-50 to-white px-4">
      <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
        <h1 className="text-3xl font-semibold text-center text-green-600 mb-6">Sign Up</h1>

        {message && <div className="mb-4 text-green-600 text-center">{message}</div>}
        {error && <div className="mb-4 text-red-600 text-center">{error}</div>}

        <form onSubmit={handleSubmit} className="space-y-4">
          <input
            type="text"
            placeholder="Full Name"
            className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            value={fullName}
            onChange={(e) => setFullName(e.target.value)}
          />
          <input
            type="email"
            placeholder="Email"
            className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
          <input
            type="password"
            placeholder="Password"
            className="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <button
            type="submit"
            disabled={loading}
            className={`w-full bg-green-600 text-white p-3 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 ${loading ? 'opacity-50 cursor-not-allowed' : ''}`}
          >
            {loading ? 'Submitting...' : 'Sign Up'}
          </button>
        </form>

        <p className="text-center mt-4 text-gray-600">
          Already have an account? <Link to="/" className="text-green-600 hover:underline">Sign In</Link>
        </p>
      </div>
    </div>
  );
}

export default SignUp;
