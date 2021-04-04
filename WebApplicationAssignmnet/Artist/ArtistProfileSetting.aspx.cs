using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class ArtistProfileSetting : System.Web.UI.Page
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
                string bio;
                LblFullName.Text = user.FullName;
                switch (user.Gender)
                {
                    case 'F':
                        ArtGenderLabel.Text = "Female";
                        break;
                    case 'M':
                        ArtGenderLabel.Text = "Male";
                        break;
                    default:
                        ArtGenderLabel.Text = "Prefer not to say";
                        break;
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "SELECT ArtBio FROM Artist WHERE ArtistID = @artistID;";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("artistID", user.ID);
                    bio = cmd.ExecuteScalar().ToString().Trim();

                }

                if (Equals(bio, "Empty"))
                {
                    ArtBioLbl.Text = "You haven't add your bio.";
                }
                else
                {
                    ArtBioLbl.Text = bio;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
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
                    string query = @"UPDATE ARTIST SET ArtFullName = @0, ArtGender = @1, ArtBio = @2 WHERE ArtistID = @artistID;";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("1", gender);
                    cmd.Parameters.AddWithValue("2", TextBio.Text.Trim());
                    cmd.Parameters.AddWithValue("artistID", user.ID);

                    cmd.ExecuteNonQuery();

                }

                Response.Redirect("Homepage.aspx", false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}