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
    public partial class employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAllEmpName();
                GetAllDepartment();
                GetAllFloor();
                GetAllCompnayIno();
            }
        }

        #region emp name
        private void GetAllEmpName()
        {
            SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
            SqlCommand cmd = new SqlCommand("GetAllPersonID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                empname.DataSource = rdr;
                empname.DataValueField = "PersonID";
                empname.DataTextField = "PersonName";
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



        #region Department name
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
                departmentname.DataTextField = "DepartmentName";
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

        #endregion


        #region floorname
        private void GetAllFloor()
        {
            SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
            SqlCommand cmd = new SqlCommand("GetAllFloorID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                floorname.DataSource = rdr;
                floorname.DataValueField = "FloorID";
                floorname.DataTextField = "FloorName";
                floorname.DataBind();
                floorname.Items.Insert(0, new ListItem("SELECT FLOOR NAME", "0"));
            }
            else
            {
                floorname.DataSource = null;
                floorname.DataBind();
                floorname.Items.Insert(0, new ListItem("SELECT FLOOR NAME", "0"));
            }
        }

        #endregion


        #region Company Name
        
        private void GetAllCompnayIno()
        {
            SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection);
            SqlCommand cmd = new SqlCommand("GetAllCompnayByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                companyname.DataSource = rdr;
                companyname.DataValueField = "CompanyID";
                companyname.DataTextField = "CompanyName";
                companyname.DataBind();
                companyname.Items.Insert(0, new ListItem("SELECT COMPNAY NAME", "0"));

            }
            else
            {
                companyname.DataSource = null;
                companyname.DataBind();
                companyname.Items.Insert(0, new ListItem("SELECT COMPANY NAME", "0"));
            }
        }

        #endregion








    }
}