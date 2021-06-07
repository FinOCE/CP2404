SELECT
	OfferNo,
    CourseNo
FROM offering
WHERE FacSSN IS NULL
AND OffYear = 2006;