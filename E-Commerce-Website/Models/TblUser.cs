using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce_Website.Models
{
	public class TblUser
	{
		public int Id { get; set; }
        public string Name { get; set; }
        public string MobileNo { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        string query;
        DBClass db = new DBClass();

        public bool Register(ref string message)
        {
            query = "INSERT INTO users(Name, MobileNo, Email, Password) ";
            query += "VALUES('" + Name + "', '" + MobileNo + "', '" + Email + "', '" + Password + "')";
            return db.ExecuteNonQuery(query, ref message);
        }

        public bool GetUserByEmail(string email, string password, ref string message)
        {
            query = "SELECT * FROM users WHERE Email = '" + email + "'";
            DataTable dtable = db.List(query, ref message);
            if(dtable.Rows.Count > 0)
            {
                string dbpassword = dtable.Rows[0]["Password"].ToString();
                if (password.Equals(dbpassword))
                {
                    Id = int.Parse(dtable.Rows[0]["Id"].ToString());
                    Name = dtable.Rows[0]["Name"].ToString();
                    Email = dtable.Rows[0]["Email"].ToString();
                    return true;
                }
                else
                {
                    message = "Invalid Password.";
                    return false;
                }

            }
            message = "Email doesn't exist";
            return false;

        }

        public void GetById(int id)
        {
            query = "SELECT * FROM users WHERE Id = " + id;
            string message = "";
            DataTable dtable = db.List(query, ref message);
            if (dtable.Rows.Count > 0)
            {
                Id = int.Parse(dtable.Rows[0]["Id"].ToString());
                Name = dtable.Rows[0]["Name"].ToString();
                MobileNo = dtable.Rows[0]["MobileNo"].ToString();
                Email = dtable.Rows[0]["Email"].ToString();
            }
        }

    }
}