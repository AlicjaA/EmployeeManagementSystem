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
            using (var scope = new TransactionScope(TransactionScopeOption.Required))
            {
                dbContext.Agency.Add(agency);
                dbContext.SaveChanges();

                scope.Complete();
            }
        }

        public void CreateRange(Range range)
        {
            throw new NotImplementedException();
        }

        public void DeleteAgency(int agencyId)
        {
            throw new NotImplementedException();
        }

        public void DeleteAgency(Agency agency)
        {
            throw new NotImplementedException();
        }

        public void DeleteRange(int rangeId)
        {
            throw new NotImplementedException();
        }

        public void DeleteRange(Range range)
        {
            throw new NotImplementedException();
        }

        public void RemoveAgency(int agencyId)
        {
            throw new NotImplementedException();
        }

        public void RemoveAgency(Agency agency)
        {
            throw new NotImplementedException();
        }

        public void RemoveRange(int rangeId)
        {
            throw new NotImplementedException();
        }

        public void RemoveRange(Range range)
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
