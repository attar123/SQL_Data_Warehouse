/*
===============================================================================
Script: Create Database and Schemas
===============================================================================
Purpose:
    Initializes the 'DataWarehouse' database environment. 
    
    - Drops the existing 'DataWarehouse' database if it exists.
    - Creates a new 'DataWarehouse' database.
    - Defines three logical schemas: 'bronze', 'silver', and 'gold'.

Schemas:
    - bronze: Raw or minimally transformed data
    - silver: Cleaned and structured data
    - gold: Business-ready reporting layer

⚠️ WARNING:
    Executing this script will permanently delete the 'DataWarehouse' database 
    if it already exists. All existing data will be lost. 
    Ensure that appropriate backups are taken before running this script.
===============================================================================
*/

-- Switch to the system database
USE master;
GO

-- Drop 'DataWarehouse' if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create a fresh 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the new database
USE DataWarehouse;
GO

-- Create schema: bronze
CREATE SCHEMA bronze;
GO

-- Create schema: silver
CREATE SCHEMA silver;
GO

-- Create schema: gold
CREATE SCHEMA gold;
GO
