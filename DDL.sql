
-- ==============================================================================
-- File: DDL.sql
-- Description: Data Definition Language (DDL) Commands Reference & Practice
-- ==============================================================================

-- 0. CREATE DATABASE
drop database if exists practice_db;
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;


-- 1. DROP TABLES (Cleanup Phase)
# DROP TABLE IF EXISTS employees;
# DROP TABLE IF EXISTS departments;


-- 2. CREATE TABLES

CREATE TABLE departments (
    dept_id     INT AUTO_INCREMENT PRIMARY KEY,
    dept_name   VARCHAR(50) NOT NULL UNIQUE,
    location    VARCHAR(100) DEFAULT 'Main Campus'
);


CREATE TABLE employees (
    emp_id      INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE,
    salary      DECIMAL(10, 2) CHECK (salary > 0),
    hire_date   DATE DEFAULT (CURRENT_DATE),
    dept_id     INT,

    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


-- 3. ALTER TABLE

-- Add a new column
ALTER TABLE employees
ADD phone_number VARCHAR(15);

-- Modify column size
ALTER TABLE employees
MODIFY phone_number VARCHAR(20);

-- Drop a column
ALTER TABLE departments
DROP COLUMN location;

-- Add CHECK constraint
ALTER TABLE employees
ADD CONSTRAINT chk_email
CHECK (email LIKE '%@%.%');


-- 4. RENAME

-- Rename column
-- MariaDB-compatible syntax
ALTER TABLE employees
CHANGE phone_number contact_no VARCHAR(20);

-- Rename table
RENAME TABLE employees TO company_employees;

-- Rename table back
RENAME TABLE company_employees TO employees;


-- 5. TRUNCATE TABLE

TRUNCATE TABLE employees;


-- 6. INDEXES & VIEWS

-- Create index
CREATE INDEX idx_emp_email
ON employees(email);

-- Create view
CREATE VIEW vw_employee_names AS
SELECT
    emp_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email
FROM employees;

-- Drop index
DROP INDEX idx_emp_email ON employees;

-- Drop view
DROP VIEW IF EXISTS vw_employee_names;