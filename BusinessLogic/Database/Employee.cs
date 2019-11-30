using System;
using System.Collections.Generic;

namespace BusinessLogic
{
    public partial class Employee
    {
        public Employee()
        {
            EmployeeDetails = new HashSet<EmployeeDetails>();
            EmployeeNotes = new HashSet<EmployeeNotes>();
        }

        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public virtual ICollection<EmployeeDetails> EmployeeDetails { get; set; }
        public virtual ICollection<EmployeeNotes> EmployeeNotes { get; set; }
    }
}
