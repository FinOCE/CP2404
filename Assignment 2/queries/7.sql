SELECT
	CourseNo,
    COUNT(OfferNo) AS 'NumOfferings'
FROM offering
GROUP BY CourseNo;