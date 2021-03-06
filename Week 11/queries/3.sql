SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK.BOOK_SUBJECT,
    ROUND(AVGCOST, 2) AS AVGCOST,
    ROUND(BOOK_COST - AVGCOST, 2) AS DIFFERENCE
FROM BOOK
JOIN (
    SELECT
        BOOK_SUBJECT,
        AVG(BOOK_COST) AS AVGCOST
    FROM BOOK
    GROUP BY BOOK_SUBJECT
) AS SUBAVGS ON BOOK.BOOK_SUBJECT = SUBAVGS.BOOK_SUBJECT
ORDER BY BOOK_NUM;