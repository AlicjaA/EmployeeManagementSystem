using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace BusinessLogic.Interfaces
{
    /// <summary>
    /// Repository for Agencies and Ranges Management. 
    /// Consists of CRUD operations.
    /// </summary>
    interface IAgenciesRepository
    {
        DbContext dbContext { get; }
        void CreateAgency();
        void RemoveAgency(int agencyId);
        void RemoveAgency(Agency agency);
        void UpdateAgency(int agencyIdToUpdate, Agency agencyUpdated);
        void UpdateAgency(Agency agencyToUpdate, Agency agencyUpdated);
        void DeleteAgency(int agencyId);
        void DeleteAgency(Agency agency);

        void CreateRange();
        void RemoveRange(int rangeId);
        void RemoveRange(Range range);
        void UpdateRange(int rangeToUpdate, Range rangeUpdated);
        void UpdateRange(Range rangeToUpdate, Range rangeUpdated);
        void DeleteRange(int rangeId);
        void DeleteRange(Range range);

    }
}
