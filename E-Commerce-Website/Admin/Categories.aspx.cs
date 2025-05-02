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
	public partial class Categories : System.Web.UI.Page
	{
		TblCategory category = new TblCategory();
		string message = "";
        protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.QueryString["action"] != null)
				{
					string action = Request.QueryString["action"].ToString();
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    if (action.Equals("delete"))
					{						
						category.Delete(id, ref message);
						Response.Redirect("Categories.aspx");
					}
					if (action.Equals("edit"))
					{
						category.GetById(id, ref message);
						txtName.Text = category.Name;
						txtSrNo.Text = category.SrNo.ToString();
					}
				}
				bind();
			}
		}

		public void bind()
		{
			DataTable dtable = category.List(ref message);
			gvData.DataSource = dtable;
			gvData.DataBind();
			if (!message.Equals(""))
			{
				lblMessage.Text = message;
			}
			txtSrNo.Text = (dtable.Rows.Count + 1).ToString();
		}

        protected void btnSave_Click(object sender, EventArgs e)
        {
			if (validateName.IsValid && validateSrNo.IsValid && validateRangeSrNo.IsValid)
			{	
				category.Name = txtName.Text.Replace("'", "''");
				category.SrNo = int.Parse(txtSrNo.Text);
				bool result = true;
				if (Request.QueryString["action"] != null)
				{
					category.Id = int.Parse(Request.QueryString["id"].ToString());
                    result = category.Update(ref message);
                }
				else
				{
					category.Id = 0;
                    result = category.Insert(ref message);
                }
				if(result)
					Response.Redirect("Categories.aspx");
				else
				{
					lblMessage.Text = message;
				}

            }

        }
    }
}