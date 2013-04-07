using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{ 
    public class DailyCashRegisterDTO : Notifier
    {
        public DateTime SaleTime
        { get; set; }
        public DateTime SaleDate
        { get; set; }
        public Employee Cashier
        { get; set; }
        public String Amount
        { get; set; }
    }
}
