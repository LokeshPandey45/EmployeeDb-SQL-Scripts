# EmployeeDb SQL Scripts

[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019%2B-blue)](https://www.microsoft.com/sql-server)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Modular SQL scripts for creating and populating an **EmployeeDb** database with Employee and OrderDetails tables. Perfect for learning, testing, or quick database setup.

## 🚀 Quick Start

### Prerequisites
- SQL Server (2019 or later)
- `sqlcmd` utility or SQL Server Management Studio (SSMS) or VS Code with MSSQL extension

### Run All Scripts

```powershell
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\run_all.sql
```

Replace `YOUR_SERVER_NAME` with your SQL Server instance name (e.g., `localhost\SQLEXPRESS` or `(localdb)\MSSQLLocalDB`).

## 📁 Project Structure

```
EmployeeDb-SQL-Scripts/
├── scripts/
│   └── sql/
│       ├── 01_create_schema.sql        # Database and table creation
│       ├── 02_insert_employee_data.sql # Employee sample data
│       ├── 03_insert_order_data.sql    # Order sample data
│       ├── 04_verify_data.sql          # Verification queries
│       ├── run_all.sql                 # Master execution script
│       └── README.md                   # Detailed SQL documentation
└── README.md                           # This file
```

## 📊 Database Schema

### Employee Table
| Column | Type | Constraints |
|--------|------|-------------|
| EmployeeId | INT | PRIMARY KEY |
| EmployeeName | NVARCHAR(100) | NOT NULL |
| Department | NVARCHAR(100) | NOT NULL |
| Salary | INT | NOT NULL |

### OrderDetails Table
| Column | Type | Constraints |
|--------|------|-------------|
| OrderId | INT | PRIMARY KEY |
| EmployeeId | INT | FOREIGN KEY → Employee.EmployeeId |
| Product | NVARCHAR(100) | NOT NULL |
| Quantity | INT | NOT NULL |
| OrderAmount | INT | NULL |

## 📋 Sample Data

**4 Employees** across Sales, HR, IT, and Finance departments

**5 Orders** including Laptops, Keyboards, Chairs, Mobile, and Desk

## 🎯 Features

✅ **Modular Design** - Separate scripts for schema, data, and verification

✅ **Idempotent** - Safe to run multiple times (drops and recreates)

✅ **Foreign Key Relationships** - Proper relational database design

✅ **Verification Included** - Built-in queries to verify setup

✅ **Well Documented** - Comments and print statements throughout

## 📖 Usage Examples

### Run Individual Scripts

```powershell
# Create schema only
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\01_create_schema.sql

# Insert employee data
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\02_insert_employee_data.sql

# Verify all data
sqlcmd -S "YOUR_SERVER_NAME" -i .\scripts\sql\04_verify_data.sql
```

### Using VS Code MSSQL Extension

1. Install the **SQL Server (mssql)** extension
2. Open any `.sql` file
3. Click **Connect** and select your server
4. Click **Execute** or press `Ctrl+Shift+E`

## 🔗 Related

- [Jira Story KAN-1](https://lokeshpandey45.atlassian.net/browse/KAN-1) - Original requirement
- Includes 8 comprehensive test cases (all passing ✅)

## 🤝 Contributing

Feel free to submit issues or pull requests for improvements.

## 📄 License

MIT License - feel free to use for learning or commercial projects.

---

**Created:** December 6, 2025  
**Author:** LokeshPandey45  
**Server:** SQL Server Express
