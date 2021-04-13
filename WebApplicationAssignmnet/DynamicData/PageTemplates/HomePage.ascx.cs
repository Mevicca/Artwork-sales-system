using System;
using System.Collections;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using WebApplicationAssignmnet.Models;

namespace WebApplicationAssignmnet.DynamicData.FieldTemplates
{
    public partial class HomePage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User user = Session["LoginUser"] as User;
                if (user.ID > 10000)
                {
                    galleryBtn.PostBackUrl = "~/Customer/CustomerProductGallery.aspx";
                    joinBtn.PostBackUrl = "~/Anonymous/SignUp.aspx"; 
                    HyperLink1.NavigateUrl = "~/Customer/CustomerProductGallery.aspx";
                    HyperLink2.NavigateUrl = "~/Customer/CustomerProductGallery.aspx";
                    HyperLink3.NavigateUrl = "~/Customer/CustomerProductGallery.aspx";
                    HyperLink4.NavigateUrl = "~/Customer/CustomerProductGallery.aspx";
                }
                else
                {
                    galleryBtn.PostBackUrl = "~/Artist/ProductGallery.aspx";
                    joinBtn.PostBackUrl = "~/Artist/FAQ.aspx";
                    HyperLink1.NavigateUrl = "~/Artist/ProductGallery.aspx";
                    HyperLink2.NavigateUrl = "~/Artist/ProductGallery.aspx";
                    HyperLink3.NavigateUrl = "~/Artist/ProductGallery.aspx";
                    HyperLink4.NavigateUrl = "~/Artist/ProductGallery.aspx";
                }    
            }
        }
    }
}
