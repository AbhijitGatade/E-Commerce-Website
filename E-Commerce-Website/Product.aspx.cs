using E_Commerce_Website.Models;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Website
{
	public partial class Product : System.Web.UI.Page
	{
		string message = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				TblProduct product = new TblProduct();
				int id = int.Parse(Request.QueryString["Id"].ToString());

				hdnId.Value = id.ToString();

				product.GetById(id, ref message);
				lblProductName.Text = product.Name;
				lblName.Text = product.Name;
				imgProduct.ImageUrl = product.ImagePath;
				lblDescription.Text = product.Description;
				lblInStock.Text = product.InStock;
				lblPrice.Text = "&#8377;" + product.Price + "/-<del>(&#8377;" + product.MRP +  "/-)</del>";
				TblCategory category = new TblCategory();
				category.GetById(product.CategoryId, ref message);
				lblCategory.Text = category.Name;
				txtQuantity.Text = "1";
				if (product.InStock.Equals("No"))
                    pnlCart.Visible = false;
            }
		}
	}
}