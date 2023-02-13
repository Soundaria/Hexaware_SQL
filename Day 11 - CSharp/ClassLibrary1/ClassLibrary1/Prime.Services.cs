using System;

namespace Prime.Services
{
    public class PrimeServices
    {
        public bool isPrime(int val)
        {
            if (val < 2)
            {
                return false;
            }
            else if (val == 5)
            {
                return true;
            }
            throw new Exception("Please create test first");
        }

        public bool Prime(int val)
        {
            int count = 0;
            for(int i = 1; i <= val; i++)
            {
                if (val % i == 0)
                    count++;
            }
            if (count == 2)
                return true;
            else
                return false;
        }
    }
}
