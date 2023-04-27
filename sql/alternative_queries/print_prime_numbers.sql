WITH RECURSIVE numbers AS (
    select 2 as n
    UNION ALL
    select numbers.n + 1 from numbers where numbers.n < 999
)
SELECT GROUP_CONCAT(p.n SEPARATOR '&') 
FROM numbers p 
where 0 not in (
    select (p.n % numbers.n)
    from numbers
    where numbers.n <> p.n
)