# 📚 Research Paper Repository – MySQL Project

## About the Project
This is a SQL-based **Research Paper Repository** designed as part of the Developer Intern selection process at **DevifyX**.  
It supports features like paper submissions, version tracking, citations, and peer reviews — all built using **MySQL only**.

It demonstrates how to manage a research paper system using MySQL by handling data related to users (authors, reviewers, admins), papers, reviews, versions, and citations.

---

## 🗂️ Database Structure

- `users`: Stores authors, reviewers, and admins  
- `papers`: Stores paper metadata like title, summary, keywords, status, etc.  
- `paper_versions`: Tracks all versions of a paper  
- `paper_citations`: Stores citation relationships (which paper cites which)  
- `paper_reviews`: Review details, reviewer comments, status, etc.  
- `review_audit`: (Bonus) Trigger-based audit table for reviews  

---

## ⚙️ Key Features Implemented

- Submit and manage research papers  
- Role-based user system (author, reviewer, admin)  
- Track version history for papers  
- Record and display paper citations  
- Review system with feedback, approval/rejection, and reviewer tracking  
- Use of SQL concepts like `JOIN`, `GROUP BY`, `LIKE`, etc.  
- ✅ **Bonus:**  
  - Stored Procedure for inserting paper metadata  
  - View for showing paper review feedback  
  - Trigger for audit logging on review inserts  

---

## Sample Data

The database includes:
- 6 users (authors, reviewers, admin)  
- 4+ papers  
- Multiple paper versions  
- Citation links between papers  
- Reviewer feedback entries

---

## How to Run the SQL File

1. Use **MySQL 8.0+**  
2. Create a database:
   ```sql
   CREATE DATABASE researchpaper_repo;
   USE researchpaper_repo;
3. Run the full SQL file researchpaper_repo.sql (includes table creation, data insertion, sample queries, procedures, views, and triggers)
4. Explore the query section to test the system

## 📌 Notes

- All code is written in SQL (DDL + DML + Views + Triggers + Procedures)  
- Indexed frequently queried fields
- Normalized to avoid redundancy


---

## 🎥 Demo Video

https://drive.google.com/file/d/1JEqZgPGP70akcxM9brIgVJ04uK9BRrMM/view?usp=sharing

---

## Created by

**Mounika Seelam**   

---

## 📁 Folder Structure

    research-paper-repo/
    ├── research_paper.sql
    ├── README.md
    └── demo_video.mp4 (optional)


---

This project was built using AI support and my understanding of SQL principles.
