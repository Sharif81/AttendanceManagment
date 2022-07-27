using AttendanceManagment.Report;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceManagment
{
    public partial class salarysheetreport : System.Web.UI.Page
    {
        SalaryData s_data = new SalaryData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string q_month = SalaryMonth.SelectedItem.Value;
                int q_year = SalaryYear.SelectedItem.Value == "0" ? DateTime.Now.Year : Convert.ToInt32(SalaryYear.SelectedItem.Value);
                this.view_report(q_month, q_year);
            }
        }
        protected void show_salary_info_Click(object sender, EventArgs e)
        {
            string q_month = SalaryMonth.SelectedItem.Value;
            int q_year = SalaryYear.SelectedItem.Value == "0" ? DateTime.Now.Year : Convert.ToInt32(SalaryYear.SelectedItem.Value);
            view_report(q_month, q_year);
        }
        private void view_report(string month, int year)
        {

            SalaryData sd = Get_report_data(month, year);

            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.SizeToReportContent = true;
            ReportViewer1.Width = Unit.Percentage(100);

            ReportViewer1.Height = Unit.Percentage(100);
            ReportViewer1.ZoomMode = ZoomMode.Percent;
            ReportViewer1.ZoomPercent = 100;
            ReportViewer1.ShowZoomControl = true;
            ReportViewer1.BackColor = System.Drawing.Color.DeepSkyBlue;

            foreach (RenderingExtension extension in ReportViewer1.LocalReport.ListRenderingExtensions())
            {
                if (extension.Name == "IMAGE" || extension.Name == "WORD" || extension.Name == "Excel")
                {
                    FieldInfo fi = extension.GetType().GetField("m_isVisible", BindingFlags.Instance | BindingFlags.NonPublic);
                    fi.SetValue(extension, false);
                }
            }

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("SalarySheetData", sd.Tables[0]));
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report/SalaryTamplet.rdlc");

        }



        private SalaryData Get_report_data(string month, int year)
        {
            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllSalaryInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@month", SqlDbType.VarChar).Value = month;
                cmd.Parameters.Add("@year", SqlDbType.Int).Value = year;
                con.Open();
                try
                {
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(s_data, s_data.Salary_Sheet.ToString());
                    return s_data;
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }
    }
}