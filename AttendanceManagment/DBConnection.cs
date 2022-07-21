using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace AttendanceManagment
{
    public static class DBConnection
    {
        static string constring = ConfigurationManager.ConnectionStrings["AttendanceDB"].ConnectionString;

        public static string DataBaseConnection
        {
            get { return constring; }
        }
    }
}