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
        string constr = "Data Source=localhost;Database=e_commerce_a;User ID=root;";
        public int Id { get; set; }
        public string  Name { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public bool Insert()
        {
            string query = "INSERT INTO admins(Name, Username, Password) ";
            query += "VALUES('" + Name + "', '" + Username + "', '" + Password + "')";
            MySqlConnection con = new MySqlConnection(constr);
            con.Open();
            MySqlCommand cmd = new MySqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            return true;
        }

        public DataTable List()
        {
            string query = "SELECT *, ROW_NUMBER() OVER(ORDER BY Name) AS SrNo FROM admins ORDER BY Name";
            MySqlConnection con = new MySqlConnection(constr);
            MySqlDataAdapter da = new MySqlDataAdapter(query, con);
            DataTable dtable = new DataTable();
            da.Fill(dtable);
            return dtable;
        }
    }
}