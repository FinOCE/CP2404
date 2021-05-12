SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME,
    AU_BIRTHYEAR
FROM AUTHOR
ORDER BY
    AU_BIRTHYEAR DESC,
    AU_LNAME;