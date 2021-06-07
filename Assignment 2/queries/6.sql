SELECT
	OfferNo,
    course.CourseNo,
    CONCAT(FacFirstName, ' ', FacLastName) AS 'Instructor Name'
FROM offering
JOIN course ON course.CourseNo = offering.CourseNo
JOIN faculty ON faculty.FacSSN = offering.FacSSN
WHERE OffYear = 2006
AND OffTerm = 'WINTER'
AND FacRank = 'PROF'
AND course.CourseNo LIKE 'FIN%';