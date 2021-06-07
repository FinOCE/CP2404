SELECT
	FacFirstName AS 'FirstName',
    FacLastName AS 'LastName',
    FacCity AS 'City',
    ROUND(FacSalary*1.2) AS 'InflatedSalary', -- ROUND to remove ".0" from end of number
    FacHireDate AS 'HireDate'
FROM faculty
WHERE EXTRACT(YEAR FROM FacHireDate) > 1996;