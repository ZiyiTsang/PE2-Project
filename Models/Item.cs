using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Power_Store.Models
{
    public class Item
    {
        public int ItemID { get; set; }
        public string ItemName { get; set; }
        public int ItemPrice { get; set; }
        public string ItemDescription { get; set; }
        public string ItemImage { get; set; }

        public Item()
        {
            
        }
        public Item(int id, string name, int price, string description, string image)
        {
            ItemID = id;
            ItemName = name;
            ItemPrice = price;
            ItemDescription = description;
            ItemImage = image;
        }
       
    }
}