# 📅 Event Manager

A simple **Event Management System** built with **Next.js, Supabase, and Tailwind CSS**.  
This project demonstrates **full-stack CRUD operations** with a clean UI and live database integration.

---

## ✨ Features

- 👥 **Users**
  - Create, edit, delete users  
  - View all users in a table  

- 🎉 **Events**
  - Create, edit, delete events  
  - Each event is linked to a creator (user)  

- 📝 **RSVPs**
  - RSVP to events (Yes/No/Maybe)  
  - Each RSVP is linked to both a user and an event  
  - Prevents duplicate RSVPs for the same event  

- 🖥️ **UI/UX**
  - Sticky navbar with links to Home, Users, Events, RSVPs  
  - Responsive forms with dropdowns for relationships  
  - Alerts for success/failure actions  
  - Clean and modern design with Tailwind CSS  

---

## 🛠️ Tech Stack

- [Next.js 15 (App Router)](https://nextjs.org/)  
- [Supabase (Postgres Database)](https://supabase.com/)  
- [Tailwind CSS](https://tailwindcss.com/)  

---

## 📸 Screenshots

> _(Add screenshots after running the app – replace placeholders below)_  

### 🔹 Home Page  
![Home Page](screenshots/home.png)  

### 🔹 Users Page  
![Users Page](screenshots/users.png)  

### 🔹 Events Page  
![Events Page](screenshots/events.png)  

### 🔹 RSVPs Page  
![RSVPs Page](screenshots/rsvps.png)  

---

## 🚀 Getting Started

Follow these steps to run the project locally.

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/event-manager.git
cd event-manager
```

### 2️⃣ Install Dependencies
```
npm install
```

### 3️⃣ Setup Environment Variables
Create a .env.local file in the root with the following:
```bash
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
```

### 4️⃣ Run the Development Server
```bash
npm run dev
```

App will be running at http://localhost:3000 🎉


### 🌍 Deployment
This project can be easily deployed on Vercel
 (recommended).
- Connect your GitHub repo to Vercel
- Add the .env.local variables in Vercel’s Project Settings → Environment Variables
- Deploy 🚀

👉 Live Demo: https://event-manager-demo.vercel.app

---

## 🗂️ Database Schema

### Users Table
| Column | Type | Notes       |
| ------ | ---- | ----------- |
| id     | UUID | Primary Key |
| name   | Text | User’s name |
| email  | Text | Unique      |

Events Table

| Column      | Type | Notes                             |
| ----------- | ---- | --------------------------------- |
| id          | UUID | Primary Key                       |
| title       | Text | Event name                        |
| description | Text | Event details                     |
| date        | Date | Event date                        |
| city        | Text | Location                          |
| created\_by | UUID | FK → Users(id), ON DELETE CASCADE |

RSVPs Table
| Column    | Type | Notes                              |
| --------- | ---- | ---------------------------------- |
| id        | UUID | Primary Key                        |
| user\_id  | UUID | FK → Users(id), ON DELETE CASCADE  |
| event\_id | UUID | FK → Events(id), ON DELETE CASCADE |
| status    | Text | ("Yes", "No", "Maybe")             |

---

## 🙌 Acknowledgements

- Supabase Docs - https://supabase.com/docs
- Next.js Docs - https://nextjs.org/docs
- Tailwind CSS Docs - https://tailwindcss.com/docs/installation/using-vite

---

## 👩‍💻 Author
**Mounika Seelam**
- 💼 Open to roles in Data Analytics & Frontend Development


Note: I am used chatGPT to understand process
