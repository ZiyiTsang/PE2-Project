﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Power_Store.MasterPage
{
    public partial class Admin : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                user_name.Text = Session["user_name"].ToString();
            }
        }

    }
}