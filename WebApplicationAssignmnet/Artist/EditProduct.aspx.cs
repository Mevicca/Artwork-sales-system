using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplicationAssignmnet
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select p.productID as productID,p.ProductName as productName, c.CategoryDesc as categoryDesc, p.ProductDesc as productDesc, p.ProductPrice as productPrice, 
                p.ReleasedDate as releasedDate, p.Quantity as quantity, p.path1 as imagePath1, p.path2 as imagePath2, p.path3 as imagePath3
                from Products p INNER JOIN Category c 
                ON (p.CategoryID = c.CategoryID AND p.productID = @prodID)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("prodID", Request.QueryString["id"].ToString());

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        if (reader.Read())
                        {
                            HiddenProduct.Value = reader.GetInt32(0).ToString();
                            productID.Text = reader.GetInt32(0).ToString();
                            prodName.Text = reader.GetString(1).ToString();
                            categoryddl.SelectedValue = reader.GetString(2);
                            prodDesc.Value = reader.GetString(3);
                            prodPrice.Value = reader.GetDecimal(4).ToString();
                            releasedDate.Text = reader.GetDateTime(5).ToString("yyyy-MM-dd");
                            quantity.Value = reader.GetInt32(6).ToString();

                            ImgPath1.ImageUrl = reader.GetString(7);
                            if (reader.GetString(8) != "")
                            {
                                ImgPath2.ImageUrl = reader.GetString(8);
                            }
                            else
                            {
                                ImgPath2.Visible = false;
                            }
                            if (reader.GetString(9) != "")
                            {
                                ImgPath3.ImageUrl = reader.GetString(9);
                            }
                            else
                            {
                                ImgPath3.Visible = false;
                            }
                        }

                    }
                }

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

        //UPDATE PRODUCT DETAILS IN DATABASE
        protected void addSaveProductbtn_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"UPDATE Products SET ProductName = @0, ProductDesc = @1, CategoryID = @2, 
                                 ProductPrice = @3, Quantity = @4, path1 = @5, path2 = @6, path3 = @7
                                 WHERE ProductID = @prodID;";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", prodName.Text.Trim());
                    cmd.Parameters.AddWithValue("1", prodDesc.Value.Trim());
                    if (categoryddl.SelectedValue == "Sculpture - Animals")
                    {
                        cmd.Parameters.AddWithValue("2", "S1001");
                    }
                    else if (categoryddl.SelectedValue == "Sculpture - Bronzo")
                    {
                        cmd.Parameters.AddWithValue("2", "S1002");
                    }
                    else if (categoryddl.SelectedValue == "Sculpture - Wood")
                    {
                        cmd.Parameters.AddWithValue("2", "S1003");
                    }
                    else if (categoryddl.SelectedValue == "Oil paint")
                    {
                        cmd.Parameters.AddWithValue("2", "S1004");
                    }
                    else if (categoryddl.SelectedValue == "Watercolor paint")
                    {
                        cmd.Parameters.AddWithValue("2", "S1005");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("2", "S1006");
                    }
                    cmd.Parameters.AddWithValue("3", Decimal.Parse(prodPrice.Value));
                    cmd.Parameters.AddWithValue("4", Int32.Parse(quantity.Value));
                    cmd.Parameters.AddWithValue("5", ImgPath1.ImageUrl);
                    cmd.Parameters.AddWithValue("6", ImgPath2.ImageUrl);
                    cmd.Parameters.AddWithValue("7", ImgPath3.ImageUrl);
                    cmd.Parameters.AddWithValue("prodID", Int32.Parse(HiddenProduct.Value));

                    var result = cmd.ExecuteNonQuery();
                }
                Response.Redirect("ProductGallery.aspx", false);
            }
            catch (Exception x)
            {
                throw x;
            }
        }

        protected void resetCancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductGallery.aspx", false);
        }

        //DELETE PRODUCT ROW FROM DATABASE
        protected void dltProduct_Click(object sender, CommandEventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"DELETE FROM Products WHERE ProductID = @0";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("0", Int32.Parse(HiddenProduct.Value));
                    cmd.ExecuteNonQuery();
                }
                Response.Redirect("ProductGallery.aspx", false);
            }
            catch (Exception x)
            {
                MessageBox.Show(x.Message);
            }
        }
    }
}