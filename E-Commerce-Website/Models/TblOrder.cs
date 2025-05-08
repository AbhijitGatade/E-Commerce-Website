using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;

namespace E_Commerce_Website.Models
{
	public class TblOrder
	{
        public int Id { get; set; }
        public int UserId { get; set; }
        public DateTime OrderDate { get; set; }
        public float Total { get; set; }
        public DateTime CreatedOn { get; set; }
        public string PaymentMode { get; set; }
        public string PaymentStatus { get; set; }
        public string Status { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Landmark { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public int Pincode { get; set; }

        string query;
        DBClass db = new DBClass();

        public bool Insert(ref string message, DataTable dtOrderDetails)
        {
            query = "INSERT INTO orders(UserId, OrderDate, Total, CreatedOn, PaymentMode, PaymentStatus, Status, Name, Address, Landmark, City, State, Pincode) ";
            query += "VALUES(" + UserId + ", NOW(), " + Total + ", NOW(), 'Online', 'Unpaid', 'Unpaid', '" + Name + "', '" + Address + "', ";
            query += "'" + Landmark + "', '" + City + "', '" + State + "', " + Pincode + ")";
            bool result = db.ExecuteNonQuery(query, ref message);
            if(result)
            {
                query = "SELECT MAX(Id) AS MaxId FROM orders WHERE UserId = " + UserId;
                DataTable dtable = db.List(query, ref message);
                Id = int.Parse(dtable.Rows[0]["MaxId"].ToString());

                //Put data into orderdetails
                foreach (DataRow dr in dtOrderDetails.Rows)
                {
                    query = "INSERT INTO orderdetails(OrderId, ProductId, VarietyId, Price, Quantity, Total) ";
                    query += "VALUES(" +Id + ", " + dr["Id"] + ", 0, " + dr["Price"] + "," + dr["Quantity"] + ", " + dr["Total"] + ")";
                    db.ExecuteNonQuery(query, ref message);
                }
            }
            return true;
        }

        public bool MarkOrderPaid(int id)
        {
            string message = "";
            query = "UPDATE orders SET PaymentStatus = 'Paid', Status = 'New' WHERE Id = " + id;
            db.ExecuteNonQuery(query, ref message);
            return true;
        }

        public DataTable List(ref string message)
        {
            query = "SELECT * FROM orders WHERE PaymentStatus = 'Paid' ORDER BY Id DESC";
            return db.List(query, ref message);
        }

        public void GetById(int id)
        {
            string message = "";
            query = "SELECT * FROM orders WHERE Id = " + id;
            DataRow dr = db.GetSingleRecord(query, ref message);
            if (dr != null)
            {
                Id = int.Parse(dr["Id"].ToString());
                UserId = int.Parse(dr["UserId"].ToString());
                OrderDate = DateTime.Parse(dr["OrderDate"].ToString());
                Total = float.Parse(dr["Total"].ToString());
                CreatedOn = DateTime.Parse(dr["CreatedOn"].ToString());
                PaymentMode = dr["PaymentMode"].ToString();
                PaymentStatus = dr["PaymentStatus"].ToString();
                Status = dr["Status"].ToString();
                Name = dr["Name"].ToString();
                Address = dr["Address"].ToString();
                Landmark = dr["Landmark"].ToString();
                City = dr["City"].ToString();
                State = dr["State"].ToString();
                Pincode = int.Parse(dr["Pincode"].ToString());
            }
        }

        public DataTable GetOrderDetails(int id)
        {
            string message = "";
            query = "SELECT P.Name, OD.Quantity, OD.Price, OD.Total FROM orderdetails AS OD INNER JOIN products AS P ";
            query += "ON P.Id = OD.ProductId WHERE OD.OrderId = " + id;
            return db.List(query, ref message);
        }
    }
}