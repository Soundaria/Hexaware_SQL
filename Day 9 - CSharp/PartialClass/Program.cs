using System;

namespace PartialClass
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Employee emp = new Employee("ram", 30);
            Console.WriteLine("Name : " + emp.Name);
            Console.WriteLine("Age : " + emp.Age);
        }
    }
}
