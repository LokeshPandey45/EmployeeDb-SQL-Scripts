# SQL Insert Schema Scripts

This folder contains modular SQL scripts to create and populate the EmployeeDb database.

## Scripts Overview

| Script | Description |
|--------|-------------|
| `01_create_schema.sql` | Creates EmployeeDb database and tables (Employee, OrderDetails) |
| `02_insert_employee_data.sql` | Inserts 4 sample employee records |
| `03_insert_order_data.sql` | Inserts 5 sample order records |
| `04_verify_data.sql` | Verifies and displays all data with summary |
| `run_all.sql` | Master script that runs all scripts in sequence |

## Usage

### Option 1: Run all scripts at once (Recommended)

```powershell
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\run_all.sql
```

### Option 2: Run individual scripts

```powershell
# Step 1: Create schema
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\01_create_schema.sql

# Step 2: Insert employee data
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\02_insert_employee_data.sql

# Step 3: Insert order data
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\03_insert_order_data.sql

# Step 4: Verify data
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\04_verify_data.sql
```

### Option 3: Use the VS Code MSSQL extension

1. Open any `.sql` file
2. Connect to your SQL Server instance
3. Execute the script

## Database Schema

### Employee Table
- **EmployeeId** (INT, PRIMARY KEY)
- **EmployeeName** (NVARCHAR(100), NOT NULL)
- **Department** (NVARCHAR(100), NOT NULL)
- **Salary** (INT, NOT NULL)

### OrderDetails Table
- **OrderId** (INT, PRIMARY KEY)
- **EmployeeId** (INT, FOREIGN KEY → Employee.EmployeeId)
- **Product** (NVARCHAR(100), NOT NULL)
- **Quantity** (INT, NOT NULL)
- **OrderAmount** (INT, NULL)

## Sample Data

### Employees (4 rows)
- 101, Amit Sharma, Sales, 45000
- 102, Neha Verma, HR, 52000
- 103, Rajesh Singh, IT, 60000
- 104, Priya Nair, Finance, 58000

### Orders (5 rows)
- 5001, 101, Laptop, 2, 120000
- 5002, 101, Keyboard, 5, 10000
- 5003, 102, Chair, 3, 15000
- 5004, 103, Mobile, 1, 30000
- 5005, 104, Desk, 2, NULL

## Notes

- All scripts include `GO` batch separators
- Schema script drops existing database if present
- Scripts include verification queries and print statements
- OrderId 5005 has NULL OrderAmount (intentional)
