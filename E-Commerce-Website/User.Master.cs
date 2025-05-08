using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Website
{
	public partial class User : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Request.Cookies["UserType"] != null)
				{
					pnlUser.Visible = true;
					lblUsername.Text = Request.Cookies["Name"].Value.ToString();
					pnlLogin.Visible = false;
				}
			}
		}
	}
}