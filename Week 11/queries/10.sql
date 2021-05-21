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