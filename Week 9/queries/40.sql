SELECT
    AUTHOR.AU_ID,
    AU_FNAME,
    AU_LNAME,
    BOOK.BOOK_NUM,
    BOOK_TITLE
FROM BOOK
JOIN WRITES ON BOOK.BOOK_NUM = WRITES.BOOK_NUM
JOIN AUTHOR ON WRITES.AU_ID = AUTHOR.AU_ID
WHERE BOOK_SUBJECT = 'Cloud'
ORDER BY
    BOOK_TITLE,
    AU_LNAME;