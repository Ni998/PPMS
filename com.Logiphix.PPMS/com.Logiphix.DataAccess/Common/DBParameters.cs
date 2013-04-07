using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.Logiphix.DataAccess.Common
{
    public class DBParameters
    {
        public const string PARM_TYPE_INT = "int";
        public const string PARM_TYPE_STRING = "string";
        public const string PARM_TYPE_DATETIME = "DateTime";
        public const string PARM_TYPE_DOUBLE = "Double";
        static public List<object> DBParm = new List<object>();

        public object PValue
        {
            get;
            set;
        }
        public string PType
        {
            get;
            set;
        }
        public DBParameters()
        {

        }
        public DBParameters(object pValue, string pType)
        {
            PValue = pValue;
            PType = pType;
        }
    }
}
