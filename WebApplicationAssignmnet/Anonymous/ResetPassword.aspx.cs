using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssignmnet
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorMsg.Text = "";
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            if (CheckExistEmail())
            {
                Hidden.Value = new Email().SendResetEmail(txtEmail.Text);
                BtnCheck.Visible = txtPin.Visible = true;
            }
            else
            {
                ErrorMsg.Text = "The email is not exist in our database.";
            }
        }

        protected void BtnCheck_Click(object sender, EventArgs e)
        {
            if (Hidden.Value == txtPin.Text)
            {
                txtPin.Visible = false;
                BtnChange.Visible = txtChange.Visible = true;
                RegExp1.Enabled = RequiredFieldValidatorPassword.Enabled = true;
                BtnSend.Visible = BtnCheck.Visible = false;
            }
            else
            {
                ErrorMsg.Text = "Invalid pin.";
            }
        }

        protected void BtnChange_Click(object sender, EventArgs e)
        {
            //modify in database
            if (ModifyPassword())
            {
                Response.Redirect("Login.aspx");
            }
        }

        private bool CheckExistEmail()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                string query = "";
                if (DropDownListIdentification.SelectedValue == "Customer")
                {
                    query = "SELECT * FROM CUSTOMER WHERE CustEmail = @0";
                }
                else
                {
                    query = "SELECT * FROM ARTIST WHERE ArtEmail = @0";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("0", txtEmail.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        if (reader.HasRows && !reader.GetBoolean(6))
                        {
                            throw new Exception("Inactive account.");
                        }
                        return true;
                    }
                }
            }
            return false;
        }

        private bool ModifyPassword()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                string query = "";
                if (DropDownListIdentification.SelectedValue == "Customer")
                {
                    query = "UPDATE CUSTOMER SET CUSTPASSWORD = @0 WHERE CUSTEMAIL = @1";
                }
                else
                {
                    query = "UPDATE ARTIST SET ARTPASSWORD = @0 WHERE ARTEMAIL = @1";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("0", txtChange.Text.Trim());
                cmd.Parameters.AddWithValue("1", txtEmail.Text.Trim());
                var reader = cmd.ExecuteNonQuery();
                if (reader > 0) return true;
                return false;
            }
        }
    }
}