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
	public partial class Checkout : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                ClientScript.RegisterForEventValidation(btnMarkPaid.UniqueID);
                if (Request.Cookies["UserType"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                bind();
            }
        }

        public void bind()
        {
            if (Request.Cookies["productids"] != null)
            {
                string productids = Request.Cookies["productids"].Value;
                string quantities = Request.Cookies["quantities"].Value;
                productids = productids.Replace("a", ",");
                TblProduct product = new TblProduct();
                string message = "";
                DataTable dtProducts = product.List(ref message, productids);
                dtProducts.Columns.Add("Quantity");
                dtProducts.Columns.Add("Total");

                string[] allproductds = productids.Split(',');
                int total = 0;

                foreach (DataRow dr in dtProducts.Rows)
                {
                    for (int i = 0; i < allproductds.Length; i++)
                    {
                        if (dr["Id"].ToString().Equals(allproductds[i]))
                        {
                            dr["Quantity"] = quantities.Split('a')[i];
                        
                            dr["Total"] = (Convert.ToInt32(dr["Quantity"]) * Convert.ToSingle(dr["Price"])).ToString();
                            total += (Convert.ToInt32(dr["Quantity"]) * Convert.ToInt16(dr["Price"]));
                        }
                    }
                }
                lblTotal.Text = total.ToString("#0.00");
                gvData.DataSource = dtProducts;
                gvData.DataBind();
            }
            else
            {
                Response.Redirect("Products.aspx");
            }
        }

        protected void btnPlaceorder_Click(object sender, EventArgs e)
        {
            string productids = Request.Cookies["productids"].Value;
            string quantities = Request.Cookies["quantities"].Value;
            productids = productids.Replace("a", ",");
            TblProduct product = new TblProduct();
            string message = "";
            DataTable dtProducts = product.List(ref message, productids);
            dtProducts.Columns.Add("Quantity");
            dtProducts.Columns.Add("Total");

            string[] allproductds = productids.Split(',');
            int total = 0;

            foreach (DataRow dr in dtProducts.Rows)
            {
                for (int i = 0; i < allproductds.Length; i++)
                {
                    if (dr["Id"].ToString().Equals(allproductds[i]))
                    {
                        dr["Quantity"] = quantities.Split('a')[i];

                        dr["Total"] = (Convert.ToInt32(dr["Quantity"]) * Convert.ToSingle(dr["Price"])).ToString();
                        total += (Convert.ToInt32(dr["Quantity"]) * Convert.ToInt16(dr["Price"]));
                    }
                }
            }
            TblOrder order = new TblOrder();
            order.Id = 0;
            order.UserId = int.Parse(Request.Cookies["UserId"].Value);
            order.Total = total;
            order.Name = txtName.Text;
            order.Address = txtAddress.Text;
            order.Landmark = txtLandmark.Text;
            order.City = txtCity.Text;
            order.State = ddlState.SelectedValue;
            order.Pincode = int.Parse(txtPincode.Text);
            bool result = order.Insert(ref message, dtProducts);
            if (!result)
            {
                lblMessage.Text = message;
            }
            else
            {
                hdnOrderId.Value = order.Id.ToString();
                btnMarkPaid.Visible = false;
                lblMessage.Text = "Order Placed. Make Payment.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                btnPlaceorder.Visible = false;
                btnMakePayment.Visible = true;
            }
            
    }

        protected void btnMarkPaid_Click(object sender, EventArgs e)
        {
            TblOrder order = new TblOrder();
            order.MarkOrderPaid(int.Parse(hdnOrderId.Value));

            //Clear Cart
            Response.Cookies["productids"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["quantities"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("ThankYou.aspx");
        }
    }
}