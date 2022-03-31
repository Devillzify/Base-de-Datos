/* 'Olimpíades de Cicles Formatius' és un esdeveniment cultural on participen diferents alumnes de diversos instituts de la província de Cadis en diversos Cicles Formatius (Administració, Electrònica i Informàtica). Cada institut participa amb un nombre màxim d'alumnes per a cadascun dels cicles. Per cada cicle se donen 3 premis (Or, Plata i Bronze). Els premis es concedeixen a l'institut, no als alumnes. Amb l'objectiu d'emmagatzemar aquesta informació, s'ha dissenyat la base de dades Olimpíades.
*/


-- 1) Llista d'instituts (nom) i localitat on se troben.
select i.nom as nombre, l.nom as lugar from instituts i
 left join localitats l on i.id = l.id;

-- 2) Llista d'instituts (nom i entre parèntesi la localitat on se troba) amb els seus alumnes (nom i data de naixement).
select concat(i.nom,l.nom) as instituts,concat(a.nom,"     ",a.data_naixement)as alumnes from instituts i
join localitats l on i.id = l.id
join alumnes a on i.id = a.instituts_id;

-- 3) Llista alfabètica dels participants de les olimpíades indicant nom del participant, dorsal (compost per identificador de l'institut i identificador de l'alumne), institut al que pertany i localitat d'aquest.
select a.nom,concat(a.instituts_id,a.id) as dorsal, i.nom as institut, l.nom as localitat, l.nom as localitat,i.nom as institut from alumnes a
join instituts i on i.id = a.id
join localitats l  on l.id = i.id
order by a.nom asc;

-- 4) Llista d'instituts participants indicant nom de l'institut, nombre d'Ors, nombre de Plates, nombre de Bronzes i total de medalles, en ordre descendent per aquest darrer valor. --INCOMPLETO
select i.nom,p.posicio from instituts i
join premiats p on i.id = p.instituts_id
order by p.posicio desc;

select *,(select count(*) from premiats where instituts_id = i.id and posicio = 1) oros from instituts i;

-- 5) Llista alfabètica de localitats que NO han aconseguit cap medalla a les Olimpíades.   -- ESTE FALLA
select distinct i.nom,l.nom from instituts i
join localitats l on i.id = l.id
join premiats p on l.id = p.instituts_id;
 
select i.nom,posicio from instituts i
join premiats p on p.instituts_id = i.id;

-- 6) Llista de participants d’una determinada modalitat. Mostrar dorsal i nom del participant. El llistat estarà ordenat per dorsal.
select  distinct nom from alumnes a
join participants p on a.id = p.alumnes_id;

-- 7) Llista de medalles indicant modalitat (nom), institut (nom) i tipus de medalla (or, plata o bronze). Ordenar per modalitat i medalla.

-- 8) Nom de l'alumne de més edat, l'institut on va i l'edat que té.
select a.nom, i.nom,year(now()) - year(a.data_naixement) edad from alumnes a
join instituts i on i.id = a.instituts_id
order by edad desc;

-- 9) Estadística que mostra quants alumnes hi ha de cada sexe per cada any de naixement.
select sum(sexe = 'F') as cantidadF,sum(sexe = 'M')cantidadM,year(data_naixement) from alumnes
group by year(data_naixement) order by year(data_naixement);

-- 10) Afegeix columna a instituts amb el nom de la localitat.
alter table alumnes add Column localitat varchar(45);

update instituts ins
join localitats loc on ins.localitats_id = loc.id
set localitat = loc.nom;

update instituts ins
join localitats loc on ins.localitats_id = loc.id
set NomLocalitat = loc.nom;   -- buena de marc

