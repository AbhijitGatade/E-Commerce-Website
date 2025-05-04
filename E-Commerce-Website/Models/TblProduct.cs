using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce_Website.Models
{
	public class TblProduct
	{
		public int Id { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public float MRP { get; set; }
        public float Price { get; set; }
        public string InStock { get; set; }
        public int SrNo { get; set; }

        string query;
        DBClass db = new DBClass();

        public bool Insert(ref string message)
        {
            query = "INSERT INTO products (CategoryId, Name, Description, ImagePath, MRP, Price, InStock, SrNo) ";
            query += "VALUES (" + CategoryId + ", '" + Name + "', '" + Description + "', '" + ImagePath + "', " + MRP + ", " + Price + ", '" + InStock + "', " + SrNo + ")";
            return db.ExecuteNonQuery(query, ref message);        
        }
        public bool Update(ref string message)
        {
            query = "UPDATE products SET CategoryId = " + CategoryId + ", Name = '" + Name + "', Description = '" + Description + "', ImagePath = '" + ImagePath + "', MRP = " + MRP + ", Price = " + Price + ", InStock = '" + InStock + "', SrNo = " + SrNo;
            query += " WHERE Id = " + Id;
            return db.ExecuteNonQuery(query, ref message);
        }

        public bool Delete(ref string message)
        {
            query = "DELETE FROM products WHERE Id = " + Id;
            return db.ExecuteNonQuery(query, ref message);
        }

        public DataTable List(ref string message)
        {
            query = "SELECT P.*, C.Name AS CategoryName FROM products AS P INNER JOIN categories AS C ON C.Id = P.CategoryId ";
            if (CategoryId != 0)
            {
                query += "WHERE CategoryId = " + CategoryId + " ";
            }
            query += "ORDER BY C.SrNo, P.SrNo";
            return db.List(query, ref message);
        }

        public void GetById(int id, ref string message)
        {
            query = "SELECT * FROM products WHERE Id = " + id;
            DataRow dr = db.GetSingleRecord(query, ref message);
            if(dr != null)
            {
                Id = int.Parse(dr["Id"].ToString());
                CategoryId = int.Parse(dr["CategoryId"].ToString());
                Name = dr["Name"].ToString();
                Description = dr["Description"].ToString();
                ImagePath = dr["ImagePath"].ToString();
                MRP = float.Parse(dr["MRP"].ToString());
                Price = float.Parse(dr["Price"].ToString());
                InStock = dr["InStock"].ToString();
                SrNo = int.Parse(dr["SrNo"].ToString());
            }
        }

    }
}