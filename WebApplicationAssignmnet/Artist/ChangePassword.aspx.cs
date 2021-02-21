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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = Session["LoginUser"] as User;
            if (user.ID > 10000)
                AccSet.NavigateUrl = "~/Customer/CustomerProfileSetting.aspx";
            else
                AccSet.NavigateUrl = "ArtistProfileSetting.aspx";
        }


        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                User user = Session["LoginUser"] as User;
                if (Equals(currentPassword.Text.Trim(), user.Password))
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        conn.Open();
                        string query = @"UPDATE CUSTOMER SET CustPassword = @0 WHERE CustID = @custID;";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("0", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("custID", user.ID);

                        cmd.ExecuteNonQuery();

                    }
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your password has successfully changed.');", true);
                    Response.Redirect("Homepage.aspx", false);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your password entered is wrong. Please try again');", true);
                    //Response.Redirect("ChangePassword.aspx", false);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}