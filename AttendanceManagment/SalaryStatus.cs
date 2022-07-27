using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public class QuerySalaryProcess
    {
        public string Salary_month { get; set; }
        public int Salary_year { get; set; }
    }
    public class SalaryStatus
    {
        public int SalaryID { get; set; }
        public int EmpCode { get; set; }       
        public int MedicalAllowance { get; set; }
        public int FoodAllowance { get; set; }
        public decimal HouseRent { get; set; }
        public int OthersAllowance { get; set; }
        public int AbsentDay { get; set; }
        public int PresentDay { get; set; }
        public int LeaveStatus { get; set; }
        public string Month { get; set; }
        public int Year { get; set; }
        public decimal Basic { get; set; }
    }
}