-- Question 1
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

-- Question 2
SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME
FROM AUTHOR
WHERE AU_ID IN (
    SELECT DISTINCT AU_ID
    FROM WRITES
    JOIN BOOK ON BOOK.BOOK_NUM = WRITES.BOOK_NUM
    WHERE BOOK_SUBJECT != 'Programming'
)
ORDER BY AU_LNAME;

-- Question 3
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

-- Question 4
SELECT
    BOOK.BOOK_NUM,
    BOOK_TITLE,
    BOOK_SUBJECT,
    AU_LNAME,
    AMOUNT AS 'Num Books by Author'
FROM WRITES
JOIN BOOK ON WRITES.BOOK_NUM = BOOK.BOOK_NUM
JOIN AUTHOR ON WRITES.AU_ID = AUTHOR.AU_ID
JOIN (
    SELECT
        AU_ID,
        COUNT(BOOK_NUM) AS AMOUNT
    FROM WRITES
    GROUP BY AU_ID
) AS WRITTEN ON AUTHOR.AU_ID = WRITTEN.AU_ID
WHERE BOOK_SUBJECT = 'Cloud'
ORDER BY
    BOOK_TITLE,
    AU_LNAME;

-- Question 5
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

-- Question 6
SELECT
    EMP_FNAME,
    EMP_LNAME,
    EMP_EMAIL
FROM
    LGEMPLOYEE
WHERE EMP_HIREDATE BETWEEN '2005-01-01' AND '2014-12-31'
ORDER BY
    EMP_LNAME,
    EMP_FNAME;
-- Question expects 363 rows but only 104 show, but first 12 are correct. May be error is prac document

-- Question 7
SELECT
    EMP_FNAME,
    EMP_LNAME,
    EMP_PHONE,
    EMP_TITLE,
    DEPT_NUM
FROM LGEMPLOYEE
WHERE DEPT_NUM = 300
OR EMP_TITLE = 'CLERK I'
ORDER BY
    EMP_LNAME,
    EMP_FNAME;

-- Question 8
SELECT
    LGEMPLOYEE.EMP_NUM,
    EMP_LNAME,
    EMP_FNAME,
    SAL_FROM,
    SAL_END,
    SAL_AMOUNT
FROM LGSALARY_HISTORY
JOIN LGEMPLOYEE ON LGEMPLOYEE.EMP_NUM = LGSALARY_HISTORY.EMP_NUM
WHERE LGEMPLOYEE.EMP_NUM IN (83731, 83745, 84039)
ORDER BY
    LGEMPLOYEE.EMP_NUM,
    SAL_FROM;

-- Question 9
SELECT DISTINCT
    CUST_FNAME,
    CUST_LNAME,
    CUST_STREET,
    CUST_CITY,
    CUST_STATE,
    CUST_ZIP
FROM LGBRAND
JOIN LGPRODUCT ON LGPRODUCT.BRAND_ID = LGBRAND.BRAND_ID
JOIN LGLINE ON LGLINE.PROD_SKU = LGPRODUCT.PROD_SKU
JOIN LGINVOICE ON LGINVOICE.INV_NUM = LGLINE.INV_NUM
JOIN LGCUSTOMER ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
WHERE LGBRAND.BRAND_NAME = 'FORESTERS BEST'
AND LGPRODUCT.PROD_CATEGORY = 'Top Coat'
AND LGINVOICE.INV_DATE BETWEEN '2017-7-15' AND '2017-7-31'
ORDER BY
    CUST_STATE,
    CUST_LNAME,
    CUST_FNAME;

-- Question 10
SELECT
    LGEMPLOYEE.EMP_NUM,
    EMP_LNAME,
    EMP_EMAIL,
    EMP_TITLE,
    DEPT_NAME
FROM LGEMPLOYEE
JOIN LGDEPARTMENT ON LGDEPARTMENT.DEPT_NUM = LGEMPLOYEE.DEPT_NUM
WHERE EMP_TITLE LIKE '%ASSOCIATE'
ORDER BY
    DEPT_NAME,
    EMP_TITLE,
    EMP_NUM;

-- Question 11
SELECT
    LGBRAND.BRAND_NAME,
    COUNT(PROD_SKU) AS NUMPRODUCTS
FROM LGPRODUCT
JOIN LGBRAND ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY LGBRAND.BRAND_ID
ORDER BY BRAND_NAME;

-- Question 12
SELECT
    BRAND_ID,
    SUM(PROD_QOH) AS TOTALINVENTORY
FROM LGPRODUCT
GROUP BY BRAND_ID
ORDER BY BRAND_ID DESC;

-- Question 13
SELECT
    LGBRAND.BRAND_ID,
    BRAND_NAME,
    ROUND(AVG(PROD_PRICE), 2) AS AVGPRICE
