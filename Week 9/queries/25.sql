SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS 'NAME',
    PAT_TYPE
FROM PATRON
ORDER BY
    Upper(PAT_TYPE),
    Upper(PAT_FNAME),
    Upper(PAT_LNAME)
-- The response given was not sorted correctly, this way is