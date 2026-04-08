/*
STEP 2: Create a stage to store files.
Download the books-dataset from Kaggle: https://www.kaggle.com/datasets/elvinrustam/books-dataset/data. 
Upload BooksDatasetClean.csv to the stage.
Load the staged file into a new table BOOKS_DATASET_RAW
Note: First line of file contains the headers
*/

USE DATABASE CORTEX_SEARCH_TUTORIAL_DB;
USE SCHEMA PUBLIC;

CREATE OR REPLACE STAGE BOOKS_DATA_STAGE
    DIRECTORY = (ENABLE = TRUE)
    ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');