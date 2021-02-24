using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models.WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Clear();
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "";
                    if (DropDownListIdentification.SelectedValue == "Customer")
                    {
                        query = "SELECT * FROM CUSTOMER WHERE CustEmail = @0 AND CustPassword =@1";
                    }
                    else
                    {
                        query = "SELECT * FROM ARTIST WHERE ArtEmail = @0 AND ArtPassword =@1";
                    }

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("1", txtPassword.Text.Trim());
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (reader.HasRows && !reader.GetBoolean(6))
                            {
                                throw new Exception("Inactive account.");
                            }
                            User user = new User
                            {
                                ID = reader.GetInt32(0),
                                Password = reader.GetString(1),
                                FullName = reader.GetString(2),
                                Email = reader.GetString(3),
                                Gender = reader.GetString(4)[0],
                                CreatedAt = reader.GetDateTime(5),
                                IsActive = reader.GetBoolean(6)
                            };


                            Session["LoginUser"] = user;
                            FormsAuthentication.RedirectFromLoginPage(user.ID.ToString(), chkPersistCookie.Checked);
                            //encrypt in password
                            if (DropDownListIdentification.SelectedValue == "Customer")
                            {
                                Response.Redirect("~/Customer/CustomerHomepage.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/Artist/Homepage.aspx");
                            }
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
                CustomValidator.IsValid = false;
                CustomValidator.ErrorMessage = ex.Message;
            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtPassword.Text = "";
        }
    }
}