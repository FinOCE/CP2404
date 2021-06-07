SELECT
	course.CourseNo,
    CrsDesc,
    COUNT(OfferNo) AS 'NumOfferings',
    ROUND(AVG(OffNumEnrolled), 0) AS 'AvgEnroll'
FROM offering
JOIN course ON course.CourseNo = offering.CourseNo
WHERE OffNumEnrolled != 0
GROUP BY CourseNo;