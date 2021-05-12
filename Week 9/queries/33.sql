SELECT
    BOOK_SUBJECT,
    COUNT(*) AS 'Books In Subject'
FROM BOOK
GROUP BY BOOK_SUBJECT
ORDER BY BOOK_SUBJECT;
-- Provided code and output do not match question, this does