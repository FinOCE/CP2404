SELECT
    MIN(AVERAGE) as 'Lowest Avg Cost',
    MAX(AVERAGE) as 'Highest Avg Cost'
FROM (
    SELECT
        DISTINCT BOOK.BOOK_SUBJECT,
        ROUND(AVGCOST, 2) AS AVERAGE
    FROM BOOK
    JOIN (
        SELECT
            BOOK_SUBJECT,
            AVG(BOOK_COST) AS AVGCOST
        FROM BOOK
        GROUP BY BOOK_SUBJECT
    ) AS SUBAVGS ON BOOK.BOOK_SUBJECT = SUBAVGS.BOOK_SUBJECT
) AS SUBCOSTS;