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
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            try
            {
                User user = Session["LoginUser"] as User;

                char gender = 'N';
                if (DropDownListGender.SelectedValue == "Female")
                {
                    gender = 'F';
                }
                else if (DropDownListGender.SelectedValue == "Male")
                {
                    gender = 'M';
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"UPDATE CUSTOMER SET CustFullName = @0, CustGender = @1 WHERE CustID = @custID;";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("1", gender);
                    cmd.Parameters.AddWithValue("custID", user.ID);

                    cmd.ExecuteNonQuery();

                }

                Response.Redirect("Homepage.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindData()
        {
            try
            {
                User user = Session["LoginUser"] as User;
                LblFullName.Text = user.FullName;
                switch (user.Gender)
                {
                    case 'F':
                        CustGenderLabel.Text = "Female";
                        break;
                    case 'M':
                        CustGenderLabel.Text = "Male";
                        break;
                    default:
                        CustGenderLabel.Text = "Prefer not to say";
                        break;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}