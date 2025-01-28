--AB loomine
Create database BlahunBaas;

use BlahunBaas
Create table opilane(
opilaneId int primary key identity(1,1),
eesinimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--Andmete lisamine tabelisse
Insert into opilane(eesinimi, perenimi, synniaeg, stip, keskmine_hinne)
Values(
'Nikita4',
'Nikita4',
'2000-11-02',
1,
5),
(
'Nikita5',
'Nikita5',
'2004-06-22',
0,
3)
--tabeli kustutamine
drop table opilane;
--rida kustuma
Delete from opilane where opilaneId=2;
update opilane set aadress='Tartu'
where opilaneid=3
