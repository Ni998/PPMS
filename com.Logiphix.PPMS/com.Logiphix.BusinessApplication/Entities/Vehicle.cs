using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Vehicle : Notifier
    {
        public String VehicleId
        { get; set; }
        public String CustId
        { get; set; }
        public String VehicleNumber
        { get; set; }

    }
}
