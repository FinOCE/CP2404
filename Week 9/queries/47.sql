SELECT
    ROUND(AVG(datediff(CHECK_IN_DATE, CHECK_OUT_DATE)), 2) AS 'Average Days Kept'
FROM CHECKOUT;