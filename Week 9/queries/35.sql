SELECT
    BOOK_NUM,
    COUNT(*) AS 'Times Checked Out'
FROM CHECKOUT
GROUP BY BOOK_NUM
ORDER BY
    COUNT(*) DESC,
    BOOK_NUM DESC;