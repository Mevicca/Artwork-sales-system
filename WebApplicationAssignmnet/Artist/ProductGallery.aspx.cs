using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationAssignmnet.Models.WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet
{
    public partial class ProductGallery : System.Web.UI.Page
    {
        int CurrentPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            all.BackColor = Color.FromArgb(0xbc5b51);
            all.ForeColor = Color.White;
            if (!IsPostBack)
            {
                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select * from products where ArtistID = @id";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("id", user.ID);

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

        protected void status_Click(object sender, EventArgs e)
        {
            try
            {
                string value = "ORDER BY ReleasedDate";
                if (Request.Cookies["sort"] != null)
                {
                    value = Request.Cookies["sort"].Value;
                }
   
                all.BackColor = Color.FromArgb(0xF3E0DC);
                all.ForeColor = Color.Black;
                instock.BackColor = Color.FromArgb(0xF3E0DC);
                instock.ForeColor = Color.Black;
                soldout.BackColor = Color.FromArgb(0xF3E0DC);
                soldout.ForeColor = Color.Black;
                inactive.BackColor = Color.FromArgb(0xF3E0DC);
                inactive.ForeColor = Color.Black;

                Button btn = sender as Button;
                btn.BackColor = Color.FromArgb(0xbc5b51); 
                btn.ForeColor = Color.White;

                string tab = "";
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    User user = Session["LoginUser"] as User;
                    conn.Open();
                    string query = @"select * from products where ArtistID = @id ";
                    if (btn.Text == "Show All")
                    {
                        query += "";
                    }
                    else if (btn.Text == "In Stock")
                    {
                        tab = @"and Quantity >= 1 and IsActive = 1 ";
                    }
                    else if (btn.Text == "Sold Out")
                    {
                        tab = @"and Quantity = 0 and IsActive = 1 ";
                    }
                    else if (btn.Text == "Inactive")
                    {
                        tab = @"and IsActive = 0 ";
                    }
                    query += tab;
                    query += value;
                    HttpCookie tabCookies = new HttpCookie("tab");
                    tabCookies.Value = tab;
                    Response.Cookies.Add(tabCookies);

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("id", user.ID);
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

                User user = Session["LoginUser"] as User;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    conn.Open();
                    string query = @"select * from products where ArtistID = @id ";
                    var sortValue = "";
                    query += tabValue;
                    if (ddlSortBy.SelectedValue == "Date")
                    {
                        sortValue = @"ORDER BY ReleasedDate";
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
                    cmd.Parameters.AddWithValue("id", user.ID);

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
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}