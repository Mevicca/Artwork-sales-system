using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplicationAssignmnet
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        private void Application_AuthenticateRequest(object sender, EventArgs e)
        {
            HttpCookie decryptedCookie = Context.Request.Cookies[FormsAuthentication.FormsCookieName];

            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(decryptedCookie.Value);

            var identity = new GenericIdentity(ticket.Name);
            var principal = new GenericPrincipal(identity, null);

            HttpContext.Current.User = principal;
            Thread.CurrentPrincipal = HttpContext.Current.User;
        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}