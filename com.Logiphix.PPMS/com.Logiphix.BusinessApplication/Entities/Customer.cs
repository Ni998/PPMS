using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Customer : Notifier
    {
        public String CustId
        { get; set; }
        public String CustName
        { get; set; }
        public String Address1
        { get; set; }
        public String Address2
        { get; set; }
        public String City
        { get; set; }
        public String State
        { get; set; }
        public String Country
        { get; set; }
    }
}
