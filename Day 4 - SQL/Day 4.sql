---DAY 4

select * from LMS_BOOK_DETAILS;
select * from LMS_BOOK_ISSUE;
select * from LMS_FINE_DETAILS;
select * from LMS_MEMBERS;
select * from LMS_SUPPLIERS_DETAILS;

-- Joins
-- Inner joins  => keyword 'inner join' or 'join' can be used.

--Display the book code,book name ,supplier name  of books in library
	select BOOK_CODE,BOOK_TITLE,SUPPLIER_NAME from LMS_BOOK_DETAILS join LMS_SUPPLIERS_DETAILS on LMS_BOOK_DETAILS.SUPPLIER_ID=LMS_SUPPLIERS_DETAILS.SUPPLIER_ID;
--using aliases
	select l1.BOOK_CODE,l1.BOOK_TITLE,l2.SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID;

--Display the book name and the member id from the library
	select distinct book_title,member_id from LMS_BOOK_DETAILS join LMS_BOOK_ISSUE on LMS_BOOK_DETAILS.BOOK_CODE=LMS_BOOK_ISSUE.BOOK_CODE;
--using aliases
	select distinct l1.book_title,l2.member_id from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE;

--Display employee name and the department name 
	select first_name+' '+last_name as name, name as department_name from employee join department on department_id=department.id
--using aliases
	select l1.first_name+' '+l1.last_name as name, l2.name as department_name from employee as l1 join department as l2 on department_id=l2.id

--display supplier name and no. of books supplied by each supplier.
	select supplier_name,count(book_code) as total_books from LMS_BOOK_DETAILS as l1 join 
	LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID group by SUPPLIER_NAME;

--display  supplier id and no. of books supplied by each supplier
	select supplier_id,count(book_code) as total_books from LMS_BOOK_DETAILS where SUPPLIER_ID is not null group by SUPPLIER_ID;

--display  author, supplier id and no. of books supplied by each supplier 
   -- Author should also be mentioned in the gropu by clause
		select author,supplier_id,count(book_code) as total_books from LMS_BOOK_DETAILS where SUPPLIER_ID is not null group by SUPPLIER_ID,author;

--Write a query to display the book title and the member name
	select distinct l3.MEMBER_NAME,l1.BOOK_TITLE from LMS_BOOK_DETAILS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
	join LMS_MEMBERS as l3 on l2.MEMBER_ID=l3.MEMBER_ID;

--display department name and no. of employees in each department
	USE Employee_DB;
	select d.name,d.id,count(e.id) as totalEmployees from department as d join employee as e on e.department_id=d.id group by d.name,d.id order by d.id;

--display the department id and no.of employees in each department
	select department_id,count(id) as totalEmployee from employee group by department_id ;

