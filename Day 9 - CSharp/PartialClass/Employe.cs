using System;
using System.Collections.Generic;
using System.Text;

namespace PartialClass
{
    internal class Employe
    {
        public string _name;
        public int _age;
        public Employe(string _name, int _age)
        {
            this._name = _name;
            this._age = _age;
        }
        public void display(string name, int age)
        {
            Console.WriteLine(name + "  " + age);
        }

    }
}
