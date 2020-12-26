-- 1
select id, title 
from movie 
where yr = 1962

-- 2
select yr 
from movie 
where title = 'Citizen Kane'

-- 3
select id, title, yr 
from movie 
where title like '%Star Trek%'
order by yr

-- 4
select id 
from actor 
where name = 'Glenn Close'

-- 5
select id 
from movie 
where title = 'Casablanca'

-- 6
select name 
from casting left join actor 
on id = actorid 
where movieid = 11768

-- 7
select name 
from casting left join actor 
on id = actorid 
where movieid = (select id from movie 
where title = 'Alien')

-- 8
select title 
from movie left join casting 
on id = movieid 
where actorid in (select id from actor where name = 'Harrison Ford') 

-- 9
select title 
from movie left join casting on id = movieid
where actorid = (select id from actor where name = 'Harrison Ford') and ord != 1

-- 10
select title, actor.name
from movie left join casting on movie.id = movieid
left join actor on actorid = actor.id
where yr = 1962 and ord = 1

-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
select title, name 
from casting left join movie on movie.id = movieid
left join actor on actor.id = actorid
where casting.ord = 1 and 
movieid in (select movieid from casting left join actor on actor.id = actorid 
where name = 'Julie Andrews')

-- 13
select a.name
from casting c join actor a 
on a.id = c.actorid
group by a.name 
having sum(case c.ord when 1 then 1 else 0 end) >=15 

-- 14
select title, count(actorid)
from casting c join movie m on m.id = c.movieid
where yr = 1978
group by title
order by count(actorid)desc,title

-- 15
select distinct a.name
from casting c left join actor a on c.actorid = a.id
where movieid in 
(select movieid from casting left join actor on casting.actorid = actor.id where name = 'Art Garfunkel') AND name != 'Art Garfunkel'

