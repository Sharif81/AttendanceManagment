using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public class LineTable
    {
        public int Rownum { get; set; }
        public int LineID { get; set; }
        public int FloorID { get; set; }
        public string FloorName { get; set; }
        public string LineName { get; set; }
    }
}