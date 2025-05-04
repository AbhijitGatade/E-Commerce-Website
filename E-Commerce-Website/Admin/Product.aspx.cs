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
	public partial class Product : System.Web.UI.Page
	{
        string message = "";
		TblProduct product = new TblProduct();
        protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				TblCategory category = new TblCategory();				
				DataTable dtable = category.List(ref message);
				ddlCategory.DataSource = dtable;
				ddlCategory.DataTextField = "Name";
				ddlCategory.DataValueField = "Id";
				ddlCategory.DataBind();
				ddlCategory.Items.Insert(0, new ListItem("Select", ""));

                if (Request.QueryString["action"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    product.GetById(id, ref message);
                    ddlCategory.SelectedValue = product.CategoryId.ToString();
                    txtName.Text = product.Name;
                    txtDescription.Text = product.Description;
                    txtMRP.Text = product.MRP.ToString();
                    txtPrice.Text = product.Price.ToString();
                    txtSrNo.Text = product.SrNo.ToString();
                    rbtnlInstock.SelectedValue = product.InStock;
                }
            }
		}

        protected void btnSave_Click(object sender, EventArgs e)
        {	
			product.CategoryId = int.Parse(ddlCategory.SelectedValue);
			product.Name = txtName.Text.Replace("'", "''");
            product.Description = txtDescription.Text.Replace("'", "''");
            product.ImagePath = "";         
            product.MRP = float.Parse(txtMRP.Text);
            product.Price = float.Parse(txtPrice.Text);
            product.InStock = rbtnlInstock.SelectedValue;
            product.SrNo = int.Parse(txtSrNo.Text);
            if (fuImage.HasFile)
            {
                try
                {
                    // Generate a unique name for the image file
                    string fileName = Guid.NewGuid().ToString() + ".png";

                    // Define the path to save the image in the 'productpics' folder
                    string folderPath = Server.MapPath("~/productpics/");
                    string filePath = System.IO.Path.Combine(folderPath, fileName);

                    // Ensure the folder exists
                    if (!System.IO.Directory.Exists(folderPath))
                    {
                        System.IO.Directory.CreateDirectory(folderPath);
                    }

                    // Save the uploaded file
                    fuImage.SaveAs(filePath);

                    // Set the ImagePath property to the relative path of the saved file
                    product.ImagePath = "productpics/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading image: " + ex.Message;
                    return;
                }
            }
            else
            {
                product.ImagePath = ""; // No file uploaded
            }



            bool result = true;
            if (Request.QueryString["action"] != null)
            {
                product.Id = int.Parse(Request.QueryString["id"].ToString());
                result = product.Update(ref message);
            }
            else
            {
                product.Id = 0;
                result = product.Insert(ref message);
            }
            if (result)
            {
                Response.Redirect("Product.aspx");
            }
            else
            {
                lblMessage.Text = message;
            }

        }
    }
}