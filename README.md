# README

## Introduction

Welcome to the Banking Analysis project! This repository contains an SQL script designed to extract and calculate various features related to bank customers. These features are crucial for data analysis and can be used as input for machine learning models to predict behaviors or classify customers based on specific metrics.

## Objective

The primary objective of this script is to generate a series of temporary tables that aggregate and calculate detailed information about bank accounts, transactions, and types of accounts and transactions for each customer. The resulting final table contains all the calculated features and can be used for further analysis or as input for machine learning models.

## Script Description

The SQL script performs the following steps:

1. **Count the total number of accounts per customer**:
    - Creates a temporary table that contains the total number of accounts owned by each customer.

2. **Calculate the number of incoming and outgoing transactions per customer**:
    - Creates a temporary table with the number of incoming and outgoing transactions for each customer.

3. **Calculate the total amount of incoming and outgoing transactions per customer**:
    - Creates a temporary table with the total amount of incoming and outgoing transactions for each customer.

4. **Count the number of accounts per type**:
    - Creates a temporary table that contains the number of accounts for each account type for each customer.

5. **Count the number of transactions per type**:
    - Creates a temporary table with the number of transactions for each transaction type for each customer.

6. **Calculate the transacted amount for incoming and outgoing transactions per account type**:
    - Creates a temporary table with the total amount of incoming and outgoing transactions for each account type for each customer.

7. **Create the final table with all features per customer**:
    - Creates a final temporary table containing all the calculated features for each customer.

## Usage

To run the script, you need access to an SQL database with the following tables:

- `banca.cliente`
- `banca.conto`
- `banca.transazioni`
- `banca.tipo_transazione`
- `banca.tipo_conto`

The script creates a series of temporary tables that aggregate and calculate the necessary features, and finally produces a `cliente_features` table containing all the calculated features.

### Execution Example

To execute the script, use an SQL client compatible with your database (e.g., MySQL Workbench, DBeaver, etc.) and copy/paste the script content into the client. After execution, the temporary table `cliente_features` will be available for further analysis.

## Conclusion

This SQL script is a powerful tool for banking data analysis, designed to extract and calculate relevant features for each customer. These features can be used for data analysis and are particularly useful as input for machine learning models to predict behaviors or classify customers based on specific metrics.

For any questions or contributions, feel free to contact the development team or create an issue on GitHub. Happy data analysis!
