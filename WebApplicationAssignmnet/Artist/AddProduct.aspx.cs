using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssignmnet
{
    public partial class AddProduct : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //INSERT PRODUCT INTO DATABASE
        protected void addSaveProductbtn_Click(object sender, EventArgs e)
        {
            string sql = "insert into Products(ProductName, ProductDesc, CategoryID, ProductPrice, ReleasedDate, Quantity, path1, path2, path3)VALUES(@0, @1, @2, @3, @4, @5, @6, @7, @8)";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
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

            //step 1
            //store path follow the productname
            //example : bear, ~\assets\product\sculpture\bear.png
            //string no;
            //string path 1 = "~\assets\product\sculpture\" + prodName.Text.Trim() + ".png";
            //validate database whether same path (if yes, no++)
            //here
            if (FileImageUpload.PostedFile != null)
            {
                string imgfile = Path.GetFileName(FileImageUpload.PostedFile.FileName);
                FileImageUpload.SaveAs("~/assets/product/scupture/" + imgfile);
                string path_1 = "~/assets/product/scupture/" + prodName.Text.Trim() + ".png";
                cmd.Parameters.AddWithValue("path1", path_1);
            }

            //step 2
            //path 1 image(ui) store into the path1(generated justnow)
            // last step

            //cmd.Parameters.AddWithValue("@path1", );
            //cmd.Parameters.AddWithValue("@path2", );
            //cmd.Parameters.AddWithValue("@path3", );

            conn.Open();
            cmd.ExecuteNonQuery();

            Response.Redirect("ProductGallery.aspx", false);

        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductGallery.aspx", false);
        }
    }
}