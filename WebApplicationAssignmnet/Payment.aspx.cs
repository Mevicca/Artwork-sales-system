using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssignmnet
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSubtotal.Text = Request.QueryString["Subtotal"];
                lblDiscount.Text = Request.QueryString["Discount"];
                lblShipping.Text = Request.QueryString["Shipping"];
                lblFinalTotal.Text = Request.QueryString["Total"];
            }
        }

        protected void PayButton_Click(object sender, EventArgs e)
        {
            if (payMethod.Value != "tab-card")
            {
                System.Reflection.PropertyInfo isreadonly = typeof(System.Collections.Specialized.NameValueCollection).GetProperty("IsReadOnly", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
                isreadonly.SetValue(HttpContext.Current.Request.QueryString, false, null);
                Session["Bank"] = radioBank.SelectedItem.Value;
                Session["Amount"] = lblFinalTotal.Text;
                Response.Redirect("~/Bank.aspx");
            }
            else
            {
                if(txtcardHolder.Text == "INNI" && txtCardNo1.Text == "4111" && txtCardNo2.Text == "1111" &&
                    txtCardNo3.Text == "4111" && txtCardNo4.Text == "1111" && txtCvv.Text == "123" &&
                    DateTime.Parse(txtMonth.Text) > DateTime.Today)
                {
                    var result = new Email().SendPaymentEmail(Session["Email"].ToString());
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert('Success','Payment Successfully.');", true);
                    Response.Redirect("~/Homepage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "failalert('Failure','Payment failure.');", true);
                }
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage.aspx");
        }
    }
}