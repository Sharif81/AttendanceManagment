using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public class employeeInfo
    {
        public int EmpID { get; set; }       
        public string EmpName { get; set; }
        public string CardNo { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string Floor { get; set; }
        public string Line { get; set; }
        public decimal Gross { get; set; }
        public string DateOfJoin { get; set; }
        public string ResignDate { get; set; }
        public string BankAccount { get; set; }
        public string CompanyName { get; set; }
        public string EmpStatus { get; set; }
    }
}