SELECT cO.CONTINENT, FLOOR(AVG(ci.POPULATION))
FROM CITY ci
INNER JOIN COUNTRY co
    on ci.COUNTRYCODE = co.CODE
GROUP BY co.CONTINENT