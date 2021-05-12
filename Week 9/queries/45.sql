SELECT
    BOOK.BOOK_NUM,
    BOOK_TITLE,
    COUNT(CHECK_NUM) AS 'Times Checked Out'
FROM BOOK
JOIN CHECKOUT ON CHECKOUT.BOOK_NUM = BOOK.BOOK_NUM
GROUP BY
    BOOK.BOOK_NUM,
    BOOK_TITLE
HAVING COUNT(CHECK_NUM) > 5
ORDER BY
    COUNT(CHECK_NUM) DESC,
    BOOK_TITLE;