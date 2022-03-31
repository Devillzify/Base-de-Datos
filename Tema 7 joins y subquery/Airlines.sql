USE airline;

-- 1) Flight number, arrival airport and the pilot identifier of all flights departing from 'Bilbao' (two ways: subquery and join).

select f.flight_number,f.arrival_airport,f.id_pilot,a.location
from FLIGHTS f
join AIRPORTS a on f.departure_airport = a.id_airport
where a.location = 'Bilbao';

-- 2) Flight number, arrival location and the pilot alias of all flights departing from 'Bilbao'.

-- 3) Firstname and number of flights of ALL pilots;

-- 4) Firstname and number of flights of pilots with more than 2 flights.

-- 5) List of pilot identifiers and surnames who have not flown as a copilot. 

-- 6) List of (identifiers and surnames) pilots and copilots who have not flown as a copilot or pilot respectively.

-- 7) List of flights with flight number, departure date, departure location, arrival location, pilot alias and copiloy alias.

select flight_number,departure_time,departure_airport,arrival_airport,id_pilot,id_copilot from FLIGHTS f
join AIRPORTS a where a.id_airport = f.flight_number;



select flight_number, departure_time, ad.location as departure_airport, aa.location as arrival_airport, cp.alias, cc.alias
from FLIGHTS f
join CREWS cp on cp.id_crew = f.id_pilot
join CREWS cc on cc.id_crew = f.id_copilot 
join AIRPORTS ad on ad.id_airport = f.departure_airport
join AIRPORTS aa on aa.id_airport = f.arrival_airport;
