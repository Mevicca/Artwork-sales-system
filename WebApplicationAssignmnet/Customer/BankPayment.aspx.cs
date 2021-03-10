using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models.WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class BankPayment : System.Web.UI.Page
    {
        private static Dictionary<string, int> cartList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BankName.Text = Session["Bank"].ToString();
                Amount.Text = Session["Total"].ToString().Substring(2);
            }
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHomepage.aspx");
        }

        protected void PAC_Click(object sender, EventArgs e)
        {
            AcceptBtn.Enabled = true;
            PAC.Visible = true;
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            if (TxtPAC.Text == "123456")
            {
                //insert db to payment successfully
                StoreSales(2);
                SentEmail();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PopupMsg", "failalert('Error','Invalid PAC No.')", true);
            }
        }

        private void SentEmail()
        {
            var result = new Email().SendPaymentEmail(Session["Email"].ToString());
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Payment Successfully.')", true);
            
            Session.Remove("Email");
            Response.Redirect("CustomerHomepage.aspx");
        }

        private void StoreSales(int paymentid)
        {
            try
            {
                string email = Session["Email"].ToString();
                string billingAdd = Session["BillingAddress"].ToString();
                Session.Remove("BillingAddress");
                User user = Session["LoginUser"] as User;
                int deliveryComID = Int32.Parse(Session["DeliveryMethod"].ToString());
                int addressID = Int32.Parse(Session["DeliveryAddressID"].ToString());
                double discount = Double.Parse(Session["Discount"].ToString().Substring(2) ?? "0.00");
                Session.Remove("DeliveryMethod");
                Session.Remove("DeliveryAddressID");

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"DECLARE @var INT;

INSERT INTO SALES(CUSTID, COUPONDISCOUNT, DELIVERYCOST, FINALTOTAL, ORDERTIME, BILLINGADDRESS) VALUES
(@CUSTID, @DISCOUNT, @DELIVERYCOST, @TOTAL, SYSDATETIME(), @BILLINGADD);

SET @var = SCOPE_IDENTITY();
";
                    GetCart();

                    int index = 0;
                    foreach (var product in cartList)
                    {
                        query += "INSERT INTO SALESDETAILS(SALESID,PRODUCTID,QUANTITY) VALUES (@VAR, @PRODUCTID" + index.ToString() + ",@QUANTITY" + index.ToString() + ");";
                        index++;
                    }

                    query += @"
DELETE FROM ADDTOCARTLIST WHERE CUSTID = @custiD;
INSERT INTO DELIVERY(SALESID, ADDRESSID, DELIVERYSERVICESNO, DELIVERYSTATUS, UPDATEAT) VALUES (@VAR, @ADDID, @DELSERNO, @DELSTATUS, SYSDATETIME());
";

                    query += @"INSERT INTO PAYMENT(SALESID, PAYMENTDATE, TOTALAMOUNT, PAYMENTMETHODID, ISPAID) VALUES 
(@var, SYSDATETIME(),@total,@payMethod,1);";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("custID", user.ID);
                    cmd.Parameters.AddWithValue("discount", discount);
                    cmd.Parameters.AddWithValue("deliveryCost", Double.Parse(Session["Shipping"].ToString().Substring(2)));
                    cmd.Parameters.AddWithValue("Total", Double.Parse(Session["Total"].ToString().Substring(2)));
                    cmd.Parameters.AddWithValue("BILLINGADD", billingAdd);
                    cmd.Parameters.AddWithValue("payMethod", paymentid);
                    
                    index = 0;
                    foreach (var product in cartList)
                    {
                        cmd.Parameters.AddWithValue("PRODUCTID" + index.ToString(), product.Key);
                        cmd.Parameters.AddWithValue("QUANTITY" + index.ToString(), product.Value);
                        index++;
                    }

                    cmd.Parameters.AddWithValue("ADDID", addressID);
                    cmd.Parameters.AddWithValue("DELSERNO", deliveryComID);
                    cmd.Parameters.AddWithValue("DELSTATUS", "UNPACK");

                    var result = cmd.ExecuteNonQuery();
                    if (result == 0)
                    {
                        throw new Exception("FAIL TO PLACE ORDER;");
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void GetCart()
        {
            try
            {
                cartList = Session["CartList"] as Dictionary<string, int>;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}