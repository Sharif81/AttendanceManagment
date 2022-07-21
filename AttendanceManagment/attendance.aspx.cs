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
    public partial class attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAllEmpName();
                //GetAllEmpCode();
            }

        }

        #region Get All Employee Name
        private void GetAllEmpName()
        {
            SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
            SqlCommand cmd = new SqlCommand("GetAllEmpCodeNumberAndName", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                empname.DataSource = rdr;
                empname.DataValueField = "PersonID";
                empname.DataTextField = "EmpName";
                empname.DataBind();
                empname.Items.Insert(0, new ListItem("SELECT EMPLOYEE NAME", "0"));
            }
            else
            {
                empname.DataSource = null;
                empname.DataBind();
                empname.Items.Insert(0, new ListItem("SELECT EMPLOYEE NAME", "0"));
            }
        }

        #endregion


        //private void GetAllEmpCode()
        //{
        //    SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
        //    SqlCommand cmd = new SqlCommand("GetAllEmpCodeNumber", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    con.Open();
        //    SqlDataReader rdr = cmd.ExecuteReader();
        //    if (rdr.HasRows)
        //    {
        //        empcode.DataSource = rdr;
        //        empcode.DataValueField = "PersonID";
        //        empcode.DataTextField = "CardNo";
        //        empcode.DataBind();
        //        empcode.Items.Insert(0, new ListItem("SELECT EMPLOYEE CODE", "0"));
        //    }
        //    else
        //    {
        //        empcode.DataSource = null;
        //        empcode.DataBind();
        //        empcode.Items.Insert(0, new ListItem("SELECT EMPLOYEE CODE", "0"));
        //    }
        //}



    }
}