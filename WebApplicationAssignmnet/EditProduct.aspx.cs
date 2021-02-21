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
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //productID.Text = Request.QueryString["id"].ToString();
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
                    productID.Text = reader.GetInt32(0).ToString();
                    prodName.Text = reader.GetString(1).ToString();
                    categoryddl.SelectedValue = reader.GetString(2);
                    prodDesc.Value = reader.GetString(3);
                    prodPrice.Value = reader.GetDecimal(4).ToString();
                        releasedDate.Text= reader.GetDateTime(5).ToString("yyyy-MM-dd");
                        quantity.Value = reader.GetInt32(6).ToString();

                        //List<string> list = new List<string>();
                        //list.Add(reader.GetString(7));
                        //list.Add(reader.GetString(8));
                        //list.Add(reader.GetString(9));

                        //foreach (String img in list)
                        //{

                        //}
                        ImgPath1.ImageUrl= reader.GetString(7);
                        if (reader.GetString(8) != "")
                        {
                            ImgPath2.ImageUrl = reader.GetString(8);
                        }
                        else {
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