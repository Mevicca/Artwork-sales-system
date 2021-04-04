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
    public partial class CustomerList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StartDate.Text = new DateTime(2019, 1, 1).ToString("dd-MM-yyyy");
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string BindDatatable(string startTime = null, string custID = null)
        {
            try
            {
                if (startTime == "") startTime = new DateTime(2019, 1, 1).ToString("dd-MM-yyyy");
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {

                    string query = @"select c.CustID, c.CustFullName as custName, c.CreatedAt as startJoinDate, s.totalorder, sa.totalsales as totolAmount
from customer c
inner join (
SELECT custid, count(custid) as totalorder FROM SALES GROUP BY custID) s on(s.CustID = c.CustID)
inner join (
SELECT custid, sum(FinalTotal) as totalsales FROM SALES GROUP BY custid) sa on(sa.CustID = c.CustID)
where 1=1

";
                    if (!String.IsNullOrEmpty(custID)) query += @"AND C.custID LIKE '%" + custID + "%' ";
                    if (!String.IsNullOrEmpty(startTime)) query += "AND c.CreatedAt >= '" + startTime + "'";


                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            DataTable dtReformat = new DataTable();
                            DataColumn dc = new DataColumn("custID", typeof(String));
                            dtReformat.Columns.Add("custID", typeof(int));
                            dtReformat.Columns.Add("custName", typeof(String));
                            dtReformat.Columns.Add("startJoinDate", typeof(String));
                            dtReformat.Columns.Add("totalOrder", typeof(String));
                            dtReformat.Columns.Add("totalAmount", typeof(String));

                            sda.Fill(dt);
                            for (int index = 0; index < dt.Rows.Count; index++)
                            {
                                dtReformat.Rows.Add(
                                    new Object[] {
                                        dt.Rows[index][0],
                                        dt.Rows[index][1],
                                        Convert.ToDateTime(dt.Rows[index][2]).ToString("dd-MM-yyyy hh:mm:ss"),
                                        Convert.ToDecimal(dt.Rows[index][3]).ToString("###,##0.00"),
                                        Convert.ToDecimal(dt.Rows[index][4]).ToString("###,##0.00")
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