SELECT
	OfferNo,
    CourseNo,
    lpad(faculty.FacSSN, 9, '0') AS 'faculty.FacSSN',
    FacFirstName,
    FacLastName AS 'FacLastName'
FROM offering
LEFT JOIN faculty ON faculty.FacSSN = offering.FacSSN
WHERE CourseNo LIKE 'IS%'
ORDER BY faculty.FacSSN;