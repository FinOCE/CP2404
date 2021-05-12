SELECT
    PAT_ID AS PATRON,
    BOOK_NUM AS BOOK,
    datediff(CHECK_IN_DATE, CHECK_OUT_DATE) AS 'Days Kept'
FROM CHECKOUT
WHERE CHECK_IN_DATE IS NOT NULL -- Line added to remove NULL values, not sure if wanted or not
ORDER BY
    datediff(CHECK_IN_DATE, CHECK_OUT_DATE) DESC,
    PAT_ID,
    BOOK_NUM;