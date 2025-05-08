using E_Commerce_Website.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Website
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnRegister_Click(object sender, EventArgs e)
        {
			TblUser user = new TblUser();
			user.Name = txtRegName.Text;
			user.MobileNo = txtRegMobileNo.Text;
			user.Email = txtRegEmail.Text;
            user.Password = txtRegPassword.Text;
			string message = "";
			bool result = user.Register(ref message);
			if (result)
			{
				lblMessage.Text = "Registration Successful";
                lblMessage.ForeColor = System.Drawing.Color.Green;
			}
			else
			{
                lblMessage.Text = "Registration Failed:" + message;
				lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
			string email = txtEmail.Text;
			string password = txtPassword.Text;
			TblUser user = new TblUser();
			string message = "";
			bool result = user.GetUserByEmail(email, password, ref message);
			if (result)
			{
				Response.Cookies.Add(new HttpCookie("UserType", "User"));
                Response.Cookies.Add(new HttpCookie("UserId", user.Id.ToString()));
                Response.Cookies.Add(new HttpCookie("Name", user.Name.ToString()));
                Response.Cookies.Add(new HttpCookie("Email", user.Email.ToString()));
                Response.Redirect("Checkout.aspx");
			}
			else
			{
				lblMessage.Text = message;
				lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}