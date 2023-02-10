using System;

namespace ExceptionHandling
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Handling exceptions

            try
            {
                int n1 = int.Parse(Console.ReadLine());
                int n2 = int.Parse(Console.ReadLine());
                int output = n1 / n2;
                Console.WriteLine(output);
                string name = Console.ReadLine();
                if (name.Length > 10)
                {
                    //throw is used to throw an user defines exception.
                    throw new Exception("Name length greater than ten");
                }
            }
            catch (DivideByZeroException ex)
            {
                Console.WriteLine(ex.Message);
            }
            catch (OverflowException ofex)
            {
                Console.WriteLine(ofex.Message);
            }
            //When having multiple catch block exception catch block should be at the last because
            //it is the parent class for exception.
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            //Finally executed after either try or catch block
            //Main purpose is used to close the connection of the database.
            finally
            {
                Console.WriteLine("Program executed successfully");
            }
        }
    }
}
