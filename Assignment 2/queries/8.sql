SELECT
	StdMajor,
	AvgGPA
FROM (
	SELECT
		StdMajor,
		ROUND(AVG(StdGPA), 1) AS 'AvgGPA'
	FROM student
	WHERE StdClass IN ('JR', 'SR')
	GROUP BY StdMajor
) majorAverages
WHERE AvgGPA > 3.3;