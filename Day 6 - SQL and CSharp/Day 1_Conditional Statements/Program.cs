using System;
using System.Threading;

namespace Day_1_Conditional_Statements
{
    internal class Program
    {
        static void Main(string[] args)
        {
             // 1. Finding Odd or Even
             int num = int.Parse(Console.ReadLine());
             if (num % 2 == 0)
                 Console.WriteLine(num + " is an even number");
             else
                 Console.WriteLine(num + " is a odd number");
            

            // 2.Checking Divisibility By 7 and 3
            int num = int.Parse(Console.ReadLine());
            if (num % 7 == 0 && num % 3 == 0)
                Console.WriteLine(num + " is divisible by both 7 and 3");
            else
                Console.WriteLine(num + " is not divisible by both 7 and 3");

            

            // 3. Maximum of Three Numbers
            int a = int.Parse(Console.ReadLine());
            int b = int.Parse(Console.ReadLine());
            int c = int.Parse(Console.ReadLine());
            if (a > b && a > c)
                Console.WriteLine(a+" is the maximum number");
            else if(b>a && b>c)
                Console.WriteLine(b + " is the maximum number");
            else
                Console.WriteLine(c + " is the maximum number");
            

            //4. Finding Leap Year
            int year = int.Parse(Console.ReadLine());
            if (year % 4 == 0 && year%100!=0)
                Console.WriteLine(year + " is a leap year");
            else if(year % 4 == 0 && year % 100 == 0 && year%400==0)
                Console.WriteLine(year + " is a leap year");
            else
                Console.WriteLine(year + " Not a leap year");
           

            // 5. EarthQuake Intensity Decision
            double rate = double.Parse(Console.ReadLine());
            if (rate <= 2.4)
                Console.WriteLine("Micro");
            else if (rate >= 2.5 && rate <= 5.4)
                Console.WriteLine("Light");
            else if (rate >= 5.5 && rate <= 6.0)
                Console.WriteLine("Moderate");
            else if (rate >= 6.1 && rate <= 6.9)
                Console.WriteLine("Strong");
            else if (rate >= 7.1 && rate <= 7.9)
                Console.WriteLine("Major");
            else 
                Console.WriteLine("Great");
            

            /// 6. Grade Calculation
            int mark = int.Parse(Console.ReadLine());
            if (mark < 50)
                Console.WriteLine("F");
            else if (mark >= 50 && mark < 60)
                Console.WriteLine("E");
            else if (mark >= 60 && mark < 70)
                Console.WriteLine("D");
            else if (mark >= 70 && mark < 80)
                Console.WriteLine("C");
            else if (mark >= 80 && mark < 90)
                Console.WriteLine("B");
            else if (mark >= 90 && mark < 100)
                Console.WriteLine("A");
            else if (mark == 100)
                Console.WriteLine("S");
            else
                Console.WriteLine("Invalid Input");
            

            // 7. Palindromic Prize
            string bill = Console.ReadLine();
            if (bill.Length == 3)
                if (bill[0] == bill[2])
                    Console.WriteLine("Yes");
                else
                    Console.WriteLine("No");
            else
                Console.WriteLine("No");
            


            // 8. Sorted Prize
            string billno = Console.ReadLine();
            if (billno.Length == 3)
                if (billno[0] > billno[1] && billno[1] > billno[2])
                    Console.WriteLine("Yes");
                else if (billno[0] < billno[1] && billno[1] < billno[2])
                    Console.WriteLine("Yes");
                else
                    Console.WriteLine("No");
            else
                Console.WriteLine("No");
            

        }
    }
}
