-- 1 -- 
SELECT name FROM teacher WHERE dept IS NULL

-- 2 -- 
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 3 -- 
SELECT t.name, d.name 
FROM teacher t LEFT JOIN dept d 
ON t.dept = d.id

-- 4 -- 
SELECT t.name, d.name 
FROM dept d LEFT JOIN teacher t 
ON t.dept = d.id

-- 5 --
SELECT name, coalesce(mobile,'07986 444 2266')
FROM teacher

-- 6 --
SELECT t.name, coalesce(d.name,'None')
FROM teacher t LEFT JOIN dept d
ON t.dept = d.id

-- 7 --
SELECT count(name), count(mobile)
FROM teacher

-- 8 --
SELECT d.name, count(t.name)
FROM dept d left join teacher t
ON d.id = t.dept
GROUP BY d.name

-- 9 --
SELECT name, CASE WHEN dept = 1 THEN 'Sci'
                  WHEN dept = 2 THEN 'Sci'
                  ELSE 'Art' END
FROM teacher

-- 10 --
SELECT name, CASE WHEN dept = 1 THEN 'Sci'
                  WHEN dept = 2 THEN 'Sci'
                  WHEN dept = 3 THEN 'Art'
             ELSE 'None' END
FROM teacher