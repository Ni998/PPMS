using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Nozzle : Notifier
    {
        public String NozzleId
        { get; set; }
        public Tank TankUsed
        { get; set; }
        public String NozzleName
        { get; set; }

        public Nozzle()
        {

        }

        public Nozzle(String _NozzId, String _NozzleName)
        {
            NozzleId = _NozzId;
            //TankId = _TankId;
            NozzleName = _NozzleName;
        }
    }
}
