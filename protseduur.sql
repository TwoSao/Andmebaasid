create database protseduurBlahun
use protseduurBlahun

Create table linn(
linnId int primary key identity(1,1),
linnNimi varchar(30),
rahvaArv int);
select * from linn
insert into linn(linnNimi, rahvaArv)
Values('Kiev', 662476)

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
exec lisaLinn @lnimi='Tallinn', @rArv=53236


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
