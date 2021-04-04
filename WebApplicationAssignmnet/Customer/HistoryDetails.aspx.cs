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
                GetOrder(id);
            }
        }
        private void GetSalesID()
        {
            id = int.Parse(Request.QueryString["id"].ToString());
        }

        private int GetUserID()
        {
            if (Session["LoginUser"] == null)
            {
                return 1001;
            }
            User user = Session["LoginUser"] as User;
            return user.ID;
        }

        private void GetOrder(int salesID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT CUSTOMER.CustFullName, DELIVERY.TelephoneNo, CONCAT(a.Address1,a.Address2,a.Address3,',',a.Postcode,',',a.City) as deliveryaddress, SALES.SalesID, SALES.FinalTotal, SALES.DeliveryCost, SALES.CouponDiscount, Delivery.DeliveryStatus, p.PaymentDate, pm.PMDescription
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
                            LblFinalTtl.Text = reader.GetDecimal(4).ToString("#,##0.00");
                            LblShipFee.Text = reader.GetDecimal(5).ToString("#,##0.00");
                            LblDisc.Text = reader.GetDecimal(6).ToString("#,##0.00");
                            LblOrderStatus.Text = reader.GetString(7);
                            LblPaymentTime.Text = reader.GetDateTime(8).ToString("dd-MM-yyyy HH:mm:ss");
                            paymentMethod.Text = reader.GetString(9) == "BankPayment" ? "Online Banking(FPX)":"Card Payment";
                        }
                    }
                    conn.Close();
                }

            }
            catch(Exception ex)
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
                    conn.Open();
                    string query = @"select sd.productid, sd.quantity, p.ProductName, p.ProductPrice, p.path1 from Products p, Sales s, SalesDetails sd where p.ProductID = sd.ProductID AND sd.SalesID = s.SalesID AND s.SalesID=@salesID";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("salesID", id);

                    double total=0;

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

                    LblSubTtl.Text = total.ToString("#,##0.00");

                    conn.Close();
                }
            }
            catch (Exception ex) { throw ex; }
        }

    }
}