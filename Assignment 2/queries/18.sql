SELECT DISTINCT
	faculty.FacSSN,
	CONCAT(FacFirstName, ' ', FacLastName) AS 'Name',
    FacCity
FROM offering
JOIN faculty ON faculty.FacSSN = offering.FacSSN
WHERE offering.OffYear = 2006
AND offering.OffTerm = 'WINTER'
AND faculty.FacSSN NOT IN (
	SELECT FacSSN
    FROM offering
    WHERE NOT (OffYear = 2006 AND OffTerm = 'WINTER')
);
-- Doesn't work but I cannot figure out why and looks like it should...