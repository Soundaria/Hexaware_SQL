using NUnit.Framework;
using Prime.Services;

namespace PrimeServices
{
    [TestFixture]
    public class Tests
    {
        private PrimeServices val;

        [SetUp]//Attribute
        public void Setup()
        {
            val = new PrimeServices();
        }

        [Test]
        public void Test1()
        {
            Assert.Pass();
        }
    }
}