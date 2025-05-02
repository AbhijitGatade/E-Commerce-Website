using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

namespace E_Commerce_Website.Models
{
	public class TblAdmin
	{   
        public int Id { get; set; }
        public string  Name { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        DBClass db = new DBClass();
        string query;

        public bool Insert(ref string message)
        {
            query = "INSERT INTO admins(Name, Username, Password) ";
            query += "VALUES('" + Name + "', '" + Username + "', '" + Password + "')";
            return db.ExecuteNonQuery(query, ref message);
        }

        public bool Update(ref string message)
        {
            query = "UPDATE admins SET  Name = '" + Name + "', ";
            query += "Username = '" + Username + "', ";
            query += "Password = '" + Password + "' ";
            query += "WHERE Id = " + Id;
            return db.ExecuteNonQuery(query, ref message);
        }

        public DataTable List(ref string message)
        {
            string query = "SELECT *, ROW_NUMBER() OVER(ORDER BY Name) AS SrNo FROM admins ORDER BY Name";
            DataTable dtable = db.List(query, ref message   );
            return dtable;
        }

        public bool Delete(int id, ref string message)
        {
            query = "DELETE FROM admins WHERE Id = " + id;
            return db.ExecuteNonQuery(query, ref message);
        }

        public void GetById(int id, ref string message)
        {
            string query = "SELECT * FROM Admins WHERE Id = " + id;
           DataRow row = db.GetSingleRecord(query, ref message);
            if (row != null)
            {
                Id = int.Parse(row["Id"].ToString());
                Name = row["Name"].ToString();
                Username = row["Username"].ToString();
                Password = row["Password"].ToString();
            }
        }
    }
}