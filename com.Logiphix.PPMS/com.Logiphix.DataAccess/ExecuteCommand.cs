using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.DataAccess.Common;
using System.Data.Odbc;
using System.Data;

namespace com.Logiphix.DataAccess
{
    public class ExecuteCommand
    {
        static public List<DBParameters> DBParm = new List<DBParameters>();

        /// <summary>
        /// Builds the query string and returns it
        /// </summary>
        /// <param name="QueryString"></param>
        /// <param name="dbParm"></param>
        /// <returns></returns>
        static public string GetQueryString(String QueryString, List<DBParameters> dbParm)
        {
            string paramList = string.Empty;
            string parmString = string.Empty;

                
            foreach (DBParameters parm in dbParm)
            {
                parmString = string.Empty;

                if (parm.PType.Equals(DBParameters.PARM_TYPE_INT))
                {
                    parmString = parm.PValue.ToString();
                }

                else if (parm.PType.Equals(DBParameters.PARM_TYPE_STRING))
                {
                    parmString = "'" + parm.PValue.ToString() + "'";
                }

                else if (parm.PType.Equals(DBParameters.PARM_TYPE_DATETIME))
                {
                    parmString = "'" + parm.PValue.ToString() + "'";
                }

                else if (parm.PType.Equals(DBParameters.PARM_TYPE_DOUBLE))
                {
                    parmString = parm.PValue.ToString();
                }
                paramList += parmString + ",";
            }

            if (!string.IsNullOrEmpty(paramList))
            {
                paramList = paramList.Substring(0, paramList.Length - 1);
            }
            else
            {
                paramList = string.Empty;
            }
            if (!string.IsNullOrEmpty(paramList))
            {
                QueryString = "CALL " + QueryString + "(" + paramList + ");";
            }
            else
            {
                QueryString = "CALL " + QueryString + "();";
            }

            return QueryString;
        }

        /// <summary>
        /// This Method will Execute a NON QUERY SQL statement Ex. a STORED PROCEDURE
        /// </summary>
        /// <param name="_queryStr"></param>
        /// <param name="_conn"></param>
        /// <returns></returns>
        static public int ExecuteNonQuery(String _queryStr, List<DBParameters> dbParm)
        {
            OdbcConnection _conn = DBConnector.OpenConnection();

            if (_conn.State != ConnectionState.Open)
            {
                _conn.Open();
            }

            _queryStr = GetQueryString(_queryStr, dbParm);

            try
            {
                OdbcCommand command = new OdbcCommand(_queryStr, _conn);
                return command.ExecuteNonQuery();
            }

            catch (Exception e)
            {
                return -1;// returns -1 in case of any exception
            }
        }

        /// <summary>
        /// This Method will Execute a SCALAR SQL statement
        /// </summary>
        /// <param name="_queryStr"></param>
        /// <param name="_conn"></param>
        /// <returns></returns>
        static public Object ExecuteScalar(String _queryStr, List<DBParameters> dbParm)
        {
            OdbcConnection _conn = DBConnector.OpenConnection();

            if (_conn.State != ConnectionState.Open)
            {
                _conn.Open();
            }

            _queryStr = GetQueryString(_queryStr, dbParm);

            try
            {
                OdbcCommand command = new OdbcCommand(_queryStr, _conn);
                return command.ExecuteScalar();
            }

            catch (Exception e)
            {
                return null;// returns null in case of any error
            }
        }

        /// <summary>
        /// This Method will Execute a SELECT SQL statement
        /// </summary>
        /// <param name="_queryStr"></param>
        /// <param name="_conn"></param>
        /// <returns></returns>
        static public DataTable ExecuteSelect(String _queryStr, List<DBParameters> dbParm)
        {
            OdbcConnection _conn = DBConnector.OpenConnection();

            if (_conn.State != ConnectionState.Open)
            {
                _conn.Open();
            }

            _queryStr = GetQueryString(_queryStr, dbParm);

            try
            {
                OdbcCommand command = new OdbcCommand(_queryStr, _conn);
                DataTable table = new DataTable();
                OdbcDataAdapter adapter = new OdbcDataAdapter();
                adapter.SelectCommand = command;
                adapter.Fill(table);
                return table;
            }

            catch (Exception e)
            {
                return null;// returns null in case of any error
            }
        }

        static public DataTable ExecuteStringQuery(String _queryStr)
        {
            OdbcConnection _conn = DBConnector.OpenConnection();

            if (_conn.State != ConnectionState.Open)
            {
                _conn.Open();
            }

            try
            {
                OdbcCommand command = new OdbcCommand(_queryStr, _conn);
                DataTable table = new DataTable();
                OdbcDataAdapter adapter = new OdbcDataAdapter();
                adapter.SelectCommand = command;
                adapter.Fill(table);
                return table;
            }

            catch (Exception e)
            {
                return null;// returns null in case of any error
            }
        }
    }
}
