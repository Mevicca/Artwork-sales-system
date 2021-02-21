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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        private void BindData()
        {
            try
            {
                double total = 0;
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT p.productID, p.ProductName, ar.ArtFullName, p.ProductPrice, p.path1 FROM [ADDTOCARTLIST] A 
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
                        for(var i = 0; i < dt.Rows.Count; i++)
                        {
                            total += Double.Parse(dt.Rows[i][3].ToString());
                        }

                        lblTotal.Text = total.ToString("C2");
                    }
                }
                if(rptProducts.Items.Count == 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Empty in cart.');", true);
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void Wish_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"INSERT INTO WISHLIST(PRODUCTID,CUSTID) VALUES (@productID, @userID);";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("productID", btn.CommandArgument);
                    cmd.Parameters.AddWithValue("userID", user.ID);

                    var result = cmd.ExecuteNonQuery();
                    var results = DeleteInList(Int32.Parse(btn.CommandArgument));

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Successfully to added in wish list.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to added in wish list.');", true);
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
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Delete in cart.');", true);
                    BindData();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to delete in cart.');", true);
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
                string query = @"DELETE FROM ADDTOCARTLIST WHERE PRODUCTID = @productID AND CUSTID = @userID;";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("productID", productID);
                cmd.Parameters.AddWithValue("userID", user.ID);

                return cmd.ExecuteNonQuery();
            }
        }
    }
}