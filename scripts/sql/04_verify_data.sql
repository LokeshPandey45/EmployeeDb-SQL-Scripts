-- =====================================================
-- Script: 04_verify_data.sql
-- Description: Verify all data in EmployeeDb
-- =====================================================

USE EmployeeDb;
GO

PRINT '============================================';
PRINT 'Employee Table Data';
PRINT '============================================';
SELECT * FROM Employee ORDER BY EmployeeId;
GO

PRINT '';
PRINT '============================================';
PRINT 'OrderDetails Table Data';
PRINT '============================================';
SELECT * FROM OrderDetails ORDER BY OrderId;
GO

PRINT '';
PRINT '============================================';
PRINT 'Employee-Order JOIN (Relationship Test)';
PRINT '============================================';
SELECT 
    e.EmployeeId,
    e.EmployeeName,
    e.Department,
    o.OrderId,
    o.Product,
    o.Quantity,
    o.OrderAmount
FROM Employee e
LEFT JOIN OrderDetails o ON e.EmployeeId = o.EmployeeId
ORDER BY e.EmployeeId, o.OrderId;
GO

PRINT '';
PRINT '============================================';
PRINT 'Summary Statistics';
PRINT '============================================';
SELECT 
    'Employee' AS TableName,
    COUNT(*) AS RowCount
FROM Employee
UNION ALL
SELECT 
    'OrderDetails' AS TableName,
    COUNT(*) AS RowCount
FROM OrderDetails;
GO
