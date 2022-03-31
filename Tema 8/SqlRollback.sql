create database test;
use test;


select @@autocommit;

create table trantest(
camp int primary key
);
insert into trantest values(1);

start transaction; -- empezar transaction
insert into trantest values(2);
rollback;

begin;
insert into trantest values(2);
commit;

begin;
insert into trantest values(3);


-- 
--

set @@autocommit = 0;
select @@autocommit;
insert into trantest values(6);
rollback;

set @@autocommit = 1;
select @@autocommit;

delete from trantest where camp = 6;
insert into trantest values(4);


use ebanca;
set @@autocommit = 1;
begin;
update cuentas set saldo = saldo - 100 where cod_cuenta = 3;
update cuentas set saldo = saldo + 100 where cod_cuenta = 4;
commit;


use test;

-- implicit commit

begin;

insert into trantest values(12);


select @@transaction_isolation;

set transaction isolation level read uncommitted;

