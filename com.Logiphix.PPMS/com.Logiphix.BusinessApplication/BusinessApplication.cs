using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Entities;
using com.Logiphix.DataAccess.Common;

namespace com.Logiphix.BusinessApplication
{
    public class BusinessApplication
    {
        public List<Employee> GetAllEmployees()
        {
            List<Employee> returnLST = new List<Employee>();
            return returnLST;
        }


        public bool EstablishServerConnection()
        {
            return DBConnector.OpenConnection();
        }

        public bool CloseServerConnection()
        {
            return DBConnector.CloseConnection();
        }
    }
}
