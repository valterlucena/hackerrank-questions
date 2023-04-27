SELECT subq1.submission_date, cnt, subq2.hacker_id, subq2.name
FROM
(SELECT submission_date, COUNT(DISTINCT hacker_id) AS cnt
FROM
(SELECT s.submission_date, s.hacker_id 
 FROM submissions s 
 WHERE s.hacker_id IN
(SELECT hacker_id 
 FROM submissions 
 WHERE submission_date <= s.submission_date 
 GROUP BY hacker_id 
 HAVING COUNT(DISTINCT submission_date) = DATE_FORMAT(s.submission_date, "%e"))) AS subq
GROUP BY submission_date) subq1
JOIN 
(SELECT s.submission_date, min(s.hacker_id) AS hacker_id, h.name
FROM submissions s
JOIN hackers h ON s.hacker_id = h.hacker_id
WHERE s.hacker_id = 
(SELECT hacker_id FROM submissions 
 WHERE submission_date = s.submission_date
 GROUP BY hacker_id
 ORDER BY COUNT(hacker_id) DESC, hacker_id
 LIMIT 1)
GROUP BY s.submission_date, h.name) subq2
ON subq1.submission_date = subq2.submission_date;