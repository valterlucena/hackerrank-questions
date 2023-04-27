SELECT h.hacker_id, h.name
FROM Hackers h 
JOIN Submissions s ON h.hacker_id = s.hacker_id 
JOIN Challenges c ON s.challenge_id = c.challenge_id 
JOIN Difficulty d ON d.difficulty_level = c.difficulty_level AND d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id ASC