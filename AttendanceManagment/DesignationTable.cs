using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public class DesignationTable
    {
        public int Rownum { get; set; }
        public int Id { get; set; }
        public int Deptid { get; set; }
        public string DepartmentName { get; set; }
        public string DesignationName { get; set; }
    }
}