USE world;

-- 1. Select identifier, name and population from only 10 records of cities.
--    Order the data by population from the most populated to the least populated city

select ID,Name,Population from city order by Population desc limit 10;

<<<<<<< HEAD
=======
select ID,Name,Population from city order by Population desc limit 10;
>>>>>>> 63987874f847c5c6f5ffdfd680f691eb0177a7fb
-- 2. The same as in 1, but now only rows from 16 to 20.

select ID,Name,Population from city order by Population desc limit 16,4;

-- 3. Number of cities

select  distinct count(*) from city;

-- 4. Show name and population from the most populated city in the table.

select * from city order by population desc limit 1;

<<<<<<< HEAD
select name,population from city where population = (select max(population) from city);
=======
>>>>>>> 63987874f847c5c6f5ffdfd680f691eb0177a7fb
-- 5. Show name and population from the least populated city in the table.

select name,population from city order by population limit 1;

<<<<<<< HEAD

select name,population from city where population = (select min(population) from city);
=======
>>>>>>> 63987874f847c5c6f5ffdfd680f691eb0177a7fb
-- 6. Show name and population from the most and the least populated cities in the table.

SELECT Name, Population from city
WHERE Population = (SELECT MAX(Population) FROM city)
OR Population = (SELECT MIN(Population) FROM city);

<<<<<<< HEAD
=======
select name,population from city 
where population = (select max(population) from city);

select name,population from city 
where population = (select min(population) from city);

>>>>>>> 63987874f847c5c6f5ffdfd680f691eb0177a7fb
-- 7. All cities (name and population) with a population above one million people.

select name, population from city where population > 1000000;

-- 8. Select all city names which begin with Kal.

select name from city where name like "kal%";

-- 9. Select all columns for one specific city, namely Bratislava.

select * from city where name = "Bratislava";

-- 10. Find out cities with a population between 670000 and 700000.

select * from city where population between 670000 and 700000;

-- 11. Returns the total number of people in the towns of the New York district.

select sum(population),name from city where District = "New York";

-- 12. Select every district from USA with its total number of people.

<<<<<<< HEAD
select district,sum(population) from city where CountryCode = "USA"group by district;
=======
select sum(population) from city where CountryCode = "USA";
>>>>>>> 63987874f847c5c6f5ffdfd680f691eb0177a7fb

-- 13. Select all districts from USA which have population over 3 million people

select * from city where CountryCode = "USA" group by district having population > 3000000;

select district from city where CountryCode = "USA" and population > 3000000;

-- 14. Show the number of countries and the average population per continent:

select distinct Code,avg(population),count(Continent) from country group by Continent;

select count(*), avg(population), continent from country group by continent;

-- 15. Select all country names that doesn't have any city.

select c.name from country c 
left join city i on i.CountryCode = c.Code
where i.CountryCode is null;

select name, capital from country where Capital is null;

-- 16. Select all country names with its number of cities (two ways: subquery and join).

<<<<<<< HEAD
select CountryCode,count(*) from city group by CountryCode;

-- buena

select co.Name, (select count(*) from city ci where ci.CountryCode = co.Code) as nº_cities
from country co
group by Code;

select co.Name, count(ci.ID) as nº_cities
from country co
left join city ci on co.Code = ci.CountryCode
group by Code; 

-- 17. Select all country names with its capital name (two ways: subquery and join).

select c.name,d.Capital from country d
join country c on c.code = d.code;

select co.Name, c.Name 
from country co
left join city c on co.Capital = c.ID; 
=======
select name,count(city) from country;

-- 17. Select all country names with its capital name (two ways: subquery and join).


>>>>>>> 63987874f847c5c6f5ffdfd680f691eb0177a7fb

-- 18. Select repeated cities names and the number of repetition

select Name, count(Name) 
from city 
group by Name;

-- 19. Select language (with country code in brackets) from all countries in Europe (two ways: subquery and join).

select Language,countrycode from countrylanguage cl
join country c on cl.CountryCode = c.Code
where Continent = 'Europe';

select Language, name from country where (select Countrycode from CountryCode where CountryCode = 'Europe');

select concat(Language,'(',CountryCode,')') Languages
from countrylanguage cl 
join country c on cl.CountryCode = c.Code
where Continent = 'Europe';

-- 20. Select language and country name from all countries in Europe (two ways: subquery and join).

select Language,CountryCode,
(select name from country where code = CountryCode) Pais
from countrylanguage cl 
where  CountryCode in (select Code from country
where Continent = 'Europe');

-- 21. Select country name, life expectancy, continent, area and population from the country with the highest and lowest life expectancy

select Name,LifeExpectancy,Continent,SurfaceArea,Population from country
where LifeExpectancy = (select max(LifeExpectancy) from country)
or LifeExpectancy = (select min(LifeExectancy) from country);


-- 22. Select the average population from all countries

-- 23. Select name, continent and population from countries with a population lower than the average population from all countries 

-- 24. Select the total area from every continent

-- 25. Select the number of countries for every different government form (ordered from the most common government form to the least common one)

-- 26. What is the most common government form? (Build a query to answer this question)
