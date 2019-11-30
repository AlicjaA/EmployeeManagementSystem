using System;
using System.Collections.Generic;

namespace BusinessLogic
{
    public partial class Agency
    {
        public Agency()
        {
            Range = new HashSet<Range>();
        }

        public int AgencyId { get; set; }
        public string AgencyName { get; set; }

        public virtual ICollection<Range> Range { get; set; }
    }
}
