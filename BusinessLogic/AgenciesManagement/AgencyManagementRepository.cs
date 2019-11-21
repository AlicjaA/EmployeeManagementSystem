using Kierownik_Magazynów.Database;
using System.Data.Entity;

namespace AgenciesManagement
{
    public class AgencyManagementRepository
    {
        private WarehouseManagerEntitiesAgencies agencyDataBase;

        public AgencyManagementRepository()
        {
            agencyDataBase = new WarehouseManagerEntitiesAgencies();
        }

        public DbSet<Range> GetRanges()
        {
            return agencyDataBase.Range;
        }

        public string AddRange(int warehouseId, int agencyId, int rangeFrom, int rangeTo, int totalRange)
        {
            Range rangeToAdd = new Range();
            rangeToAdd.WarehouseId = warehouseId;
            rangeToAdd.AgencyId = agencyId;
            rangeToAdd.RangeFrom = rangeFrom;
            rangeToAdd.RangeTo = rangeTo;
            rangeToAdd.TotalRange = totalRange;
            agencyDataBase.Range.Add(rangeToAdd);
            agencyDataBase.SaveChanges();
            return "Dodano zakres";
        }

        internal DbSet<Warehouse> GetWarehouses()
        {
            return agencyDataBase.Warehouse;
        }

        public string EditRange(int rangeId, int rangeFrom, int rangeTo, int totalRange)
        {
            Range toEdit = agencyDataBase.Range.Find(rangeId);
            if (toEdit != null)
            {
                toEdit.RangeFrom = rangeFrom;
                toEdit.RangeTo = rangeTo;
                toEdit.TotalRange = totalRange;
                agencyDataBase.SaveChanges();
                return "Zaktualizowano zakres";
            }
            else
            {
                return "B³¹d przy aktualizacji nazwy agencji";

            }
        }

        public string DeleteRange(int rangeId)
        {
            Range toDelete = agencyDataBase.Range.Find(rangeId);
            if (toDelete != null)
            {
                agencyDataBase.Range.Remove(toDelete);
                agencyDataBase.SaveChanges();
                return "Usuniêto wybrany zakres";
            }
            else
            {
                return "B³¹d przy usuwaniu agencji";
            }
        }

        public DbSet<Agency> GetAgencies()
        {
            return agencyDataBase.Agency;
        }

        public string AddAgency(string agencyName)
        {
            Agency agencyToAdd = new Agency();
            agencyToAdd.AgencyName = agencyName;
            agencyDataBase.Agency.Add(agencyToAdd);
            agencyDataBase.SaveChanges();

            return "Dodano agencjê";
        }

        public string EditAgency(int agencyId, string agencyName)
        {
            Agency toEdit = agencyDataBase.Agency.Find(agencyId);
            if (toEdit != null)
            {
                toEdit.AgencyName = agencyName;
                agencyDataBase.SaveChanges();
                return "Zaktualizowano nazwê agencji";
            }
            else
            {
                return "B³¹d przy aktualizacji nazwy agencji";
            }
        }

        public string DeleteAgency(int agencyId)
        {
            Agency toDelete = agencyDataBase.Agency.Find(agencyId);
            if (toDelete != null)
            {
                agencyDataBase.Agency.Remove(toDelete);
                agencyDataBase.SaveChanges();
                return "Usuniêto wybran¹ agencjê";
            }
            else
            {
                return "B³¹d przy usuwaniu agencji";
            }
        }

    }

}

