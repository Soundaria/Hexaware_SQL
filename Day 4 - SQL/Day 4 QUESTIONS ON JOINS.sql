--LMS JOIN QUESTIONS

select * from LMS_MEMBERS;
select * from LMS_BOOK_DETAILS;
select * from LMS_FINE_DETAILS;
select * from LMS_BOOK_ISSUE;
select * from LMS_SUPPLIERS_DETAILS;


--1.Write a query to display the book title, supplier name who has supplied books to library.
	select BOOK_TITLE,SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID

--2.Write a query to display member name and book code for the book he/she taken from the library.
	select distinct l3.MEMBER_NAME,l1.BOOK_CODE from LMS_BOOK_DETAILS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
	join LMS_MEMBERS as l3 on l2.MEMBER_ID=l3.MEMBER_ID;

--3.Write a query to display the book title and date when the book was taken from the library.
	select BOOK_TITLE,DATE_ISSUE from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE;

--4.Write a query to display the member id and the fine amount paid by the member in the library.
	select MEMBER_ID,FINE_AMOUNT from LMS_BOOK_ISSUE as l1 join LMS_FINE_DETAILS as l2 on l1.FINE_RANGE=l2.FINE_RANGE;
	
--5.Write a query to display the member name and the date difference between the date return and date returned.
	select MEMBER_NAME,datediff(day,DATE_RETURN,DATE_RETURNED) as differenceBtnTheReturnDates from LMS_MEMBERS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID;

--6.Write a query to display the book title and the member name of member who has taken book from library.
	select distinct l3.MEMBER_NAME,l1.BOOK_TITLE from LMS_BOOK_DETAILS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
	join LMS_MEMBERS as l3 on l2.MEMBER_ID=l3.MEMBER_ID;

--7.Write a query to display the book title, member name and the supplier name for the books taken from the library.
	select distinct l1.BOOK_TITLE,l3.MEMBER_NAME,SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
	join LMS_MEMBERS as l3 on l2.MEMBER_ID=l3.MEMBER_ID 
	join LMS_SUPPLIERS_DETAILS as l4 on l1.SUPPLIER_ID=l4.SUPPLIER_ID;

--8.Write a query to display the book title and the different fine amount paid for the book in library.
	select book_title,FINE_AMOUNT as DiffrentFineAmount from LMS_BOOK_DETAILS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
	join LMS_FINE_DETAILS as l3 on l2.FINE_RANGE=l3.FINE_RANGE
	order by BOOK_TITLE;

	--ANSI_SQL_QB_SET
	--EASY

--Problem#17:
--Write a query to display the member id, member name, city and member status of members with the total fine paid by them with alias name “Fine”.
	select l1.MEMBER_ID,l1.MEMBER_NAME,l1.CITY,l1.MEMBERSHIP_STATUS,sum(FINE_AMOUNT) as FINE from LMS_MEMBERS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID
	join LMS_FINE_DETAILS as l3 on l2.FINE_RANGE=l3.FINE_RANGE
	group by l1.MEMBER_ID,l1.MEMBER_NAME,l1.CITY,l1.MEMBERSHIP_STATUS;

--Average Questions

--Problem # 1:
--Write a query to display the member id, member name of the members, book code and book title of the books taken by them.
	select distinct l3.MEMBER_ID,l3.MEMBER_NAME,l1.BOOK_CODE,L1.BOOK_TITLE from LMS_BOOK_DETAILS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE=l2.BOOK_CODE 
	join LMS_MEMBERS as l3 on l2.MEMBER_ID=l3.MEMBER_ID;

--Problem # 2:
--Write a query to display the total number of books available in the library with alias name “NO_OF_BOOKS_AVAILABLE” (Which is not issued). 
--Hint: The issued books details are available in the LMS_BOOK_ISSUE table. 
	select count(l1.book_code) as NO_OF_BOOKS_AVAILABLE from LMS_BOOK_DETAILS as l1 
	left join LMS_BOOK_ISSUE as l2 on l1.BOOK_CODE= l2.BOOK_CODE
	where l1.BOOK_CODE not in (select BOOK_CODE from LMS_BOOK_ISSUE)  ---where l2.bookcode is null

