using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class Payment : System.Web.UI.Page
    {
        private static Dictionary<string, int> cartList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSubtotal.Text = Session["Subtotal"].ToString();
                lblDiscount.Text = Session["Discount"].ToString();
                lblShipping.Text = Session["Shipping"].ToString();
                lblFinalTotal.Text = Session["Total"].ToString();
            }
        }

        protected void PayButton_Click(object sender, EventArgs e)
        {
            if (payMethod.Value != "tab-card")
            {
                Session["Bank"] = radioBank.SelectedItem.Value;
                Response.Redirect("Bank.aspx");
            }
            else
            {
                if (txtcardHolder.Text == "INNI" && txtCardNo1.Text == "4111" && txtCardNo2.Text == "1111" &&
                    txtCardNo3.Text == "4111" && txtCardNo4.Text == "1111" && txtCvv.Text == "123" &&
                    DateTime.Parse(txtMonth.Text) > DateTime.Today)
                {
                    var result = new Email().SendPaymentEmail(Session["Email"].ToString());
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Payment Successfully.');", true);
                    StoreSales(1);
                    Session.Remove("CartList");
                    Session.Remove("Email");
                    Response.Redirect("CustomerHomepage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Failure','Payment failure.');", true);
                }
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerHomepage.aspx");
        }

        private void StoreSales(int paymentid)
        {
            try
            {
                string email = Session["Email"].ToString();
                string billingAdd = Session["BillingAddress"].ToString();
                Session.Remove("Email");
                Session.Remove("BillingAddress");
                User user = Session["LoginUser"] as User;
                int deliveryComID = Int32.Parse(Session["DeliveryMethod"].ToString());
                int addressID = Int32.Parse(Session["DeliveryAddressID"].ToString());
                double discount = Double.Parse(lblDiscount.Text?.Substring(2) ?? "0.00");
                string telephoneNo = Session["TelephoneNo"].ToString();
                Session.Remove("DeliveryMethod");
                Session.Remove("TelephoneNo");
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
                    int salesID = 0;
                    foreach (var product in cartList)
                    {
                        query += "INSERT INTO SALESDETAILS(SALESID,PRODUCTID,QUANTITY) VALUES (@VAR, @PRODUCTID" + index.ToString() + ",@QUANTITY" + index.ToString() + ");";
                        index++;
                    }

                    query += @"
DELETE FROM ADDTOCARTLIST WHERE CUSTID = @custiD;
INSERT INTO DELIVERY(SALESID, ADDRESSID, DELIVERYSERVICESNO, DELIVERYSTATUS, UPDATEAT, TELEPHONENO) VALUES (@VAR, @ADDID, @DELSERNO, @DELSTATUS, SYSDATETIME(),@tel);
";

                    query += @"INSERT INTO PAYMENT(SALESID, PAYMENTDATE, TOTALAMOUNT, PAYMENTMETHODID, ISPAID) VALUES 
(@var, SYSDATETIME(),@total,@payMethod,1);

SELECT @var";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("custID", user.ID);
                    cmd.Parameters.AddWithValue("discount", discount);
                    cmd.Parameters.AddWithValue("deliveryCost", Double.Parse(lblShipping.Text.Substring(2)));
                    cmd.Parameters.AddWithValue("Total", Double.Parse(lblFinalTotal.Text.Substring(2)));
                    cmd.Parameters.AddWithValue("BILLINGADD", billingAdd);
                    cmd.Parameters.AddWithValue("payMethod", paymentid);
                    cmd.Parameters.AddWithValue("tel", telephoneNo);

                    index = 0;
                    foreach (var product in cartList)
                    {
                        cmd.Parameters.AddWithValue("PRODUCTID" + index.ToString(), product.Key);
                        cmd.Parameters.AddWithValue("QUANTITY" + index.ToString(), product.Value);
                        index++;
                    }

                    cmd.Parameters.AddWithValue("ADDID", addressID);
                    cmd.Parameters.AddWithValue("DELSERNO", deliveryComID);
                    cmd.Parameters.AddWithValue("DELSTATUS", "Unpack");

                    var result = cmd.ExecuteReader();
                    if (result.HasRows && result.Read())
                    {
                        salesID = result.GetInt32(0);
                        Response.Redirect("~/Customer/HistoryDetails.aspx?id=" + salesID);
                    }
                    else
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