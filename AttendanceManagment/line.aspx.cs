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
    public partial class line : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetAllFloor();
            }
        }
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

    }
}