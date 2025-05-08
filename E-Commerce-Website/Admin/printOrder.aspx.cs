using E_Commerce_Website.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace E_Commerce_Website.Admin
{
	public partial class printOrder : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				bind();
			}
		}

		public void bind()
		{
			TblOrder order = new TblOrder();
			order.GetById(int.Parse(Request.QueryString["id"]));

			TblUser user = new TblUser();
			user.GetById(order.UserId);

            ReportParameter[] parms = new ReportParameter[4];
			parms[0] = new ReportParameter("pOrderId", order.Id.ToString());
            parms[1] = new ReportParameter("pOrderDate", order.OrderDate.ToString("dd/MM/yyyy"));
            parms[2] = new ReportParameter("pClientName", user.Name);
            parms[3] = new ReportParameter("pTotal", order.Total.ToString("#0.00"));

			DataTable dtOrderDetails = order.GetOrderDetails(order.Id);
            ReportDataSource datasource = new ReportDataSource("DataSet1", dtOrderDetails);
            rptInvoice.LocalReport.DataSources.Add(datasource);
            rptInvoice.ProcessingMode = ProcessingMode.Local;
            rptInvoice.LocalReport.ReportPath = Server.MapPath("~/Admin/rptInvoice.rdlc");
			rptInvoice.LocalReport.SetParameters(parms);
            rptInvoice.LocalReport.Refresh();
        }
	}
}