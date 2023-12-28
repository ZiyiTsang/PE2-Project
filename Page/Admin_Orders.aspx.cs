using Power_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Power_Store.Page
{
    public partial class Admin_Orders : System.Web.UI.Page
    {
        private string path = HttpContext.Current.Server.MapPath("~/App_Data/Orders.xml");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Session["need_role"]="admin";
                Response.Redirect("LoginPage.aspx");
            }
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
           
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int id = int.Parse( row.Cells[0].Text);
            delete_order_id(id);
            Response.Redirect(Request.RawUrl);


        }
        protected void delete_order_id(int id_to_delete)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(path);
            XmlNodeList orderNodes = xmlDoc.SelectNodes("/Orders/Order");
            foreach (XmlNode orderNode in orderNodes)
            {
                int id = int.Parse(orderNode.Attributes["id"].Value);
                if (id == id_to_delete)
                {
                    orderNode.ParentNode.RemoveChild(orderNode);
                    xmlDoc.Save(path);
                    break;
                }
            }
        }
        



    }
}