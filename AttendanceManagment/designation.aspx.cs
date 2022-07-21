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
    public partial class designation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAllDepartment();
            }
        }
        private void GetAllDepartment()
        {
            SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
            SqlCommand cmd = new SqlCommand("GetAllDepartmentID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                departmentname.DataSource = rdr;
                departmentname.DataValueField = "DepartmentID";
                departmentname.DataValueField = "DepartmentName";
                departmentname.DataBind();
                departmentname.Items.Insert(0, new ListItem("SELECT DEPARTMENT NAME", "0"));
            }
            else
            {
                departmentname.DataSource = null;
                departmentname.DataBind();
                departmentname.Items.Insert(0, new ListItem("SELECT DEPARTMENT NAME", "0"));
            }
        }
    }
}