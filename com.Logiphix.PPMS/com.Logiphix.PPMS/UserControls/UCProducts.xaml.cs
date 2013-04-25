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

namespace com.Logiphix.PPMS.UserControls
{
    /// <summary>
    /// Interaction logic for UCProducts.xaml
    /// </summary>
    public partial class UCProducts : UserControl
    {
        ProductsViewModel dContext;

        public UCProducts()
        {
            dContext = new ProductsViewModel();
            this.DataContext = dContext;
            InitializeComponent();
        }

        private void CreateNewPack_Clicked(object Sender, RoutedEventArgs e)
        {
            ChildWindowHelper ChildWindow = new ChildWindowHelper();
            ChildWindow.Title = "New Pack";
            ChildWindow.ReloadDockPanel(new UserControls.UCPack());
            ChildWindow.Show();
        }

    }
}
