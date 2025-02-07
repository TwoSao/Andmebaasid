create database protseduurBlahun
use protseduurBlahun

Create table linn(
linnId int primary key identity(1,1),
linnNimi varchar(30),
rahvaArv int);
select * from linn
insert into linn(linnNimi, rahvaArv)
Values('TRT', 662476)

-- функция которая добавляет город
Create procedure lisaLinn
@lnimi varchar(30),
@rArv int

as 
BEGIN

insert into linn(linnNimi, rahvaArv)
Values(@lnimi, @rArv);
select * from linn;
END;

-- запуск функции
exec lisaLinn @lnimi='Viimsi', @rArv=53236


delete from linn where linnId=4;
-- функция удаления города по его айди
Create procedure kustutalinn
@deleteId int
as
begin
select * from linn
delete from linn where linnId=@deleteId;
select * from linn
end;

exec kustutalinn 4
-- процедура которая будет искать по имени(первой букве)
create procedure linnaOtsing
@taht char(1)
as
begin

select * from linn
where linnNimi like @taht + '%'; -- '%' любое количество символов

end;
exec linnaOtsing T
-- 
Alter table linn ADD test int
select * from linn

Alter table linn drop column test;

create procedure veeruLisaKustuta
@vakik varchar(20),
@veerunimi varchar(20),
@tyype varchar(20) = null
as 
begin
declare  @sqltegevus as varchar(max)
set @sqltegevus=case
when @vakik='add' then CONCAT('Alter table linn ADD ', @veerunimi, ' ', @tyype)
when @vakik='drop' then CONCAT('Alter table linn DROP COLUMN ', @veerunimi)
end;
print @sqltegevus;
begin
Exec (@sqltegevus);
end
end;
drop procedure veeruLisaKustuta
exec veeruLisaKustuta @vakik='drop', @veerunimi='test3';
select * from linn


create procedure veeruLisaKustutaTabelis
@vakik varchar(20),
@tabelinimi varchar(25),
@veerunimi varchar(20),
@tyype varchar(20) = null
as 
begin
declare  @sqltegevus as varchar(max)
set @sqltegevus=case
when @vakik='add' then CONCAT('Alter table ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyype)
when @vakik='drop' then CONCAT('Alter table ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
end;
print @sqltegevus;
begin
Exec (@sqltegevus);
end
end;
drop procedure veeruLisaKustutaTabelis
exec veeruLisaKustutaTabelis @vakik='add', @tabelinimi='linn', @veerunimi='test3', @tyype='int';
select * from linn
exec veeruLisaKustutaTabelis @vakik='drop', @tabelinimi='linn', @veerunimi='test3';

--protseduur tingimusega
create procedure rahvaHinnang
@piir int

as
begin
select linnNimi, rahvaArv, IIF(rahvaArv<@piir, 'Väike linn', 'Suur linn') as Hinnang
from linn;

end;
drop procedure rahvaHinnang
exec rahvaHinnang 299999
-- agregaat funksioonid: sum(), AVG(), min(), max(), count()


create procedure kokkuRahvaarv

as
begin
select sum(rahvaArv) as 'Kokku rahvaArv', AVG(rahvaArv) as 'keskmine rahvaArv', COUNT(*) as 'Linnade arv'
from linn
end;
drop procedure kokkuRahvaarv
exec kokkuRahvaarv
