using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Power_Store.Models;

namespace Power_Store.Page
{
    public partial class LoginPage : System.Web.UI.Page
    {
        string state = "login";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.Params["state"] != null)
            {
                state= Request.Params["state"];
            }
            if (Session["role"] != null)
            {
               
                state = "logout";
                
                
            }
            if (!IsPostBack)
            {
                if (Request.UrlReferrer != null)
                {
                    
                    if (Session["need_role"]=="admin")
                    {
                        if (Session["user_name"] == null)
                        {
                            lblError.Text = "Please login in as Admin";
                            state = "login";
                        }
                        else
                        {
                            lblError.Text = "Please logout customer account first, then login in as Admin";
                            state = "logout";
                        }
                        Session["need_role"]=null;
                        

                    }
                    else
                    {
                        if (state == "login") {
                        lblError.Text = "Please login as Customer";
                        }
                    }
                    lblError.ForeColor = System.Drawing.Color.Yellow;

                }
            }
            if(state=="login")
            {
                lblUserType.Text="User Type";
                psdAgain.Visible = false;
                ddlUserType.Visible = true;
                btnSubmit.Text= "Login";
                login_link.Visible = false;
                register_link.Visible = true;
            }
            else if(state=="logout")
            {
                label_password.Visible = false;
                txtPassword.Visible = false;
                lblUserType.Visible = true;
                psdAgain.Visible = false;
                role_display.Visible = true;
                role_display.Text = String.Format("{0}",Session["role"]);
                btnSubmit.Text = "Logout";
                ddlUserType.Visible = false;
                register_link.Visible = false;
                login_link.Visible = false;
                txtUsername_label.Visible=true;
                txtUsername_label.Text = String.Format("{0}", Session["user_name"]);
                txtUsername.Visible = false;

            }
            else
            {
                lblUserType.Text = "Confirm Password";
                psdAgain.Visible = true;
                ddlUserType.Visible = false;
                btnSubmit.Text = "Register";
                login_link.Visible = true;
                register_link.Visible = false;
                role_display.Visible = false;
            }
            

        }
        
        private void login()
        {
            string xmlPath = Server.MapPath("~/App_Data/UserInfo.xml");
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(xmlPath);

            // Get user input values
            string enteredUsername = txtUsername.Text.ToLower(); // Convert to lowercase for case-insensitive comparison
            string enteredPassword = txtPassword.Text;
            string selectedUserType = ddlUserType.SelectedValue;

            // Check credentials in XML
            XmlNodeList users = xmlDoc.SelectNodes("//user");
            foreach (XmlNode userNode in users)
            {
                string uid = userNode.SelectSingleNode("uid").InnerText.ToLower();
                string alt = userNode.SelectSingleNode("alt").InnerText.ToLower();
                string psw = userNode.SelectSingleNode("psw").InnerText;
                string userType = userNode.SelectSingleNode("type").InnerText;

                // Check if entered username matches uid or alt, and password matches psw
                if ((enteredUsername == uid || enteredUsername == alt) && enteredPassword == psw)
                {
                    // Check if user type matches
                    if (selectedUserType.ToLower() == userType.ToLower())
                    {
                        string url = null;
                        // Redirect based on user type
                        if (userType.ToLower() == "admin")
                        {
                            Session["role"] = "admin";
                            url = "Admin_Orders.aspx";

                        }
                        else if (userType.ToLower() == "customer")
                        {
                            Session["role"] = "user";
                            url = "Market.aspx";
                        }
                        Session["user_name"] = alt;
                        Response.Redirect(url);

                    }
                }
            }

            // If no match is found, show an alert
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Invalid login information, please try again!');", true);
        }
        private void logout()
        {
            Session["role"] = null;
            Session["need_role"] = null;
            Session["user_name"] = null;
            Response.Redirect("Market.aspx");
        }
        private void register()
        {
            string name= txtUsername.Text;
            string pwd= txtPassword.Text;
            string pwdAgain = psdAgain.Text;
            User user = new User(name, pwd);
            if(pwd!=pwdAgain)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Password not match!');", true);
                return;
            }
            string message=user.AppendToXml();
            if(message=="OK")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Register successfully!');", true);
            }
            else
            {
                string error = "Register failed! Error message: " + message;
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", $"alert('{error}');", true);
            }
            
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(state=="login")
            {
                login();
            }
            else if(state=="logout")
            {
                logout();
                
            }
            else
            {
                register();
            }
        }
    }
}