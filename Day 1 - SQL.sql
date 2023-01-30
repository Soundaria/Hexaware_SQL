
create database inventoryManagementSystem;

use  inventoryManagementSystem;

create table Users
(
UserId int primary key identity(1,1),
UserName varchar(50),
Password varchar(25),
FullName varchar(255),
IsActive bit,
Category varchar(50)
);

create table ProductMaster
(
ProductId int primary key identity(1,1),
ProductName varchar(50),
AvailableQty bigint
);


create table [Transaction](
TransactionId int primary key identity(1,1),
TransactionDate date,
ProductId int foreign key references ProductMaster(ProductId),
TransactionType varchar(50),
Qty int,
UpdatedBy int foreign key references Users(UserId)
);

--alter command

alter table [Transaction] alter column ProductId int not null;
alter table [Transaction] alter column TransactionType int not null;
alter table [Transaction] alter column UpdatedBy int not null;
alter table ProductMaster alter column ProductName varchar not null;
alter table ProductMaster alter column AvailableQty bigint not null;

alter table [Transaction] drop [FK__Transacti__Updat__33D4B598];

alter table[Transaction] add foreign key(UpdatedBy) references Users(UserId);

---Insert Command

insert into users values
('Soundaria','Sound','SoundariaSekar',1,'Staff'),
('SakthiNivasni','Sakthi','SakthiSaravanan',1,'Staff'),
('Rahul','12345','RahulRajendran',1,'Admin');
insert into Users values('Mathew','1234567','Mathew@123',1,'Admin');
select * from users;

insert into ProductMaster values
('Fan',500),
('TubeLight',750),
('Washing Machine',250);
insert into ProductMaster values('Nails',1000);

select * from ProductMaster;

insert into [Transaction] values
('2022-08-30',9,'online',10,2),
('2023-01-10',10,'offline',5,1),
('2022-10-20',11,'Offline',20,1);
insert into [Transaction] values('2022-11-21',9,'In',500,4);

update [Transaction] set TransactionType='In' where TransactionId=5;
update [Transaction] set TransactionType='Out' where TransactionId=7;
update [Transaction] set TransactionType='Out' where TransactionId=6;

select * from [Transaction];

--select all users fullname and category
select FullName,Category from Users;

--select productName where availableQty is less than 500
select ProductName from ProductMaster where AvailableQty<500;

--select transaction detail done by user mathew Here updatedby is set to 4 because Mathew's userid is 4. 
select * from [Transaction] where UpdatedBy=4;


--Select the transactionDate and Transaction Type from transaction table
select TransactionDate,TransactionType from [Transaction];

-- Fetch only the Inward Transaction details.
select * from [Transaction] where TransactionType='In';

--Fetch the product details of Nails.
select * from ProductMaster where ProductName='Nails';

