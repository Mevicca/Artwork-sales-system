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
    public partial class WishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            try
            {
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT p.productID, p.ProductName, ar.ArtFullName, p.ProductPrice, p.path1 FROM [WishList] A 
INNER JOIN PRODUCTS P ON (P.ProductID = A.ProductID)
INNER JOIN Artist AR ON (AR.ArtistID = P.ArtistID)
WHERE A.CustID = @CustID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("CustID", user.ID);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptProducts.DataSource = dt;
                        rptProducts.DataBind();
                    }
                }
                if(rptProducts.Items.Count == 0)
                {
                    LblNone.Visible = true;
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Empty in wish list.');", true);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Cart_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"INSERT INTO ADDTOCARTLIST(PRODUCTID,CUSTID,QUANTITY) VALUES (@productID, @userID, 1);";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("productID", btn.CommandArgument);
                    cmd.Parameters.AddWithValue("userID", user.ID);

                    var result = cmd.ExecuteNonQuery();
                    var results = DeleteInList(Int32.Parse(btn.CommandArgument));

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Successfully to added in cart.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to added in cart.');", true);
                    }
                    BindData();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                var result = DeleteInList(Int32.Parse(btn.CommandArgument));
                if (result > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Delete in wishlist.');", true);
                    BindData();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to delete in wishlist.');", true);
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private int DeleteInList(int productID)
        {
            User user = Session["LoginUser"] as User;
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                string query = @"DELETE FROM WISHLIST WHERE PRODUCTID = @productID AND CUSTID = @userID;";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("productID", productID);
                cmd.Parameters.AddWithValue("userID", user.ID);

                return cmd.ExecuteNonQuery();
            }
        }

        protected void Product_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            HiddenField productID = btn.FindControl("hiddenProduct") as HiddenField;
            Response.Redirect("Product.aspx?id="+ productID.Value);
        }
    }
}