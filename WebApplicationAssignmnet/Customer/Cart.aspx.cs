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
    public partial class Cart : System.Web.UI.Page
    {
        private static Dictionary<string, int> productsList = new Dictionary<string, int>();
        private static Dictionary<string, double> priceList = new Dictionary<string, double>();
        private static Dictionary<string, int> cartList = new Dictionary<string, int>();
        private static User user;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData(String criteria = "")
        {
            try
            {
                productsList.Clear();
                priceList.Clear();
                cartList.Clear();
                user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT a.quantity, p.productID, p.ProductName, ar.ArtFullName, p.ProductPrice, p.path1, p.quantity,
CASE WHEN a.quantity = p.quantity THEN 0 ELSE 1 END AS productMax
FROM [ADDTOCARTLIST] A 
INNER JOIN PRODUCTS P ON (P.ProductID = A.ProductID)
INNER JOIN Artist AR ON (AR.ArtistID = P.ArtistID)
WHERE A.CustID = @CustID ";

                    if (criteria != "")
                    {
                        query += "ORDER BY " + criteria;
                    }

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("CustID", user.ID);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        RptProducts.DataSource = dt;
                        RptProducts.DataBind();
                        for (var i = 0; i < dt.Rows.Count; i++)
                        {
                            productsList.Add(dt.Rows[i][1].ToString(), Int32.Parse(dt.Rows[i][6].ToString()));
                            priceList.Add(dt.Rows[i][1].ToString(), Double.Parse(dt.Rows[i][4].ToString()));
                            cartList.Add(dt.Rows[i][1].ToString(), Int32.Parse(dt.Rows[i][0].ToString()));
                        }
                        CalculateTotal();
                    }
                }

                if (RptProducts.Items.Count == 0)
                {
                    LblNone.Visible = true;
                    LblCheckout.Enabled = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Warning','Empty in cart.');", true);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void CalculateTotal()
        {
            double total = 0;
            foreach (var cart in cartList)
            {
                var price = priceList.Where((a, b) => a.Key == cart.Key).FirstOrDefault().Value;
                total += (price * cart.Value);
            }

            lblTotal.Text = total.ToString("C2");
        }

        protected void Wish_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                User user = Session["LoginUser"] as User;
                if (checkDuplicate(btn.CommandArgument) == 0)
                {
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
                            cartList.Remove(btn.CommandArgument);
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Successfully to added in wish list.');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to added in wish list.');", true);
                        }
                        BindData();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','The item already inside the wishlist.');", true);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public int checkDuplicate(String id)
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

                return returnValue;
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
                    cartList.Remove(btn.CommandArgument);
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

        protected void DropDownListSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData(DropDownListSort.SelectedValue);
        }

        protected void LblCheckout_Click(object sender, EventArgs e)
        {
            if (cartList.Count > 0)
            {
                Session["CartList"] = cartList;
                Response.Redirect("Shipping.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Empty in cart.');", true);
            }
        }

        protected void NoProduct_Click(object sender, CommandEventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                RepeaterItem item = (RepeaterItem)btn.NamingContainer;
                TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");
                int currentQuantity = Int32.Parse(txtQuantity.Text);
                Button delbtn = (Button)item.FindControl("MinusProduct");
                Button addbtn = (Button)item.FindControl("PlusProduct");
                delbtn.Enabled = true;
                addbtn.Enabled = true;
                var result = productsList.Where(a => a.Key == e.CommandArgument.ToString()).Select(a => a.Value).FirstOrDefault();

                if (e.CommandName == "Add")
                {
                    //check whether add / minus button workable
                    //add button is disable when the quantity in stock is equal to textbox
                    if (result >= currentQuantity + 1)
                    {
                        txtQuantity.Text = (++currentQuantity).ToString();
                        cartList[e.CommandArgument.ToString()] = currentQuantity;
                        UpdateCart(e.CommandArgument.ToString(), currentQuantity);
                    }
                    if (result < currentQuantity + 1) //if quantity in stock less than new quantity + 1, it will disable the add button
                    {
                        addbtn.Enabled = false;
                    }
                }
                else
                {
                    //the quantity in stock equally to the new quantity, the add btn must disable
                    if (result == currentQuantity - 1)
                    {
                        addbtn.Enabled = false;
                    }

                    //minus button only disable when the textbox is 1
                    if (currentQuantity - 1 == 1)
                    {
                        txtQuantity.Text = (--currentQuantity).ToString();
                        cartList[e.CommandArgument.ToString()] = currentQuantity;
                        UpdateCart(e.CommandArgument.ToString(), currentQuantity);
                        delbtn.Enabled = false;
                    }
                }
                CalculateTotal();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void UpdateCart(string id, int quan)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"UPDATE [ADDTOCARTLIST] 
SET quantity = @quantity
WHERE CustID = @CustID AND PRODUCTID = @ProductID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("CustID", user.ID);
                    cmd.Parameters.AddWithValue("quantity", quan);
                    cmd.Parameters.AddWithValue("ProductID", id);

                    var result = cmd.ExecuteNonQuery();
                    if (result == 0)
                    {
                        throw new Exception("Fail to update the cart.");
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


    }
}