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
	public partial class Admins : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.QueryString["action"] != null)
				{
					string action = Request.QueryString["action"].ToString();
					if (action.Equals("delete"))
					{
						TblAdmin admin = new TblAdmin();
						int id = int.Parse(Request.QueryString["id"].ToString());
						string message = "";
						if (admin.Delete(id, ref message))
						{
							Response.Redirect("Admins.aspx");
						}
						else
						{

						}
					}
					if(action.Equals("edit"))
					{
						TblAdmin admin = new TblAdmin();
						int id = int.Parse(Request.QueryString["id"].ToString());
						string message = "";
						admin.GetById(id, ref message);
						txtName.Text = admin.Name;
                        txtUsername.Text = admin.Username;
                        txtPasssword.Text = admin.Password;
                    }
				}
				bind();
			}
			
        }

		public void bind()
		{
			string message = "";
            TblAdmin admin = new TblAdmin();
            DataTable dtable = admin.List(ref message);
            gvData.DataSource = dtable;
            gvData.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
			if (validateName.IsValid && validateUsername.IsValid && validatePassword.IsValid)
			{
				TblAdmin admin = new TblAdmin();
				admin.Id = 0;
				admin.Name = txtName.Text.Replace("'", "''");
				admin.Username = txtUsername.Text.Replace("'", "''");
                admin.Password = txtPasssword.Text.Replace("'", "''");
				string message = "";
				bool result = true;
                if (Request.QueryString["action"] != null)
				{
					admin.Id = int.Parse(Request.QueryString["id"].ToString());
					result = admin.Update(ref message);
				}
				else
				{
                    result = admin.Insert(ref message);
                }
				if (result)
				{
					Response.Redirect("Admins.aspx");
				}
				else
				{
					lblMessage.Text = message;
				}
			}
        }
    }
}