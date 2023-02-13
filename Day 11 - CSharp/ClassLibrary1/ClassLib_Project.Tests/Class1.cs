using System;

namespace ClassLib_Project.Tests
{
    public class ClassLibProject
    {
        public int isLeapYear(int value)
        {
            if(value>=1753 && value<=9999)
            {
                if( (value % 4 == 0 && value%100!=0) || value%400==0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return -1;
            }
        }
    }
}
