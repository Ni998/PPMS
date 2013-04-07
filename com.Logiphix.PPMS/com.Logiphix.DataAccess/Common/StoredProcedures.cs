using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.Logiphix.DataAccess.Common
{
    class StoredProcedures
    {
         //Constants for Packing Tab.
         public const string INSERT_NEW_PACK    = "InsertPacking_Proc";
         public const string DELETE_EXIST_PACK  = "DeletePacking_Proc";
         public const string UPDATE_EXIST_PACK  = "UpdatePacking_Proc";
         public const string GET_EXIST_PACK     = "GetAllPacking_Proc";

        //Constants for Product Tab.
         public const string INSERT_NEW_PRODUCT    = "InsertDetailedItemPriceHist_Proc";
         public const string DELETE_EXIST_PRODUCT  = "DELETEITEMIPDATEPRICEHIST_PROC";
         public const string UPDATE_EXIST_PRODUCT  = "UPDATEITEMPRICEHIST_PROC";
         public const string GET_EXIST_PRODUCT     = "GetAllProducts_Proc";

        //public constants for Tank.
         public const string INSERT_NEW_TANK    = "InsertTank_Proc";
         public const string DELETE_EXIST_TANK  = "DeleteTank_Proc";
         public const string UPDATE_EXIST_TANK  = "UpdateTank_Proc";
         public const string GET_EXIST_TANKCAPACITIES = "GetAllTankCapacities_Proc";

        //public constants for Nozzle.
         public const string INSERT_NEW_NOZZLE    = "InsertNozzel_Proc";
         public const string DELETE_EXIST_NOZZLE  = "DeleteNozzel_Proc";
         public const string UPDATE_EXIST_NOZZLE  = "UpdateNozzel_Proc";
         public const string GET_EXIST_NOZZLE     = "GetAllPNozzleSales_Proc";

        //public constants for Nozzle Sale.
         public const string GET_EXIST_NOZZ_SALES = "nozzelsale_view";
         public const string INSERT_NEW_NOZZLE_SALE    = "InsertNozzelSale_Proc";
         public const string DELETE_EXIST_NOZZLE_SALE  = "DeleteNozzelSale_Proc";
         public const string UPDATE_EXIST_NOZZLE_SALE  = "UpdateNozzelSale_Proc";

        //public constants for Credit Sale.
         public const string INSERT_NEW_CREDIT_SALE    = "InsertCashierFuelCreditSale_Proc";
         public const string DELETE_EXIST_CREDIT_SALE  = "DeleteCashierFuelCreditSale_Proc";
         public const string UPDATE_EXIST_CREDIT_SALE  = "UpdateCashierFuelCreditSale_Proc";

        //public constants for Lubricant Sale.
         public const string INSERT_NEW_LUBRICANT_SALE   = "InsertLubesale_Proc";
         public const string DELETE_EXIST_LUBRICANT_SALE = "DeleteLubesale_Proc";
         public const string UPDATE_EXIST_LUBRICANT_SALE = "UpdateLubesale_Proc";
         public const string GET_EXIST_LUBE_SALES = "GetAllLubeSales_Proc";

        //public constants for Daily cash Register.
         public const string GET_EXIST_DCR = "GetAllDailyCashRegisterEntries";
         public const string INSERT_NEW_DCR = "InsertAmountFromCashier_Proc";
         public const string DELETE_EXIST_DCR = "DeleteAmountFromCashier_Proc";
         public const string UPDATE_EXIST_DCR = "UpdateAmountFromCashier_Proc";

         //public constants for Employee.
         public const string GET_EXIST_EMPLOYEE = "SELECT * FROM EMPLOYEE";
         public const string INSERT_NEW_EMPLOYEE = "InsertEmployee_Proc";
         public const string DELETE_EXIST_EMPLOYEE = "DeleteAmountFromCashier_Proc";
         public const string UPDATE_EXIST_EMPLOYEE  = "UpdateAmountFromCashier_Proc";


        ////public constants for Daily Dip.
        // public const string INSERT_NEW_DCR = "InsertLubesale_Proc";
        // public const string DELETE_EXIST_DCR = "DeleteAmountFromCashier_Proc";
        // public const string UPDATE_EXIST_DCR = "UpdateAmountFromCashier_Proc";
    }
}
