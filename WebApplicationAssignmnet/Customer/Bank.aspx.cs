using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssignmnet
{
    public partial class Bank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TxtBankName.Text = Session["Bank"].ToString();
        }

        protected void Login1_Authenticate(object sender, EventArgs e)
        {
            if(UserName.Text.Trim() == "Jess123" && Password.Text.Trim() == "Jess123")
            {
                Response.Redirect("BankPayment.aspx");
            }
            else
            {
                FailureText.Text = "Invalid User ID / Password.";
            }
        }
    }
}