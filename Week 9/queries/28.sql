SELECT
    COUNT(BOOK_NUM) AS 'Available Books'
FROM BOOK
WHERE PAT_ID IS NULL;