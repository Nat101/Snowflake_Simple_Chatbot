/*
STEP 3: Create a table to store the chunks of text extracted from the book descriptions.
Retrieval accuracy with Cortex Search tends to be higher when documents are shorter.
*/

USE DATABASE CORTEX_SEARCH_TUTORIAL_DB;
USE SCHEMA PUBLIC;

CREATE TABLE BOOK_DESCRIPTION_CHUNKS AS (
    SELECT
        BOOKS.TITLE,
        BOOKS.AUTHORS,
        BOOKS.CATEGORY,
        BOOKS.PUBLISHER,
        BOOKS.TITLE || '\n' || BOOKS.AUTHORS || '\n' || CHUNK_VALUE.VALUE AS CHUNK
    FROM BOOKS_DATASET_RAW BOOKS,
        LATERAL FLATTEN(
            INPUT => SNOWFLAKE.CORTEX.SPLIT_TEXT_RECURSIVE_CHARACTER(
                BOOKS.DESCRIPTION,
                'none',
                2000,
                300
            )
        ) AS CHUNK_VALUE
);

-- VERIFY
SELECT CHUNK, * 
FROM BOOK_DESCRIPTION_CHUNKS LIMIT 10;