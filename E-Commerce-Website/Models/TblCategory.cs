using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce_Website.Models
{
	public class TblCategory
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public int SrNo { get; set; }

		string query;
		DBClass db = new DBClass();

		public bool Insert(ref string message)
		{
			query = "INSERT INTO categories(Name, SrNo) VALUES('" + Name + "', " + SrNo + ")";
			return db.ExecuteNonQuery(query, ref message);
		}

		public bool Update(ref string message)
		{
			query = "UPDATE categories SET Name = '" + Name + "', SrNo = " + SrNo + " WHERE Id = " + Id;
			return db.ExecuteNonQuery(query, ref message);
		}

        public bool Delete(int id, ref string message)
        {
            query = "DELETE FROM categories WHERE Id = " + id;
            return db.ExecuteNonQuery(query, ref message);
        }

		public DataTable List(ref string message)
		{
			query = "SELECT * FROM categories ORDER BY SrNo";
			return db.List(query, ref message);
		}

		public void GetById(int id, ref string message)
		{
			query = "SELECT * FROM categories WHERE Id = " + id;
			DataRow row = db.GetSingleRecord(query, ref message);
			if(row != null)
			{
				Id = int.Parse(row["Id"].ToString());
				Name = row["Name"].ToString();
                SrNo = int.Parse(row["SrNo"].ToString());
            }
		}
    }
}