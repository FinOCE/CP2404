SELECT
    PAT_ID,
    PAT_FNAME,
    PAT_LNAME
FROM PATRON
WHERE Upper(PAT_TYPE) = 'STUDENT'
ORDER BY PAT_ID;