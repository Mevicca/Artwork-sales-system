using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationAssignmnet
{
    public partial class CustomerProductGallery : System.Web.UI.Page
    {
        int CurrentPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select * from products";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ProductGalleryDataList.DataSource = dt;
                        ProductGalleryDataList.DataBind();
                        ViewState["PagedDataSurce"] = dt;
                        DataListPaging(dt);
                    }
                    ViewState["PageCount"] = 0;
                }
            }
            CurrentPage = (int)ViewState["PageCount"];
        }

        private void DataListPaging(DataTable dt)
        {
            PagedDataSource PD = new PagedDataSource();

            PD.DataSource = dt.DefaultView;
            PD.PageSize = 12;
            PD.AllowPaging = true;
            PD.CurrentPageIndex = CurrentPage;
            Button1.Enabled = !PD.IsFirstPage;
            Button2.Enabled = !PD.IsFirstPage;
            Button4.Enabled = !PD.IsLastPage;
            Button3.Enabled = !PD.IsLastPage;
            ViewState["TotalCount"] = PD.PageCount;
            ProductGalleryDataList.DataSource = PD;
            ProductGalleryDataList.DataBind();
            ViewState["PagedDataSurce"] = dt;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["PageCount"];
            CurrentPage = 0;
            ViewState["PageCount"] = CurrentPage;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["PageCount"];
            CurrentPage -= 1;
            ViewState["PageCount"] = CurrentPage;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["PageCount"];
            CurrentPage += 1;
            ViewState["PageCount"] = CurrentPage;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            CurrentPage = (int)ViewState["TotalCount"] - 1;
            DataListPaging((DataTable)ViewState["PagedDataSurce"]);
        }

        protected void Category_Click(object sender, EventArgs e)
        {
            try
            {
                string value = "ORDER BY ReleasedDate";
                if (Request.Cookies["sort"] != null)
                {
                    value = Request.Cookies["sort"].Value;
                }

                Button btn = sender as Button;
                string tab = "";
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select * from products ";
                    if (btn.Text == "All")
                    {
                        query += "";
                    }
                    else if (btn.Text == "Animals")
                    {
                        tab = @"where CategoryID = 'S1001' ";
                    }
                    else if (btn.Text == "Bronzo")
                    {
                        tab = @"where CategoryID = 'S1002' ";
                    }
                    else if (btn.Text == "Wood")
                    {
                        tab = @"where CategoryID = 'S1003' ";
                    }
                    else if (btn.Text == "Oil Paint")
                    {
                        tab = @"where CategoryID = 'S1004' ";
                    }
                    else if (btn.Text == "Water Color")
                    {
                        tab = @"where CategoryID = 'S1005' ";
                    }
                    else if (btn.Text == "Arcylir Paint")
                    {
                        tab = @"where CategoryID = 'S1006' ";
                    }
                    query += tab;
                    query += value;
                    HttpCookie tabCookies = new HttpCookie("tab");
                    tabCookies.Value = tab;
                    Response.Cookies.Add(tabCookies);

                    SqlCommand cmd = new SqlCommand(query, conn);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ProductGalleryDataList.DataSource = dt;
                        ProductGalleryDataList.DataBind();
                        CurrentPage = 0;
                        ViewState["PageCount"] = 0;
                        ViewState["PagedDataSurce"] = dt;
                        DataListPaging(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string tabValue = "";
                if (Request.Cookies["tab"] != null)
                {
                    tabValue = Request.Cookies["tab"].Value;
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select * from products ";
                    var sortValue = "";
                    query += tabValue;
                    if (ddlSortBy.SelectedValue == "New Arrived")
                    {
                        sortValue += @"ORDER BY ReleasedDate DESC";
                    }
                    else if (ddlSortBy.SelectedValue == "Name : A to Z")
                    {
                        sortValue += @"ORDER BY ProductName";
                    }
                    else if (ddlSortBy.SelectedValue == "Name : Z to A")
                    {
                        sortValue += @"ORDER BY ProductName DESC";
                    }
                    else if (ddlSortBy.SelectedValue == "Price: Cheap to Expensive")
                    {
                        sortValue += @"ORDER BY ProductPrice";
                    }
                    else
                    {
                        sortValue += @"ORDER BY ProductPrice DESC";
                    }
                    query += sortValue;

                    SqlCommand cmd = new SqlCommand(query, conn);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ProductGalleryDataList.DataSource = dt;
                        ProductGalleryDataList.DataBind();
                        CurrentPage = 0;
                        ViewState["PageCount"] = 0;
                        ViewState["PagedDataSurce"] = dt;
                        DataListPaging(dt);
                    }
                    HttpCookie sortCookies = new HttpCookie("sort");
                    sortCookies.Value = sortValue;
                    Response.Cookies.Add(sortCookies);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}