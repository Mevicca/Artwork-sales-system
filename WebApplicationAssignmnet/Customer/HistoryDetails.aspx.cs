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
    public partial class HistoryDetails : System.Web.UI.Page
    {
        private static int id = 100000;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetSalesID();
                GetSalesDetails(id);
                GetCust(GetUserID());
                GetPayment(id);
            }
        }
        private void GetSalesID()
        {
            id = int.Parse(Request.QueryString["id"].ToString());
        }

        private int GetUserID()
        {
            User user = Session["LoginUser"] as User;
            return user.ID;
        }

        private void GetOrder()
        {
            try
            {
                //get customer name, contact number
                 //get delivery address, 
                 //subtotal, shippingfee, discount, finaltotal
            }catch(Exception ex)
            {
                throw ex;
            }
        }

        private void GetSalesDetails(int id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    int quantity;
                    decimal price;
                    decimal ttlPrice = 0;
                    decimal shipFee, disc, finalTtl;
                    decimal orderID;
                    DateTime orderDate;

                    conn.Open();
                    string query = @"select sd.productid, sd.quantity, p.ProductName, p.ProductPrice, p.path1 from Products p, Sales s, SalesDetails sd where p.ProductID = sd.ProductID AND sd.SalesID = s.SalesID AND s.SalesID=@salesID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("salesID", id);

                    //var reader = cmd.ExecuteReader();

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptProducts.DataSource = dt;
                        rptProducts.DataBind();
                    }
                    //if (reader.HasRows)
                    //{
                    //    while (reader.Read())
                    //    {
                    //        LblDelAdd.Text = reader.GetString(10) ?? "";
                    //        LblProductName.Text = reader.GetString(11) ?? "";
                    //        ImgPath.ImageUrl = reader.GetString(13) ?? "";
                    //        quantity = reader.GetInt32(14);
                    //        LblQuantity.Text = quantity.ToString() ?? "0";

                    //        price = reader.GetDecimal(12);
                    //        for (int i = 0; i < quantity; i++)
                    //        {
                    //            ttlPrice += price;
                    //        }
                    //        LblPrice.Text = ttlPrice.ToString("C2");
                    //        LblSubTtl.Text = ttlPrice.ToString("C2");
                    //        shipFee = reader.GetDecimal(7);
                    //        LblShipFee.Text = shipFee.ToString("C2");
                    //        disc = reader.GetDecimal(6);
                    //        LblDisc.Text = disc.ToString("C2");
                    //        finalTtl = reader.GetDecimal(8);
                    //        LblFinalTtl.Text = finalTtl.ToString("C2");
                    //        orderID = reader.GetInt32(1);
                    //        LblOrderId.Text = orderID.ToString();
                    //        orderDate = reader.GetDateTime(9);
                    //        LblOrderDate.Text = orderDate.ToShortDateString();
                    //        LblOrderTime.Text = orderDate.ToShortTimeString();
                    //    }
                    //}

                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

        private void GetCust(int id)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select c.CustID, u.UsersID, u.UserFullName, u.UserTelNo from Customer c, Users u where c.CustID = @usersID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("usersID", id);

                    var reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            LblCustName.Text = reader.GetString(1);
                            LblPhNum.Text = reader.GetString(2);
                        }
                    }



                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

        private void GetPayment(int id)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    DateTime paymentDate;
                    conn.Open();
                    string query = @"select p.PaymentDate from Payment p where PaymentID=@salesID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("salesID", id);

                    var reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            paymentDate = reader.GetDateTime(0);
                            LblPaymentDate.Text = paymentDate.ToShortDateString();
                            LblPaymentTime.Text = paymentDate.ToShortTimeString();
                        }
                    }



                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

    }
}