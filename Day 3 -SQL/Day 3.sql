--- Day 3

--Subquery
--Two types
--1.Corealated
--2.Non-Corelated

	Select first_name, email, salary from employee where department_id=2;-- Hard-coding the data The department id in the department table for HR is 2

--If sometimes the department HR's id is updated as 9 the above query will not give right answer.So subquery is used in these case

	Select first_name, email, salary from employee where department_id=(select id from department where name='HR')

--Multiple subquery
	select first_name from employee where id in (select employee_id from manager where department_id=(select id from department where name='HR'))

--Multilevel subquery

--Display the employee detail whose departments's location is in state New Jersey
--multi-level subquery

Select first_name from employee where department_id=(
Select id from department where location_id =(
Select id from location where state='New Jersey'))

--Emplaoyee Max Salary
Select first_name from employee where salary =(Select Max(salary) from employee);

--Employee avg salary
Select first_name,salary from employee where salary<(Select Avg(salary) from employee);

--2 nd highest salary
Select first_name,salary from employee where salary=(Select max(salary) from employee where salary !=(Select Max(salary) from employee));

-- 3rd highest salary
Select max(salary) from employee where salary <(Select max(salary) from employee where salary !=(Select max(salary) from employee ))

--Questions from QB SET

--2.Write a query to display the names of all states belonging to the country Canada. Display the records sorted in ascending 
--order based on state name.(Q 2).
	select state from location where country_id =(select id from Countries where name='Canada') order by state asc

--3.Write a query to display the first name of the managers of Accounts department. Display the records sorted in ascending order
--based on manager name.(Q7).
	select first_name from employee where id in
	(select employee_id from manager where department_id=
	(select id from department where name='Accounts'))
	order by first_name asc;

--9.Write a query to display the names of all countries belonging to region Europe. Display the records sorted in ascending order 
--based on country name.(Q1)
  select name from Countries where region_id=(select id from Region where name='Europe') order by name asc

--14.Write a query to display the first name of the managers of HR department. Display the records sorted in ascending order
--based on manager name(Q6)
	select first_name from employee where id in 
	(select employee_id from manager where department_id=
	(select id from department where name='HR')) 
	order by first_name

--15.Write a query to display the first name of all employees who are managers. Display the records sorted in ascending order based 
--on first name.(Q5)
	select first_name from employee where id in (select employee_id from manager) order by first_name


--Group by clause

---Find out how many employees are avilable in IT department
	Select count(id) as IT_Employees from employee where department_id in (select id from department where name='IT' )

--Find the max salary in each department
	Select department_id,max(salary) from employee group by department_id

--Find no.of states in each country
	select * from location
	select country_id,count(state) from location group by(country_id)

--Find no. of employees in each department
	Select department_id,count(id) from employee group by department_id

--Write a query to display the department id and the number of managers in the department. Display the records sorted in ascending 
--order based on department name. Give an alias to the number of managers as manager_count.(Q15).
	select department_id,count(employee_id) as manager_count from manager group by department_id
	