using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Package : Notifier
    {
        public String PackId
        { get; set; }
        public String PackQuantity
        { get; set; }
        public String PackDescription
        { get; set; }
        public DateTime RecordStanp
        { get; set; }

        public Package()
        {

        }

        public Package(String packId, String packQuantity, DateTime recordStamp)
        {
            PackId = packId;
            PackQuantity = packQuantity;
            RecordStanp = recordStamp;
        }
    }
}
