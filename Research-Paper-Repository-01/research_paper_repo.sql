create database researchpaper_repo;
use researchPaper_repo; 


/* creating tables */
-- users TABLE
-- Creating a table to store all users like authors, reviewers, and admins
-- that is who write, review, or manage papers
CREATE TABLE users (
	user_id int AUTO_INCREMENT PRIMARY KEY,
    full_name varchar(50) NOT NULL,
    email varchar(50) UNIQUE NOT NULL,
    role_type ENUM('author', 'reviewer', 'admin') NOT NULL,
    joined_on timestamp DEFAULT current_timestamp
);

-- papers TABLE
-- Creating a table to store paper information
-- Includes summary, tags, submission info, and current status
CREATE TABLE papers (
	paper_id int AUTO_INCREMENT PRIMARY KEY,
    paper_title varchar(200) NOT NULL,
    summary text,
    keywords varchar(255),
    date_submitted date,
    submitted_by int not null,
    review_stage ENUM('submitted', 'under_review', 'accepted', 'rejected') DEFAULT 'submitted',
    foreign key (submitted_by) references users(user_id)
);

-- paper_versions TABLE
-- Creating a table to store different versions of a paper
-- This table tracks changes made to each paper after submission
-- So every time a paper is updated, a new version is added here
CREATE TABLE paper_versions (
	version_id int AUTO_INCREMENT PRIMARY KEY,
    paper_id int not null,
    version_number int not null, -- Like 1, 2, 3...
    updated_date date, -- Time when this version was created
    changes_summary text,
    foreign key (paper_id) references papers (paper_id)
);

-- citations TABLE
-- Creating a table to store citation relationships between papers
-- This table shows which paper refers to (cites) which other paper
CREATE TABLE paper_citations (
	citation_id INT AUTO_INCREMENT PRIMARY KEY,
	citing_paper_id int not null, -- the paper that gives the reference - that is citing
    cited_paper_id int not null, -- the paper that is being referred to - that is being cited
    cited_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Time when citation was recorded
    -- Setting up foreign keys to ensure valid papers are cited
    foreign key (citing_paper_id) references papers (paper_id),
    foreign key (cited_paper_id) references papers(paper_id),
    -- check to prevent a paper from citing itself
    CHECK (citing_paper_id <> cited_paper_id),
    -- Ensure unique citation pairs
	UNIQUE (citing_paper_id, cited_paper_id)
);

-- reviews TABLES
-- Creating a table to store reviews for papers
-- feedback given by reviewers on submitted papers
CREATE TABLE paper_reviews (
    review_id int AUTO_INCREMENT PRIMARY KEY,
    paper_id int not null,
    checked_by int not null,  -- The reviewer (user_id from users table)
    review_comments text,
    review_status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    reviewed_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- When the review was submitted
    -- Foreign key connections
    foreign key (paper_id) references papers(paper_id),
    foreign key (checked_by) references users(user_id)
);





/* inserting data */
-- Adding a few users: a author, a reviewer, and an admin
INSERT INTO users (full_name, email, role_type) VALUES
('Aarav Sharma', 'aarav.sharma@gmail.com', 'author'),
('Divya Reddy', 'divya.reddy@gmail.com', 'reviewer'),
('Kunal Mehta', 'kunal.mehta@gmail.com', 'admin'),
('Neha Sharma', 'neha@gmail.com', 'author'),
('Rahul Desai', 'rahul.desai@gmail.com', 'reviewer'),
('Sneha Patil', 'sneha.patil@gmail.com', 'author');

-- Insert data in papers table
-- Each paper is submitted by a different author (submitted_by = user_id from users table).
INSERT INTO papers (paper_title, summary, keywords, date_submitted, submitted_by, review_stage) VALUES
('AI for Healthcare', 'Explores how AI can help in medical diagnosis.', 'AI, health, machine learning', '2025-06-17', 1, 'under_review'),
('Climate Change Impacts', 'Research on global warming trends.', 'climate, environment, temperature', '2025-06-18', 4, 'submitted'),
('Smart Farming Techniques', 'Using IoT for modern agriculture.', 'IoT, farming, sensors', '2025-06-20', 6, 'submitted'),
('Cybersecurity Trends 2025', 'Latest challenges in data protection.', 'cybersecurity, encryption', '2025-06-21', 1, 'under_review');

-- paper_versions
-- Inserting sample paper versions
INSERT INTO paper_versions (paper_id, version_number, updated_date, changes_summary)
VALUES
(1, 1, '2025-06-10', 'Initial submission of the paper.'),
(1, 2, '2025-06-13', 'Added graphs and updated abstract.'),
(2, 1, '2025-06-12', 'Initial version of the climate change paper.'),
(3, 1, '2025-06-20', 'Initial draft.'),
(4, 1, '2025-06-21', 'Initial version with examples.');

-- Insert into paper_citations table
-- Shows citation relationships (Paper 2 refers to Paper 1).
INSERT INTO paper_citations (citing_paper_id, cited_paper_id) VALUES
(2, 1), -- AI in healthcare
(3, 2), -- Smart Farming cites Climate
(4, 1); -- Cybersecurity cites AI

