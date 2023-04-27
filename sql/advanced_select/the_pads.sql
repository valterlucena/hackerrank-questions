(SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS temp
FROM OCCUPATIONS
ORDER BY Name ASC)
UNION
(SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation ASC)
ORDER BY temp