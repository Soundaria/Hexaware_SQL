using System;

namespace ClassObjects
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Object with two parameter
            Employee em = new Employee("Rahul", 1);
            Console.WriteLine(em.EmployeeName + " " + em.EmployeeId);

            string option;
            do
            {
                //Object with no parameter
                Employee emp = new Employee();
                Console.WriteLine("Enter the name : ");
                emp.EmployeeName = Console.ReadLine();
                Console.WriteLine("Enter the Id : ");
                emp.EmployeeId = int.Parse(Console.ReadLine());
                Console.WriteLine("Enter the Email : ");
                emp.EmployeeEmail = Console.ReadLine();
                Console.WriteLine("Enter the Contact : ");
                emp.EmployeeContact = long.Parse(Console.ReadLine());
                emp.printInfo();
                Console.WriteLine("Do you want to continue ? (yes/no)");
                option = Console.ReadLine();
            }
            while (option == "yes" || option == "Yes");
            
        }
    }
}
