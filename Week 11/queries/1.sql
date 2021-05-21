SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_COST
FROM BOOK
WHERE BOOK_COST = (
    SELECT MIN(BOOK_COST)
    FROM BOOK
)
ORDER BY BOOK_NUM;