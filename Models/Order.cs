using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Power_Store.Models
{
    public class Order
    {
        private string path = HttpContext.Current.Server.MapPath("~/App_Data/Orders.xml");
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string address { get; set; }
        public string country { get; set; }
        public string time { get; set; }

        public string price { get; set; }

        public string email { get; set; }

        public Order(string first_name, string last_name, string address, string country, string time, string price,string email)
        {
            this.first_name = first_name;
            this.last_name = last_name;
            this.address = address;
            this.country = country;
            this.time = time;
            this.price = price;
            this.email = email;
        }
        public string AppendToXml()
        {
            try
            {
                
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(path);
                System.Xml.XmlElement root = doc.DocumentElement;
                System.Xml.XmlElement order = doc.CreateElement("Order");
                order.SetAttribute("first_name", this.first_name);
                order.SetAttribute("last_name", this.last_name);
                order.SetAttribute("address", this.address);
                order.SetAttribute("country", this.country);
                order.SetAttribute("time", this.time);
                order.SetAttribute("price", this.price);
                order.SetAttribute("email", this.email);

                root.AppendChild(order);
                doc.Save(path);
                return "OK";
            }
            catch(Exception e)
            {
                return e.Message;
            }
            
        }
    }
}