using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLogic;
using System;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        EmployeeManagementSystemContext dbContext;

        [TestInitialize]
        public void Setup()
        {
            dbContext = new EmployeeManagementSystemContext();
        }

        [TestMethod]
        public void AddEmployeeNoteTest()
        {
            EmployeeNotes noteToAdd = new EmployeeNotes();
            noteToAdd.BusinessEntityId = 2;
            noteToAdd.NoteText = "Test";
            noteToAdd.CreationDate = DateTime.Now;

            dbContext.EmployeeNotes.Add(noteToAdd);
            dbContext.SaveChanges();

            Assert.IsNotNull(dbContext.EmployeeNotes.Find(2).BusinessEntityId);
        }
    }
}
