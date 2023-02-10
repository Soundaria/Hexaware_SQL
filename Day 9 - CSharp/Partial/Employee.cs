using System;
using System.Collections.Generic;
using System.Text;

namespace Partial
{
    public partial class Employee
    {
        public void display(string name,int age)
        {
            Console.WriteLine("Name : " + name);
            Console.WriteLine("Age : " + age);
        }
    }
}
