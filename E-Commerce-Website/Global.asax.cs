using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace E_Commerce_Website
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
new ScriptResourceDefinition
{
    Path = "~/assets/jquery-3.6.0.min.js", // Path to your jQuery
    DebugPath = "~/assets/jquery-3.6.0.js",    
    LoadSuccessExpression = "window.jQuery"
});
        }
    }
}