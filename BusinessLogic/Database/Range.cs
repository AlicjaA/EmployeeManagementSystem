using System;
using System.Collections.Generic;

namespace BusinessLogic
{
    public partial class Range
    {
        public int RangeId { get; set; }
        public int AgencyId { get; set; }
        public int RangeFrom { get; set; }
        public int RangeTo { get; set; }
        public int TotalRange { get; set; }

        public virtual Agency Agency { get; set; }
    }
}
