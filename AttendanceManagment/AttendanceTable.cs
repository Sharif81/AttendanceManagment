using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public class AttendanceTable    {
       
        public string AttDate { get; set; }
        public string EmpName { get; set; }
        public string CardNo { get; set; }
        public string Intime { get; set; }
        public string Outtime { get; set; }
        public string OT { get; set; }
        public string Status { get; set; }
    }
}