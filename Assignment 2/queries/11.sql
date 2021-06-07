SELECT
	OfferNo,
    course.CourseNo,
    CrsDesc,
    OffDays,
    OffLocation,
	OffTime
FROM offering
JOIN course ON course.CourseNo = offering.CourseNo
JOIN faculty ON faculty.FacSSN = offering.FacSSN
WHERE FacFirstName = 'LEONARD'
AND FacLastName = 'FIBON'
AND OffTerm = 'SPRING'
AND OffYear = 2006;