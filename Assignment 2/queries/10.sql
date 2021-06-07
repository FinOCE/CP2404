SELECT
	OffLocation,
    COUNT(OfferNo) AS '2006OfferCount'
FROM offering
WHERE OffYear = 2006
GROUP BY OffLocation;