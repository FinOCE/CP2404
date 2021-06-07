SELECT
	StdMajor,
    StdClass,
    ROUND(MIN(StdGPA), 1) AS 'MinGPA',
    ROUND(MAX(StdGPA), 1) AS 'MaxGPA'
FROM student
GROUP BY
	StdMajor,
    StdClass;