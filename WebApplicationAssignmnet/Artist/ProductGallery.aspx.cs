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
    public partial class ProductGallery : System.Web.UI.Page
    {
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
                    }
                }
            }
        }

        protected void showAll_Click(object sender, EventArgs e)
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
                }
            }
        }
        protected void inStock_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                string query = @"select * from products where Quantity >= 1";
                SqlCommand cmd = new SqlCommand(query, conn);

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ProductGalleryDataList.DataSource = dt;
                    ProductGalleryDataList.DataBind();
                }
            }
        }

        protected void soldOut_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                string query = @"select * from products where Quantity = 0";
                SqlCommand cmd = new SqlCommand(query, conn);
                
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ProductGalleryDataList.DataSource = dt;
                    ProductGalleryDataList.DataBind();
                }
            }
        }
    }
}