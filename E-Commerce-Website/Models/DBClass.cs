using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce_Website.Models
{
	public class DBClass
	{
        string constr = "Data Source=localhost;Database=e_commerce_a;User ID=root;";

        public bool ExecuteNonQuery(string query, ref string message)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(constr);
                con.Open();
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return false;
            }
            return true;
        }

        public DataTable List(string query, ref string message)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(constr);
                MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                DataTable dtable = new DataTable();
                da.Fill(dtable);
                return dtable;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return null;
            }
            
        }

        public DataRow GetSingleRecord(string query, ref string message)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(constr);
                MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                DataTable dtable = new DataTable();
                da.Fill(dtable);
                if (dtable.Rows.Count > 0)
                       return dtable.Rows[0];
                else
                    return null;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return null;
            }

        }
    }
}