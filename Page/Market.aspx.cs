using Power_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}