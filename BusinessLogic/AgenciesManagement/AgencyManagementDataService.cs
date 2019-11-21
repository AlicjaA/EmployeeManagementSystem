using AgenciesManagement;
using Kierownik_Magazynów.Database;
using System.Data;
using System.Data.Entity;

namespace AgenciesManagement
{
    public class AgencyManagementDataService
    {
        public DataTable Ranges;

        public DataTable Agencies;

        public DataTable Warehouses;

        private AgencyManagementRepository agencyRepository;

        public AgencyManagementDataService()
        {
            this.agencyRepository = new AgencyManagementRepository();
        }

        public void GetWarehouses()
        {
            try
            {
                this.Warehouses = agencyRepository.GetWarehouses().ToListAsync().Result.ToDataTable();
            }
            catch
            {
                DevExpress.XtraEditors.XtraMessageBox.Show("B³¹d przy pobieraniu listy magazynów");
            }
        }

        public string GetRanges()
        {
            string message;
            try
            {
                Ranges = agencyRepository.GetRanges().ToListAsync().Result.ToDataTable();
                message = "Pobrano listê zakresów";
            }
            catch
            {
                message = "Nieudana próba pobrania zakresów";
            }
            return message;
        }

        public string AddRange(int warehouseId, int agencyId, int rangeFrom, int rangeTo)
        {
            string message;
            if (warehouseId != 0 && agencyId != 0 && rangeFrom > 0 && rangeTo > rangeFrom)
            {
                return agencyRepository.AddRange(warehouseId, agencyId, rangeFrom, rangeTo, rangeTo - rangeFrom);
            }
            else
            {
                message = "Nale¿y wprowadziæ wszystkie dane!";
            }
            return message;

        }

        public string EditRange(int rangeId, int rangeFrom, int rangeTo)
        {
            string message;
            if (rangeId >= 1 && rangeFrom > 0 && rangeTo > rangeFrom)
            {
                int totalRange = rangeTo - rangeFrom;
                message = agencyRepository.EditRange(rangeId, rangeFrom, rangeTo, totalRange);
            }
            else if (rangeFrom >= rangeTo)
            {
                message = "Zakres do musi byæ wiêkszy od zakresu od";
            }
            else if (rangeTo == 0 || rangeFrom == 0)
            {
                message = "Zakres nie mo¿e byæ równy 0";
            }
            else if (rangeId < 1)
            {
                message = "B³êdny numer zakresu";
            }
            else
            {
                message = "B³¹d przy edycji zakresu";
            }
            return message;
        }


        //TODO
        public string DeleteRange(int rangeId)
        {
            string message;
            if (rangeId > 0)
            {
                message = agencyRepository.DeleteRange(rangeId);
            }
            else
            {
                message = "B³êdny numer zakresu";
            }
            return message;
        }

        public string GetAgencies()
        {
            string message;
            try
            {
                Agencies = agencyRepository.GetAgencies().ToListAsync().Result.ToDataTable();
                message = "Pobrano listê agencji";
            }
            catch
            {
                message = "Nieudana próba pobrania agencji";
            }
            return message;
        }

        public string AddAgency(string agencyName)
        {
            string message;
            if (agencyName.Length >= 1)
            {
                return agencyRepository.AddAgency(agencyName);
            }
            else
            {
                message = "Minimalna d³ugoœæ nazwy agencji wynosi 1 znak.";
            }
            return message;
        }

        public string EditAgency(int agencyId, string agencyName)
        {
            string message;
            if (agencyName.Length >= 1 && agencyId > 0)
            {
                message = agencyRepository.EditAgency(agencyId, agencyName);
            }
            else if (agencyName.Length < 1)
            {
                message = "Minimalna d³ugoœæ nazwy agencji wynosi 1 znak.";
            }
            else
            {
                message = "B³êdny numer agencji";
            }
            return message;
        }

        public string DeleteAgency(int agencyId)
        {
            string message;
            if (agencyId > 0)
            {
                message = agencyRepository.DeleteAgency(agencyId);
            }
            else
            {
                message = "B³êdny numer agencji";
            }
            return message;
        }


    }
}

