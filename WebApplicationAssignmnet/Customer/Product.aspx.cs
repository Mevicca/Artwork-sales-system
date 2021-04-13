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
    public partial class ProductPage : System.Web.UI.Page
    {
        private static int id = 100001;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetProductID();
            GetProductDetails(id);
            GetImages(id);
            CheckDuplicateWish();
            CheckDuplicatePro();
        }

        private void GetProductID()
        {
            id = Int32.Parse(Request.QueryString["id"].ToString());
        }

        private int GetUserID()
        {
            User user = Session["LoginUser"] as User;
            return user.ID;
        }

        private void GetProductDetails(int id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select p.*, a.ArtistID, a.ArtFullName, a.CreatedAt from products p inner join Artist a on (a.ArtistID = p.ArtistID) where ProductID=@productID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("productID", id);

                    var reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            LblProductName.Text = reader.GetString(1);
                            LblDesc.Text = reader.GetString(2);
                            LblPrice.Text = reader.GetDecimal(5).ToString("C2");
                            ImgPath1.ImageUrl = reader.GetString(8);
                            ImgPath2.ImageUrl = reader.GetString(9) ?? "";
                            ImgPath3.ImageUrl = reader.GetString(10) ?? "";
                            LinkArtistName.NavigateUrl = "ArtistProfile.aspx?id=" + reader.GetInt32(12).ToString();
                            LinkArtistName.Text = "By " + reader.GetString(13);
                            LblDate.Text = reader.GetDateTime(14).ToString("dd-MM-yyyy");
                        }
                    }

                    if (ImgPath2.ImageUrl == "") ImgPath2.Visible = false;
                    if (ImgPath3.ImageUrl == "") ImgPath3.Visible = false;

                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

        private void GetImages(int id)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT * FROM [Products] WHERE(([Quantity] > 0) AND([ProductID] = @ProductID))";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("productID", id);

                    var reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            ImgSlides1.ImageUrl = reader.GetString(8);
                            ImgSlides2.ImageUrl = reader.GetString(9) ?? "";
                            ImgSlides3.ImageUrl = reader.GetString(10) ?? "";
                        }
                    }

                    if (ImgSlides2.ImageUrl == "") ImgSlides2.Visible = false;
                    if (ImgSlides3.ImageUrl == "") ImgSlides3.Visible = false;

                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

        protected void WishBtn_Click(object sender, EventArgs e)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"INSERT INTO WISHLIST(PRODUCTID,CUSTID) VALUES (@productID, @userID);";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("productID", id);
                    cmd.Parameters.AddWithValue("userID", GetUserID());

                    var result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Added in wish list.');", true);

                        CheckDuplicateWish();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to added in wish list.');", true);
                    }
                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

        public void CheckDuplicateWish()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                string query = @"SELECT COUNT(PRODUCTID) FROM WISHLIST WHERE PRODUCTID=@productID;";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("productID", id);
                int returnValue = (int)cmd.ExecuteScalar();
                conn.Close();

                if (returnValue > 0)
                {
                    WishBtn.Text = ("Already in Wish List !");
                    WishBtn.Enabled = false;
                }
                else
                {
                    WishBtn.Text = ("Add in Wish List !");
                    WishBtn.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void CartBtn_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {

                    conn.Open();
                    string query = @"INSERT INTO ADDTOCARTLIST(PRODUCTID,CUSTID,QUANTITY) VALUES (@productID, @userID, 1);";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("productID", id);
                    cmd.Parameters.AddWithValue("userID", GetUserID());

                    var result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Added in cart.');", true);
                        CheckDuplicatePro();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to added in cart.');", true);
                    }
                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

        public void CheckDuplicatePro()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                string query = @"SELECT COUNT(PRODUCTID) FROM ADDTOCARTLIST WHERE PRODUCTID=@productID;";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("productID", id);
                int returnValue = (int)cmd.ExecuteScalar();
                conn.Close();

                if (returnValue > 0)
                {
                    CartBtn.Text = ("Already in Cart !");
                    CartBtn.Enabled = false;
                }
                else
                {
                    CartBtn.Text = ("Add in Cart !");
                    CartBtn.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected override void OnPreInit(EventArgs e)
        {
            if (Request.UserAgent != null && (Request.UserAgent.IndexOf("AppleWebKit") > 0))  // added for compatibility issues with chrome 
            {
                this.ClientTarget = "uplevel";
            }

            base.OnPreInit(e);
        }
    }
}
