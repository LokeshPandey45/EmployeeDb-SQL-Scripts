-- =====================================================
-- Script: 05_create_stored_procedures.sql
-- Description: Create useful stored procedures for EmployeeDb
-- =====================================================

USE EmployeeDb;
GO

-- =====================================================
-- Stored Procedure: GetEmployeesByDepartment
-- Description: Retrieves employees by department name
-- =====================================================
CREATE OR ALTER PROCEDURE GetEmployeesByDepartment
    @DepartmentName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        EmployeeId,
        EmployeeName,
        Department,
        Salary
    FROM Employee
    WHERE Department = @DepartmentName
    ORDER BY EmployeeName;
END
GO

-- =====================================================
-- Stored Procedure: GetEmployeeOrderSummary
-- Description: Get order summary for an employee
-- =====================================================
CREATE OR ALTER PROCEDURE GetEmployeeOrderSummary
    @EmployeeId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        e.EmployeeId,
        e.EmployeeName,
        e.Department,
        COUNT(o.OrderId) AS TotalOrders,
        SUM(o.OrderAmount) AS TotalOrderValue,
        AVG(o.OrderAmount) AS AverageOrderValue
    FROM Employee e
    LEFT JOIN OrderDetails o ON e.EmployeeId = o.EmployeeId
    WHERE e.EmployeeId = @EmployeeId
    GROUP BY e.EmployeeId, e.EmployeeName, e.Department;
END
GO

-- =====================================================
-- Stored Procedure: GetTopOrdersByAmount
-- Description: Get top N orders by amount
-- =====================================================
CREATE OR ALTER PROCEDURE GetTopOrdersByAmount
    @TopN INT = 5
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP (@TopN)
        o.OrderId,
        o.Product,
        o.Quantity,
        o.OrderAmount,
        e.EmployeeName,
        e.Department
    FROM OrderDetails o
    INNER JOIN Employee e ON o.EmployeeId = e.EmployeeId
    WHERE o.OrderAmount IS NOT NULL
    ORDER BY o.OrderAmount DESC;
END
GO

-- =====================================================
-- Stored Procedure: GetDepartmentSpending
-- Description: Get total spending by department
-- =====================================================
CREATE OR ALTER PROCEDURE GetDepartmentSpending
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        e.Department,
        COUNT(DISTINCT e.EmployeeId) AS EmployeeCount,
        COUNT(o.OrderId) AS TotalOrders,
        ISNULL(SUM(o.OrderAmount), 0) AS TotalSpending,
        ISNULL(AVG(o.OrderAmount), 0) AS AverageOrderValue
    FROM Employee e
    LEFT JOIN OrderDetails o ON e.EmployeeId = o.EmployeeId
    GROUP BY e.Department
    ORDER BY TotalSpending DESC;
END
GO

-- =====================================================
-- Stored Procedure: AddNewEmployee
-- Description: Insert a new employee
-- =====================================================
CREATE OR ALTER PROCEDURE AddNewEmployee
    @EmployeeId INT,
    @EmployeeName NVARCHAR(100),
    @Department NVARCHAR(100),
    @Salary INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        INSERT INTO Employee (EmployeeId, EmployeeName, Department, Salary)
        VALUES (@EmployeeId, @EmployeeName, @Department, @Salary);
        
        SELECT 'Employee added successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO

-- =====================================================
-- Stored Procedure: AddNewOrder
-- Description: Insert a new order
-- =====================================================
CREATE OR ALTER PROCEDURE AddNewOrder
    @OrderId INT,
    @EmployeeId INT,
    @Product NVARCHAR(100),
    @Quantity INT,
    @OrderAmount INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        -- Check if employee exists
        IF NOT EXISTS (SELECT 1 FROM Employee WHERE EmployeeId = @EmployeeId)
        BEGIN
            SELECT 'Error: Employee does not exist' AS Result;
            RETURN;
        END
        
        INSERT INTO OrderDetails (OrderId, EmployeeId, Product, Quantity, OrderAmount)
        VALUES (@OrderId, @EmployeeId, @Product, @Quantity, @OrderAmount);
        
        SELECT 'Order added successfully' AS Result;
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO

PRINT 'Stored procedures created successfully';
PRINT '';
PRINT 'Available procedures:';
PRINT '  - GetEmployeesByDepartment';
PRINT '  - GetEmployeeOrderSummary';
PRINT '  - GetTopOrdersByAmount';
PRINT '  - GetDepartmentSpending';
PRINT '  - AddNewEmployee';
PRINT '  - AddNewOrder';
