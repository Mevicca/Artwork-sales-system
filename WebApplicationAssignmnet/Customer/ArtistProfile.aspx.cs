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
    public partial class ArtistProfile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int artistID = int.Parse(Request.QueryString["id"]);
                contactLink.NavigateUrl = "mailto:" + BindData(artistID);
            }
            if (Session["LoginUser"] != null)
            {
                User user = Session["LoginUser"] as User;
                if (user.Role == "Customer")
                {
                    Response.Redirect("~/Customer/CustomerHomepage.aspx");
                }
                else
                {
                    Response.Redirect("~/Artist/Homepage.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Anonymous/Login.aspx");
            }
        }

        private String BindData(int artistID)
        {
            string artEmail = "", artGender = "";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "SELECT ArtFullName, ArtBio, ArtEmail, ArtGender FROM ARTIST WHERE ArtistID = @artistID;";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("artistID", artistID);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            artist.Text = reader.GetString(0);
                            artistBio.Text = reader.GetString(1).Trim();
                            artEmail = reader.GetString(2);
                            artGender = reader.GetString(3).Trim();
                        }
                    }
                }

                if (String.Equals(artGender, "M"))
                {
                    artistPic.ImageUrl = "~/assets/ArtistProfile/ArtistMan.png";
                }
                else if (String.Equals(artGender, "F"))
                {
                    artistPic.ImageUrl = "~/assets/ArtistProfile/ArtistWomen.png";
                }
                else
                {
                    artistPic.ImageUrl = "~/assets/ArtistProfile/Artist.png";
                }
                if (String.Equals(artistBio.Text, "Empty"))
                    artistBio.Text = "The artist hasn't add bio.";
                return artEmail;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}