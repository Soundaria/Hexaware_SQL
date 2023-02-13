using NUnit.Framework;
using ClassLib_Project.Tests;

namespace TestProject1
{
    public class Tests
    {
        private ClassLibProject leap;

        [SetUp]
        public void Setup()
        {
            leap = new ClassLibProject();
        }

        [TestCase(1752)]
      
        public void TestValidYear(int value)
        {
           var result= leap.isLeapYear(value);
           
                Assert.That(result, Is.EqualTo(-1));
        }

        [TestCase(2000)]
        [TestCase(1900)]
        public void TestvalidLeapyear(int value)
        {
            var result = leap.isLeapYear(value);
            Assert.That(result, Is.EqualTo(1));     
        }
    }
}