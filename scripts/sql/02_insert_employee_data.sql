-- =====================================================
-- Script: 02_insert_employee_data.sql
-- Description: Insert sample data into Employee table
-- =====================================================

USE EmployeeDb;
GO

-- Insert Employee data
INSERT INTO Employee (EmployeeId, EmployeeName, Department, Salary) 
VALUES
    (101, 'Amit Sharma', 'Sales', 45000),
    (102, 'Neha Verma', 'HR', 52000),
    (103, 'Rajesh Singh', 'IT', 60000),
    (104, 'Priya Nair', 'Finance', 58000);
GO

PRINT 'Employee data inserted: 4 rows';
GO

-- Verify insertion
SELECT COUNT(*) AS EmployeeCount FROM Employee;
GO
