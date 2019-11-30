using System;
using System.Collections.Generic;

namespace BusinessLogic
{
    public partial class EmployeeNotes
    {
        public int NoteId { get; set; }
        public int BusinessEntityId { get; set; }
        public string NoteText { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        public string Comment { get; set; }

        public virtual Employee BusinessEntity { get; set; }
    }
}
