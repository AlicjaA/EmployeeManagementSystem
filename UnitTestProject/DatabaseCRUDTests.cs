using Microsoft.VisualStudio.TestTools.UnitTesting;
using BusinessLogic;
using System;
using System.Transactions;
using System.Linq;
using BusinessLogic.Repositories;
using System.Collections;
using System.Collections.Generic;

namespace UnitTestProject
{
    [TestClass]
    public class DatabaseCrudTests
    {
        EmployeeManagementSystemContext dbContext;
        RepositoryBase<Agency> agenciesRepository;
        RepositoryBase<BusinessLogic.Range> rangeRepository;
        string agencyName;
        int rangeFrom;
        int rangeTo;

        [TestInitialize]
        public void Setup()
        {
            dbContext = new EmployeeManagementSystemContext();
            agenciesRepository = new RepositoryBase<Agency>(dbContext);
            rangeRepository = new RepositoryBase<BusinessLogic.Range>(dbContext);
            agencyName = "Testowa";
            rangeFrom = 1;
            rangeTo = 10;
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

            agenciesRepository.Add(agency);

            List<Agency> agencyCreated = agenciesRepository.List(a => a.AgencyName.Equals(agencyName)).ToList();

            Assert.AreEqual(agencyCreated.LastOrDefault(), agency);
        }

        [TestMethod]
        public void AddRangeTest()
        {
            BusinessLogic.Range rangeCreated = new BusinessLogic.Range()
            {
                AgencyId = agenciesRepository.List(a => a.AgencyName == agencyName).FirstOrDefault().AgencyId,
                RangeFrom = rangeFrom,
                RangeTo = rangeTo
            };

            rangeRepository.Add(rangeCreated);

            List<BusinessLogic.Range> rangesList = rangeRepository.List(a => a.RangeFrom.Equals(rangeCreated.RangeFrom)).ToList();

            Assert.AreEqual(rangesList.LastOrDefault(), rangeCreated);
        }

        [TestMethod]
        public void EditRangeTest()
        {
            BusinessLogic.Range rangeToEdit = rangeRepository.List(r => r.RangeFrom.Equals(rangeFrom) && r.RangeTo.Equals(rangeTo)).FirstOrDefault();

            rangeToEdit.RangeFrom = rangeFrom += 1;
            rangeToEdit.RangeTo = rangeTo += 1;

            rangeRepository.Edit(rangeToEdit);

            BusinessLogic.Range rangeEdited = rangeRepository.GetById(rangeToEdit.RangeId);

            Assert.AreEqual(rangeToEdit, rangeEdited);
        }

        [TestMethod]
        public void DeleteRangeTest()
        {
            Agency agencyCreated = agenciesRepository.List(a => a.AgencyName == agencyName).FirstOrDefault();
            BusinessLogic.Range rangeCreated = rangeRepository.List(r => r.RangeFrom.Equals(rangeFrom + 1) && r.RangeTo.Equals(rangeTo + 1)).FirstOrDefault();

            rangeRepository.Delete(rangeCreated);

            BusinessLogic.Range rangeDeleted = rangeRepository.List(r => r.RangeId == rangeCreated.RangeId).FirstOrDefault();

            Assert.IsNull(rangeDeleted);
        }


        [TestMethod]
        public void DeleteAgency()
        {
            Agency agencyCreated = agenciesRepository.List(a => a.AgencyName == agencyName).FirstOrDefault();

            agenciesRepository.Delete(agencyCreated);

            Agency agencyDeleted = agenciesRepository.List(a => a.AgencyId == agencyCreated.AgencyId).FirstOrDefault();

            Assert.IsNull(agencyDeleted);
        }
    }
}
