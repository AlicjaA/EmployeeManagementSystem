using System;
using System.Collections.Generic;

namespace BusinessLogic
{
    public partial class EmployeeDetails
    {
        public int DetailsId { get; set; }
        public int EmployeeId { get; set; }
        public DateTime HireDate { get; set; }
        public DateTime? DismissDate { get; set; }
        public int? SupervisorId { get; set; }
        public string DefaultActivity { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
