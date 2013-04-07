using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class TankCapacity : Notifier
    {
        public string CapacityID
        {
            get;
            set;
        }
        public string Capacity
        {
            get;
            set;
        }
    }
}
