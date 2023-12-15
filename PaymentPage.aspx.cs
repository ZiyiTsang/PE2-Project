using Power_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Power_Store
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cart local_cart = (Cart)Session["Cart"];
            if (local_cart == null)
            {
                Response.Redirect("NothingBuy.aspx");
                return;
            }
            else
            {
                if (local_cart.totalPrice == 0)
                {
                    Response.Redirect("NothingBuy.aspx");
                    return;
                }
                else
                {
                    paymentRepeater.DataSource = local_cart.itemSet;
                    paymentRepeater.DataBind();
                    TotalPrice.Text = local_cart.totalPrice.ToString();
                }
            }
            ItemCount.Text = local_cart.itemSet.Count.ToString();
        }
        protected void Submit_click(object sender, EventArgs e)
        {
            string script = $"alert('Pay Successful ! Thank you! ') ";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
        }

    }
}