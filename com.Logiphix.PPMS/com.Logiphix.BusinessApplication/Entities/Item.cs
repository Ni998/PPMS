using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using com.Logiphix.BusinessApplication.Common;

namespace com.Logiphix.BusinessApplication.Entities
{
    public class Item : Notifier
    {
        public String ItemId
        { get; set; }
        public String ItemName
        { get; set; }
        public String ItemDesc
        { get; set; }
        public String ItemPackId
        { get; set; }
        public String ItemPackQty
        { get; set; }
        public String ItemPrice
        { get; set; }
        public DateTime RecordStanp
        { get; set; }
        public Item()
        {

        }
        public Item(String _itemId, String _itemName, String _itemDesc, String _itemPackId, String _itemPackQty, String _itemPrice)
        {
            ItemId = _itemId;
            ItemName = _itemName;
            ItemPackId = _itemPackId;
            ItemPackQty = _itemPackQty;
            ItemDesc = _itemDesc;
            ItemPrice = _itemPrice;
        }


    }
}
