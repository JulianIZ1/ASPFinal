using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ASPFinal
{
    public class PaitentDataTier
    {
        static String connString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);
        static System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
    }
}