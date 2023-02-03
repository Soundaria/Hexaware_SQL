---Day 5

--ANSI_SQL_QB_SET

select * from LMS_MEMBERS;
select * from LMS_BOOK_DETAILS;
select * from LMS_FINE_DETAILS;
select * from LMS_SUPPLIERS_DETAILS;
select * from LMS_BOOK_ISSUE

--EASY
--Problem # 2:
--Write a query to display the book code, publication, price and supplier name of the book witch is taken frequently.
	select l1.BOOK_CODE,l1.PUBLICATION,l1.PRICE,l2.SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 
	join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
	join LMS_BOOK_ISSUE as l3 on l3.BOOK_CODE=l1.BOOK_CODE
	group by l1.BOOK_CODE,l1.PUBLICATION,l1.PRICE,l2.SUPPLIER_NAME 
	having count(l3.BOOK_CODE)>=all(select count(BOOK_CODE) from LMS_BOOK_ISSUE group by BOOK_CODE)

--Problem#15:
--Write a query to display the supplier id, supplier name and contact details. Contact details can be either phone number or email or address 
--with alias name “CONTACTDETAILS”. If phone number is null then display email, even if email also null then display the address of the supplier. 
--Hint: Use Coalesce function. 
	select SUPPLIER_ID,SUPPLIER_NAME,coalesce(contact,email,address) as CONTACTDEATILS from LMS_SUPPLIERS_DETAILS
	

--AVERAGE
--Problem # 9:
--Write a query to display the date on which the maximum numbers of books were issued and the number of books issued with alias name “NOOFBOOKS”.
	select DATE_ISSUE,count(BOOK_CODE) as NOOFBOOKS from LMS_BOOK_ISSUE
	group by date_issue
	having count(BOOK_CODE) > =all(select count(book_code) from lms_book_issue group by date_issue);

--Problem # 14:
--Write a query to display the book code, book title ,supplier name and price of the book witch takes maximum price based on each supplier.
	select l1.BOOK_CODE,l1.BOOK_TITLE,l2.SUPPLIER_NAME,l1.PRICE from LMS_BOOK_DETAILS as l1 
	join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
    join (select SUPPLIER_ID,max(price) as price from LMS_BOOK_DETAILS group by SUPPLIER_ID) as l3 on l1.SUPPLIER_ID=l3.supplier_id
	and l3.price=l1.price
	

----Complex Questions:

--Problem # 1:
--Write a query to display the book code, book title and supplier name of the supplier who has supplied maximum number of books. 
--For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books and “XYZ Store” has supplied 1 book. 
--So “ABC Store” has supplied maximum number of books, hence display the details as mentioned below. -
--Example:
--BOOK_CODE	BOOK_TITLE	SUPPLIER_NAME
--BL000008	Easy Reference for Java   	ABC STORE
--BL000001	Easy Reference for C     	               ABC STORE
--BL000003	Easy Reference for VB    	ABC STORE

	select l1.BOOK_CODE,l1.BOOK_TITLE,l2.SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 
	left join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
    where l1.SUPPLIER_ID in (select SUPPLIER_ID from 
	(select SUPPLIER_ID,count(BOOK_CODE) as cbook_code from LMS_BOOK_DETAILS group by SUPPLIER_ID) as l3
	where cbook_code =
	(select max(cbook_code) from (select SUPPLIER_ID,count(BOOK_CODE) as cbook_code from LMS_BOOK_DETAILS group by SUPPLIER_ID) as l4))


--Problem # 2:
--Write a query to display the member id, member name and number of remaining books he/she can take with “REMAININGBOOKS” as alias name. 
--Hint:  Assuming a member can take maximum 3 books.  For example, Ramesh has already taken 2 books; he can take only one book now.
--Hence display the remaining books as 1 in below format. 
--Example: 
--MEMBER_ID             MEMBER_NAME           REMAININGBOOKS
--LM001                        RAMESH	                    1
--LM002                        MOHAN	                    3
	select l1.MEMBER_ID,l1.MEMBER_NAME,3-count(l2.BOOK_CODE) as REAININGBOOKS from LMS_MEMBERS as l1 
	left join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID
	group by l1.MEMBER_ID,l1.MEMBER_NAME

--Problem # 3 
--Write a query to display the supplier id and supplier name of the supplier who has supplied minimum number of books. 
--For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 2 books and “XYZ Store” has supplied 1 book. 
--So “XYZ Store” has supplied minimum number of books, hence display the details as mentioned below. 
--Example:
--SUPPLIER_ID	SUPPLIER_NAME
--S04	               XYZ STORE

    select l1.SUPPLIER_ID,l2.SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 
	left join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID
    where l1.SUPPLIER_ID in (select SUPPLIER_ID from 
	(select SUPPLIER_ID,count(BOOK_CODE) as cbook_code from LMS_BOOK_DETAILS group by SUPPLIER_ID) as l3
	where cbook_code =
	(select min(cbook_code) from (select SUPPLIER_ID,count(BOOK_CODE) as cbook_code from LMS_BOOK_DETAILS group by SUPPLIER_ID) as l4))
