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

            if (Request.QueryString["good_id"] != null && int.TryParse(Request.QueryString["good_id"], out int good_id))
            {
                if (repo.Product_list.ContainsKey(good_id))
                {
                    item = repo.Product_list[good_id];
                    LoadItemDetails();
                }
                else
                {
                    // Handle the case where the product with the given ID is not found
                }
            }
            else
            {
                // Handle the case where the "good_id" parameter is not present or not a valid integer
            }
        }

        private void LoadItemDetails()
        {
            
            ItemImg.ImageUrl = item.ItemImage;
            ItemName.Text = item.ItemName;
            ItemDescription.Text = item.ItemDescription;
            ItemPrice.Text = "RM" + item.ItemPrice.ToString();
        }
        protected void Buy_click(object sender, EventArgs e)
        {
            Cart local_cart = (Cart)Session["Cart"];
            Button button = (Button)sender;

            if (int.TryParse(button.CommandArgument.ToString(), out int good_id))
            {
                
                if (repo.Product_list.ContainsKey(good_id))
                {
                    Item good = repo.Product_list[good_id];
                    local_cart.AddItem(good);
                    Session["Cart"] = local_cart;
                    string script = "alert('Add to cart successful');";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
                }
                else
                {
                    // Handle the case where the product with the given ID is not found
                }
            }
            else
            {
                
                string script = "alert('Invalid item ID');";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
            }
        }
    }


}
