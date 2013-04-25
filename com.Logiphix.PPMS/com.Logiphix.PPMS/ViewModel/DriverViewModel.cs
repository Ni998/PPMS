using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Controls;
using com.Logiphix.PPMS.Model;
using System.Threading;
using System.Windows;

namespace com.Logiphix.PPMS.ViewModel
{

    public class DriverViewModel
    {
        public ChildWindowHelper ChildWindow;
        public DriverModel Model;
        private bool isConnected;
        public bool IsConnected
        {
            get;
            set;
        }

        public DriverViewModel()
        {
            ChildWindow = new ChildWindowHelper();
            Model = new DriverModel();
        }

        public void CreateChildWindow()
        {
            ChildWindow = new ChildWindowHelper();
        }

        private void ReloadDockPanel(UserControl newUserControl)
        {
            if (ChildWindow.DockPanelDisplay.Children.Count > 0)
            {
                ChildWindow.DockPanelDisplay.Children.RemoveRange(0, ChildWindow.DockPanelDisplay.Children.Count);
            }
            ChildWindow.DockPanelDisplay.Children.Add(newUserControl);
        }


        public void  EstablishServerConnection()
        {
            IsConnected = Model.EstablishServerConnection();
        }

        public void CloseServerConnection()
        {
            IsConnected = Model.CloseServerConnection();
        }

        public void InitApplication()
        {
            EstablishServerConnection();
            SleepNow();
        }

        public void SleepNow()
        {
            if(!IsConnected)
            MessageBox.Show("Failed to connect to the Database. Please contact the developer");
        }
    }
}