FROM LGPRODUCT
JOIN LGBRAND ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY LGBRAND.BRAND_ID
ORDER BY BRAND_NAME;

-- Question 14
SELECT
    LGEMPLOYEE.EMP_NUM,
    EMP_FNAME,
    EMP_LNAME,
    MAX(SAL_AMOUNT) AS LARGESTSALARY
FROM LGEMPLOYEE
JOIN LGSALARY_HISTORY ON LGSALARY_HISTORY.EMP_NUM = LGEMPLOYEE.EMP_NUM
WHERE DEPT_NUM = 200
GROUP BY LGEMPLOYEE.EMP_NUM
ORDER BY LARGESTSALARY DESC;

-- Question 15
SELECT
    LGDEPARTMENT.DEPT_NUM,
    DEPT_NAME,
    DEPT_PHONE,
    LGEMPLOYEE.EMP_NUM,
    EMP_LNAME
FROM LGDEPARTMENT
JOIN LGEMPLOYEE ON LGEMPLOYEE.EMP_NUM = LGDEPARTMENT.EMP_NUM
ORDER BY DEPT_NAME;

-- Question 16
SELECT
    LGVENDOR.VEND_ID,
    VEND_NAME,
    BRAND_NAME,
    COUNT(LGPRODUCT.PROD_SKU) AS NUMPRODUCTS
FROM LGVENDOR
JOIN LGSUPPLIES ON LGSUPPLIES.VEND_ID = LGVENDOR.VEND_ID
JOIN LGPRODUCT ON LGPRODUCT.PROD_SKU = LGSUPPLIES.PROD_SKU
JOIN LGBRAND ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY
    LGBRAND.BRAND_ID,
    LGVENDOR.VEND_ID
ORDER BY
    VEND_NAME,
    BRAND_NAME;

-- Question 17
SELECT MAX(AVG_PRICE) AS 'LARGEST AVERAGE'
FROM (
    SELECT
        ROUND(AVG(PROD_PRICE), 2) AS AVG_PRICE
    FROM LGPRODUCT
    GROUP BY BRAND_ID
) AS AVERAGES;

-- Question 18
SELECT
    LGBRAND.BRAND_ID,
    BRAND_NAME,
    BRAND_TYPE,
    AVG_PRICE
FROM (
    SELECT
        BRAND_ID,
        ROUND(AVG(PROD_PRICE), 2) AS AVG_PRICE
    FROM LGPRODUCT
    GROUP BY BRAND_ID
) AS AVERAGES
JOIN LGBRAND ON LGBRAND.BRAND_ID = AVERAGES.BRAND_ID
ORDER BY AVG_PRICE DESC
LIMIT 1;

-- Question 19
SELECT
    LGEMPLOYEE.EMP_NUM AS 'Emp_Num',
    EMP_LNAME AS 'Emp_LName',
    EMP_FNAME AS 'Emp_FName',
    SAL_AMOUNT AS 'Sal_Amount'
FROM LGEMPLOYEE
JOIN LGSALARY_HISTORY ON LGSALARY_HISTORY.EMP_NUM = LGEMPLOYEE.EMP_NUM
WHERE DEPT_NUM = 300
AND SAL_END IS NULL
ORDER BY SAL_AMOUNT DESC;

-- Question 20
SELECT
    LGEMPLOYEE.EMP_NUM AS 'Emp_Num',
    EMP_LNAME AS 'Emp_LName',
    EMP_FNAME AS 'Emp_FName',
    MIN_SALARY.SALARY AS 'Sal_Amount'
FROM (
    SELECT
        EMP_NUM,
        ROUND(MIN(SAL_AMOUNT)) AS SALARY
    FROM LGSALARY_HISTORY
    GROUP BY EMP_NUM
) AS MIN_SALARY
JOIN LGEMPLOYEE ON LGEMPLOYEE.EMP_NUM = MIN_SALARY.EMP_NUM
ORDER BY LGEMPLOYEE.EMP_NUM;

-- Question 21
SELECT
    LGINVOICE.INV_NUM,
    SEALER.LINE_NUM AS 'LINE_NUM(S)',
    SEALER.PROD_SKU AS 'PROD_SKU(S)',
    SEALER.PROD_DESCRIPT AS 'PROD_DESCRIPT(S)',
    TOP_COAT.LINE_NUM AS 'LINE_NUM(T)',
    TOP_COAT.PROD_SKU AS 'PROD_SKU(T)',
    TOP_COAT.PROD_DESCRIPT AS 'PROD_DESCRIPT(T)',
    SEALER.BRAND_ID
