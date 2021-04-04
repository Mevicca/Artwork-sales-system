using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class AddProduct : System.Web.UI.Page
    {
        List<string> fileName;
        User user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginUser"] != null)

            {
                user = Session["LoginUser"] as User;
            }
        }

        //INSERT PRODUCT INTO DATABASE
        protected void addSaveProductbtn_Click(object sender, EventArgs e)
        {
            try
            {
                string newFileName = @"~\assets\product\";
                fileName = new List<string>();
                string filepath = Server.MapPath("\\assets\\product\\");
                if (categoryddl.SelectedValue.Contains("Sculpture"))
                { 
                    filepath += "sculpture\\";
                    newFileName += @"sculpture\";
                }
                if (categoryddl.SelectedValue.Contains("Oil"))
                {
                    filepath += "OilPaint\\";
                    newFileName += @"OilPaint\";
                }
                if (categoryddl.SelectedValue.Contains("Water"))
                {
                    filepath += "Watercolor\\";
                    newFileName += @"Watercolor\";
                }

                HttpFileCollection uploadedFiles = Request.Files;

                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];

                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {
                            userPostedFile.SaveAs(filepath + "\\" + Path.GetFileName(userPostedFile.FileName));
                            fileName.Add(newFileName + Path.GetFileName(userPostedFile.FileName));
                        }
                    }
                    catch (Exception Ex)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "PopupMsg", "failalert('Error','" + Ex.Message + "')", true);
                    }
                }

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                string sql = "insert into Products(ProductName, ProductDesc, CategoryID, ProductPrice, ReleasedDate, Quantity,artistID,  path1, path2, path3)VALUES(@0, @1, @2, @3, @4, @5, @6, @7, @8,@9)";

                SqlCommand cmd = new SqlCommand(sql, conn);
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
                cmd.Parameters.AddWithValue("4", DateTime.Now);
                cmd.Parameters.AddWithValue("5", Int32.Parse(quantity.Value));

                if (fileName.Count >= 1) cmd.Parameters.AddWithValue("6", user.ID);
                if (fileName.Count >= 1) cmd.Parameters.AddWithValue("7", fileName.ToArray()[0]);
                if (fileName.Count >= 2)
                {
                    cmd.Parameters.AddWithValue("8", fileName.ToArray()[1]);
                }
                else
                {
                    cmd.Parameters.AddWithValue("8", "");
                }
                if (fileName.Count >= 3)
                {
                    cmd.Parameters.AddWithValue("9", fileName.ToArray()[2]);
                }
                else
                {
                    cmd.Parameters.AddWithValue("9", "");
                }

                conn.Open();
                cmd.ExecuteNonQuery();

                Response.Redirect("ProductGallery.aspx", false);
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PopupMsg", "failalert('Error','Database connection got problem.')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PopupMsg", "failalert('Error','" + ex.Message + "')", true);
            }

        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductGallery.aspx", false);
        }
    }
}