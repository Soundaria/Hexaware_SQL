using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;

namespace Collections
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Wedding Planner
            Console.WriteLine("Welcome to Conto Wedding Services\n");
            Console.WriteLine("Enter the Wedding Package you wish for :");
            string weddingPackage = Console.ReadLine();
            Dream_Wedding wed = new Dream_Wedding();
            
            if (wed.ValidatePackage(weddingPackage))
            {
                List<string> events = new List<string>();
                if (weddingPackage=="D" ||weddingPackage=="d" || weddingPackage=="DW"|| weddingPackage == "dw")
                {
                    Console.WriteLine("Enter 3 event Names and cost seperated by , for the selected packages ");
                    for(int i = 1; i <= 3; i++)
                    {
                        Console.WriteLine("Event Detail " + i);
                        events.Add(Console.ReadLine());
                    }
                    if (wed.ValidateEventList(weddingPackage, events))
                    {
                        sum(events);
                    }
                    else
                    {
                        Console.WriteLine("Not all events are valid for this package");
                    }
                }
                else
                {
                    Console.WriteLine("Enter 5 event Names and cost seperated by , for the selected packages ");
                    for (int i = 1; i <=5; i++)
                    {
                        Console.WriteLine("Event Detail " + i);
                        events.Add(Console.ReadLine());
                    }
                    if(wed.ValidateEventList(weddingPackage, events))
                    {
                        sum(events);
                    }
                    else
                    {
                        Console.WriteLine("Not all events are valid for this package") ;
                    }
                }
            }
            else
            {
                Console.WriteLine("No such wedding package available");
            }

            void sum(List<string> events)
            {
                int sum = 0;
                for (int i = 0; i < events.Count; i++)
                {
                    sum = sum + (Convert.ToInt32(events[i].Substring(events[i].IndexOf(',') + 1)));
                }
                if (wed.ValidateEventCost(sum))
                {
                    
                    Dictionary<string, double> dict = wed.CreateWedding(weddingPackage, events);
                    Console.WriteLine("Event Name      Cost");
                    foreach(KeyValuePair<string,double> item in dict)
                    {
                        Console.WriteLine(item.Key + "     " + item.Value);
                    }
                    double totalCost = wed.GetTotalCost(dict);
                    Console.WriteLine("\nTotal cost for the wedding is " + totalCost);
                }
                else
                {
                    Console.WriteLine("Low Cost Amount...Restart the Application");
                }
            }
        }
    }
}
