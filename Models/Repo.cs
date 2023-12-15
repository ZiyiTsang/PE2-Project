using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace Power_Store.Models
{
    public class Repo
    {
        //public List<Item> Product_list { get; set; }
        public Dictionary<int, Item> Product_list { get; set; }

        private static Repo instance;
        public static Repo GetInstance()
        {
            if (instance == null)
            {
                instance = new Repo();
            }
            return instance;
        }
        private void get_from_define()
        {
            Product_list.Clear();
            Product_list.Add(1,new Item(1, "Pillow", 70, "Pillow is a comfortable and high-quality pillow product that provides you with a good sleep experience and neck support, helping you achieve comfortable sleep and relaxed rest.", "~/Resource/Image/pillow.jpg"));
            Product_list.Add(2, new Item(2, "Iphone 13", 2000, "Newest Iphone", "~/Resource/Image/iphone.jpg"));
            Product_list.Add(3, new Item(3, "Pikachu", 40, "Pikachu stickers are carefully designed and produced, each sticker showcasing Pikachu's unique charm and cute image.", "~/Resource/Image/pikachu.jpg"));
            Product_list.Add(4, new Item(4, "Laptop", 3000, "A laptop is a portable personal computer device that can be used for office, learning, entertainment, and various other tasks", "~/Resource/Image/laptop.png"));
            Product_list.Add(5, new Item(5, "Mirror", 3000, "Mirrors help people observe their appearance, organize clothing, or apply makeup", "~/Resource/Image/Mirror.jpg"));
            Product_list.Add(6, new Item(6, "Full Marks potion", 39999, "You will receive full marks for your PE final exam results in after purchasing.", "~/Resource/Image/fullMark.jpg"));
        }
        private void get_from_xml(String xmlPath)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlPath);
            XmlNodeList productNodes = xmlDoc.SelectNodes("/Products/Product");
            foreach (XmlNode productNode in productNodes)
            {
                int id = int.Parse(productNode.SelectSingleNode("Id").InnerText);
                string name = productNode.SelectSingleNode("Name").InnerText;
                int price = int.Parse(productNode.SelectSingleNode("Price").InnerText);
                string description = productNode.SelectSingleNode("Description").InnerText;
                string image = productNode.SelectSingleNode("ImageURL").InnerText;
                Product_list.Add(id,new Item(id, name, price, description, image));
            }
        }
        
        public Repo()
        {
            //Product_list = new List<Item>();
            Product_list = new Dictionary<int, Item>();
            get_from_xml(HttpContext.Current.Server.MapPath("~/App_Data/Product.xml"));
        }
        
    }
}