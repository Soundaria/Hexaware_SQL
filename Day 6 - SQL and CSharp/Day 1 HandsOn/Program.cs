using System;

namespace Day_1_HandsOn
{
    internal class Program
    {
        static void Main(string[] args)
        {
            
            // 1. Welcome Aliens

            Console.WriteLine("Enter your name:");
            string name = Console.ReadLine();
            Console.WriteLine("Hello " + name + " ! Welcome to our planet Earth.");

            //  2. Dynamic Web Site --- Prototype

            Console.WriteLine("Enter college name:");
            string collegeName = Console.ReadLine();
            Console.WriteLine("Enter college locality:");
            string locality = Console.ReadLine();
            Console.WriteLine("Enter college's vision:");
            string vision = Console.ReadLine();
            Console.WriteLine("Enter college's mission:");
            string mission = Console.ReadLine();
            Console.WriteLine("Enter the number of departments:");
            int dept = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter student strength:");
            int strength = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter college rating:");
            char rating = char.Parse(Console.ReadLine());
            Console.WriteLine(collegeName + "\n" + locality);
            Console.WriteLine("______________________________");
            Console.WriteLine("Vision \n" + vision);
            Console.WriteLine("______________________________");
            Console.WriteLine("Mission \n" + mission);
            Console.WriteLine("______________________________");
            Console.WriteLine("Number of Departments \n" + dept);
            Console.WriteLine("______________________________");
            Console.WriteLine("Student Strength \n" + strength);
            Console.WriteLine("______________________________");
            Console.WriteLine("College rating \n" + rating);
            Console.WriteLine("______________________________");
            
            // 3. Calculating Gain Percentage
            Console.WriteLine("Price of old scooter : ");
            double price = double.Parse(Console.ReadLine());
            Console.WriteLine("Repair amount : ");
            double repair = double.Parse(Console.ReadLine());
            Console.WriteLine("Selling price : ");
            double sellingprice = double.Parse(Console.ReadLine());
            double cp = price + repair;
            double gain = sellingprice - cp;
            double gainp = (gain * 100) / cp;
            
            Console.WriteLine("Gain percentage is " + gainp.ToString("#.##"));
            
            
            //Celsius to Fahrenheit Converter
            Console.WriteLine("Temperature in Celsius : ");
            double celsius = double.Parse(Console.ReadLine());
            double fah = (celsius * 9 / 5) + 32;
            Console.WriteLine("Temperature in Fahrenheit : ");
            Console.WriteLine(fah + "F");
            
        }
    }
}
