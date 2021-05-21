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