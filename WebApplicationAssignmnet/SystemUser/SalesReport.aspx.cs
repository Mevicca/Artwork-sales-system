using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

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
                BindData(StartDate.Text, EndDate.Text);
            }
            //Required for jQuery DataTables to work.
            GridViewSales.UseAccessibleHeader = true;
            if (GridViewSales.Rows.Count > 0) GridViewSales.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private void BindData(string startTime = null, string endTime = null, string custID = null, string address = null, string paymentMethod = null)
        {
            try
            {
                
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
                    if (PaymentMethod.SelectedItem.Text != "All") query += @"AND pm.pmdescription LIKE '%" + paymentMethod+"%' ";
                    if (!String.IsNullOrEmpty(address)) query += @"AND billing address LIKE '%"+address+"%' ";


                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        sda.SelectCommand.Parameters.AddWithValue("startTime", DateTime.Parse(startTime));
                        sda.SelectCommand.Parameters.AddWithValue("endTime", DateTime.Parse(endTime));
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridViewSales.DataSource = dt;
                            GridViewSales.DataBind();
                        }
                    }

                    //Required for jQuery DataTables to work.
                    GridViewSales.UseAccessibleHeader = true;
                    if (GridViewSales.Rows.Count > 0) GridViewSales.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            } 
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void StartDateButton_Click(object sender, EventArgs e)
        {
            StartDateCalendar.Visible = !StartDateCalendar.Visible;
        }

        protected void EndDateButton_Click(object sender, EventArgs e)
        {
            EndDateCalendar.Visible = !EndDateCalendar.Visible;
        }

        protected void EndDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            EndDate.Text = EndDateCalendar.SelectedDate.ToString("dd/MM/yyyy");
            EndDateCalendar.Visible = false;
        }

        protected void StartDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            StartDate.Text = StartDateCalendar.SelectedDate.ToString("dd/MM/yyyy");
            StartDateCalendar.Visible = false;
        }

        protected void StartDate_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void EndDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                BindData(StartDate.Text, EndDate.Text, CustomerName.Text, TxtBillingEmail.Text, PaymentMethod.SelectedItem.Text);
            }catch(Exception ex)
            {
                
            }
        }
    }
}