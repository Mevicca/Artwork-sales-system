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
    public partial class ArtistProfile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int artistID = int.Parse(Request.QueryString["id"]);
                contactLink.NavigateUrl = "mailto:" + BindData(artistID);
            }
        }
        private String BindData(int artistID)
        {
            string artEmail = "";
            
            try
            {               
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "SELECT ArtFullName, ArtBio, ArtEmail FROM ARTIST WHERE ArtistID = @artistID;";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("artistID", artistID);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            artist.Text = reader.GetString(0);
                            artEmail = reader.GetString(2);
                            artistBio.Text = reader.GetString(1).Trim();
                            
                        }
                    }
                }
                return artEmail;
            }
            catch (Exception ex)
            {
                artistBio.Text = "The artist hasn't add bio.";
                return artEmail;
            }
        }

    }
}