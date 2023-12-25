using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Power_Store
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            /*
            // Get the search terms entered by the user
            string searchTerms = txtSearch.Text.Trim().ToLower(); // Convert to lowercase for case-insensitive search

            // Get all books from the repository
            var allProducts = xmlDoc.Load(Server.MapPath("~/App_Data/Product.xml"));

            // Perform the search based on the entered terms
            var searchResults = allProducts.Where(product =>
                product.Name.ToLower().Contains(searchTerms) ||
                product.Category.ToLower().Contains(searchTerms) ||
                product.Description.ToLower().Contains(searchTerms)
            // Add other properties you want to search by
            ).ToList();  // ToList() ensures immediate execution of the query

            // Bind the search results to your GridView or other controls
            repeat_view_product.DataSource = searchResults;
            repeat_view_product.DataBind();*/
        }
    }
}