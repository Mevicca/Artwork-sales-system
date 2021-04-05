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
    public partial class OrderDetails : System.Web.UI.Page
    {
        private static int id = 100000;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetSalesID();
                GetOrder(id);
                GetSalesDetails(id);               
            }
        }
        private void GetSalesID()
        {
            id = int.Parse(Request.QueryString["id"].ToString());
        }

        private void GetOrder(int salesID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT CUSTOMER.CustFullName, DELIVERY.TelephoneNo, CONCAT(a.Address1,a.Address2,a.Address3,',',a.Postcode,',',a.City) as deliveryaddress, SALES.SalesID, SALES.DeliveryCost, SALES.CouponDiscount, Delivery.DeliveryStatus, p.PaymentDate, pm.PMDescription
FROM CUSTOMER, DELIVERY, Sales, [Address] a, Payment p, paymentmethod pm
WHERE CUSTOMER.CustID=SALES.CustID AND SALES.SalesID = DELIVERY.SalesID AND a.AddressID=delivery.AddressID AND p.SalesID=sales.SalesID AND pm.PaymentMethodID = p.PaymentMethodID AND SALES.SALESID = @salesID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("salesID", salesID);

                    var reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            LblCustName.Text = reader.GetString(0);
                            LblPhNum.Text = reader.GetString(1);
                            LblDelAdd.Text = reader.GetString(2);
                            LblOrderId.Text = reader.GetInt32(3).ToString();
                            LblShipFee.Text = reader.GetDecimal(4).ToString("#,##0.00");
                            LblDisc.Text = reader.GetDecimal(5).ToString("#,##0.00");
                            LblOrderStatus.Text = reader.GetString(6);
                            LblPaymentTime.Text = reader.GetDateTime(7).ToString("dd-MM-yyyy HH:mm:ss");
                            paymentMethod.Text = reader.GetString(8) == "BankPayment" ? "Online Banking(FPX)" : "Card Payment";
                        }
                    }
                    conn.Close();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void GetSalesDetails(int id)
        {
            try
            {
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select sd.productid, sd.quantity, p.ProductName, p.ProductPrice, p.path1 from Products p, Sales s, SalesDetails sd where p.ProductID = sd.ProductID AND sd.SalesID = s.SalesID AND s.SalesID=@salesID AND p.ArtistID = @artistID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("salesID", id);
                    cmd.Parameters.AddWithValue("artistID", user.ID);

                    double total = 0;
                    double finalTotal = 0;

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptProducts.DataSource = dt;
                        rptProducts.DataBind();

                        for (var i = 0; i < dt.Rows.Count; i++)
                        {
                            total += Double.Parse(dt.Rows[i][3].ToString()) * Double.Parse(dt.Rows[i][1].ToString());
                        }
                    }
                    finalTotal = total - Double.Parse(LblDisc.Text) + Double.Parse(LblShipFee.Text);
                    LblSubTtl.Text = total.ToString("#,##0.00");
                    LblFinalTtl.Text = finalTotal.ToString("#,##0.00");
                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }
    }
}