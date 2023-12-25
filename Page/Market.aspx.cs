using Power_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Power_Store
{
    public partial class Customer_Market : System.Web.UI.Page
    {
        private Dictionary<int, Item> Product_list { get; set; }
        Repo repo = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Repo"] == null) {
                Session["Repo"] = Repo.GetInstance();
            }
            repo = (Repo)Session["Repo"];

            repeat_view_product.DataSource = repo.Product_list.Values;
            repeat_view_product.DataBind();

            if (Session["Cart"] == null)
            {
                Session["Cart"] = new Cart();
            }
        }
        protected void Buy_click(object sender, EventArgs e)
        {
            Cart local_cart = (Cart)Session["Cart"];
            Button button = (Button)sender;
            int good_id = int.Parse(button.CommandArgument.ToString());
            Item good = repo.Product_list[good_id];
            local_cart.AddItem(good);
            Session["Cart"] = local_cart;
            string script = "alert('Add to cart successful');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);

        }
        protected void detail_click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int good_id = int.Parse(button.CommandArgument.ToString());
            string redirectUrl = "ItemDetail.aspx?good_id=" + good_id;
            Response.Redirect(redirectUrl);
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            /*
            // Load XML data
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("~/App_Data/Product.xml"));

            // Get all products from the repository
            XmlNodeList productNodes = xmlDoc.SelectNodes("//Product");

            // Perform the search based on the entered terms
            var filteredProducts = productNodes.Cast<XmlNode>()
                .Where(product =>
                    (chkCategories.Items.Cast<ListItem>().Any(category => product.SelectSingleNode("Name").InnerText.Contains(category.Value)))
                    && (string.IsNullOrEmpty(ddlOptions.SelectedValue) || product.SelectSingleNode("Option").InnerText == ddlOptions.SelectedValue)
                // Add other filters based on your XML structure
                )
                .ToList();

            // Bind the search results to your GridView or other controls
            repeat_view_product.DataSource = filteredProducts;
            repeat_view_product.DataBind();*/
        }
    }
}