FROM LGINVOICE
JOIN (
    SELECT
        LGINVOICE.INV_NUM,
        LINE_NUM,
        LGPRODUCT.PROD_SKU,
        PROD_DESCRIPT,
        BRAND_ID
    FROM LGINVOICE
    JOIN LGLINE ON LGLINE.INV_NUM = LGINVOICE.INV_NUM
    JOIN LGPRODUCT ON LGPRODUCT.PROD_SKU = LGLINE.PROD_SKU
    WHERE PROD_CATEGORY = 'Sealer'
) AS SEALER ON SEALER.INV_NUM = LGINVOICE.INV_NUM
JOIN (
    SELECT
        LGINVOICE.INV_NUM,
        LINE_NUM,
        LGPRODUCT.PROD_SKU,
        PROD_DESCRIPT,
        BRAND_ID
    FROM LGINVOICE
    JOIN LGLINE ON LGLINE.INV_NUM = LGINVOICE.INV_NUM
    JOIN LGPRODUCT ON LGPRODUCT.PROD_SKU = LGLINE.PROD_SKU
    WHERE PROD_CATEGORY = 'Top Coat'
) AS TOP_COAT ON TOP_COAT.INV_NUM = LGINVOICE.INV_NUM
WHERE SEALER.BRAND_ID = TOP_COAT.BRAND_ID
ORDER BY
    LGINVOICE.INV_NUM,
    SEALER.LINE_NUM,
    TOP_COAT.LINE_NUM DESC;

-- Question 22
SELECT
    LGEMPLOYEE.EMP_NUM AS 'Emp_Num',
    EMP_LNAME AS 'Emp_LName',
    EMP_FNAME AS 'Emp_FName',
    EMP_EMAIL AS 'Emp_Email',
    COUNT(PRODUCTS.PROD_SKU) AS 'Total'
FROM (
    SELECT
        EMPLOYEE_ID,
        LGPRODUCT.PROD_SKU
    FROM LGLINE
    JOIN LGINVOICE ON LGINVOICE.INV_NUM = LGLINE.INV_NUM
    JOIN LGPRODUCT ON LGPRODUCT.PROD_SKU = LGLINE.PROD_SKU
    JOIN LGBRAND ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
    WHERE BRAND_NAME = 'BINDER PRIME'
    AND INV_DATE BETWEEN '2017-11-1' AND '2017-12-5'
) AS PRODUCTS
JOIN LGEMPLOYEE ON LGEMPLOYEE.EMP_NUM = PRODUCTS.EMPLOYEE_ID
GROUP BY EMPLOYEE_ID
ORDER BY Total DESC, EMP_LNAME;
-- This one looks to be incorrect but I cant seem to get it to work

-- Question 23
SELECT DISTINCT
    LGCUSTOMER.CUST_CODE AS 'Cust_Code',
    CUST_FNAME AS 'Cust_FName',
    CUST_LNAME AS 'Cust_LName'
FROM LGCUSTOMER
JOIN (
    SELECT LGCUSTOMER.CUST_CODE AS CUST_CODE
    FROM LGCUSTOMER
    JOIN LGINVOICE ON LGINVOICE.CUST_CODE = LGCUSTOMER.CUST_CODE
    WHERE EMPLOYEE_ID = 83649
) AS EMP1 ON EMP1.CUST_CODE = LGCUSTOMER.CUST_CODE
JOIN (
    SELECT LGCUSTOMER.CUST_CODE AS CUST_CODE
    FROM LGCUSTOMER
    JOIN LGINVOICE ON LGINVOICE.CUST_CODE = LGCUSTOMER.CUST_CODE
    WHERE EMPLOYEE_ID = 83677
) AS EMP2 ON EMP2.CUST_CODE = LGCUSTOMER.CUST_CODE
ORDER BY
    CUST_LNAME,
    CUST_FNAME;

-- Question 24
SELECT
    LGCUSTOMER.CUST_CODE,
    CUST_FNAME,
    CUST_LNAME,
    CUST_STREET,
    CUST_CITY,
    CUST_STATE,
    CUST_ZIP,
    INV_DATE,
    PURCHASE AS 'Largest Invoice'
FROM (
    SELECT
        LGCUSTOMER.CUST_CODE,
        INV_DATE,
        ROUND(MAX(INV_TOTAL), 2) AS PURCHASE
    FROM LGINVOICE
    RIGHT JOIN LGCUSTOMER ON LGCUSTOMER.CUST_CODE = LGINVOICE.CUST_CODE
    GROUP BY LGCUSTOMER.CUST_CODE
) AS MAX_PURCHASE
JOIN LGCUSTOMER ON LGCUSTOMER.CUST_CODE = MAX_PURCHASE.CUST_CODE
WHERE CUST_STATE = 'AL'
ORDER BY
    CUST_LNAME,
    CUST_FNAME;
-- I couldn't get it to show 0 instead of null for LARGEST INVOICE if ther was no invoices

