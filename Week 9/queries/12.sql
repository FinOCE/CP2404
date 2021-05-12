SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_YEAR
FROM BOOK
WHERE BOOK_YEAR > 2015
AND BOOK_SUBJECT = 'Programming'
ORDER BY BOOK_NUM;