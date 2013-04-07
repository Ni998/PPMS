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
    /// Interaction logic for UCEmployee.xaml
    /// </summary>
    public partial class UCEmployee : UserControl
    {
        EmployeeViewModel dContext;

        public UCEmployee()
        {
            dContext = new EmployeeViewModel();

            this.DataContext = dContext;

            InitializeComponent();


        }
    }
}
