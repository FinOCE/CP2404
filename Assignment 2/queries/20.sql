SELECT DISTINCT
	subr.FacFirstName,
    subr.FacLastName AS 'FacLastName',
    CONCAT(supr.FacFirstName, ' ', supr.FacLastName) AS 'Supervisor'
FROM offering
JOIN faculty AS subr ON subr.FacSSN = offering.FacSSN
JOIN faculty AS supr ON supr.FacSSN = subr.FacSupervisor
WHERE offering.CourseNo LIKE 'IS%'
AND OffYear = 2006;