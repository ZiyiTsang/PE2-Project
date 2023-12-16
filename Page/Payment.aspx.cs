using Power_Store.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Power_Store.Page
{
    public partial class Payment : System.Web.UI.Page
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
            Session["Cart"] = null;
            
            Order order = get_order_detail();

            string script = null;
            string write_return = order.AppendToXml();
            if (write_return.Equals("OK"))
            {
                script = "alert('Pay Successful! Thank you!');";
                
                //Response.Redirect("Market.aspx");
            }
            else
            {
                script= "alert('" + write_return + "');";
                
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);




        }
        protected Order get_order_detail()
        {
            string firstname = firstName.Text;
            string lastname = lastName.Text;
            string address = address1.Text;
            string country = country1.Text;
            string time= DateTime.Now.ToString();
            string price = TotalPrice.Text;
            string email = emailFirst.Text + "@" + emailServer.Text;
            return new Order(firstname, lastname, address, country, time, price,email);
        }
        

    }
}