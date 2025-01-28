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
drop table oppimine;
--rida kustuma
Delete from opilane where opilaneId=2;
update opilane set aadress='Tartu'
where opilaneid=3

CREATE TABLE language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
select * from language

insert into language(ID, Code, Language)
Values(2, 'RUS', 'vene'), (3, 'ENG', 'inglise'), (4, 'DE', 'saksa')

Create table keelevalik(
keeleValikId  int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
Language int,
Foreign key (Language) references Language(ID)
)
select * from keelevalik
select * from language
select * from opilane

Insert into keelevalik(valikuNimetus, opilaneId, Language)
Values('valik B', 2, 3)

Delete from keelevalik where opilaneId=4; 

Select opilane.eesinimi, language.Language
from opilane, language, keelevalik
Where opilane.opilaneid=keelevalik.opilaneId
and language.ID=keelevalik.Language
------------------------------------------------------------------------------------
--vigane kood
create table oppimine(
oppimineId int primary key identity(1,1),
aine varchar(35) not null,
aasta int,
opilanesId int,
opetaja varchar(25),
hinne int,
Foreign key (opilanesId) references opilane(opilaneId)
)
Insert into oppimine(aine, aasta,opetaja,hinne)
values('ingli', 15, 1, 'Sayapina', 5 )
select * from opilane, oppimine
where opilane.opilaneId=oppimine.opilanesId
