WITH NodeTypes AS (
    SELECT
        N,
        P,
        CASE 
            WHEN P IS NULL THEN 'Root'
            WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
            ELSE 'Leaf'
        END AS Type
    FROM BST
)
SELECT N, Type
FROM NodeTypes
ORDER BY N
        