using System;
using System.Linq;

namespace Strings
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // 1. Lower Case
                Console.WriteLine("Enter the input string : ");
                string name = Console.ReadLine();
                Console.WriteLine("The Output string is " + name.ToLower());

            // 2. Converting Text to SMS Language
                string msg = Console.ReadLine();
                if (msg.Contains("yes"))
                {
                    msg=msg.Replace("yes", "s");
                }
                if (msg.Contains("why"))
                {
                    msg=msg.Replace("why", "y");
                }
                if (msg.Contains("you"))
                {
                    msg=msg.Replace("you", "u");
                }
                if (msg.Contains("to"))
                {
                    msg=msg.Replace("to", "2");
                }
                Console.WriteLine(msg);

            // 3.String API : split() : Illustration
                Console.WriteLine("Enter the string : ");
                string str = Console.ReadLine();
                string[] strList = str.Split(" ");
                Console.WriteLine("The words in the string are : ");
                foreach(string  item in strList)
                {
                    Console.WriteLine(item);
                }

            // 4. String Operations-Length,Uppercase,Concat & Compare

            string word1 = Console.ReadLine();
            string word2 = Console.ReadLine();
            Console.WriteLine("The length of the first string is " + word1.Length);
            Console.WriteLine("The length of the second string is " + word2.Length);
            Console.WriteLine("The uppercase of the first string is " + word1.ToUpper());
            Console.WriteLine("The uppercase of the second string is " + word2.ToUpper());
            Console.WriteLine("The concated string is " +  word1+word2);
            int compare = word1.CompareTo(word2);
            if (compare == 0)
            {
                Console.WriteLine("Both the input string are same");
            }
            else if (compare < 0)
            {
                Console.WriteLine($"{word1} appears before {word2}" );
            }
            else
            {
                Console.WriteLine($"{word2} appears before {word1}");
            }

        }
    }
}
