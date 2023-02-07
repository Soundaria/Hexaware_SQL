using System;

namespace Day_7
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] marks = new int[7];
            for(int i = 0; i < marks.Length; i++)
            {
                marks[i] = int.Parse(Console.ReadLine());
            }
            Console.WriteLine("Sorted array in ascending : ");
            //Sort method
            Array.Sort(marks);
            foreach(int temp in marks)
            {
                Console.WriteLine(temp);
            }
            Console.WriteLine("Sorted array in desending : ");
            //Reverse method
            Array.Reverse(marks);
            foreach (int temp in marks)
            {
                Console.WriteLine(temp);
            }
            Console.WriteLine("Even Numbers :");
            //Find all method Also lambda function is used
            foreach(int temp in Array.FindAll(marks, s => s % 2 == 0))
            {
                Console.WriteLine(temp);
            }
            Console.WriteLine("Odd Numbers :");
            foreach (int temp in Array.FindAll(marks, s => s % 2 != 0))
            {
                Console.WriteLine(temp);
            }
            Console.WriteLine("Marks greater than avg marks :");
            int sum = 0;
            foreach (int temp in marks)
            {
                sum=sum+temp;
            }
            double avg = sum / marks.Length;
            foreach (int temp in Array.FindAll(marks, s => s > avg))
            {
                Console.WriteLine(temp);
            }

        }
    }
}
