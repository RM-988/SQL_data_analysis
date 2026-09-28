-- Create a practice table (MySQL)
CREATE TABLE cases (
    case_id VARCHAR(20) PRIMARY KEY,
    client VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL,
    opened_date DATE,
    document_count INT NOT NULL
);

-- After importing data/cases.csv into the cases table:

-- 1. View all records
SELECT * FROM cases;

-- 2. Count cases by status
SELECT status, COUNT(*) AS case_count
FROM cases
GROUP BY status;

-- 3. Total documents by client
SELECT client, SUM(document_count) AS total_documents
FROM cases
GROUP BY client
ORDER BY total_documents DESC;

-- 4. Find open cases
SELECT case_id, client, opened_date, document_count
FROM cases
WHERE status = 'Open'
ORDER BY opened_date;

-- 5. Find cases with more than 200 documents
SELECT case_id, client, document_count
FROM cases
WHERE document_count > 200;
