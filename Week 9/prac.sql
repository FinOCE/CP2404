-- Question 1
SELECT
    PAT_FNAME,
    PAT_LNAME
FROM PATRON;

-- Question 2
SELECT
    CHECK_NUM,
    CHECK_OUT_DATE,
    CHECK_DUE_DATE
FROM CHECKOUT
ORDER BY CHECK_NUM;

-- Question 3
SELECT
    BOOK_NUM,
    BOOK_TITLE AS TITLE,
    BOOK_SUBJECT AS 'Subject of Book'
FROM BOOK
ORDER BY BOOK_NUM;

-- Question 4
SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_COST AS 'Replacement Cost'
FROM BOOK
ORDER BY BOOK_NUM;

-- Question 5
SELECT
    DISTINCT BOOK_YEAR
FROM BOOK
ORDER BY BOOK_YEAR;

-- Question 6
SELECT
    DISTINCT BOOK_SUBJECT
FROM BOOK
ORDER BY BOOK_SUBJECT;

-- Question 7
SELECT
    CHECK_NUM,
    BOOK_NUM,
    PAT_ID,
    CHECK_OUT_DATE,
    CHECK_DUE_DATE
FROM CHECKOUT
ORDER BY
    CHECK_OUT_DATE DESC,
    CHECK_NUM;

-- Question 8
SELECT
    BOOK_TITLE,
    BOOK_YEAR,
    BOOK_SUBJECT
FROM BOOK
ORDER BY
    BOOK_SUBJECT,
    BOOK_YEAR DESC,
    BOOK_TITLE

-- Question 9
SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_COST
FROM BOOK
WHERE BOOK_COST = 59.95
ORDER BY BOOK_NUM;

-- Question 10
SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_COST
FROM BOOK
WHERE BOOK_SUBJECT = 'Database'
ORDER BY BOOK_NUM;

-- Question 11
SELECT
    CHECK_NUM,
    BOOK_NUM,
    CHECK_OUT_DATE
FROM CHECKOUT
WHERE CHECK_OUT_DATE < '2017-04-05'
ORDER BY CHECK_NUM;

-- Question 12
SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_YEAR
FROM BOOK
WHERE BOOK_YEAR > 2015
AND BOOK_SUBJECT = 'Programming'
ORDER BY BOOK_NUM;

-- Question 13
SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_SUBJECT,
    BOOK_COST
FROM BOOK
WHERE BOOK_SUBJECT IN ('Cloud', 'Middleware')
AND BOOK_COST > 70
ORDER BY BOOK_NUM;

-- Question 14
SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME,
    AU_BIRTHYEAR
FROM AUTHOR
WHERE AU_BIRTHYEAR BETWEEN 1980 AND 1989
ORDER BY AU_ID;

-- Question 15
SELECT
    BOOK_NUM,
    BOOK_TITLE,
    BOOK_SUBJECT
FROM BOOK
WHERE Upper(BOOK_TITLE) LIKE '%DATABASE%'
ORDER BY BOOK_NUM;

-- Question 16
SELECT
    PAT_ID,
    PAT_FNAME,
    PAT_LNAME
FROM PATRON
WHERE Upper(PAT_TYPE) = 'STUDENT'
ORDER BY PAT_ID;

-- Question 17
SELECT
    PAT_ID,
    PAT_FNAME,
    PAT_LNAME,
    PAT_TYPE
FROM PATRON
WHERE Upper(PAT_LNAME) LIKE 'C%'
ORDER BY PAT_ID;

-- Question 18
SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME
FROM AUTHOR
WHERE AU_BIRTHYEAR IS NULL
ORDER BY AU_ID;

-- Question 19
SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME
FROM AUTHOR
WHERE AU_BIRTHYEAR IS NOT NULL
ORDER BY AU_ID;

-- Question 20
SELECT
    CHECK_NUM,
    BOOK_NUM,
    PAT_ID,
    CHECK_OUT_DATE,
    CHECK_DUE_DATE
