SELECT
    LGBRAND.BRAND_NAME,
    COUNT(PROD_SKU) AS NUMPRODUCTS
FROM LGPRODUCT
JOIN LGBRAND ON LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY LGBRAND.BRAND_ID
ORDER BY BRAND_NAME;