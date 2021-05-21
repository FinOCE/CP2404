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