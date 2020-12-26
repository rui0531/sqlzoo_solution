-- 1
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'
	
-- 2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

-- 3
SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 4
SELECT team1, team2, player 
FROM game 
LEFT JOIN goal ON id = matchid
WHERE player LIKE 'Mario%'

-- 5
SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON teamid = id
WHERE gtime<=10

-- 6
SELECT game.mdate, teamname 
FROM game JOIN eteam ON game. team1 = eteam.id
WHERE coach = 'Fernando Santos'

-- 7
SELECT player FROM goal LEFT JOIN game ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'

-- 8 
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE ((team1='GER' OR team2='GER') AND teamiD != 'GER')
		
-- 9 
SELECT teamname, COUNT(*)
FROM goal LEFT JOIN eteam on teamid = id
GROUP BY teamname

-- 10
SELECT stadium, count(1)
FROM goal LEFT JOIN game on id = matchid
GROUP BY stadium

-- 11
SELECT matchid, mdate, count(*)
FROM goal JOIN game ON matchid = id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate
	
-- 12
SELECT matchid, mdate,count(1) 
FROM goal JOIN game ON id = matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate

-- 13
SELECT mdate, team1, 
sum(case when teamid = team1 then 1 else 0 end) score1,
team2, 
sum(case when teamid = team2 then 1 else 0 end) score2
FROM goal LEFT JOIN game ON id = matchid 
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2 
