SELECT
	CourseNo,
    OfferNo,
    AvgGPA
FROM (
	SELECT
		CourseNo,
        offering.OfferNo,
		ROUND(AVG(student.StdGPA), 2) AS 'AvgGPA'
	FROM offering
    JOIN enrollment ON enrollment.OfferNo = offering.OfferNo
    JOIN registration ON registration.RegNo = enrollment.RegNo
    JOIN student ON student.StdSSN = registration.StdSSN
    WHERE offering.OffTerm = 'SPRING'
	GROUP BY CourseNo
) majorAverages
WHERE AvgGPA > 3;