SELECT
	CONCAT(Subr.FacFirstName, ' ', Subr.FacLastName) AS 'Faculty Name',
    OffYear AS 'Year',
    offering.CourseNo
FROM offering
JOIN faculty AS Subr ON Subr.FacSSN = offering.FacSSN
WHERE OffYear = 2006
AND Subr.FacSupervisor IN (
	SELECT FacSSN
	FROM offering AS SuprOffering
    WHERE SuprOffering.CourseNo = offering.CourseNo
);