using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Power_Store.Models
{
    public class Cart
    {

        public List<Item> itemSet { get; set; }
        public int totalPrice { get; set; }

        public Cart()
        {
            itemSet = new List<Item>();
            totalPrice = 0;
        }
        public void AddItem(Item item)
        {
            itemSet.Add(item);
            totalPrice += item.ItemPrice;
        }
    }
}