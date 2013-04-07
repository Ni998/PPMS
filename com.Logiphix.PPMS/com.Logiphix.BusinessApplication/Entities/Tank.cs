using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Tank : Notifier
    {
        public String TankId
        { get; set; }
        public String TankName
        { get; set; }
        public Item ItemUsed
        { get; set; }
        public String TankCapacityId
        { get; set; }

        public Tank()
        {

        }
        public Tank(String _TId, String _TName, String _ItemId, String _TankCapacityId)
        {
            TankId = _TId;
            TankName = _TName;
            //temId = _ItemId;
            TankCapacityId = _TankCapacityId;
        }
    }
}
