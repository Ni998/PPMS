using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.Logiphix.PPMS.Model
{
    public class ProductsModel
    {
        private delegate void FetchAllProductsDelegate();
        private FetchAllProductsDelegate FetchAllProducts;



        public class myEvent : EventArgs
        {
            public List<int> intLST { get; set; }
        }

        public event EventHandler<myEvent> GetPayrollSummaryReportCompleted;

        

        public void SaveProduct()
        {

        }

        public void GetAllProducts()                            
        {
            FetchAllProducts = new FetchAllProductsDelegate(this.GetProducts);
            IAsyncResult result = FetchAllProducts.BeginInvoke(null, null);
            FetchAllProducts.EndInvoke(result);
        }

       private void GetProducts()
       {

       }
    }
}
