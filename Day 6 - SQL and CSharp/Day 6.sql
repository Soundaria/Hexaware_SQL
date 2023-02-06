--Day 6

Select * from LMS_BOOK_DETAILS;
Select * from LMS_SUPPLIERS_DETAILS;
Select * from LMS_MEMBERS;
Select * from lms_book_issue;


Select   l1.BOOK_TITLE,l2.SUPPLIER_NAME,l4.MEMBER_NAME  
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID
join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE join 
LMS_MEMBERS as l4 on l4.MEMBER_ID=l3.MEMBER_ID;

-- we can use this joins in stored procedure to reduce time for execution
-- Beacuse it is pre compiled statement.
-- This stored procedure can have parameters
-- Procedures are more effective with dml commands --> update insert and delete and dql statement select
-- more effective with dyanamic data.

go
create proc fetch_details
as begin
Select   l1.BOOK_TITLE,l2.SUPPLIER_NAME,l4.MEMBER_NAME  
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID
join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE join 
LMS_MEMBERS as l4 on l4.MEMBER_ID=l3.MEMBER_ID;
end

exec fetch_details


-- procedures with parameters
go
create proc usp_AddFine
(@fr char(5), @fa int)
AS
Begin
insert into LMS_FINE_DETAILS values(@fr,@fa);
Select * from lms_fine_details;
END

execute usp_AddFine 'R9',270;

-- Views
--Virtual table
--Light weight

Create View vw_Book_details
AS

Select   l1.BOOK_TITLE,l2.SUPPLIER_NAME,l4.MEMBER_NAME  
from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID
join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE join 
LMS_MEMBERS as l4 on l4.MEMBER_ID=l3.MEMBER_ID;

Select * from vw_Book_details where supplier_name like 'S%';


--Trigggers
--Automatic notification sent whendml commands are executed

--insert trigger
go
Create trigger trg_InsertFine
on lms_fine_details
FOR insert As
BEGIN
print 'A New Row added '
END

insert into lms_fine_details values('R12',325)

--update trigger
go
Create trigger trg_UpdateFine
on lms_fine_details
FOR update As
BEGIN
print 'A  Row updated in Fine Details table '
END

update LMS_FINE_DETAILS set FINE_RANGE='r11' where FINE_AMOUNT=325

--delete trigger
go
create trigger upd on lms_fine_details
for delete as
begin
rollback
print 'not allowed to delete'
end

delete from LMS_FINE_DETAILS where FINE_RANGE='r11'

--Also we can disable  the trigger and enable the trigger using the disable and enable keywords.