using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml;

namespace Power_Store.Models
{

    public class User
    {
        private string path = HttpContext.Current.Server.MapPath("~/App_Data/UserInfo.xml");
        public string name { get; set; }
        public string pwd { get; set; }
        public User(string name, string pwd)
        {
            this.name = name;
            this.pwd = pwd;
        }
        public string AppendToXml()
        {
            try
            {

                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.Load(path);
                System.Xml.XmlElement root = doc.DocumentElement;
                System.Xml.XmlElement userNode = doc.CreateElement("user");

                XmlNode uidNode = doc.CreateElement("uid");
                uidNode.InnerText = "123456";
                userNode.AppendChild(uidNode);

                XmlNode altNode = doc.CreateElement("alt");
                altNode.InnerText = this.name;
                userNode.AppendChild(altNode);

                XmlNode pswNode = doc.CreateElement("psw");
                pswNode.InnerText = this.pwd;
                userNode.AppendChild(pswNode);

                XmlNode typeNode = doc.CreateElement("type");
                typeNode.InnerText = "Customer";
                userNode.AppendChild(typeNode);


                root.AppendChild(userNode);
                doc.Save(path);
                return "OK";
            }
            catch (Exception e)
            {
                return e.Message;
            }

        }

    }
}