using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Entities;
using com.Logiphix.BusinessApplication.Common;
using System.Windows.Input;
using System.Windows;
using com.Logiphix.PPMS.Common;

namespace com.Logiphix.PPMS.ViewModel
{
    public class EmployeeViewModel : Notifier
    {
        #region Properties

        List<Employee> employeeLST;
        public List<Employee> EmployeeLST 
        { 
            get 
            {
                return employeeLST; 
            } 
            set 
            { 
                employeeLST  = value; 
                NotifyPropertyChanged("EmployeeLST");
            } 
        }

        List<Designations> desigLST;
        public List<Designations> DesigLST
        {
            get
            {
                return desigLST;
            }
            set
            {
                desigLST = value;
                NotifyPropertyChanged("DesigLST");
            }
        }

        string firstName;
        public string FirstName 
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = value;
                NotifyPropertyChanged("FirstName");
            }
        }

        string lastName;
        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                lastName = value;
                NotifyPropertyChanged("LastName");
            }
        }

        DateTime dob;
        public DateTime DOB
        {
            get
            {
                return dob;
            }
            set
            {
                dob = value;
                NotifyPropertyChanged("DOB");
            }
        }

        string phone1;
        public string Phone1
        {
            get
            {
                return phone1;
            }
            set
            {
                phone1 = value;
                NotifyPropertyChanged("Phone1");
            }
        }

        string phone2;
        public string Phone2
        {
            get
            {
                return phone2;
            }
            set
            {
                phone2 = value;
                NotifyPropertyChanged("Phone2");
            }
        }

        string address;
        public string Address
        {
            get
            {
                return address;
            }
            set
            {
                address = value;
                NotifyPropertyChanged("Address");
            }
        }

        int desigID;
        public int DesigID
        {
            get
            {
                return desigID;
            }
            set
            {
                desigID = value;
                NotifyPropertyChanged("DesigID");
            }
        }

        #endregion

        

        public EmployeeViewModel()
        {
            this.CommandSave    = new ExecCommand(ExecuteSaveCommand, CanExecuteCommand);
            this.CommandReset   = new ExecCommand(ExecuteResetCommand, CanExecuteCommand);
            this.CommandCancel  = new ExecCommand(ExecuteCancelCommand, CanExecuteCommand);
            this.CommandDelete  = new ExecCommand(ExecuteDeleteCommand, CanExecuteCommand);
        }

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

        

        public void ExecuteSaveCommand(object parameter)
        {
            MessageBox.Show("Executing Save");
        }
       
        public void ExecuteResetCommand(object parameter)
        {
            MessageBox.Show("Executing Save");
        }

        
        public void ExecuteCancelCommand(object parameter)
        {
            MessageBox.Show("Executing Save");
        }

        
        public void ExecuteDeleteCommand(object parameter)
        {
            MessageBox.Show("Executing Save");
        }
        

    }

}
