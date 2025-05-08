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
	public partial class Cart : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Page.Title = "Cart";

			if (!IsPostBack)
			{
				bind();
			}
		}

		public void bind()
		{
			if(Request.Cookies["productids"] != null)
			{
				pnlNoProduct.Visible = false;
                btnClearCart.Visible = true;

				string productids = Request.Cookies["productids"].Value;
				string quantities = Request.Cookies["quantities"].Value;
				productids = productids.Replace("a", ",");
                TblProduct product = new TblProduct();
				string message = "";
                DataTable dtProducts = product.List(ref message, productids);
                dtProducts.Columns.Add("Quantity");
                dtProducts.Columns.Add("Total");

			 	string []allproductds = productids.Split(',');

                foreach (DataRow dr in dtProducts.Rows)
                {
                    for(int i = 0; i < allproductds.Length; i++)
                    {
                        if (dr["Id"].ToString().Equals(allproductds[i]))
                        {
                            dr["Quantity"] = quantities.Split('a')[i];
                            dr["Total"] = (Convert.ToInt32(dr["Quantity"]) * Convert.ToSingle(dr["Price"])).ToString();
                        }
                    }
                }

                gvData.DataSource = dtProducts;
				gvData.DataBind();

            }
			else
			{
				btnClearCart.Visible = false;
				pnlNoProduct.Visible = true;

            }
		}

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            Response.Cookies["productids"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["quantities"].Expires = DateTime.Now.AddDays(-1);
			Response.Redirect("Cart.aspx");
        }
    }
}