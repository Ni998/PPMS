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
using System.Windows.Navigation;
using System.Windows.Shapes;
using com.Logiphix.PPMS.ViewModel;


namespace com.Logiphix.PPMS
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DriverViewModel dContext;
        public MainWindow()
        {
            SplashScreen splash = new SplashScreen("..\\Images\\SplashScreen_Nozzle.jpg");
            splash.Show(true);
            dContext = new DriverViewModel();
            dContext.InitApplication();
            splash.Show(false);
            InitializeComponent();
            
        }

        
        private void MenuItem_Click_App_Exit(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        #region Main Menuitems Click events

        private void NewEmployeeMenuitem_Clicked(object sender, RoutedEventArgs e)
        {
            dContext.CreateChildWindow();
            dContext.ChildWindow.Title = "New Employee";
            dContext.ChildWindow.Height = 500;
            dContext.ChildWindow.Width = 800;
            dContext.ChildWindow.ReloadDockPanel(new UserControls.UCEmployee());
            dContext.ChildWindow.Show();
        }

        private void NewNozzleMenuitem_Clicked(object sender, RoutedEventArgs e)
        {
            dContext.CreateChildWindow();
            dContext.ChildWindow.Title = "New Nozzle";
            dContext.ChildWindow.Height = 500;
            dContext.ChildWindow.Width = 800;
            dContext.ChildWindow.ReloadDockPanel(new UserControls.UCNozzle());
            dContext.ChildWindow.Show();
        }

        private void NewTankMenuitem_Clicked(object sender, RoutedEventArgs e)
        {
            dContext.CreateChildWindow();
            dContext.ChildWindow.Title = "New Tank";
            dContext.ChildWindow.Height = 500;
            dContext.ChildWindow.Width = 800;
            dContext.ChildWindow.ReloadDockPanel(new UserControls.UCTank());
            dContext.ChildWindow.Show();
        }

        private void NewProductMenuitem_Clicked(object sender, RoutedEventArgs e)
        {
            dContext.CreateChildWindow();
            dContext.ChildWindow.Title = "New Product";
            dContext.ChildWindow.Height = 500;
            dContext.ChildWindow.Width = 800;
            dContext.ChildWindow.ReloadDockPanel(new UserControls.UCProducts());
            dContext.ChildWindow.Show();
        }

        private void NewPackMenuitem_Clicked(object sender, RoutedEventArgs e)
        {
            dContext.CreateChildWindow();
            dContext.ChildWindow.Title = "New Pack";
            dContext.ChildWindow.Height = 500;
            dContext.ChildWindow.Width = 800;
            dContext.ChildWindow.ReloadDockPanel(new UserControls.UCPack());
            dContext.ChildWindow.Show();
        }
        
        #endregion


        private void NozzleSale_Btn_Click(object sender, RoutedEventArgs e)
        {
            ReloadDockPanel(new UserControls.UCNozzleSale());
        }

        private void CreditSale_Btn_Click(object sender, RoutedEventArgs e)
        {
            ReloadDockPanel(new UserControls.UCCreditFuelSales());
        }

        private void DCR_Btn_Click(object sender, RoutedEventArgs e)
        {
            ReloadDockPanel(new UserControls.UCDailyCashRegister());
        }

        private void Tank_Btn_Click(object sender, RoutedEventArgs e)
        {
            ReloadDockPanel(new UserControls.UCTank());
        }

        private void LubeSale_Btn_Click(object sender, RoutedEventArgs e)
        {

        }
        
        private void Employee_Btn_Click(object sender, RoutedEventArgs e)
        {
            ReloadDockPanel(new UserControls.UCEmployee());
        }

        private void ReloadDockPanel(UserControl newUserControl)
        {
            if (DockPanelDisplay.Children.Count > 0)
            {
                DockPanelDisplay.Children.RemoveRange(0, DockPanelDisplay.Children.Count);
            }
            DockPanelDisplay.Children.Add(newUserControl);
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            dContext.CloseServerConnection();
            Application.Current.Shutdown();
        }

    }
}
