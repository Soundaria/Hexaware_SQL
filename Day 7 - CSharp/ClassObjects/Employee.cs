using System;
using System.Collections.Generic;
using System.Text;

namespace ClassObjects
{
    internal class Employee
    {
        private string employeeName;
        private int employeeId;
        private string employeeEmail;
        private long employeeContact;

        //Empty constructor
        public Employee() { }

        //Constrictor with two parameters
        public Employee(string _employeeName,int _employeeId)
        {
            this.employeeName = _employeeName;
            this.employeeId = _employeeId;
        }

        //Properties
        public string EmployeeName { 
            get { return employeeName; } 
            set { employeeName = value; }
        }
        public int EmployeeId
        {
            get { return employeeId; }
            set { employeeId = value; }
        }
        public string EmployeeEmail
        {
            get { return employeeEmail; }
            set { employeeEmail= value; }
        }
        public long EmployeeContact
        {
            get { return employeeContact; }
            set { employeeContact = value; }
        }

        //Method to print all details
        public void printInfo() {
            Console.WriteLine("Name : " + employeeName);
            Console.WriteLine("Id : " + employeeId);
            Console.WriteLine("Email : " + employeeEmail);
            Console.WriteLine("Contact : " + employeeContact);
        }
    }
}
