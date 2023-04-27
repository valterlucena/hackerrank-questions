SELECT IF(Grade > 7, Name, NULL), Grade, Marks
FROM Students
JOIN Grades
WHERE Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY Grade DESC, Name