Amazon Inventory Database

Description:
This repository contains the SQL scripts and data files for creating and populating an Amazon inventory database. The database schema is designed to manage Amazon sales data efficiently, with structured tables for customers, promotions, fulfillment options, products, orders, and order promotions. The database normalization process enhances data integrity, reduces redundancy, and enables scalability.

Data Source:
The Amazon sales data used for this database is sourced from Kaggle, specifically from the following dataset: [Amazon Sales Report](https://www.kaggle.com/datasets/mdsazzatsardar/amazonsalesreport).

Step-by-Step Setup:

1. Data Download:
   - Download the Amazon sales data from the provided Kaggle link.

2. Main Table Creation:
   - Create a main table named `amazon_sales_table` containing all attributes present in the downloaded Excel sheet.

3. Creating Structured Tables:
   - Normalize the database schema by creating structured tables for customers, promotions, fulfillment options, products, and orders.

4. Data Insertion:
   - Insert data from the `amazon_sales_table` into the normalized tables using the provided SQL script.

   - Breakdown of data insertion:
     - Inserting Data into Customers Table
     - Inserting Data into Promotions Table
     - Inserting Data into FulfillmentOptions Table
     - Inserting Data into Products Table
     - Inserting Data into Orders Table
     - Inserting Data into OrderPromotions Table

Files:

1. create.sql:
   - SQL script to create all tables in the database.

2. load.sql:
   - SQL script for bulk loading data into the tables from tab or comma-separated files.

3. Data Files:
   - cleaned amazon inventory .csv file after removing duplicates and the cleaned Amazon inventory .csv file ensures all state names are consistent by standardizing variations like "Karnataka," "KARNATAKA," and "KARnatAKA" to a single, simplified format, such as "Karnataka."

Instructions:
1. Download the provided Amazon sales data from the Kaggle link and do the required cleaning process.
2. Run the `create.sql` script to create the necessary tables in your database.
3. Use the `load.sql` script to bulk load data from the provided data files into the tables.
4. Refer to the `readme.txt` file for additional information and setup instructions.