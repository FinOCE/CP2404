SELECT
	OfferNo,
    CourseNo,
    OffTerm,
    OffYear,
    FacSSN
FROM offering
WHERE (
	OffTerm = 'FALL'
    AND OffYear = 2005
) OR (
	OffTerm = 'SPRING'
    AND OffYear = 2006
);