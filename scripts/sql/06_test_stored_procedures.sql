-- =====================================================
-- Script: 06_test_stored_procedures.sql
-- Description: Test all stored procedures
-- =====================================================

USE EmployeeDb;
GO

PRINT '============================================';
PRINT 'Testing Stored Procedures';
PRINT '============================================';
PRINT '';

-- Test 1: GetEmployeesByDepartment
PRINT 'Test 1: Get Employees in IT Department';
PRINT '--------------------------------------------';
EXEC GetEmployeesByDepartment @DepartmentName = 'IT';
GO

PRINT '';
PRINT 'Test 2: Get Employee Order Summary for Employee 101';
PRINT '--------------------------------------------';
EXEC GetEmployeeOrderSummary @EmployeeId = 101;
GO

PRINT '';
PRINT 'Test 3: Get Top 3 Orders by Amount';
PRINT '--------------------------------------------';
EXEC GetTopOrdersByAmount @TopN = 3;
GO

PRINT '';
PRINT 'Test 4: Get Department Spending Summary';
PRINT '--------------------------------------------';
EXEC GetDepartmentSpending;
GO

PRINT '';
PRINT 'Test 5: Add New Employee (Employee 105)';
PRINT '--------------------------------------------';
EXEC AddNewEmployee 
    @EmployeeId = 105, 
    @EmployeeName = 'Vikram Patel', 
    @Department = 'Marketing', 
    @Salary = 48000;
GO

PRINT '';
PRINT 'Test 6: Add New Order for Employee 105';
PRINT '--------------------------------------------';
EXEC AddNewOrder 
    @OrderId = 5006, 
    @EmployeeId = 105, 
    @Product = 'Monitor', 
    @Quantity = 1, 
    @OrderAmount = 25000;
GO

PRINT '';
PRINT '============================================';
PRINT 'All stored procedure tests completed!';
PRINT '============================================';