FROM CHECKOUT
WHERE CHECK_IN_DATE IS NULL
ORDER BY BOOK_NUM;

-- Question 21
SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME,
    AU_BIRTHYEAR
FROM AUTHOR
ORDER BY
    AU_BIRTHYEAR DESC,
    AU_LNAME;

-- Question 22
SELECT
    PAT_ID AS PATRON,
    BOOK_NUM AS BOOK,
    datediff(CHECK_IN_DATE, CHECK_OUT_DATE) AS 'Days Kept'
FROM CHECKOUT
WHERE CHECK_IN_DATE IS NOT NULL -- Line added to remove NULL values, not sure if wanted or not
ORDER BY
    datediff(CHECK_IN_DATE, CHECK_OUT_DATE) DESC,
    PAT_ID,
    BOOK_NUM;

-- Question 23
SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS 'Patron Name',
    PAT_TYPE
FROM PATRON
ORDER BY PAT_ID;

-- Question 24
SELECT
    BOOK_NUM,
    CONCAT(BOOK_TITLE, ' (', BOOK_YEAR, ')') AS 'BOOK',
    BOOK_SUBJECT
FROM BOOK
ORDER BY BOOK_NUM;

-- Question 25
SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS 'NAME',
    PAT_TYPE
FROM PATRON
ORDER BY
    Upper(PAT_TYPE),
    Upper(PAT_FNAME),
    Upper(PAT_LNAME)
-- The response given was not sorted correctly, this way is

-- Question 26
SELECT
    COUNT(BOOK_NUM) AS 'Number of Books'
FROM BOOK;

-- Question 27
SELECT
    COUNT(DISTINCT BOOK_SUBJECT) AS 'Number of Subjects'
FROM BOOK;

-- Question 28
SELECT
    COUNT(BOOK_NUM) AS 'Available Books'
FROM BOOK
WHERE PAT_ID IS NULL;

-- Question 29
SELECT
    MAX(BOOK_COST) AS 'Most Expensive'
FROM BOOK;

-- Question 30
SELECT
    MIN(BOOK_COST) AS 'Least Expensive'
FROM BOOK;

-- Question 31
SELECT
    SUM(BOOK_COST) AS 'Library Value'
FROM BOOK;

-- Question 32
SELECT
    COUNT(DISTINCT PAT_ID) AS 'DIFFERENT PATRONS'
FROM CHECKOUT;

-- Question 33
SELECT
    BOOK_SUBJECT,
    COUNT(*) AS 'Books In Subject'
FROM BOOK
GROUP BY BOOK_SUBJECT
ORDER BY BOOK_SUBJECT;
-- Provided code and output do not match question, this does

-- Question 34
SELECT
    AU_ID,
    COUNT(*) AS 'Books Written'
FROM WRITES
GROUP BY AU_ID
ORDER BY
    COUNT(*) DESC,
    AU_ID;

-- Question 35
SELECT
    BOOK_NUM,
    COUNT(*) AS 'Times Checked Out'
FROM CHECKOUT
GROUP BY BOOK_NUM
ORDER BY
    COUNT(*) DESC,
    BOOK_NUM DESC;

-- Question 36
SELECT
    AU_LNAME,
    AU_FNAME,
    BOOK_NUM
FROM AUTHOR
JOIN WRITES ON AUTHOR.AU_ID = WRITES.AU_ID
ORDER BY
    AU_LNAME,
    AU_FNAME,
    BOOK_NUM;

-- Question 37
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

-- Question 38
SELECT
    AU_LNAME,
    AU_FNAME,
    BOOK_TITLE,
    BOOK_COST
FROM BOOK
JOIN WRITES ON BOOK.BOOK_NUM = WRITES.BOOK_NUM
JOIN AUTHOR ON WRITES.AU_ID = AUTHOR.AU_ID
ORDER BY
    BOOK.BOOK_NUM,
    AUTHOR.AU_ID;

-- Question 39
SELECT
    BOOK.PAT_ID,
    BOOK_NUM,
    PAT_FNAME,
    PAT_LNAME,
    BOOK_TITLE
