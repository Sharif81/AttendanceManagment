using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceManagment
{
   public partial class salary : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
     {
//            if (!Page.IsPostBack)
//            {
//                GetAllEmpCode();
//            }
       }
//        private void GetAllEmpCode()
//        {
//            SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
//            SqlCommand cmd = new SqlCommand("GetAllEmpCodeNumber", con);
//            cmd.CommandType = CommandType.StoredProcedure;
//            con.Open();
//            SqlDataReader rdr = cmd.ExecuteReader();
//            if (rdr.HasRows)
//            {
//                empcode.DataSource = rdr;
//                empcode.DataValueField = "PersonID";
//                empcode.DataTextField = "CardNo";
//                empcode.DataBind();
//                empcode.Items.Insert(0, new ListItem("SELECT EMPLOYEE CODE", "0"));
//            }
//            else
//            {
//                empcode.DataSource = null;
//                empcode.DataBind();
//                empcode.Items.Insert(0, new ListItem("SELECT EMPLOYEE CODE", "0"));
//            }
//        }
    }
}