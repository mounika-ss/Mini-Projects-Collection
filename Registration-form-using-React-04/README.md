# 📝 Registration Form (React + Vite + Tailwind CSS + Axios)

This project is a simple **Registration Form** built using **React (with Vite)** and styled with **Tailwind CSS**.  
It includes **Sign In**, **Sign Up**, and **Dashboard** pages, along with **API integration** using **Axios** and **React Router** for navigation.

---

## Tech Stack

- **React (Vite)** — Fast build tool for modern React apps  
- **Tailwind CSS** — Utility-first CSS framework for styling  
- **React Router DOM** — For page navigation (Sign In, Sign Up, Dashboard)  
- **Axios** — For making API requests  
- **Beeceptor API (Mock)** — Used to test registration requests  

---

## Setup Instructions

### 🧩 1. Install Node.js
Download and install Node.js from the official site:  
👉 [https://nodejs.org/en/download](https://nodejs.org/en/download)

Check version:
```bash
node -v
```
If a version number appears, Node.js is installed successfully.

### 2. Create a React App
Using Vite: 
```bash
npm create vite@latest my-project
cd my-project
npm install
npm run dev
```

### 3. Setup Tailwind CSS
Install Tailwind and the plugin: 
```bash
npm install tailwindcss @tailwindcss/vite
```
Add the Tailwind plugin to vite.config.js:
```bash
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [tailwindcss()],
})

```

Import Tailwind in index.css: 
```bash
@import "tailwindcss";

```

(Or use the classic setup if needed)
```bash
npx tailwindcss init -p
```

Create or update tailwind.config.js:
```bash
/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,jsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
}

```
Install the Tailwind CSS IntelliSense extension in VS Code for better code suggestions.

### 3. Setup Tailwind CSS
Used for page navigation (Sign In → Dashboard → Sign Up).
Install:
```bash
npm install react-router-dom

```
### 5. Axios Setup
Used to make HTTP requests (for registration, etc.)
Install:

```bash
npm install axios
```

Example API used:
```bash
https://fake-json-api.mock.beeceptor.com/companies
```

### 6. Folder Structure

```bash
my-project/
│
├── src/
│   ├── components/
│   │   ├── SignIn.jsx
│   │   ├── SignUp.jsx
│   │   └── Dashboard.jsx
│   ├── App.jsx
│   └── index.css
│
├── final-screenshots/   # contains SignIn, SignUp, Dashboard output images
│
├── tailwind.config.js
├── package.json
└── vite.config.js

```
---
🧠 Features

- Responsive UI using Tailwind CSS
- Routing between pages (Sign In, Sign Up, Dashboard)
- Mock API integration using Axios and Beeceptor
- Loading, success, and error states
- Simple and clean dashboard after login
---

🧪 Running the Project
Start the development server:
```bash
npm run dev

```
Open the app in your browser at: http://localhost:5173/

---
Additional Notes

- You can replace the mock API (Beeceptor) with your own backend or database like MySQL, Firebase, or MongoDB.
- Postman can be used to test API endpoints before integrating them in the frontend.
- The project is easily customizable — update the theme, colors, and fonts using Tailwind utilities.

---

📧 For learning and demonstration purposes only.

