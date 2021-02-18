﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssignmnet
{
    public partial class BankPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BankName.Text = Session["Bank"].ToString();
                Amount.Text = String.Format("{0:0.00}", Double.Parse(Session["Amount"].ToString()));
            }
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Homepage.aspx");
        }

        protected void PAC_Click(object sender, EventArgs e)
        {
            Accept.Enabled = true;
            PAC.Visible = true;
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            if (TxtPAC.Text == "123456")
            {
                //insert db to payment successfully
                SentEmail();
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Invalid PAC No.");
            }
        }

        private void SentEmail()
        {
            var result = new Email().SendPaymentEmail(Session["Email"].ToString());
            System.Windows.Forms.MessageBox.Show("Payment Successfully.");
            Response.Redirect("~/Homepage.aspx");
        }
    }
}