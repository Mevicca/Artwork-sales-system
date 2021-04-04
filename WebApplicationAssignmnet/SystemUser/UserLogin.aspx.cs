using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet.SystemUser
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated && Session["User"] != null)
            {
                Response.Redirect("~/SystemUser/SalesReport.aspx");
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Clear();
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "SELECT * FROM USERS WHERE UsersID = @0 AND UserPassword =@1";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", UserName.Text.Trim());
                    cmd.Parameters.AddWithValue("1", Password.Text.Trim());
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (reader.HasRows && !reader.GetBoolean(7))
                            {
                                throw new Exception("Inactive account.");
                            }
                            User user = new User
                            {
                                ID = reader.GetInt32(0),
                                Password = reader.GetString(2),
                                FullName = reader.GetString(3),
                                Email = "",
                                Gender = reader.GetString(4)[0],
                                CreatedAt = reader.GetDateTime(6),
                                IsActive = reader.GetBoolean(7)
                            };

                            Session["LoginUser"] = user;
                            FormsAuthentication.RedirectFromLoginPage(user.ID.ToString(), RememberMe.Checked);
                            //encrypt in password
                            Response.Redirect("~/SystemUser/SalesReport.aspx");
                        }
                    }
                    else
                    {
                        throw new Exception("Wrong Email / Password.");
                    }
                }
            }
            catch (Exception ex)
            {
                FailureText.Text = ex.Message;
            }
        }
    }
}