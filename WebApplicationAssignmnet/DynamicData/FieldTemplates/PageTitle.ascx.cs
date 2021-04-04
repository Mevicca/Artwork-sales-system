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

namespace WebApplicationAssignmnet.DynamicData.FieldTemplates
{
    public partial class PageTitle : System.Web.UI.UserControl
    {
        public string PageHeader { get; set; } = "Default";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
