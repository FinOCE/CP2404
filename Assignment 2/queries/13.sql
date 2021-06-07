SELECT
	-- Using AS so the Subr. and Supr. show up in MySQL Workbench since they didn't seem to
	Subr.FacFirstName AS 'Subr.FacFirstName',
	Subr.FacLastName AS 'Subr.FacLastName',
	Subr.FacSalary AS 'Subr.FacSalary',
    Supr.FacFirstName AS 'Supr.FacFirstName',
    Supr.FacLastName AS 'Supr.FacLastName',
    Supr.FacSalary AS 'Supr.FacSalary'
FROM faculty AS Subr
JOIN (
	SELECT
		FacSSN,
		FacFirstName,
		FacLastName,
		FacSalary
	FROM faculty
) Supr ON Supr.FacSSN = Subr.FacSupervisor
WHERE Subr.FacSalary < Supr.FacSalary;