using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Employee : Notifier
    {
        public string ID
        { get; set; }
        public string FirstName
        { get; set; }
        public string LastName
        { get; set; }
        public DateTime DOB
        { get; set; }
        public string MobilePhone
        { get; set; }
        public string OtherPhone
        { get; set; }
        public string Address
        { get; set; }
        public Designations Designation
        { get; set; }
    }
}
