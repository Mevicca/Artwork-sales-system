using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models.WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class OrderHistory : System.Web.UI.Page
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
                    string query = "SELECT s.SalesID, s.OrderTime, d.UpdateAt, s.FinalTotal, d.deliveryStatus FROM Sales s, Delivery d WHERE s.SalesID = d.SalesID AND CustID = @custID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("custID", user.ID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        orderHistory.DataSource = dt;
                        orderHistory.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void orderHistory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string status = DataBinder.Eval(e.Item.DataItem, "DeliveryStatus").ToString();
            LinkButton btnCancel = (LinkButton)e.Item.FindControl("btnCancel");
            if (String.Equals(status, "Unpack"))
            {
                btnCancel.Visible = true;
            }
            else
                btnCancel.Visible = false;
        }
        protected void btnCancel_Click(object sender, CommandEventArgs e)
        {
            string salesID = e.CommandArgument.ToString();
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "UPDATE Delivery SET DeliveryStatus = 'Cancelled' WHERE SalesID = @0";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", salesID);
                    cmd.ExecuteNonQuery();
                }
                Response.Redirect("~/Customer/OrderHistory.aspx");
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
                    string query = @"SELECT s.SalesID, s.OrderTime, d.UpdateAt, s.FinalTotal, d.deliveryStatus FROM Sales s, Delivery d WHERE s.SalesID = d.SalesID AND CustID = @custID ";
                    var sortValue = "";
                    query += tabValue;
                    if (ddlSortBy.SelectedValue == "Date")
                    {
                        sortValue = @"ORDER BY OrderTime";
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
                    cmd.Parameters.AddWithValue("custID", user.ID);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        orderHistory.DataSource = dt;
                        orderHistory.DataBind();
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