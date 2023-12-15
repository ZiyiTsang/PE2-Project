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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new Cart();
            }
            Product_list = new Dictionary<int, Item>();
            Product_list.Add(1, new Item(1, "Pillow", 70, "Pillow is a comfortable and high-quality pillow product that provides you with a good sleep experience and neck support, helping you achieve comfortable sleep and relaxed rest.", "~/Resource/Image/pillow.jpg"));
            Product_list.Add(2, new Item(2, "Iphone 13", 2000, "Newest Iphone", "~/Resource/Image/iphone.jpg"));
            Product_list.Add(3, new Item(3, "Pikachu", 40, "Pikachu stickers are carefully designed and produced, each sticker showcasing Pikachu's unique charm and cute image.", "~/Resource/Image/pikachu.jpg"));
            Product_list.Add(4, new Item(4, "Laptop", 3000, "A laptop is a portable personal computer device that can be used for office, learning, entertainment, and various other tasks", "~/Resource/Image/laptop.png"));
            Product_list.Add(5, new Item(5, "Mirror", 3000, "Mirrors help people observe their appearance, organize clothing, or apply makeup", "~/Resource/Image/Mirror.jpg"));
            Product_list.Add(6, new Item(6, "Full Marks potion", 39999, "You will receive full marks for your PE final exam results in after purchasing.", "~/Resource/Image/fullMark.jpg"));

            repeat_view_product.DataSource = Product_list.Values;
            repeat_view_product.DataBind();
        }
        protected void Buy_click(object sender, EventArgs e)
        {
            Cart local_cart = (Cart)Session["Cart"];
            Button button = (Button)sender;
            int good_id = int.Parse(button.CommandArgument.ToString());
            Item good = Product_list[good_id];
            local_cart.AddItem(good);
            Session["Cart"] = local_cart;
            string script = "alert('Add to cart successful');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);

        }
    }
}