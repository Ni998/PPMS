using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Entities;
using com.Logiphix.BusinessApplication.Common;
using System.Windows.Input;
using com.Logiphix.PPMS.Common;
using System.Windows;
using com.Logiphix.PPMS.Model;

namespace com.Logiphix.PPMS.ViewModel
{
    public class ProductsViewModel : Notifier
    {
        #region Properties

        List<Item> productLST;
        public List<Item> ProductLST
        {
            get
            {
                return productLST;
            }
            set
            {
                productLST = value;
                NotifyPropertyChanged("ProductLST");
            }
        }

        List<Package> packageLST;
        public List<Package> PackageLST
        {
            get
            {
                return packageLST;
            }
            set
            {
                packageLST = value;
                NotifyPropertyChanged("PackageLST");
            }
        }

        string prodcutName;
        public string ProdcutName
        {
            get
            {
                return prodcutName;
            }
            set
            {
                prodcutName = value;
                NotifyPropertyChanged("ProdcutName");
            }
        }

        string productDesc;
        public string ProductDesc
        {
            get
            {
                return productDesc;
            }
            set
            {
                productDesc = value;
                NotifyPropertyChanged("ProductDesc");
            }
        }

        string productPrice;
        public string ProductPrice
        {
            get
            {
                return productPrice;
            }
            set
            {
                productPrice = value;
                NotifyPropertyChanged("ProductPrice");
            }
        }

        string productID;
        public string ProductID
        {
            get
            {
                return productID;
            }
            set
            {
                productID = value;
                NotifyPropertyChanged("ProductID");
            }
        }
        #endregion

        ProductsModel model = new ProductsModel();

        #region ICommand

        public ICommand CommandSave { get; set; }
        public ICommand CommandReset { get; set; }
        public ICommand CommandCancel { get; set; }
        public ICommand CommandDelete { get; set; }
        public bool CanExecuteCommand(object parameter)
        {
            return true;
        }
        #endregion

        public ProductsViewModel()
        {
            this.CommandSave    = new ExecCommand(ExecuteSaveCommand, CanExecuteCommand);
            this.CommandReset   = new ExecCommand(ExecuteResetCommand, CanExecuteCommand);
            this.CommandCancel  = new ExecCommand(ExecuteCancelCommand, CanExecuteCommand);
            this.CommandDelete  = new ExecCommand(ExecuteDeleteCommand, CanExecuteCommand);
        }

        public void ExecuteSaveCommand(object parameter)
        {
            MessageBox.Show("Are You Sure?");


            model.GetAllProducts();
        }

        public void ExecuteResetCommand(object parameter)
        {
            MessageBox.Show("Executing Reset");
        }


        public void ExecuteCancelCommand(object parameter)
        {
            MessageBox.Show("Executing Cancel");
        }


        public void ExecuteDeleteCommand(object parameter)
        {
            MessageBox.Show("Executing Delete");
        }



    }
}
