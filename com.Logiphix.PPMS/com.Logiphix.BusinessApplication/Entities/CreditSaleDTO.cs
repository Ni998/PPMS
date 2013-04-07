using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class CreditSaleDTO : Notifier
    {
        public Nozzle _nozzle
        { get; set; }
        public DateTime _saleDate
        { get; set; }
        public Employee _cashier
        { get; set; }
        public String _litres
        { get; set; }
    }
}
