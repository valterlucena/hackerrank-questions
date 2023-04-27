SELECT w.id, p.age, w.coins_needed, w.power
FROM Wands w JOIN Wands_Property p on w.code = p.code
WHERE p.is_evil = 0 AND w.coins_needed = (SELECT MIN(coins_needed)
                                          FROM Wands
                                          WHERE code = w.code AND power = w.power)
ORDER BY w.power DESC, p.age DESC