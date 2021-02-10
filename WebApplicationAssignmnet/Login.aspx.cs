using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

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
                using (SqlConnection conn = new SqlConnection(Constant.connectionStrings))
                {
                    conn.Open();
                    string query = "";
                    if (DropDownListIdentification.SelectedValue == "")
                    {
                        query = "SELECT COUNT(*), ISACTIVE FROM CUSTOMER WHERE CustEmail = @0 AND CustPassword =@1 GROUP BY ISACTIVE";
                    }
                    else
                    {
                        query = "SELECT COUNT(*), ISACTIVE  FROM ARTIST WHERE ArtEmail = @0 AND ArtPassword =@1 GROUP BY ISACTIVE";
                    }

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("1", txtPassword.Text.Trim());

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            if (reader.GetInt32(0) > 0 && !reader.GetBoolean(1))
                            {
                                throw new Exception("Inactive account.");
                            }

                        }
                    }
                    else
                    {
                        throw new Exception("Wrong Email / Password.");
                    }
                }

                Response.Redirect("Homepage.aspx", false);
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