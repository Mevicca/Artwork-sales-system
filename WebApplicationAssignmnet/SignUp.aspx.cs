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
    public partial class CustomerRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsignin_Click(object sender, EventArgs e)
        {
            try
            {
                char gender = 'N';
                if (DropDownListGender.SelectedValue == "Female")
                {
                    gender = 'F';
                }
                else if (DropDownListGender.SelectedValue == "Male")
                {
                    gender = 'M';
                }

                using (SqlConnection conn = new SqlConnection(Constant.connectionStrings))
                {
                    conn.Open();
                    string query = "";
                    if (DropDownListIdentification.SelectedValue == "")
                    {
                        query = "INSERT INTO CUSTOMER(CustPassword, CustFullName, CustEmail, CustGender, CreatedAt) VALUES (@0,@1,@2,@3,GETDATE())";
                    }
                    else
                    {
                        query = "INSERT INTO ARTIST(ArtPassword, ArtFullName, ArtEmail, ArtGender, CreatedAt) VALUES (@0,@1,@2,@3,GETDATE())";
                    }

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("1", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("2", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("3", gender);

                    cmd.ExecuteNonQuery();
                    
                }
                Response.Redirect("Homepage.aspx", false);
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("The duplicate key value is"))//because in db, it only have 1 unique attribute
                {
                    RegularExpressionValidatorEmail.IsValid = false;
                    RegularExpressionValidatorEmail.ErrorMessage = "Duplicate email.";
                }
                else
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtFullName.Text = "";
            txtPassword.Text = "";
            txtPassword2.Text = "";
            DropDownListGender.SelectedValue = "Prefer not to say";
        }
    }
}