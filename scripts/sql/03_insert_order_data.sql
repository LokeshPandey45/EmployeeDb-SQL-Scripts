-- =====================================================
-- Script: 03_insert_order_data.sql
-- Description: Insert sample data into OrderDetails table
-- =====================================================

USE EmployeeDb;
GO

-- Insert OrderDetails data
INSERT INTO OrderDetails (OrderId, EmployeeId, Product, Quantity, OrderAmount) 
VALUES
    (5001, 101, 'Laptop', 2, 120000),
    (5002, 101, 'Keyboard', 5, 10000),
    (5003, 102, 'Chair', 3, 15000),
    (5004, 103, 'Mobile', 1, 30000),
    (5005, 104, 'Desk', 2, NULL);
GO

PRINT 'OrderDetails data inserted: 5 rows';
GO

-- Verify insertion
SELECT COUNT(*) AS OrderCount FROM OrderDetails;
GO
