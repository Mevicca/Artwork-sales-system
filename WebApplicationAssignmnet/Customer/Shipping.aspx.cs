using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models.WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class Shipping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (IsPostBack)
                {
                    BindRadio();
                }
                else
                {
                    Databinding();
                }
                CalculateFinal();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Something wrong.');", true);
            }

        }

        protected void Delivery_Click(object sender, EventArgs e)
        {
            try
            {
                radioListMethod.Items.Clear();

                ImageButton btn = (ImageButton)sender;
                txtDeliveryCompany.Text = btn.CommandArgument;

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = "SELECT DeliveryServicesNo, Delivery_Description, Delivery_Company, DeliveryFee, DayMin, DayMax, ImagePath, isActive FROM DeliveryMethod WHERE(isActive = @isActive) AND(Delivery_Company = @CompanyName)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("isActive", 1);
                    cmd.Parameters.AddWithValue("CompanyName", txtDeliveryCompany.Text);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            string deliveryMethodNo = reader.GetInt32(0).ToString();
                            string deliveryDescription = reader.GetString(1);
                            string deliveryFee = reader.GetDecimal(3).ToString();
                            string dayMin = reader.GetDecimal(4).ToString();
                            string dayMax = reader.GetDecimal(5).ToString();

                            if (deliveryFee != "")
                            {
                                var newItem = new ListItem()
                                {
                                    Text = "<br/> " + deliveryDescription +
                                    "  " + DateTime.Now.AddDays(Int32.Parse(dayMin)).ToString("dd.MM.yy") + " - " +
                                    DateTime.Now.AddDays(Int32.Parse(dayMax)).ToString("dd.MM.yy") + "<br/>" +
                                    "RM " + deliveryFee.ToString(),
                                    Value = deliveryMethodNo + ";" + deliveryFee
                                };
                                radioListMethod.Items.Add(newItem);
                            }
                        }
                    }
                }

                if (radioListMethod.Items.Count > 0)
                {
                    radioListMethod.Items[0].Selected = true;
                    BindRadio();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void Databinding()
        {
            try
            {
                EmailBinding();
                GetProducts();
                //bind telephoneNo
                if (Session["LoginUser"] != null)
                {
                    User user = Session["LoginUser"] as User;
                    telNumber.Text = String.IsNullOrEmpty(user.TelephoneNo) ? "": user.TelephoneNo;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void EmailBinding()
        {
            try
            {
                #region first time load the page : binding email address through user's information catch by the login session
                User user = Session["LoginUser"] as User;
                txtEmailAdd.Text = user.Email;

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"SELECT [AddressList].AddressID, ADDRESS1, ADDRESS2, ADDRESS3, POSTCODE, CITY, [AddressList].IsDefault
FROM[Address]
INNER JOIN[AddressList] ON([AddressList].AddressID = [Address].AddressID)
WHERE[AddressList].CustID = @custID; ";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("custID", user.ID);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            int addressID = reader.GetInt32(0);
                            string address1 = (!reader.IsDBNull(1)) ? reader.GetString(1) : "";
                            string address2 = (!reader.IsDBNull(2)) ? reader.GetString(2) : "";
                            string address3 = (!reader.IsDBNull(3)) ? reader.GetString(3) : "";
                            string postcode = (!reader.IsDBNull(4)) ? reader.GetInt32(4).ToString() : "";
                            string city = (!reader.IsDBNull(5)) ? reader?.GetString(5) : "";
                            bool isDefault = (bool)reader.GetSqlBoolean(6);

                            string fullAddress = "";
                            fullAddress += (address1 != null && address1 != "") ? address1 + ", \n" : "";
                            fullAddress += (address2 != null && address2 != "") ? address2 + ", \n" : "";
                            fullAddress += (address3 != null && address3 != "") ? address3 + ", \n" : "";
                            fullAddress += (postcode != null && postcode != "") ? postcode + ", \n" : "";
                            fullAddress += (city != null && city != "") ? city + "." : "";

                            var newItem = new ListItem()
                            {
                                Text = fullAddress,
                                Value = addressID.ToString()
                            };

                            if (isDefault)
                            {
                                ddlAddress.Items.Insert(0, newItem);
                            }
                            else
                            {
                                ddlAddress.Items.Add(newItem);
                            }
                        }

                    }
                }

                if (ddlAddress.Items.Count == 0)
                {
                    ddlAddress.Items.Add("Empty. Please add in the shipping address.");
                }
                #endregion
            }
            catch (Exception ex) { throw ex; }

            txtBillAdd.Text = ddlAddress.SelectedItem.Text; //default
        }

        private void GetProducts()
        {
            try
            {
                #region first time load the page : load the add to cart products
                User user = Session["LoginUser"] as User;
                double total = 0;

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select p.productID as productID,p.ProductName as productName, p.ProductPrice as productPrice, p.path1 as imagePath, a.Quantity as purchaseQuantity
from Products p
INNER JOIN addtocartlist a ON (p.ProductID = a.ProductID AND a.CustID = @custID)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("custID", user.ID);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        repeaterProducts.DataSource = dt;
                        repeaterProducts.DataBind();

                        for (var i = 0; i < dt.Rows.Count; i++)
                        {
                            total += Double.Parse(dt.Rows[i][2].ToString());
                        }

                        lblSubtotal.Text = total.ToString("C2");
                    }
                }
                #endregion
            }
            catch (Exception ex) { throw ex; }
        }

        protected void BtnApply_Click(object sender, EventArgs e)
        {
            try
            {
                var coupon = txtCoupon.Text?.Trim();
                if (coupon != null && coupon != "")
                {
                    coupon = coupon.ToUpper();
                    if (coupon == "HAPPY2021")//hardcode first, not sure whether the admin side can add on or not
                    {
                        var value = double.Parse(lblSubtotal.Text, NumberStyles.Currency);
                        lblDiscount.Text = (value * 0.05).ToString("C2");
                        lbelDiscount.Text = "Discount 5%";
                        CalculateFinal();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Coupon applied.')", true);
                        return;
                    }
                }
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Invalid coupon.')", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error', 'Something wrong')", true);
            }
        }

        private void CalculateFinal()
        {
            try
            {
                double subtotal = double.Parse(lblSubtotal.Text, NumberStyles.Currency);
                double discount = double.Parse(lblDiscount.Text, NumberStyles.Currency);
                double shipping = double.Parse(lblShipping.Text, NumberStyles.Currency);

                lblFinalTotal.Text = (subtotal - discount + shipping).ToString("C2");
                lblDiscount.Text = discount.ToString("C2");
                lblShipping.Text = shipping.ToString("C2");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void BtnPayment_Click(object sender, EventArgs e)
        {
            if (ValidateToPayment())
            {
                Session["Email"] = txtEmailAdd.Text;
                Session["BillingAddress"] = txtBillAdd.Text;
                Session["DeliveryAddressID"] = ddlAddress.SelectedValue;
                Session["Subtotal"] = lblSubtotal.Text;
                Session["Discount"] = lblDiscount.Text;
                Session["Shipping"] = lblShipping.Text;
                Session["Total"] = lblFinalTotal.Text;
                Session["TelephoneNo"] = telNumber.Text;

                Response.Redirect("Payment.aspx");
            }
        }

        private void BindRadio()
        {
            if (radioListMethod.SelectedItem != null)
            {
                var items = (radioListMethod.SelectedItem?.Value).Split(';');
                lblShipping.Text = Double.Parse(items[1]).ToString("C2");
                CalculateFinal();
            }
        }

        protected void RadioListMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRadio();
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"DECLARE @var INT;

INSERT INTO ADDRESS([AddressLabel], [Address1], [Address2], [Address3], [Postcode], [City]) 
VALUES(@label,@add1,@add2,@add3,@postcode,@city);

SELECT @var = SCOPE_IDENTITY()

INSERT INTO ADDRESSLIST([AddressID], [CustID], [IsDefault]) VALUES (@var, @CustID, 1);";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("label", txtLabel.Text.Trim());
                    cmd.Parameters.AddWithValue("add1", txtAdd1.Text == null ? "" : txtAdd1.Text.Trim());
                    cmd.Parameters.AddWithValue("add2", txtAdd2.Text == null ? "" : txtAdd2.Text.Trim());
                    cmd.Parameters.AddWithValue("add3", txtAdd3.Text == null ? "" : txtAdd3.Text.Trim());
                    cmd.Parameters.AddWithValue("postcode", txtPostCode.Text);
                    cmd.Parameters.AddWithValue("city", txtCity.Text);
                    cmd.Parameters.AddWithValue("CustID", user.ID);

                    var result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Successfully to add.');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Error','Fail to add.');", true);
                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Chkbox_CheckedChanged(object sender, EventArgs e)
        {
            if (!((CheckBox)sender).Checked)
            {
                txtBillAdd.Visible = true;
            }
            else
            {
                txtBillAdd.Visible = false;
                txtBillAdd.Text = ddlAddress.SelectedItem.Text; //default
            }
        }

        private bool ValidateToPayment()
        {
            try
            {
                if (ddlAddress.SelectedItem.Text.Contains("Empty"))
                {
                    throw new Exception("Please select the shipment address.");
                }
                if (double.Parse(lblFinalTotal.Text, NumberStyles.Currency) <= 0)
                {
                    throw new Exception("Please add a product into cart.");
                }
                if (txtDeliveryCompany.Text == "")
                {
                    throw new Exception("Please select a shipping company.");
                }
                if (!chkbox.Checked && txtBillAdd.Text == "")
                {
                    throw new Exception("Please enter the billing address.");
                }
                if (String.IsNullOrEmpty(telNumber.Text))
                {
                    throw new Exception("Please enter the telephone number for delivery.");
                }
                //store the shipping session
                var address = (radioListMethod.SelectedItem?.Value).Split(';'); //inside format : deliveryMethodNo + ";" + deliveryFee
                Session["DeliveryMethod"] = address[0];
                Session["DeliveryAddress"] = ddlAddress.SelectedItem.Text;
                Session["BillAddress"] = txtBillAdd.Text;
                Session["BillingEmailAdress"] = txtEmailAdd.Text;
            }
            catch (Exception ex)
            {
                string js = "failalert('" + ex.Message + "');";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", js, true);
                return false;
            }
            return true;
        }
    }


}