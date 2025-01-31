Create database epoodBlahun;
use epoodBlahun;

Create table Category(
idCategory int primary key identity(1,1),
CategoryName varchar(25) unique
)
select * from Category
insert into Category (CategoryName)
values ('liha'), ('toit');

-- tabeli striktuuri muutmine --> uue veergu lisamine
alter table Category ADD test int;

-- tabeli striktuuri muutmine --> veergu kustumine
alter table Category drop column test;

create table Product (
    idProduct int primary key identity(1,1),
    ProductName varchar(25) unique,
    Price int,
    idCategory int,
    Foreign key (idCategory) references Category(idCategory)  
);
insert into Product (ProductName, Price, idCategory)
values ('Veiseliha', 75, 5), ('õunad', 200, 4);
select * from Product

create table Sale (
idSale int primary key identity(1,1),
idCustomer int,
Count int,
DateOfSale date,
idProduct int,
Foreign key (IdProduct) references Product(idProduct)
)
insert into Sale (idProduct, idCustomer, Count, DateOfSale)
values 
(1, 1, 2, '2025-01-12'),  
(2, 2, 5, '2025-02-06'),
(3, 1, 12, '2025-02-15'),
(4, 1, 8, '2025-02-18'),
(5, 2, 9, '2025-02-22')

select * from Category;
select * from Product;
select * from Sale

create table Customer (
idCustomer int primary key identity(1,1), 
Name varchar(25), 
contact text
) 
insert into Customer (Name, contact)
values ('Roman', '5290 2190')
--tabeli muutmine --> FK lisamine
alter table Sale add foreign key (idCustomer)
References Customer(idCustomer)
-- tabeli Custome täitmine
-- tabeli Sale täitmine

select * from Category
select * from Product
select * from Sale
select * from Customer

-- kustutab kõik kirjed
delete from Sale;

