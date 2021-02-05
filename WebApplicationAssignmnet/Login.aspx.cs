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
                        query = "SELECT COUNT(*) FROM CUSTOMER WHERE CustEmail = @0 AND CustPassword =@1";
                    }
                    else
                    {
                        query = "SELECT COUNT(*) FROM ARTIST WHERE ArtEmail = @0 AND ArtPassword =@1";
                    }

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("1", txtPassword.Text.Trim());

                    var result = (Int32)cmd.ExecuteScalar();
                    if (result < 1)
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