USE world;

-- 1. Select identifier, name and population from only 10 records of cities.
--    Order the data by population from the most populated to the least populated city

select ID,Name,Population from city order by Population desc limit 10;

select ID,Name,Population from city order by Population desc limit 10;
-- 2. The same as in 1, but now only rows from 16 to 20.

select ID,Name,Population from city order by Population desc limit 16,4;

-- 3. Number of cities

select  distinct count(*) from city;

-- 4. Show name and population from the most populated city in the table.

select * from city order by population desc limit 1;

-- 5. Show name and population from the least populated city in the table.

select name,population from city order by population limit 1;

-- 6. Show name and population from the most and the least populated cities in the table.

SELECT Name, Population from city
WHERE Population = (SELECT MAX(Population) FROM city)
OR Population = (SELECT MIN(Population) FROM city);

select name,population from city 
where population = (select max(population) from city);

select name,population from city 
where population = (select min(population) from city);

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

select sum(population) from city where CountryCode = "USA";

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

select name,count(city) from country;

-- 17. Select all country names with its capital name (two ways: subquery and join).



-- 18. Select repeated cities names and the number of repetition

-- 19. Select language (with country code in brackets) from all countries in Europe (two ways: subquery and join).

-- 20. Select language and country name from all countries in Europe (two ways: subquery and join).

-- 21. Select country name, life expectancy, continent, area and population from the country with the highest and lowest life expectancy

-- 22. Select the average population from all countries

-- 23. Select name, continent and population from countries with a population lower than the average population from all countries 

-- 24. Select the total area from every continent

-- 25. Select the number of countries for every different government form (ordered from the most common government form to the least common one)

-- 26. What is the most common government form? (Build a query to answer this question)
