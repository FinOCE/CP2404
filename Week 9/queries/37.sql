SELECT
    AU_ID,
    BOOK.BOOK_NUM,
    BOOK_TITLE,
    BOOK_SUBJECT
FROM BOOK
JOIN WRITES ON BOOK.BOOK_NUM = WRITES.BOOK_NUM
ORDER BY
    BOOK.BOOK_NUM,
    AU_ID;