--Problem # 3:
--Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100. 
	select l1.MEMBER_ID,l3.MEMBER_NAME,l1.FINE_RANGE,l2.FINE_AMOUNT from LMS_BOOK_ISSUE as l1 
	join LMS_FINE_DETAILS as l2 on l1.FINE_RANGE=l2.FINE_RANGE 
	join LMS_MEMBERS as l3 on l3.MEMBER_ID=l1.MEMBER_ID 
	where l2.FINE_AMOUNT<100;

--Problem # 4:
--Write a query to display the book code, book title, publisher, edition, price and year of publication and sort based on year of publication,
--publisher and edition.
	select BOOK_CODE,BOOK_TITLE,PUBLICATION,BOOK_EDITION,PRICE,PUBLISH_DATE from LMS_BOOK_DETAILS
	order by PUBLISH_DATE,PUBLICATION,BOOK_EDITION;

--Problem # 5:
--Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' and sort by book title in 
--ascending order. 
	select BOOK_CODE,BOOK_TITLE,RACK_NUM from LMS_BOOK_DETAILS
	where RACK_NUM='A1'
	order by BOOK_TITLE;

--Problem # 6:
--Write a query to display the member id, member name, due date and date returned of the members who has returned the books after the due date.
--Hint: Date_return is due date and Date_returned is actual book return date. 
	select l1.MEMBER_ID,l1.MEMBER_NAME,l2.DATE_RETURN,l2.DATE_RETURNED from LMS_MEMBERS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID
	where l2.DATE_RETURN<l2.DATE_RETURNED;

--Problem # 7:
--Write a query to display the member id, member name and date of registration who have not taken any book.
	select l1.MEMBER_ID,l1.MEMBER_NAME,DATE_REGISTER from LMS_MEMBERS as l1 
	left join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID
	where l1.MEMBER_ID not in (select MEMBER_ID from LMS_BOOK_ISSUE) ---where l2.member_id is null

--Problem # 8:
--Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.
	select l1.MEMBER_ID,l1.MEMBER_NAME from LMS_MEMBERS as l1 
	join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID
	where FINE_RANGE='R0';

--Problem # 9:
--Write a query to display the date on which the maximum numbers of books were issued and the number of books issued with alias name “NOOFBOOKS”.
	--select DATE_ISSUE,count(BOOK_CODE) as NOFBOOKS from LMS_BOOK_ISSUE group by DATE_ISSUE

--Problem # 10:
--Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’. 
	select BOOK_TITLE,SUPPLIER_ID from LMS_BOOK_DETAILS where AUTHOR='Herbert Schildt' and BOOK_EDITION=5 and SUPPLIER_ID='S01';

--Problem # 11:
--Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.
	select RACK_NUM,count(BOOK_CODE) as NOOFBOOKS from LMS_BOOK_DETAILS group by RACK_NUM order  by RACK_NUM;

--Problem # 13:
--Write a query to display the book code, title, publish date of the books which is been published in the month of December. 
		select BOOK_CODE,BOOK_TITLE,PUBLISH_DATE from LMS_BOOK_DETAILS
		where datename(month,PUBLISH_DATE)='December';

--Problem # 12:
--Write a query to display book issue number, member name, date of registration, date of expiry, book title, category author, price, date of issue, date of return, actual returned date, issue status, fine amount. 
	select l1.BOOK_ISSUE_NO,l2.MEMBER_NAME,l2.DATE_REGISTER,l2.DATE_EXPIRE,l3.BOOK_TITLE,l3.CATEGORY,l3.AUTHOR,l3.PRICE,
	l1.DATE_ISSUE,l1.DATE_RETURN,l1.DATE_RETURNED,l4.FINE_AMOUNT from LMS_BOOK_ISSUE as l1 
	join LMS_MEMBERS as l2 on l1.MEMBER_ID=l2.MEMBER_ID
	join LMS_BOOK_DETAILS as l3 on l3.BOOK_CODE=l1.BOOK_CODE
	join LMS_FINE_DETAILS as l4 on l4.FINE_RANGE=l1.FINE_RANGE;


--Problem # 15:
--Write a query to display book code, book name, and publisher, how old the book is. Sorted as older to newer.
	select BOOK_CODE,BOOK_TITLE,PUBLICATION,DATEDIFF(year,PUBLISH_DATE,GETDATE()) as BOOK_OLD from LMS_BOOK_DETAILS
	order by BOOK_OLD desc;
