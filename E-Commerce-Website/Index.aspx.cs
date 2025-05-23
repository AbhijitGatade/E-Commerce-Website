﻿using E_Commerce_Website.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Website
{
	public partial class Index : System.Web.UI.Page
	{
		string message;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				TblCategory category = new TblCategory();				
				DataTable dtCategories = category.List(ref message);
				rptCategories.DataSource = dtCategories;
                rptCategories.DataBind();
            }
		}
	}
}