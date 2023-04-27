WITH median AS (
    SELECT 
        *,
        ROW_NUMBER() OVER(ORDER BY LAT_N) AS rank_asc,
        ROW_NUMBER() OVER(ORDER BY LAT_N DESC) AS rank_desc
    FROM STATION
)
SELECT ROUND(LAT_N, 4)
FROM median
WHERE rank_asc = rank_desc
    