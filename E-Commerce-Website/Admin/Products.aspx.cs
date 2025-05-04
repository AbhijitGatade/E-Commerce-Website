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
	public partial class Products : System.Web.UI.Page
	{
		string message;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				bind();
			}
		}

		public void bind()
		{
			TblProduct product = new TblProduct();
			DataTable dtable = product.List(ref message);
			gvData.DataSource = dtable;
            gvData.DataBind();
        }
	}
}