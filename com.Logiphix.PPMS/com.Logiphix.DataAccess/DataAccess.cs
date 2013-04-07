using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using com.Logiphix.DataAccess.Common;

namespace com.Logiphix.DataAccess
{
    public class DataAccess
    {
        private string QUERY_STRING = string.Empty;
        DataTable returnTable = new DataTable();
        private int ReturnStatus = -1;

        public DataTable GetAllEmployees()
        {
            return  ExecuteCommand.ExecuteStringQuery(StoredProcedures.GET_EXIST_EMPLOYEE);
        }

        public int InsertEmployee(string Name, String Designation)
        {
            List<DBParameters> parmList = new List<DBParameters>();
            parmList.Add(new DBParameters(Name, DBParameters.PARM_TYPE_STRING));
            parmList.Add(new DBParameters(Designation, DBParameters.PARM_TYPE_STRING));
            return  ExecuteCommand.ExecuteNonQuery(StoredProcedures.INSERT_NEW_EMPLOYEE, parmList); 
        }

        public int UpdateEmployee(int ID, string Name, String Designation)
        {
            List<DBParameters> parmList = new List<DBParameters>();
            parmList.Add(new DBParameters(ID, DBParameters.PARM_TYPE_INT));
            parmList.Add(new DBParameters(Name, DBParameters.PARM_TYPE_STRING));
            parmList.Add(new DBParameters(Designation, DBParameters.PARM_TYPE_STRING));
            parmList.Add(new DBParameters(Designation, DBParameters.PARM_TYPE_STRING));
            return ExecuteCommand.ExecuteNonQuery(StoredProcedures.INSERT_NEW_EMPLOYEE, parmList);
        }
    }
}
