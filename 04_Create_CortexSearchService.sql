/*
Step 4: Create a Cortex Search Service on the table to allow you to search through the chunks
*/

USE DATABASE CORTEX_SEARCH_TUTORIAL_DB;
USE SCHEMA PUBLIC;

CREATE CORTEX SEARCH SERVICE BOOKS_DATASET_SERVICE
    ON CHUNK
    WAREHOUSE = CORTEX_SEARCH_TUTORIAL_WH
    TARGET_LAG = '1 hour'
    AS (
        SELECT *
        FROM BOOK_DESCRIPTION_CHUNKS
    );