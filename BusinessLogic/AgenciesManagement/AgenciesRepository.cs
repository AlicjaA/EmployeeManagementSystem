using BusinessLogic.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Transactions;

namespace BusinessLogic.AgenciesManagement
{
    public class AgenciesRepository : IAgenciesRepository<EmployeeManagementSystemContext>
    {
        public AgenciesRepository(EmployeeManagementSystemContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public EmployeeManagementSystemContext dbContext { get; }

        public void CreateAgency(Agency agency)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required, 
                new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
            {
                dbContext.Agency.Add(agency);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void CreateRange(Range range)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required,
                new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
            {
                dbContext.Range.Add(range);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void DeleteAgency(int agencyId)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required,
                 new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
            {
                Agency toRemove = dbContext.Agency.Find(agencyId);
                dbContext.Agency.Remove(toRemove);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void DeleteAgency(Agency agency)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required,
                 new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
            {
                dbContext.Agency.Remove(agency);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void DeleteRange(int rangeId)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required,
                 new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
            {
                Range toRemove = dbContext.Range.Find(rangeId);
                dbContext.Range.Remove(toRemove);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void DeleteRange(Range range)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required,
                 new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
            {
                dbContext.Range.Remove(range);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void ReadAgency(int agencyId)
        {
            throw new NotImplementedException();
        }

        public void RemoveAgency(Agency agency)
        {
            throw new NotImplementedException();
        }

        public void ReadRange(int rangeId)
        {
            throw new NotImplementedException();
        }

        public void ReadRange(Range range)
        {
            throw new NotImplementedException();
        }

        public void UpdateAgency(int agencyIdToUpdate, Agency agencyUpdated)
        {
            throw new NotImplementedException();
        }

        public void UpdateAgency(Agency agencyToUpdate, Agency agencyUpdated)
        {
            throw new NotImplementedException();
        }

        public void UpdateRange(int rangeToUpdate, Range rangeUpdated)
        {
            throw new NotImplementedException();
        }

        public void UpdateRange(Range rangeToUpdate, Range rangeUpdated)
        {
            throw new NotImplementedException();
        }
    }
}
