using System;
using System.Collections.Generic;
using System.Linq;

namespace CustomObjectAndLinq
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Creating list with Employee date type
            List<Employee> listOfEmp = new List<Employee>();
            //Creating object for Employee class
            Employee raghu = new Employee();
            
            //Declaring the property value for employee class
            raghu.Name = "Raghuram";
            raghu.Age = 30;
            raghu.Dept = "Developer";
            raghu.Salary = 35000;
            //Adding the object to list
            listOfEmp.Add(raghu);

            Employee ram = new Employee();
            ram.Name = "Ramcharan";
            ram.Age = 40;
            ram.Dept = "Tester";

            listOfEmp.Add(ram);

            foreach (var items in listOfEmp)
            {
                Console.WriteLine(items.Name + "      " + items.Age + "        " + items.Salary + "        " + items.Dept);
            }

            //Also declare value for properties in this way

            listOfEmp.Add(new Employee { Name = "Veera", Age = 35, Dept = "Accounts", Salary = 45000 });
            listOfEmp.Add(new Employee { Name = "Sri", Age = 45, Dept = "Developer", Salary = 50000 });

            foreach (var items in listOfEmp)
            {
                Console.WriteLine(items.Name + "      " + items.Age + "        " + items.Salary + "        " + items.Dept);
            }

            //Linq-Language Integrated Query
            //sql query--> select temp.name from listofEmp as temp where temp.name="Developer"

            var query = from temp in listOfEmp where temp.Dept == "Developer" select temp;

            Console.WriteLine("\nDisplay details of emmployess where dept= developer ");
            foreach (var items in query)
            {
                Console.WriteLine(items.Name + "      " + items.Age + "        " + items.Salary + "        " + items.Dept);
            }

            Console.WriteLine("\nDisplay details whose salary is >35000");
            var querySalry = from temp in listOfEmp where temp.Salary >= 35000 select temp.Name;

            foreach (var items in query)
            {
                Console.WriteLine(items.Name);
            }

            Console.WriteLine("\nDisplay dept and count(dept) group by department");
            var queryDept = from temp in listOfEmp group temp by temp.Dept into val 
                            select new { Dept = val.Key,Count=val.Count() };
            foreach (var items in queryDept)
            {
                Console.WriteLine(items.Dept+"      "+items.Count);
            }

            //using lambda expression
            var queryDep = listOfEmp.GroupBy(x => x.Dept).Select(x => new { Dept = x.Key,count=x.Count() });
            foreach (var items in queryDep)
            {
                Console.WriteLine(items.Dept+"  "+items.count);
            }
        }
    }
}
