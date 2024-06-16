# MYSQL-Tableau-SuperStore-Project

# Business Task


## Table of Contents
- [Data Source](#data-source)
- [Data Dictionary](#data-dictionary)
- [Data Cleaning](#data-cleaning)
- [Data Schema](#data-schema)
- [Data Transformation](#data-transformation)
- [Analysis/Findings](#analysisfindings)

# Data Source
Superstore Dataset - [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)

# Data Dictionary


## Superstore Dataset

| Field          | Description                                           |
|----------------|-------------------------------------------------------|
| Row ID         | Unique ID for each row                                |
| Order ID       | Unique Order ID for each Customer                     |
| Order Date     | Order Date of the product                             |
| Ship Date      | Shipping Date of the Product                          |
| Ship Mode      | Shipping Mode specified by the Customer               |
| Customer ID    | Unique ID to identify each Customer                   |
| Customer Name  | Name of the Customer                                  |
| Segment        | The segment where the Customer belongs                |
| Country        | Country of residence of the Customer                  |
| City           | City of residence of the Customer                     |
| State          | State of residence of the Customer                    |
| Postal Code    | Postal Code of every Customer                         |
| Region         | Region where the Customer belongs                     |
| Product ID     | Unique ID of the Product                              |
| Category       | Category of the product ordered                       |
| Sub-Category   | Sub-Category of the product ordered                   |
| Product Name   | Name of the Product                                   |
| Sales          | Sales of the Product                                  |
| Quantity       | Quantity of the Product                               |
| Discount       | Discount provided                                     |
| Profit         | Profit/Loss incurred                                  |

# Data Cleaning
Effective data analysis begins with ensuring the data is clean and well-structured.

To facilitate this process, i've provided a SQL script that performs the necessary data cleaning operations. The script is a stored procedure. By running this script, the dataset is prepared for accurate and reliable analysis.
The procedure will be called during the Data Transformation phase of this project. 

You can access the SQL file for data cleaning [here](https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/blob/main/Data%20Cleaning%20-%20Stored%20Procedure.sql).


## Data Schema
<img src="https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/assets/160198611/0d25e0dd-5a5f-4515-83eb-df617e8f8598" alt="Description" width="500"/>


# Data Transformation
The provided SQL script contains a set of questions with queries used to gather insight about this dataset using MYSQL. You can access the SQL file [here](https://github.com/rml-lee/MYSQL-Tableau-SuperStore-Project/blob/main/SuperStore%20Project.sql).

# Analysis/Findings

