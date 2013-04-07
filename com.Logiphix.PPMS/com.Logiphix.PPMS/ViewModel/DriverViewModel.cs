using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Controls;

namespace com.Logiphix.PPMS.ViewModel
{

    public class DriverViewModel
    {
        public ChildWindowHelper ChildWindow;

        public DriverViewModel()
        {
            ChildWindow = new ChildWindowHelper();
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
    }
}
