using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public class SalaryStatus
    {
        public int SalaryID { get; set; }
        public string EmpCode { get; set; }       
        public decimal MedicalAllowance { get; set; }
        public decimal FoodAllowance { get; set; }
        public decimal HouseRent { get; set; }
        public decimal OthersAllowance { get; set; }
        public int AbsentDay { get; set; }
        public int PresentDay { get; set; }
        public int LeaveStatus { get; set; }
    }
}