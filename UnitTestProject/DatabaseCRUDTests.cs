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
        String agencyName;

        [TestInitialize]
        public void Setup()
        {
            dbContext = new EmployeeManagementSystemContext();
            agenciesRepository = new AgenciesRepository(dbContext);
            agencyName = "Testowa";
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
            agency.AgencyName = agencyName;

            agenciesRepository.CreateAgency(agency);

            var agencyCreated = agenciesRepository.dbContext.Agency.Single(a => a.AgencyName == agencyName);

            Assert.IsNotNull(agencyCreated);
        }

        [TestMethod]
        public void AddRangeTest()
        {
            BusinessLogic.Range range = new BusinessLogic.Range();
            range.AgencyId = agenciesRepository.dbContext.Agency.Single(a => a.AgencyName == agencyName).AgencyId;
            range.RangeFrom = 1;
            range.RangeTo = 10;

            agenciesRepository.CreateRange(range);
        }

        [TestMethod]
        public void DeleteRangeById()
        {
            var agencyCreated = agenciesRepository.dbContext.Agency.Single(a => a.AgencyName == agencyName);
            var rangeCreated = agenciesRepository.dbContext.Range.Single(r => r.AgencyId == agencyCreated.AgencyId);

            agenciesRepository.DeleteRange(rangeCreated.RangeId);
        }


        [TestMethod]
        public void DeleteAgencyById()
        {
            var agencyCreated = agenciesRepository.dbContext.Agency.Single(a => a.AgencyName == agencyName);

            agenciesRepository.DeleteAgency(agencyCreated.AgencyId);
        }
    }
}
