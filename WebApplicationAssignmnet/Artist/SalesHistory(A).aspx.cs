using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models.WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class SalesHistory_A_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            try
            {
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "SELECT Sales.SalesID, Delivery.UpdateAt, Customer.CustFullName, Sales.FinalTotal, Delivery.DeliveryStatus FROM Sales, Delivery, SalesDetails, Products,Customer WHERE Sales.SalesID = Delivery.SalesID AND NOT Delivery.DeliveryStatus = 'Shipping' AND NOT Delivery.DeliveryStatus = 'Unpack' AND Sales.CustID = Customer.CustID AND Sales.SalesID = SalesDetails.SalesID AND SalesDetails.ProductID = Products.ProductID AND Products.ArtistID = @id GROUP BY Sales.SalesID, Delivery.UpdateAt, Customer.CustFullName, Sales.FinalTotal, Delivery.DeliveryStatus";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("id", user.ID);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        salesHistory.DataSource = dt;
                        salesHistory.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string tabValue = "";
                if (Request.Cookies["tab"] != null)
                {
                    tabValue = Request.Cookies["tab"].Value;
                }

                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT Sales.SalesID, Delivery.UpdateAt, Customer.CustFullName, Sales.FinalTotal, Delivery.DeliveryStatus FROM Sales, Delivery, SalesDetails, Products,Customer 
                WHERE Sales.SalesID = Delivery.SalesID AND NOT Delivery.DeliveryStatus = 'Shipping' AND NOT Delivery.DeliveryStatus = 'Unpack' AND Sales.CustID = Customer.CustID AND Sales.SalesID = SalesDetails.SalesID AND SalesDetails.ProductID = Products.ProductID AND Products.ArtistID = @id GROUP BY Sales.SalesID, Delivery.UpdateAt, Customer.CustFullName, Sales.FinalTotal, Delivery.DeliveryStatus ";
                    var sortValue = "";
                    query += tabValue;
                    if (ddlSortBy.SelectedValue == "Date")
                    {
                        sortValue = @"ORDER BY UpdateAt";
                    }
                    else if (ddlSortBy.SelectedValue == "Customer Name")
                    {
                        sortValue += @"ORDER BY CustFullName";
                    }
                    else if (ddlSortBy.SelectedValue == "Total Price")
                    {
                        sortValue += @"ORDER BY FinalTotal";
                    }
                    else
                    {
                        sortValue += @"ORDER BY SalesID";
                    }
                    query += sortValue;
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("id", user.ID);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        salesHistory.DataSource = dt;
                        salesHistory.DataBind();
                    }
                    HttpCookie sortCookies = new HttpCookie("sort");
                    sortCookies.Value = sortValue;
                    Response.Cookies.Add(sortCookies);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}