using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Odbc;

namespace com.Logiphix.DataAccess.Common
{
    public class DBConnector
    {
        static private OdbcConnection Connect(String _userName, String _passwd)
        {
            string ConString = "DRIVER={MySQL ODBC 5.1 Driver};" + "SERVER=localhost;" + "DATABASE=fuelfetch;" + "UID=" + _userName + ";" + "PASSWORD=" + _passwd + ";";// +"OPTION=3";
            OdbcConnection Connection = new OdbcConnection(ConString);
            Connection.Open();
            return (Connection.State == System.Data.ConnectionState.Open ? Connection : null);
        }

        static public OdbcConnection OpenConnection()
        {
            return Connect("root", "Deepa");
        }
        static public OdbcConnection CloseConnection()
        {
            return Connect("root", "Deepa");
        }
    }
}