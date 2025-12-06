-- =====================================================
-- Script: 01_create_schema.sql
-- Description: Create EmployeeDb database and tables
-- =====================================================

-- Drop database if exists
IF DB_ID(N'EmployeeDb') IS NOT NULL
BEGIN
    ALTER DATABASE EmployeeDb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EmployeeDb;
END
GO

-- Create database
CREATE DATABASE EmployeeDb;
GO

-- Switch to EmployeeDb
USE EmployeeDb;
GO

-- Create Employee table
CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    EmployeeName NVARCHAR(100) NOT NULL,
    Department NVARCHAR(100) NOT NULL,
    Salary INT NOT NULL
);
GO

-- Create OrderDetails table with foreign key
CREATE TABLE OrderDetails (
    OrderId INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    Product NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    OrderAmount INT NULL,
    CONSTRAINT FK_Order_Employee FOREIGN KEY (EmployeeId) 
        REFERENCES Employee(EmployeeId)
);
GO

PRINT 'Schema created successfully';
