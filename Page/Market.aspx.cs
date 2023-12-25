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

            //get query string
            string key_word = Request.QueryString["search"];
            if (key_word != null)
            {
                Product_list=repo.filter(key_word);
                if (Product_list.Count == 0)
                {
                    //redirect to error page
                    Response.Redirect("Nothing_filter.aspx");
                }
            }
            else
            {
                Product_list =repo.Product_list;
            }
           
            repeat_view_product.DataSource = Product_list.Values;
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
        
    }
}