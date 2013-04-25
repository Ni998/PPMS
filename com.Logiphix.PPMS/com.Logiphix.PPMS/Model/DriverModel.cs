using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication;

namespace com.Logiphix.PPMS.Model
{
    public class DriverModel
    {
        BusinessApplication.BusinessApplication App;

        public DriverModel()
        {
            App = new BusinessApplication.BusinessApplication();
        }

        public bool EstablishServerConnection()
        {
            return App.EstablishServerConnection();
        }

        public bool CloseServerConnection()
        {
            return App.CloseServerConnection();
        }
    }
}
