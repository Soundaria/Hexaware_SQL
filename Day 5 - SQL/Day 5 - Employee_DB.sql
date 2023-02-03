use Employee_DB;
select * from location
select * from department
select * from Countries
select * from employee
select * from manager
select * from Region

--4.Write a query to display the country name and the number of departments in each country.Display the records sorted in ascending order based
--on country name.Give an alias to the number of departments as department_count. Display only the country names that have atleast one department 
--located in it.(Q19).
	select countries.name, count(department.name) from Countries join location on Countries.id=location.country_id join 
	department on department.location_id=location.id
	group by countries.name
	order by countries.name;

--5.Write a query to find the first name and department name of employees who work in city London. Display the records sorted in ascending order
--based on first name.(Q14).
	select first_name,name as department_name from employee join department on employee.department_id=department.id join location on
	location.id=department.location_id where city='London';

--6.Write a query to display the names of departments that have multiple managers. Display the records sorted in ascending order based on
--department name.(Q16).
	select name from department 
	where id in (
	select department_id from manager 
	group by(department_id)
	having count(employee_id)>1
	);

--7.Write a query to display the department name and the number of managers in the department. Display the records sorted in ascending 
--order based on department name. Give an alias to the number of managers as manager_count.(Q15).
	select a.name,count(b.employee_id) as manager_count from department a,manager b
	where a.id=b.department_id
	group by a.name
	order by a.name asc

--8.Write a query to find the addresses (department name, location id as id , street_address, city, state_province, country_name) of all the
--departments. Display the records sorted in ascending order based on department name.(Q13)
	select a.name,a.location_id as id,b.street_address,b.city,b.state,c.name as country_name from department a,location b,Countries c 
	where a.location_id=b.id and b.country_id=c.id
	order by a.name

--12.Write a query to display the addresses (location id, street_address, city, state_province, country_name) of all the entries in the location table.
--Display the records sorted in ascending order based on location id. [Use Inner Join](Q3)
		select a.id, a.street_address, a.city, a.state, b.name from location a inner join Countries b on a.country_id=b.id order by a.id

--17.Write a query to display the region name and the number of departments in each region. Display the records sorted in ascending order based on
--region name. Give an alias to the number of departments as department_count. Display only the region names that have atleast one department 
--located in it.(Q18)
	select l1.name,count(l4.id) from Region as l1 
	join Countries as l2 on l1.id=l2.region_id 
	join location as l3 on l2.id=l3.country_id
	join department as l4 on l3.id=l4.location_id
	group by l1.name

--18.Write a query to display the location_id, street_address, city, state_province, country_name, region_name of all the entries in the location 
--table.Display the records sorted by location_id.[Use Left Join](Q12)
		select a.id, a.street_address, a.city, a.state, b.name,c.name from location a left join Countries b on a.country_id=b.id left join 
		region c on b.region_id=c.id order by a.id

--19.Write a query to display the department name and the first name of managers of all departments. Display the records sorted in ascending order 
-- based on department name and then by manager name.[Use inner join or join](Q4)
	select d.name,e.first_name from employee as e join department as d on e.department_id=d.id join manager as m on e.id=m.employee_id 
	where e.id in (select employee_id from manager) order by d.name,e.first_name

	