SELECT C1.CONTEST_ID, HACKER_ID, NAME,
    SUM(S.TOTAL_SUBMISSIONS) AS GRAND_TOTAL_SUBMISSIONS,
    SUM(S.TOTAL_ACCEPTED_SUBMISSIONS) AS GRAND_TOTAL_ACCEPTED_SUBMISSIONS,
    SUM(V.GRAND_TOTAL_VIEWS) AS GRAND_TOTAL_VIEWS,
    SUM(V.GRAND_TOTAL_UNIQUE_VIEWS) AS GRAND_TOTAL_UNIQUE_VIEWS
FROM 
    CONTESTS C1 
    LEFT JOIN COLLEGES C2 ON C1.CONTEST_ID = C2.CONTEST_ID 
    LEFT JOIN CHALLENGES C3 ON C2.COLLEGE_ID = C3.COLLEGE_ID
    LEFT JOIN (
        SELECT CHALLENGE_ID, 
        SUM(TOTAL_VIEWS) AS GRAND_TOTAL_VIEWS, 
        SUM(TOTAL_UNIQUE_VIEWS) AS GRAND_TOTAL_UNIQUE_VIEWS
        FROM VIEW_STATS
        GROUP BY CHALLENGE_ID
    ) V ON C3.CHALLENGE_ID = V.CHALLENGE_ID
    LEFT JOIN (
        SELECT CHALLENGE_ID, 
        SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS, 
        SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
        FROM SUBMISSION_STATS
        GROUP BY CHALLENGE_ID
    ) S ON C3.CHALLENGE_ID = S.CHALLENGE_ID
GROUP BY 
    C1.CONTEST_ID, HACKER_ID, NAME
HAVING 
    SUM(S.TOTAL_SUBMISSIONS) + 
    SUM(S.TOTAL_ACCEPTED_SUBMISSIONS) +
    SUM(V.GRAND_TOTAL_VIEWS) +
    SUM(V.GRAND_TOTAL_UNIQUE_VIEWS) != 0
ORDER BY C1.CONTEST_ID;