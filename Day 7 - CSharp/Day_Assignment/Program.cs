using System;
using System.Runtime.ConstrainedExecution;
using Day_7_Assignment;

namespace Day7_Assignment
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string option;
            do
            {
                Console.WriteLine("Enter Registration Number  : ");
                string registrationNumber = Console.ReadLine();
                Console.WriteLine("Enter Driver Name : ");
                string driverName =Console.ReadLine();
                Console.WriteLine("Enter Vechile Type : ");
                string vechileType = Console.ReadLine();
                Console.WriteLine("Enter Cost Per KM : ");
                float costPerKM = float.Parse(Console.ReadLine());
                Vechile vec = new Vechile(registrationNumber, driverName, vechileType, costPerKM);
                vec.Display();
                Console.WriteLine("Do you want to continue ? (yes/no)");
                option = Console.ReadLine();
            }
            while (option == "yes" || option == "Yes");
        }
    }
}
