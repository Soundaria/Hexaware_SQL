using System;
using System.Collections.Generic;
using System.Text;

namespace Day_7_Assignment
{
    internal class Vechile
    {
        private string registerNumber;
        private string driverName;
        private string vechileType;
        private float costPerKM;

        //Default Constructor
        public Vechile()
        {
            Console.WriteLine("Cab Registration");
        }

        //Parametrized Constructor
        public Vechile(string _registerNumber,string _drivername,string _vechileType,float _costPerKM)
        {
            this.registerNumber = _registerNumber;
            this.driverName = _drivername;
            this.vechileType = _vechileType;
            this.costPerKM = _costPerKM;
            Vechile vec = new Vechile();
        }

        public string RegisterNumber
        {
            get { return registerNumber; }
            set { registerNumber = value; }
        }
        public string DriverName
        {
            get { return driverName; }
            set { driverName = value; }
        }
        public string VechileType
        {
            get { return vechileType; }
            set { vechileType = value; }
        }
        public float CostperKM
        {
            get { return costPerKM; }
            set { costPerKM = value; }
        }

        public void Display()
        {
            Console.WriteLine("Vechile Details : ");
            Console.WriteLine("Registration Number :" + registerNumber);
            Console.WriteLine("Driver Name :" + driverName);
            Console.WriteLine("Vechile type :" + vechileType);
            Console.WriteLine("Cost Per Km :" + costPerKM);
        }
    }
}
