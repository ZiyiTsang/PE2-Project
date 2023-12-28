using Power_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Power_Store.Page
{
    public partial class ItemDetail : System.Web.UI.Page
    {
        Repo repo = null;
        public Item item = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Repo"] == null)
            {
                Session["Repo"] = Repo.GetInstance();
            }
            repo = (Repo)Session["Repo"];
            int good_id = int.Parse(Request.QueryString["good_id"]);
            // item 是当前访问商品的实例
            item = repo.Product_list[good_id];
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
    }
    

}
