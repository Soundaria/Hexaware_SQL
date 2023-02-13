using NUnit.Framework;
using Prime.Services;

namespace Testing
{
    public class Tests
    {
        private PrimeServices _val;

        [SetUp]
        public void Setup()
        {
            _val = new PrimeServices();
        }

        [Test]
        public void Test1()
        {
            var result = _val.isPrime(1);
            Assert.IsFalse(result, "1 is not a prime number");
        }
        [Test]
        public void Test2()
        {
            var result = _val.isPrime(-1);
            Assert.IsFalse(result, "-1 is not prime number");
        }

        [Test]
        public void Test3()
        {
            var result = _val.isPrime(5);
            Assert.IsTrue(result, "5 is prime");
        }

        //To avoid wrting multiple test functions for a single method,we can use testcase attribute
        [TestCase(0)]
        [TestCase(-5)]
        [TestCase(1)]
        public void Test4(int value)
        {
            var result = _val.isPrime(value);
            Assert.IsFalse(result, "cannot be prime");
        }

        [Test]
        public void Test()
        {
            var result = _val.Prime(0);
            if (result == false) 
                Assert.IsFalse(result," Is not a Prime Number");
            else
                Assert.IsTrue(result," Is a Prime Number");
        }
    }
}