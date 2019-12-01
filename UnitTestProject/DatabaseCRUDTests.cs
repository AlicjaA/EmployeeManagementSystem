using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLogic;
using System;
using System.Transactions;
using System.Linq;
using BusinessLogic.AgenciesManagement;
using BusinessLogic.Interfaces;

namespace UnitTestProject
{
    [TestClass]
    public class DatabaseCRUDTests
    {
        EmployeeManagementSystemContext dbContext;
        IAgenciesRepository<EmployeeManagementSystemContext> agenciesRepository;

        [TestInitialize]
        public void Setup()
        {
            dbContext = new EmployeeManagementSystemContext();
            agenciesRepository = new AgenciesRepository(dbContext);
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

        [TestMethod]
        public void AddAgencyTest()
        {
            Agency agency = new Agency();
            String agencyName = "Testowa";
            agency.AgencyName = agencyName;

            agenciesRepository.CreateAgency(agency);

            var agencyCreated = agenciesRepository.dbContext.Agency.Single(a => a.AgencyName == agencyName);

            Assert.IsNotNull(agencyCreated);
        }
    }
}
