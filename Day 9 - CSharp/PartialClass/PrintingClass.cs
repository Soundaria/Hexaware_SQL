using System;
using System.Collections.Generic;
using System.Text;

namespace PartialClass
{
     public partial class Employee
     {
        public void display(string name,int age)
        {
            Console.WriteLine(name + "  " + age);
        }
    }
}
