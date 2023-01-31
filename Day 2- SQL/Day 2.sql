
-- Day 2
use inventoryManagementSystem;

--Write a Default constarint for category column as admin
alter table Users add constraint df_Category default 'admin' for Category;
insert into Users(UserName,Password,FullName,IsActive) values('Vikram','sara','VikramSara',1);
insert into users(UserName,Password,FullName,IsActive) values ('Prabhu','Raj','Prabhuraj',1);
select * from users;

--Write check constraint for transcation type : Inward or Outward:
Alter table [Transaction] add check (TransactionType='Inward' or TransactionType='Outward' or TransactionType='In' or TransactionType='out');
insert into [Transaction] values ('2022-09-09',10,'Inward',100,2);
insert into [Transaction] values ('2023-01-11',11,'Outward',200,1);
insert into [Transaction] values ('2022-10-09',10,'In',50,2);
insert into [Transaction] values ('2022-09-12',10,'Out',150,1);
--Getting an error when using transactiontype=xyz
insert into [Transaction] values ('2022-09-12',10,'xyz',150,1);
Select * from [Transaction];

--Where clause is for filtering data = is single row comparitive operator
Select * from Users where Category='admin';
Select * from ProductMaster where AvailableQty>500 and AvailableQty!=750 ;
Select * from [Transaction] where TransactionType='In' or TransactionType='Inward';
Select * from ProductMaster where AvailableQty between 500 and 1000;

--Working with IN Operator
Insert Into productmaster values('Screw',1500),('Tv',500);
Select * from ProductMaster;
Select productName,AvailableQty from ProductMaster where AvailableQty in (250,1000,500);
Select * from ProductMaster where AvailableQty in (750,1500);

--Working with Not In operator
Select * from ProductMaster where AvailableQty not in (500,1500);
Select * from ProductMaster where ProductName not in ('nails','screw');

--Like Operator
	--User Name starts with S
    Select * from Users where UserName like 'S%';
    --FullName have 'R' followed by some character then by 'R'
	Select * from Users where fullName like 'r%R%';
	--User name having having third letter 'k'
	Select * from Users where UserName like '__k%' ;
    --UserName ends with m
	Select * from Users where UserName like '%M';
    -- User name starts with 'SA' or it ends with 'a'
	Select * from Users where UserName like 'sa%' or UserName like '%a';

 


-- Functions in SQL 
--Aggregate Functions

Select * from ProductMaster

--Max Function
Select Max(AvailableQTY) as Highest_Quantity from productmaster;

--Min Function
Select Min(Availableqty) from ProductMaster;
Select Min(AvailableQty) as Low_Quantity from ProductMaster;

--Sum Function
Select Sum(AvailableQty) as TotalSum from ProductMaster;

--Count Function to get total rows
Select Count(*) as TotalCount from ProductMaster;

-- Count Function in other way
Select Count(UserId) from Users;

--Avg Function
Select Avg(AvailableQTY) from ProductMaster;