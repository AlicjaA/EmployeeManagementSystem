using System;
using System.Collections.Generic;
using System.Text;

namespace BusinessLogic.Interfaces
{
    public abstract class EntityBase
    {
        public int Id { get; protected set; }
    }
}
