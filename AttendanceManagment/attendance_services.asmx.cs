using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace AttendanceManagment
{
    /// <summary>
    /// Summary description for attendance_services
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class attendance_services : System.Web.Services.WebService
    {
        JavaScriptSerializer js = new JavaScriptSerializer();

        #region CompanyInfo
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void InsetAndUpdate_CompanyInfo(string insertObject)
        {
            CompanyInfo companyData = JsonConvert.DeserializeObject<CompanyInfo>(insertObject);

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertAndUpdateCompanyInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = companyData.CompanyID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@companyid", SqlDbType.Int).Value = companyData.CompanyID;
                cmd.Parameters.Add("@companyname", SqlDbType.VarChar).Value = companyData.CompanyName;
                cmd.Parameters.Add("@companyaddress", SqlDbType.VarChar).Value = companyData.CompanyAddress;
                cmd.Parameters.Add("companylogo", SqlDbType.VarChar).Value = companyData.CompanyLogo;
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write(js.Serialize("Inserted"));
                }
                else
                {
                    Context.Response.Write(js.Serialize("Invalid"));
                }
            }
        }
        #endregion

        #region Company Info Table
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]
        
        public void GetCompanyTableInfo()
        {
            List<CompanyTable> listdata = new List<CompanyTable>();

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllCompanyInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    CompanyTable obj = new CompanyTable();
                    obj.CompanyID = Convert.ToInt32(rdr["CompanyID"]);
                    obj.CompanyName = rdr["CompanyName"].ToString();
                    obj.CompanyLogo = rdr["CompanyLogo"].ToString();
                    obj.CompanyAddress = rdr["CompanyAddress"].ToString();
                    listdata.Add(obj);
                }
            }
            Context.Response.Write(js.Serialize(listdata));
        }
        #endregion

        #region Department Info
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void InsertUpdate_DepartmentInfo(string insertObject)
        {
            DepartmentInfo deparmentData = JsonConvert.DeserializeObject<DepartmentInfo>(insertObject);           

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateDepartmentInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = deparmentData.DepartmentID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@departmentid", SqlDbType.Int).Value = deparmentData.DepartmentID;
                cmd.Parameters.Add("@departmentname", SqlDbType.VarChar).Value = deparmentData.DepartmentName;
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write("Inserted");
                }
                else
                {
                    Context.Response.Write("Invalid");
                }
            }
         
        }
        #endregion 

        #region DepartmentTableInfo
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        
        public void GetDepartmentTableInfo()
        {
            List<DepartmentTable> listdata = new List<DepartmentTable>();

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllDepartmentInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DepartmentTable obj = new DepartmentTable();
                    obj.DepartmentID = Convert.ToInt32(rdr["DepartmentID"]);
                    obj.DepartmentName = rdr["DepartmentName"].ToString();
                    listdata.Add(obj);
                    
                }
            }
            Context.Response.Write(js.Serialize(listdata));
        }

        #endregion


        #region Delete Department
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public void DeletedDepartment(int deptid)
        {
            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("DeleteDepartmentInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = deptid;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write(js.Serialize("Deleted"));
                }
                else
                {
                    Context.Response.Write(js.Serialize("Invalid"));
                }
            }
        }


        #endregion

        #region Designation Info
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]
        
        public void InsertUpdate_DesignationInfo(string insertObject)
        {
            DesignationInfo designationData = JsonConvert.DeserializeObject<DesignationInfo>(insertObject);

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateDesignationInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = designationData.DesignationID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@departmentid", SqlDbType.Int).Value = designationData.DepartmentID;
                cmd.Parameters.Add("@designationid", SqlDbType.Int).Value = designationData.DesignationID;
                cmd.Parameters.Add("@designationname", SqlDbType.VarChar).Value = designationData.DesignationName;
                con.Open();
                if(cmd.ExecuteNonQuery()> 0)
                {
                    Context.Response.Write("Inserted");
                }
                else
                {
                    Context.Response.Write("Invalid");
                }
            }
        }
        #endregion

        #region Designation DataTable
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void GetDepartmentAndDesignationInfo(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
        {
            int filteredCount = 0;

            List<DesignationTable> listdata = new List<DesignationTable>();

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetDepartmentAndDesignationInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DisplayLength", SqlDbType.Int).Value = iDisplayLength;
                cmd.Parameters.Add("@DisplayStart", SqlDbType.Int).Value = iDisplayStart;
                cmd.Parameters.Add("@SortCol", SqlDbType.Int).Value = iSortCol_0;
                cmd.Parameters.Add("@SortDir", SqlDbType.VarChar).Value = sSortDir_0;
                cmd.Parameters.Add("@Search", SqlDbType.VarChar).Value = sSearch;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DesignationTable obj = new DesignationTable();
                    obj.Rownum = Convert.ToInt32(rdr["Rownum"]);
                    filteredCount = Convert.ToInt32(rdr["Totalcount"]);
                    obj.Id = Convert.ToInt32(rdr["Id"]);
                    obj.Deptid = Convert.ToInt32(rdr["Deptid"]);
                    obj.DepartmentName = rdr["DepartmentName"].ToString();
                    obj.DesignationName = rdr["DesignationName"].ToString();
                    listdata.Add(obj);
                }
            }
            string query = "select count(*) from DesignationInfo";
            var result = new
            {
                iTotalRecords = filteredCount, //GetTotalcount(query),
                iTotalDisplayRecords = filteredCount,
                aaData = listdata
            };
            Context.Response.Write(js.Serialize(result));
        }


        //private int GetTotalcount(string query)
        //{
        //    int record = 0;
        //    using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
        //    {
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        con.Open();
        //        record = (int)cmd.ExecuteScalar();
        //    }
        //    return record;
        //}

        #endregion

        #region FloorInfo
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void InsertUpdate_FloorInfo(string insertObject)
        {
            FoorInfo floordata = JsonConvert.DeserializeObject<FoorInfo>(insertObject);   

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateFloorInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = floordata.FloorID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@floorid", SqlDbType.Int).Value = floordata.FloorID;
                cmd.Parameters.Add("@floorname", SqlDbType.VarChar).Value = floordata.FloorName;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write("inserted");
                }
                else
                {
                    Context.Response.Write("invalid");
                }
            }
        }
        #endregion

        #region Delete FloorId
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public void DeletedFloorId(int floorid)
        {
            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("DeleteFloorInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = floorid;
                con.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write(js.Serialize("Deleted"));
                }
                else
                {
                    Context.Response.Write(js.Serialize("Invalid"));
                }
            }
        }
        #endregion

        #region Line Info
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void InsertUpdate_LineInfo(string insertObject)
        {
            LineInfo linedata = JsonConvert.DeserializeObject<LineInfo>(insertObject);

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateLineInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = linedata.LineID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@lineid", SqlDbType.Int).Value = linedata.LineID;
                cmd.Parameters.Add("@floorid", SqlDbType.Int).Value = linedata.FloorID;
                cmd.Parameters.Add("@linename", SqlDbType.VarChar).Value = linedata.LineName;
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write("inserted");
                }
                else
                {
                    Context.Response.Write("invalid");
                }
                
             }
        }

        #endregion

        #region Person Info
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void InsertUpdate_PersonInfo(string insertObject)
        {
            personInfo personData = JsonConvert.DeserializeObject<personInfo>(insertObject);

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdatePersonInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = personData.PersonID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@personid", SqlDbType.VarChar).Value = personData.PersonID;
                cmd.Parameters.Add("@personname", SqlDbType.VarChar).Value = personData.EmployeeName;
                cmd.Parameters.Add("@dateofbirth", SqlDbType.VarChar).Value = personData.DateOfBirth;
                cmd.Parameters.Add("@fathername", SqlDbType.VarChar).Value = personData.FatherName;
                cmd.Parameters.Add("@mothername", SqlDbType.VarChar).Value = personData.MotherName;
                cmd.Parameters.Add("@bloodgroup", SqlDbType.VarChar).Value = personData.BloodGroup;
                cmd.Parameters.Add("@metrialstatus", SqlDbType.VarChar).Value = personData.MaterialStatus;
                cmd.Parameters.Add("@religion", SqlDbType.VarChar).Value = personData.Religion;
                cmd.Parameters.Add("@nationalid", SqlDbType.VarChar).Value = personData.NationalID;
                cmd.Parameters.Add("@contact", SqlDbType.VarChar).Value = personData.ContactNo;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = personData.Email;
                cmd.Parameters.Add("@gender", SqlDbType.VarChar).Value = personData.Gender;
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write("inserted");
                }
                else
                {
                    Context.Response.Write("invalid");
                }
            }
        }
        #endregion

        #region Deleted PersonInfo

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void DeletedPersonInfo(int PersonID)
        {
            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("DeletePersonInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = PersonID;
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write(js.Serialize("Deleted"));
                }
                else
                {
                    Context.Response.Write(js.Serialize("Invalid"));
                }
            }
        }
        #endregion

        #region Designation Name by Department ID
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void GetAllDesignationName_ByDepartmentID(int deptid)
        {
            List<DesignationInfo> listdata = new List<DesignationInfo>();
            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetDesignationByDepartmentID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = deptid;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DesignationInfo obj = new DesignationInfo();
                    obj.DesignationID = Convert.ToInt32(rdr["DesignationID"]);
                    obj.DesignationName = rdr["DesignationName"].ToString();
                    listdata.Add(obj);
                }
                
            }
            Context.Response.Write(js.Serialize(listdata));
        }

        #endregion

        #region Get Line ID for Floor ID
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]
        public void GetAllLine_ByFloorID(int floorID)
        {
            List<LineInfo> linedata = new List<LineInfo>();

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetLineByFloorID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = floorID;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    LineInfo obj = new LineInfo();
                    obj.LineID = Convert.ToInt32(rdr["LineID"]);
                    obj.LineName = rdr["LineName"].ToString();
                    linedata.Add(obj);
                }
            }
            Context.Response.Write(js.Serialize(linedata));
        }
        #endregion


        #region employee information
        [WebMethod]
       [ScriptMethod (ResponseFormat = ResponseFormat.Json)]
       
       public void InsertUpdate_EmployeeInfo(string insertObject)
        {
            employeeInfo empdata = JsonConvert.DeserializeObject<employeeInfo>(insertObject);

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateEmployeeInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = empdata.EmpID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@personid", SqlDbType.Int).Value = empdata.EmpName;
                cmd.Parameters.Add("@companyid", SqlDbType.Int).Value = empdata.CompanyName;
                cmd.Parameters.Add("@designationid", SqlDbType.Int).Value = empdata.Designation;
                cmd.Parameters.Add("@floorid", SqlDbType.Int).Value = empdata.Floor;
                cmd.Parameters.Add("@lineid", SqlDbType.Int).Value = empdata.Line;
                cmd.Parameters.Add("@cardno", SqlDbType.VarChar).Value = empdata.CardNo;
                cmd.Parameters.Add("@dateofjoin", SqlDbType.VarChar).Value = empdata.DateOfJoin;
                cmd.Parameters.Add("@resigndate", SqlDbType.VarChar).Value = empdata.ResignDate;
                cmd.Parameters.Add("@bankaccount", SqlDbType.VarChar).Value = empdata.BankAccount;
                cmd.Parameters.Add("@GrossSalary", SqlDbType.Decimal).Value = empdata.Gross;
                cmd.Parameters.Add("@empstatus", SqlDbType.VarChar).Value = empdata.EmpStatus;
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write("Inserted");
                }
                else
                {
                    Context.Response.Write("Invalid");
                }
            }
        }

        #endregion


        #region employee table

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void Get_EmployeeInfoTable()
        {
            List<employeeInfo> empdata = new List<employeeInfo>();

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllEmployeeInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    employeeInfo obj = new employeeInfo();
                    obj.EmpName = rdr["PersonName"].ToString();
                    obj.CardNo = rdr["CardNo"].ToString();
                    obj.Department = rdr["DepartmentName"].ToString();
                    obj.Designation = rdr["DesignationName"].ToString();
                    obj.Floor = rdr["FloorName"].ToString();
                    obj.Line = rdr["LineName"].ToString();
                    obj.Gross = Convert.ToDecimal(rdr["GrossSalary"]);
                    obj.DateOfJoin = rdr["DateOfJoin"].ToString();
                    obj.ResignDate = rdr["RegisnDate"].ToString();
                    obj.BankAccount = rdr["BankAccount"].ToString();
                    obj.CompanyName = rdr["CompanyName"].ToString();
                    obj.EmpStatus = rdr["EmpStatus"].ToString();
                    empdata.Add(obj);
                }

            }
            Context.Response.Write(js.Serialize(empdata));
        }


        #endregion


        #region Attendance Information

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void Insert_Update_AttendanceInfo(string insertObject)
        {
            AttClass attData = JsonConvert.DeserializeObject<AttClass>(insertObject);

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateAttendanceInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = attData.AttID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@attid", SqlDbType.Int).Value = attData.AttID;
                cmd.Parameters.Add("@personid", SqlDbType.Int).Value = attData.EmpName;
                cmd.Parameters.Add("@attdate", SqlDbType.VarChar).Value = attData.AttDate;
                cmd.Parameters.Add("@intime", SqlDbType.VarChar).Value = attData.Intime;
                cmd.Parameters.Add("@outtime", SqlDbType.VarChar).Value = attData.Outtime;
                cmd.Parameters.Add("@ot", SqlDbType.VarChar).Value = 0;
                cmd.Parameters.Add("@attstatus", SqlDbType.VarChar).Value = attData.Intime == "" ? "A" : "P";                
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Context.Response.Write("Inserted");
                }
                else
                {
                    Context.Response.Write("Invalid");
                }
            }
        }

        #endregion

        #region Salary Status Info

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Process_Salary(string salaryobj)
        {
            int salary_for = 0;
            QuerySalaryProcess qobj = JsonConvert.DeserializeObject<QuerySalaryProcess>(salaryobj);

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetProcessMonthlySalary", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@month", SqlDbType.VarChar).Value = qobj.Salary_month;
                cmd.Parameters.Add("@year", SqlDbType.Int).Value = qobj.Salary_year;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    SalaryStatus obj = new SalaryStatus();
                    obj.SalaryID = 0;
                    obj.EmpCode = Convert.ToInt32(rdr["PersonID"]);
                    obj.MedicalAllowance = Convert.ToInt32(rdr["Medical"]);
                    obj.FoodAllowance = Convert.ToInt32(rdr["Food"]);
                    obj.HouseRent = Convert.ToDecimal(rdr["HouseRent"]);
                    obj.Basic = Convert.ToDecimal(rdr["Basic_salary"]);
                    obj.OthersAllowance = 0;
                    obj.AbsentDay = Convert.ToInt32(rdr["emp_absent"]);
                    obj.PresentDay = Convert.ToInt32(rdr["emp_present"]);
                    obj.LeaveStatus = Convert.ToInt32(rdr["emp_leave"]);
                    obj.Year = Convert.ToInt32(rdr["Salary_year"]);
                    obj.Month = rdr["Salary_month"].ToString();

                    salary_for+= Insert_Update_SalaryInfo(obj);
                }
            }

            Context.Response.Write(js.Serialize(salary_for));

        }
        

        private int Insert_Update_SalaryInfo(SalaryStatus obj)
        {
            int row_count = 0;
            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("InsertUpdateSalaryInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@cmdtype", SqlDbType.VarChar).Value = obj.SalaryID == 0 ? "NEW" : "UPDATE";
                cmd.Parameters.Add("@salaryid", SqlDbType.Int).Value = obj.SalaryID;
                cmd.Parameters.Add("@personid", SqlDbType.Int).Value = obj.EmpCode;
                cmd.Parameters.Add("@medicalallowance", SqlDbType.Int).Value = obj.MedicalAllowance;
                cmd.Parameters.Add("@foodallowance", SqlDbType.Int).Value = obj.FoodAllowance;
                cmd.Parameters.Add("@houserent", SqlDbType.Decimal).Value = obj.HouseRent;
                cmd.Parameters.Add("@othersallowance", SqlDbType.Int).Value = obj.OthersAllowance;
                cmd.Parameters.Add("@absentday", SqlDbType.Int).Value = obj.AbsentDay;
                cmd.Parameters.Add("@presentday", SqlDbType.Int).Value = obj.PresentDay;
                cmd.Parameters.Add("@leavestatus", SqlDbType.Int).Value = obj.LeaveStatus;
                cmd.Parameters.Add("@month", SqlDbType.VarChar).Value = obj.Month;
                cmd.Parameters.Add("@year", SqlDbType.Int).Value = obj.Year;
                cmd.Parameters.Add("@basic", SqlDbType.Decimal).Value = obj.Basic;
                con.Open();
                row_count = cmd.ExecuteNonQuery();
            }
            return row_count;

        }
        #endregion


        #region Person Table
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void Get_PersonInfo()
        {
            List<personInfo> persondata = new List<personInfo>();

            using (SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllPersonInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    personInfo obj = new personInfo();
                    obj.PersonID = Convert.ToInt32(rdr["PersonID"]);
                    obj.EmployeeName = rdr["PersonName"].ToString();
                    obj.FatherName = rdr["FatherName"].ToString();
                    obj.MotherName = rdr["MotherName"].ToString();
                    obj.DateOfBirth = rdr["DateOfBirth"].ToString();
                    obj.MaterialStatus = rdr["MetrialStatus"].ToString();
                    obj.Religion = rdr["Religion"].ToString();
                    obj.Gender = rdr["Gender"].ToString();
                    obj.NationalID = rdr["NationalID"].ToString();
                    obj.ContactNo = rdr["Contact"].ToString();
                    obj.Email = rdr["Email"].ToString();
                    obj.BloodGroup = rdr["BloodGroup"].ToString();
                    persondata.Add(obj);
                }               
            }

            Context.Response.Write(js.Serialize(persondata));
        }

        #endregion

        #region Attendance Info
        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void Get_All_AttendanceInfo()
        {
            List<AttendanceTable> attData = new List<AttendanceTable>();

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllAttendanceInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    AttendanceTable obj = new AttendanceTable();
                    obj.AttDate = rdr["AttDate"].ToString();
                    obj.EmpName = rdr["PersonName"].ToString();
                    obj.CardNo = rdr["CardNo"].ToString();
                    obj.Intime = rdr["Intime"].ToString();
                    obj.Outtime = rdr["Outtime"].ToString();
                    obj.OT = rdr["OT"].ToString();
                    obj.Status = rdr["AttStatus"].ToString();
                    attData.Add(obj);
                }
            }
            Context.Response.Write(js.Serialize(attData));
        }

        #endregion


        #region Floor Data Table

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void Get_floorInfo(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
        {
            int filteredCount = 0;

            List<FoorInfo> floordata = new List<FoorInfo>();

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllFloorInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DisplayLength", SqlDbType.Int).Value = iDisplayLength;
                cmd.Parameters.Add("@DisplayStart", SqlDbType.Int).Value = iDisplayStart;
                cmd.Parameters.Add("@SortCol", SqlDbType.Int).Value = iSortCol_0;
                cmd.Parameters.Add("@SortDir", SqlDbType.VarChar).Value = sSortDir_0;
                cmd.Parameters.Add("@Search", SqlDbType.VarChar).Value = sSearch;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    FoorInfo obj = new FoorInfo();
                    obj.Rownum = Convert.ToInt32(rdr["Rownum"]);
                    filteredCount = Convert.ToInt32(rdr["Totalcount"]);
                    obj.FloorID = Convert.ToInt32(rdr["FloorID"]);
                    obj.FloorName = (rdr["FloorName"]).ToString();                                       
                    floordata.Add(obj);
                }
            }
            string query = "select (*) from FloorInfo";
            var result = new
            {
                iTotalRecords = filteredCount, //GetTotalcount(query),
                iTotalDisplayRecords = filteredCount,
                aaData = floordata
            };
            Context.Response.Write(js.Serialize(result));
        }
        #endregion

        #region Line Table

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]

        public void Get_LineTableInfo(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
        {
            int filteredCount = 0;

            List<LineTable> linedata = new List<LineTable>();

            using(SqlConnection con = new SqlConnection(DBConnection.DataBaseConnection))
            {
                SqlCommand cmd = new SqlCommand("GetAllLineInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DisplayLength", SqlDbType.Int).Value = iDisplayLength;
                cmd.Parameters.Add("@DisplayStart", SqlDbType.Int).Value = iDisplayStart;
                cmd.Parameters.Add("@SortCol", SqlDbType.Int).Value = iSortCol_0;
                cmd.Parameters.Add("@SortDir", SqlDbType.VarChar).Value = sSortDir_0;
                cmd.Parameters.Add("@Search", SqlDbType.VarChar).Value = sSearch;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read()){

                    LineTable obj = new LineTable();
                    obj.Rownum = Convert.ToInt32(rdr["Rownum"]);
                    filteredCount = Convert.ToInt32(rdr["Totalcount"]);
                    obj.LineID = Convert.ToInt32(rdr["LineID"]);
                    obj.FloorID = Convert.ToInt32(rdr["FloorID"]);
                    obj.FloorName = (rdr["FloorName"]).ToString();
                    obj.LineName = rdr["LineName"].ToString();
                    linedata.Add(obj);
                }
                
            }

            string query = "select (*) from FloorInfo";
            var result = new
            {
                iTotalRecords = filteredCount, //GetTotalcount(query),
                iTotalDisplayRecords = filteredCount,
                aaData = linedata
            };
            Context.Response.Write(js.Serialize(result));
        }

        #endregion


    }

}
