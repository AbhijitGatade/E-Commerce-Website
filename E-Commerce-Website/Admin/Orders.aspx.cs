using E_Commerce_Website.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Website.Admin
{
	public partial class Orders : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				bind();
			}
		}
		public void bind()
		{
			TblOrder order = new TblOrder();
			string message = "";
			DataTable dtable = order.List(ref message);
			gvData.DataSource = dtable;
			gvData.DataBind();
		}
	}
}