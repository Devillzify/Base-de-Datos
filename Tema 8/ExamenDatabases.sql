use COMPANYIA;


-- Pregunta 1:
select nom_empleat,salari from EMPLEATS
where departament = 1 or departament = 2 or departament = 3;  -- 0,5++
--
--
--
-- 
-- Pregunta 2:
select departament,max(salari) from EMPLEATS where id_empleat is not null group by departament;
--
--
--
--
-- Pregunta 3:
select count(e.departament),d.nom_departament from DEPARTAMENTS d
join CIUTATS c on  c.id_ciutat = d.ciutat_departament
join EMPLEATS e on e.departament = d.id_departament
group by id_departament;
--
--
--
--
-- Pregunta 4:
-- JOIN
select e.nom_empleat,d.edifici from EMPLEATS e
join DEPARTAMENTS d on e.departament = d.id_departament;
--
-- SUBQUERY
select nom_empleat from EMPLEATS where departament in(select id_departament from DEPARTAMENTS); -- mal
--
--
--
--
-- Pregunta 5:
select c.nom_ciutat from CIUTATS c 
join EMPLEATS e on e.ciutat_empleat = c.id_ciutat
join DEPARTAMENTS d on d.id_departament = e.departament
where d.nom_departament is null;

select c.nom_ciutat from CIUTATS c
join EMPLEATS e on e.ciutat_empleat = c.id_ciutat
join DEPARTAMENTS d on d.id_departament = e.departament;
--
--
--
--
-- Pregunta 6:
select nom_empleat,max(salari) from EMPLEATS 
group by nom_empleat order by max(salari) desc limit 1;
--
--
--
--
-- Pregunta 7 -- regular
select p.id_projecte,e.nom_empleat,e.salari from PROJECTES p
join EMPLEATS e on e.projecte = p.id_projecte;


select p.id_projecte,e.nom_empleat,e.salari from PROJECTES p
join EMPLEATS e on e.projecte = p.id_projecte
where e.salari in(select max(salari) from EMPLEATS group by projecte);
--
--
--
--
-- Pregunta 8 -- bien
select e.nom_empleat,d.nom_departament,p.nom_projecte from EMPLEATS e
join DEPARTAMENTS d on d.id_departament = e.departament
join PROJECTES p on p.id_projecte = e.projecte;
--
--
--
--
-- Pregunta 9 

select p.id_projecte,count(id_empleat)as cantidad from EMPLEATS e
join PROJECTES p on p.id_projecte = e.projecte
group by id_projecte
having cantidad > 2;
--
--
--
-- Pregunta 10
select concat(p.id_projecte,' ',p.nom_projecte)as Relacio,count(id_empleat)as cantidad from EMPLEATS e
right join PROJECTES p on p.id_projecte = e.projecte
group by id_projecte
having cantidad < 1;
--
--
--
--
-- Pregunta 11:
select e.nom_empleat,e.salari,p.id_projecte from EMPLEATS e
join PROJECTES p on p.id_projecte = e.projecte
where id_projecte = 1 and salari > 2312.5000 or id_projecte = 2 and salari > 2312.5000 or id_projecte = 3 and salari > 1375;

select avg(salari),projecte from EMPLEATS group by projecte;
--
--
--
--
-- Pregunta 12: -- sin revisar aun
select nom_empleat,ciutat_empleat from EMPLEATS e
join DEPARTAMENTS d on e.departament = d.id_departament
where d.ciutat_departament != e.ciutat_empleat;
--
--
--
--
-- Pregunta 13:
select id_projecte, nom_projecte from PROJECTES p 
join EMPLEATS e on e.projecte = p.id_projecte
where e.salari > 1500 and p.pressupost > 6000;
--
--
--
--
-- Pregunta 14:

UPDATE salari
SET  salari = salari + 20%;