-- Insert into paper_reviews table
-- Reviews by reviewer on papers
INSERT INTO paper_reviews (paper_id, checked_by, review_comments, review_status, reviewed_on) VALUES
(1, 2, 'Great work on AI use cases. Add references.', 'pending', '2025-06-18'),
(2, 2, 'Good draft, but lacks proper graphs.', 'pending', '2025-06-19'),
(3, 5, 'Very innovative idea, consider adding data charts.', 'pending', '2025-06-22'),
(4, 2, 'Interesting take on privacy. Needs more sources.', 'approved', '2025-06-23');




-- ========================
-- SAMPLE QUERIES SECTION
-- ========================
-- Core Feature Queries

-- List all authors in the system
select * from users 
where role_type = 'author';

-- List all papers submitted by a specific author (aarav sharma)
select papers.paper_id, papers.paper_title, users.full_name as auther_name, users.user_id, users.role_type 
from papers inner join users
on papers.submitted_by = users.user_id
where role_type = 'author' and users.full_name = 'aarav sharma';

-- Show all papers submitted by a particular author (ex: user_id = 1)
select * 
from papers
where submitted_by = 1;

-- Show reviews for each paper with reviewer name
select p.paper_title, pr.review_comments, u.full_name, pr.reviewed_on
from paper_reviews as pr 
join users as u on u.user_id = pr.checked_by
join papers as p on p.paper_id = pr.paper_id;

-- Get reviews and their statuses for a paper (paper_id = 1)
select u.full_name as reviewer_name, r.review_comments, r.review_status, r.reviewed_on
from paper_reviews r
join users u on r.checked_by = u.user_id
where r.paper_id = 1;

-- Search papers by keyword (example: search for 'AI')
select paper_title, summary, keywords
from papers
where keywords like '%AI%';

-- Count how many papers each author submitted
select u.full_name, count(p.paper_id) as total_papers
from users u
LEFT JOIN papers p on u.user_id = p.submitted_by
where u.role_type = 'author'
group by u.user_id;

-- Find papers currently under review
select paper_id, paper_title, review_stage 
from papers
where review_stage = 'under_review';

-- Show all versions of a paper 
select paper_id, version_id, version_number, updated_date, changes_summary  
from paper_versions
where paper_id = 1
order by version_number;

-- Show citations made by a paper (let say paper_id = 2)
select pc.citation_id, pc.citing_paper_id, p1.paper_title as citing_title, p2.paper_title as cited_title
from paper_citations as pc 
join papers as p1 on pc.citing_paper_id = p1.paper_id
join papers as p2 on pc.cited_paper_id = p2.paper_id
where pc.citing_paper_id = 2;

-- See all citations (who cites whom)
SELECT pc.citing_paper_id, citing.paper_title AS citing_title,
       pc.cited_paper_id, cited.paper_title AS cited_title
FROM paper_citations pc
JOIN papers citing ON pc.citing_paper_id = citing.paper_id
JOIN papers cited ON pc.cited_paper_id = cited.paper_id;



-- BONUS QUERIES FEATURES 

-- Top 1 most cited paper
select pc.cited_paper_id, p.paper_title, COUNT(pc.cited_paper_id) AS citation_count
from paper_citations as pc
join papers as p on pc.cited_paper_id = p.paper_id
group by pc.cited_paper_id
order by citation_count desc
limit 1;

-- Active reviewers (who gave the most reviews)
select u.full_name as reviewer_name, u.role_type, count(*) as most_reviewed
from paper_reviews as pr
join users as u on u.user_id = pr.checked_by
group by u.full_name, u.role_type
order by most_reviewed desc;




-- Stored Procedure – Import Paper Metadata in Bulk
-- This makes adding new papers faster. We can just call the procedure instead of writing long INSERT statements each time.
DELIMITER //
CREATE PROCEDURE insert_paper_metadata (
    IN p_title VARCHAR(200),
    IN p_summary TEXT,
    IN p_keywords VARCHAR(255),
    IN p_date DATE,
    IN p_author_id INT
)
BEGIN
    INSERT INTO papers (paper_title, summary, keywords, date_submitted, submitted_by)
    VALUES (p_title, p_summary, p_keywords, p_date, p_author_id);
END //

DELIMITER ;

-- example
CALL insert_paper_metadata(
  'Future of AI',
  'Exploring potential AI advancements.',
  'AI, future, tech',
  '2025-06-25',
  1
);

SELECT * FROM papers
ORDER BY paper_id DESC
LIMIT 5;





-- View – Show paper with reviewer comments
-- This creates a virtual table for easily accessing reviewer feedback.
CREATE VIEW view_paper_reviews AS
SELECT 
    p.paper_title,
    u.full_name AS reviewer_name,
    r.review_comments,
    r.review_status,
    r.reviewed_on
FROM paper_reviews r
JOIN users u ON r.checked_by = u.user_id
JOIN papers p ON r.paper_id = p.paper_id;
-- this view to quickly get all review details without writing complex joins 

select * from view_paper_reviews;





-- Trigger – Audit Log for Reviews
-- This tracks any new reviews automatically (like bonus audit log feature).
-- so this keeps a record of who reviewed what and when – useful for tracking changes.
-- First, create audit table
CREATE TABLE review_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    review_id INT,
    paper_id INT,
    reviewer_id INT,
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Then, create trigger
DELIMITER //

CREATE TRIGGER after_review_insert
AFTER INSERT ON paper_reviews
FOR EACH ROW
BEGIN
    INSERT INTO review_audit (review_id, paper_id, reviewer_id, action_type)
    VALUES (NEW.review_id, NEW.paper_id, NEW.checked_by, 'INSERT');
END //

DELIMITER ;