FROM BOOK
JOIN PATRON ON BOOK.PAT_ID = PATRON.PAT_ID
ORDER BY
    Upper(PAT_LNAME),
    BOOK_TITLE;

-- Question 40
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

-- Question 41
SELECT
    BOOK.BOOK_NUM,
    BOOK_TITLE,
    AU_LNAME,
    AU_FNAME,
    PATRON.PAT_ID,
    PAT_LNAME,
    PAT_TYPE
FROM BOOK
JOIN WRITES ON BOOK.BOOK_NUM = WRITES.BOOK_NUM
JOIN AUTHOR ON WRITES.AU_ID = AUTHOR.AU_ID
JOIN PATRON ON BOOK.PAT_ID = PATRON.PAT_ID
ORDER BY
    BOOK_TITLE;

-- Question 42
SELECT
    BOOK.BOOK_NUM,
    BOOK_TITLE,
    COUNT(CHECK_NUM) AS 'Times Checked Out'
FROM BOOK
LEFT JOIN CHECKOUT ON BOOK.BOOK_NUM = CHECKOUT.BOOK_NUM
GROUP BY
    BOOK.BOOK_NUM,
    BOOK_TITLE
ORDER BY
    COUNT(CHECK_NUM) DESC,
    BOOK_TITLE;

-- Question 43
SELECT
    AUTHOR.AU_ID,
    AU_LNAME,
    BOOK_TITLE,
    CHECK_OUT_DATE,
    PAT_LNAME
FROM CHECKOUT
JOIN BOOK ON BOOK.BOOK_NUM = CHECKOUT.BOOK_NUM
JOIN WRITES ON WRITES.BOOK_NUM = BOOK.BOOK_NUM
JOIN AUTHOR ON AUTHOR.AU_ID = WRITES.AU_ID
JOIN PATRON ON PATRON.PAT_ID = BOOK.PAT_ID
WHERE AU_LNAME = 'Bruer'
AND PAT_LNAME = 'Miles'
ORDER BY CHECK_OUT_DATE;
-- My result has 4 rows whereas the provided only has 2. I don't see why this is the case because it seems correct still

-- Question 44
SELECT
    DISTINCT PAT_ID,
    PAT_FNAME,
    PAT_LNAME
FROM PATRON
WHERE PAT_ID NOT IN (
    SELECT DISTINCT PAT_ID
    FROM CHECKOUT
)
ORDER BY
    UPPER(PAT_LNAME),
    UPPER(PAT_FNAME);

-- Question 45
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

-- Question 46
SELECT
    PATRON.PAT_ID,
    PAT_LNAME,
    COUNT(CHECK_NUM) AS 'NUM CHECKOUTS',
    COUNT(DISTINCT CHECKOUT.BOOK_NUM) AS 'NUM DIFFERENT CHECKOUTS'
FROM CHECKOUT
JOIN PATRON ON PATRON.PAT_ID = CHECKOUT.PAT_ID
JOIN BOOK ON BOOK.BOOK_NUM = CHECKOUT.BOOK_NUM
GROUP BY CHECKOUT.PAT_ID
HAVING COUNT(CHECK_NUM) >= 3
ORDER BY
    COUNT(DISTINCT CHECKOUT.BOOK_NUM) DESC,
    COUNT(CHECK_NUM) DESC,
    PATRON.PAT_ID;

-- Question 47
SELECT
    ROUND(AVG(datediff(CHECK_IN_DATE, CHECK_OUT_DATE)), 2) AS 'Average Days Kept'
FROM CHECKOUT;

-- Question 48
SELECT
    PAT_ID,
    ROUND(AVG(datediff(CHECK_IN_DATE, CHECK_OUT_DATE)), 2) AS 'Average Days Kept'
FROM CHECKOUT
GROUP BY PAT_ID
HAVING COUNT(CHECK_NUM) >= 3
ORDER BY ROUND(AVG(datediff(CHECK_IN_DATE, CHECK_OUT_DATE)), 2) DESC;