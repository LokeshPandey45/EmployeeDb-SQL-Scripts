-- =====================================================
-- Script: run_all.sql
-- Description: Execute all scripts in sequence
-- =====================================================

PRINT 'Starting EmployeeDb setup...';
PRINT '';

-- Step 1: Create schema
PRINT 'Step 1: Creating schema...';
:r 01_create_schema.sql
PRINT '';

-- Step 2: Insert employee data
PRINT 'Step 2: Inserting employee data...';
:r 02_insert_employee_data.sql
PRINT '';

-- Step 3: Insert order data
PRINT 'Step 3: Inserting order data...';
:r 03_insert_order_data.sql
PRINT '';

-- Step 4: Verify data
PRINT 'Step 4: Verifying data...';
:r 04_verify_data.sql
PRINT '';

PRINT '============================================';
PRINT 'Setup completed successfully!';
PRINT '============================================';
