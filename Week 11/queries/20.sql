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