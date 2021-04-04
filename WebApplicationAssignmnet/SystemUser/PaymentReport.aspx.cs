using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace WebApplicationAssignmnet.SystemUser
{
    public partial class PaymentReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StartDate.Text = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).ToString("dd-MM-yyyy");
                EndDate.Text = DateTime.Today.ToString("dd-MM-yyyy");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string BindDatatable(string startTime = null, string endTime = null, string custID = null, string status = null, string paymentMethod = null)
        {
            try
            {
                if (startTime == "") startTime = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).ToString("dd-MM-yyyy");
                if (endTime == "") endTime = DateTime.Today.ToString("dd-MM-yyyy");
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {

                    string query = @"SELECT p.paymentid, p.PaymentDate as paymenttime, c.CustFullName as customerName,pm.PMDescription as paymentMethod, p.TotalAmount as totalAmount, 
p.isPaid as status
FROM PAYMENT P
INNER JOIN sales s on (s.SalesID=p.SalesID)
inner join customer c on (c.CustID = s.CustID)
inner join PaymentMethod pm on (pm.PaymentMethodID=p.PaymentMethodID)
where orderTime between @startTime and @endtime + 1
";
                    if (!String.IsNullOrEmpty(custID)) query += @"AND c.custID LIKE '%" + custID + "%' ";
                    if (!String.IsNullOrEmpty(paymentMethod) && paymentMethod != "All") query += @"AND pm.pmdescription LIKE '%" + paymentMethod + "%' ";
                    if (status != "2") query += @"AND status = "+ status;


                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("startTime", DateTime.Parse(startTime));
                        sda.SelectCommand.Parameters.AddWithValue("endTime", DateTime.Parse(endTime));
                        using (DataTable dt = new DataTable())
                        {
                            DataTable dtReformat = new DataTable();
                            DataColumn dc = new DataColumn("paymentID", typeof(String));

                            dtReformat.Columns.Add("paymentID", typeof(String));
                            dtReformat.Columns.Add("paymenttime", typeof(String));
                            dtReformat.Columns.Add("customerName", typeof(String));
                            dtReformat.Columns.Add("paymentMethod", typeof(String));
                            dtReformat.Columns.Add("totalAmount", typeof(String));
                            dtReformat.Columns.Add("status", typeof(String));

                            sda.Fill(dt);
                            for (int index = 0; index < dt.Rows.Count; index++)
                            {
                                dtReformat.Rows.Add(
                                    new Object[] {
                                        dt.Rows[index][0],
                                        Convert.ToDateTime(dt.Rows[index][1]).ToString("dd-MM-yyyy hh:mm:ss"),
                                        dt.Rows[index][2],
                                        dt.Rows[index][3],
                                        Convert.ToDecimal(dt.Rows[index][4]).ToString("###,##0.00"),
                                        dt.Rows[index][5],
                                    }
                                    );
                            }
                            return DataTableToJSONWithJSONNet(dtReformat);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public static string DataTableToJSONWithJSONNet(DataTable table)
        {
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }
    }
}