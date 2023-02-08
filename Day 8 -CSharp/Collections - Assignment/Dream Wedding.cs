using System;
using System.Collections.Generic;
using System.Text;

namespace Collections
{
    internal class Dream_Wedding
    {
        public bool ValidatePackage(string packageType)
        {
            if (packageType == "FSW" || packageType == "fsw" || packageType == "d" || packageType == "D" || packageType == "DW" || packageType == "dw")
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public bool ValidateEventList(string packageType, List<string> events)
        {
            if (packageType == "D" || packageType == "d")
            {
                if (
                    events[0].Substring(0, events[0].IndexOf(',')) == "Floor design" && 
                    events[1].Substring(0, events[1].IndexOf(',')) == "Lighting design" &&
                    events[2].Substring(0, events[2].IndexOf(',')) == "Furniture linen")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else if (packageType == "DW" || packageType == "dw")
            {
                if (events[0].Substring(0, events[0].IndexOf(',')) == "Wedding venues" &&
                    events[1].Substring(0, events[1].IndexOf(',')) == "Transportation" &&
                    events[2].Substring(0, events[2].IndexOf(',')) == "Bridal styling")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                if (events[0].Substring(0, events[0].IndexOf(',')) == "Wedding venues" &&
                    events[1].Substring(0, events[1].IndexOf(',')) == "Vendor management" &&
                    events[2].Substring(0, events[2].IndexOf(',')) == "Wedding invites" &&
                    events[3].Substring(0, events[3].IndexOf(',')) == "Photography & Videography" &&
                    events[4].Substring(0, events[4].IndexOf(',')) == "Bridal styling")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }  
        }
        public bool ValidateEventCost(double eventCost)
        {
            if (eventCost > 5000)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public Dictionary<string, double> CreateWedding(string packageType, List<string> eventsCost)
        {
            Dictionary<string, double> dict = new Dictionary<string, double>();
                for(int i = 0; i < eventsCost.Count; i++)
                {
                    dict.Add(eventsCost[i].Substring(0, eventsCost[i].IndexOf(',')),
                        Convert.ToDouble(eventsCost[i].Substring(eventsCost[i].IndexOf(',') + 1)));
                }
            return dict;
        }
        public double GetTotalCost(Dictionary<string, double> wedding)
        {
            double total = 0;
            foreach(double item in wedding.Values)
            {
                total = total + item;
            }
            return total;
        }
    }
}
