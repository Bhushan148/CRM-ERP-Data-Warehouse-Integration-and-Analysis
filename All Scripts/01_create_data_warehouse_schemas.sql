/*
=============================================================
Create Database and Schemas in PostgreSQL
=============================================================
Project: CRM & ERP Data Warehouse Integration  
Author: Bhushan Gawali  
Role: Data Analyst  

Description:
    This script is part of my real-time **PostgreSQL-based Data Warehouse project**, 
    designed to integrate and analyze **CRM & ERP data**. It creates a structured 
    database environment for efficient data processing by establishing three schema 
    layers following best **Data Warehousing** practices:

    🔹 **Bronze Layer** → Ingests raw, unprocessed data from multiple sources (CSV, APIs).  
    🔹 **Silver Layer** → Cleanses, transforms, and normalizes data for business rules.  
    🔹 **Gold Layer** → Stores finalized, aggregated data optimized for reporting & analytics.  

Warning:
    🚨 **This script drops the existing 'data_warehouse' database if it exists.**  
    🚨 **Ensure you have backups before running this script to prevent data loss.**  
*/

-- Terminate active connections to prevent conflicts during database drop
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE datname = 'data_warehouse';

-- Drop the existing database (if any) and create a fresh one
DROP DATABASE IF EXISTS data_warehouse;
CREATE DATABASE data_warehouse;

-- Connect to the newly created database
\c data_warehouse;

-- Create structured schema layers for Data Warehousing
CREATE SCHEMA bronze;  -- Raw data ingestion layer  
CREATE SCHEMA silver;  -- Cleansed & transformed business logic layer  
CREATE SCHEMA gold;    -- Aggregated, analytics-ready reporting layer  
