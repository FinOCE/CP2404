SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME
FROM AUTHOR
WHERE AU_ID IN (
    SELECT DISTINCT AU_ID
    FROM WRITES
    JOIN BOOK ON BOOK.BOOK_NUM = WRITES.BOOK_NUM
    WHERE BOOK_SUBJECT != 'Programming'
)
ORDER BY AU_LNAME;