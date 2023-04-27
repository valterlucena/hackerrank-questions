SET @row := 0;

SELECT
    REPEAT('* ', @row := @row + 1) AS pattern
FROM
    information_schema.tables
LIMIT
    20