using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class NozzleSaleDTO : Notifier
    {
        public string NozzleSaleID
        { get; set; }
        public Nozzle UsedNozzle
        { get; set; }
        public DateTime SaleDate
        { get; set; }
        public Employee Cashier
        { get; set; }
        public String OpenRead
        { get; set; }
        public String CloseRead
        { get; set; }
        public String LitresSold
        { get; set; }
        public String TotalAmount
        { get; set; }
    }
}
