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
			TblAdmin admin = new TblAdmin();
			DataTable dtable = admin.List();
			gvData.DataSource = dtable;
			gvData.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
			TblAdmin admin = new TblAdmin();
			admin.Id = 0;
			admin.Name = txtName.Text;
			admin.Username = txtUsername.Text;
			admin.Password = txtPasssword.Text;
			admin.Insert();
			txtName.Text = "";
			txtUsername.Text = "";
			txtPasssword.Text = "";
        }
    }
}