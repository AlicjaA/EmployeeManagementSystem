using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLogic;
using System;
using System.Transactions;
using System.Linq;

namespace UnitTestProject
{
    [TestClass]
    public class DatabaseCRUDTests
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
            DateTime now = DateTime.Now;
            using (var scope = new TransactionScope(TransactionScopeOption.Required))
            {
                EmployeeNotes noteToAdd = new EmployeeNotes();
                noteToAdd.BusinessEntityId = 3;
                noteToAdd.NoteText = "Test";
                noteToAdd.CreationDate = now;

                dbContext.EmployeeNotes.Add(noteToAdd);
                dbContext.SaveChanges();

                scope.Complete();
            }

            var note = dbContext.EmployeeNotes
                .Single(n => n.CreationDate == now);

            Assert.IsNotNull(note);
        }
    }
}
