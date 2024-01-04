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
                
            }
           
        }

        private void LoadItemDetails()
        {
            
            ItemImg.ImageUrl = item.ItemImage;
            ItemName.Text = item.ItemName;
            ItemDescription.Text = item.ItemDescription;
            ItemPrice.Text = "RM" + item.ItemPrice.ToString();
        }
        protected void Btn_back(object sender, EventArgs e)
        {
           
            Response.Redirect("Market.aspx");
        }
        
    }


}

