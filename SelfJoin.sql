-- 1 --
SELECT count(id) FROM stops

-- 2 -- 
SELECT id FROM stops 
WHERE name =  'Craiglockhart'

-- 3 -- 
SELECT stops.id, stops.name
FROM stops LEFT JOIN route ON stops.id = route.stop
WHERE num = 4 AND company =  'LRT' 

-- 4 -- 
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING count(*) =2

-- 5 --
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149

-- 6 --
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road' 

-- 7 --
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop = 137

-- 8 -- 
SELECT a.company, a.num
FROM route a JOIN route b ON 
(a.company = b.company AND a.num = b.num)
JOIN stops stopa ON stopa.id = a.stop
JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'

-- 9 --
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
(a.company = b.company AND a.num = b.num)
JOIN stops stopa ON stopa.id = a.stop
JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart' AND a.company = 'LRT'

-- 10 -- 
SELECT one.num, one.company, one.name, two.num, two.company
FROM 
    (select distinct a.num, a.company, stopb.name
     from route a join route b on (a.company = b.company and a.num = b.num)
                  join stops stopa on stopa.id = a.stop
                  join stops stopb on stopb.id = b.stop
     where stopa.name = 'Craiglockhart' and stopb.name <> 'Lochend'
     ) AS one
JOIN 
    (select distinct c.num, c.company, stopc.name
     from route c join route d on (c.company = d.company and c.num = d.num)
                  join stops stopc on stopc.id = c.stop
                  join stops stopd on stopd.id = d.stop
     where stopc.name <> 'Craiglockhart' and stopd.name = 'Lochend'
     ) AS two
ON (one.name = two.name)

