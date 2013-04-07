using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace com.Logiphix.PPMS
{
    /// <summary>
    /// Interaction logic for ChildWindowHelper.xaml
    /// </summary>
    public partial class ChildWindowHelper : Window
    {
        public ChildWindowHelper()
        {
            InitializeComponent();
        }

        public void ReloadDockPanel(UserControl newUserControl)
        {
            if (DockPanelDisplay.Children.Count > 0)
            {
                DockPanelDisplay.Children.RemoveRange(0, DockPanelDisplay.Children.Count);
            }
            DockPanelDisplay.Children.Add(newUserControl);
        }
    }
}
