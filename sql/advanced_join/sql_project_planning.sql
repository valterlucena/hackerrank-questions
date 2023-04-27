WITH Project_Dates AS (
    SELECT
        Start_Date, 
        End_Date, 
        SUM(CASE WHEN Start_Date IN (SELECT End_Date FROM Projects)
            THEN 0 ELSE 1 END) 
            OVER (ORDER BY Start_Date) AS Project_ID
    FROM Projects
), Project_Duration AS (
    SELECT 
        Project_ID,
        MIN(Start_Date) AS Start_Date,
        MAX(End_Date) AS End_Date,
        COUNT(Start_Date) AS Duration
    FROM Project_Dates
    GROUP BY Project_ID
)
SELECT Start_Date, End_Date
FROM Project_Duration
ORDER BY Duration, Start_Date