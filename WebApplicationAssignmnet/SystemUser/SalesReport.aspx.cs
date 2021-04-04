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
    public partial class SalesReport : System.Web.UI.Page
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
        public static string BindDatatable(string startTime = null, string endTime = null, string custID = null, string address = null, string paymentMethod = null)
        {
            try
            {
                if(startTime == "") startTime = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).ToString("dd-MM-yyyy");
                if(endTime == "") endTime = DateTime.Today.ToString("dd-MM-yyyy");
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {

                    string query = @"select ordertime, custID, pm.pmdescription as paymentMethod, billingaddress, CouponDiscount as discount, DeliveryCost,FinalTotal
from Sales s
inner join Delivery d on (d.SalesID = s.SalesID)
inner join DeliveryMethod dm on (dm.DeliveryServicesNo = d.DeliveryServicesNo)
inner join payment p on (p.SalesID = s.SalesID)
inner join paymentMethod pm on (p.paymentMethodID = pm.paymentMethodID)
where orderTime between @startTime and @endtime + 1
";
                    if (!String.IsNullOrEmpty(custID)) query += @"AND custID LIKE '%" + custID + "%' ";
                    if (!String.IsNullOrEmpty(paymentMethod) && paymentMethod != "All") query += @"AND pm.pmdescription LIKE '%" + paymentMethod + "%' ";
                    if (!String.IsNullOrEmpty(address)) query += @"AND billingaddress LIKE '%" + address + "%' ";


                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("startTime", DateTime.Parse(startTime));
                        sda.SelectCommand.Parameters.AddWithValue("endTime", DateTime.Parse(endTime));
                        using (DataTable dt = new DataTable())
                        {
                            DataTable dtReformat = new DataTable();
                            DataColumn dc = new DataColumn("ordertime", typeof(String));

                            dtReformat.Columns.Add("ordertime", typeof(String));
                            dtReformat.Columns.Add("custID", typeof(String));
                            dtReformat.Columns.Add("paymentMethod", typeof(String));
                            dtReformat.Columns.Add("billingaddress", typeof(String));
                            dtReformat.Columns.Add("discount", typeof(String));
                            dtReformat.Columns.Add("DeliveryCost", typeof(String));
                            dtReformat.Columns.Add("FinalTotal", typeof(String));

                            sda.Fill(dt);
                            for (int index = 0; index < dt.Rows.Count; index++)
                            {
                                dtReformat.Rows.Add(
                                    new Object[] {
                                        Convert.ToDateTime(dt.Rows[index][0]).ToString("dd-MM-yyyy hh:mm:ss"),
                                        dt.Rows[index][1],
                                        dt.Rows[index][2],
                                        dt.Rows[index][3],
                                        Convert.ToDecimal(dt.Rows[index][4]).ToString("###,##0.00"),
                                        Convert.ToDecimal(dt.Rows[index][5]).ToString("###,##0.00"),
                                        Convert.ToDecimal(dt.Rows[index][6]).ToString("###,##0.00")
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