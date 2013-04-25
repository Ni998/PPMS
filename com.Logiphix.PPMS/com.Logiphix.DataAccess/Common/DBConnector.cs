using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Odbc;

namespace com.Logiphix.DataAccess.Common
{
    public class DBConnector
    {
        internal static OdbcConnection connection{get;set;}

        static private OdbcConnection Connect(String _userName, String _passwd)
        {
            try
            {
                string ConString = "DRIVER={MySQL ODBC 5.2a Driver};" + "SERVER=localhost;" + "DATABASE=fuelfetch;" + "UID=" + _userName + ";" + "PASSWORD=" + _passwd + ";";// +"OPTION=3";
                OdbcConnection Connection = new OdbcConnection(ConString);
                Connection.Open();
                return (Connection.State == System.Data.ConnectionState.Open ? Connection : null);
            }
            catch
            {
                return null;
            }
        }


        #region Public

        static public OdbcConnection GetConnection()
        {
            return connection;
        }

        static public bool OpenConnection()
        {
            connection = Connect("root", "deepa");
            return ((connection != null && connection.State == System.Data.ConnectionState.Open) ? true : false);
        }
        static public bool CloseConnection()
        {
            try
            {
                if (connection != null && connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        #endregion
    }
}