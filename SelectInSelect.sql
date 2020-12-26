-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
			
-- 2
select name from world 
where continent = 'Europe' and gdp/population > (select gdp/population from world where name = 'United Kingdom')

-- 3
select name, continent from world 
where continent in 
(select continent from world where name in ('Argentina','Australia'))
order by name 

-- 4
select name from world 
where population > (select population from world where name ='Canada') and 
population < (select population from world where name = 'Poland')

-- 5
select name, 
concat(round(100*population/(select population from world where name = 'Germany'),0),'%') percentage
from world 
where continent = 'Europe'

-- 6
select name 
from world 
where gdp > all(select gdp from world where continent = 'Europe' and gdp > 0)

-- 7
select continent, name, area 
from world x 
where area >= all(select area from world y where x.continent = y.continent and area >0)

-- 8 
select continent, name 
from world x 
where name <= all(select name from world y where x.continent = y.continent)

-- 9
select name, continent,population 
from world x
where 25000000 > all(select population from world y where y.continent = x.continent)

-- 10 
select name,continent
from world x 
where population > all(select population*3 from world y where x.continent = y.continent and x.name != y.name)