using E_Commerce_Website.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Website
{
	public partial class Products : System.Web.UI.Page
	{
		string message = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				TblCategory category = new TblCategory();
				int id = int.Parse(Request.QueryString["CategoryId"].ToString());
				category.GetById(id, ref message);
				lblCategoryName.Text = category.Name;

				TblProduct product = new TblProduct();
				product.CategoryId = id;
                DataTable dtProducts = product.List(ref message);
				rptProducts.DataSource = dtProducts;
                rptProducts.DataBind();
            }
		}
	}
}