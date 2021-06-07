SELECT
	OfferNo,
    course.CourseNo,
    OffDays
FROM offering
JOIN course ON course.CourseNo = offering.CourseNo
WHERE OffYear = 2006
AND OffTerm = 'WINTER'
AND (
	LOWER(CrsDesc) LIKE '%database%'
	OR LOWER(CrsDesc) LIKE '%finance%'
);