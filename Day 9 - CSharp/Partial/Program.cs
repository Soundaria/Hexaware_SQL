using System;

namespace Partial
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Employee emp = new Employee("Ram", 30);
            emp.display(emp.Name,emp.Age);
        }
    }
}
