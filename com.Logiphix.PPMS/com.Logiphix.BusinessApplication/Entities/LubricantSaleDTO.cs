using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class LubricantSaleDTO : Notifier
    {
        public Item Item
        { get; set; }
        public String SaleType
        { get; set; }
        public DateTime SaleDate
        { get; set; }
        public Employee Cashier
        { get; set; }
        public String  Quantity
        { get; set; }
    }
}
