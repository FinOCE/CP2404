SELECT
	offering.OfferNo,
    CourseNo,
    OffDays,
    OffLocation,
    OffTime,
    FacLastName
FROM offering
JOIN enrollment ON enrollment.OfferNo = offering.OfferNo
JOIN registration ON registration.RegNo = enrollment.RegNo
JOIN student ON student.StdSSN = registration.StdSSN
JOIN faculty ON offering.FacSSN = faculty.FacSSN
WHERE StdFirstName = 'CANDY'
AND StdLastName = 'KENDALL'
AND OffYear = 2005;