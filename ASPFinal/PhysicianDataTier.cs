using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ASPFinal
{
    public class PhysicianDataTier
    {
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);
        static System.Data.SqlClient.SqlCommand cmdString = new System.Data.SqlClient.SqlCommand();

        public DataSet getphysician(string phyid, string fname, string midint, string lname, string v, DateTime dateTime, string gender, string streetname, string city, Decimal zip, string docstate, string officephone, string personalphone, string workemail, string personalemail, string speciality, Decimal salary)
        {
            try
            {
                myConn.Open();   //open connection
                cmdString.Parameters.Clear();      //clear command argument
                //command
                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "getphysician";  //name of stored procedure
                //Define input parameter
                cmdString.Parameters.Add("@stud_ID", SqlDbType.VarChar, 6).Value = phyid;    //parameter names must match and in same
                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 25).Value = fname;
                cmdString.Parameters.Add("@midint", SqlDbType.VarChar, 1).Value = midint;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 25).Value = lname;
                cmdString.Parameters.Add("@dob", SqlDbType.DateTime).Value = dateTime;
                cmdString.Parameters.Add("@gender", SqlDbType.Char, 6).Value = gender;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 40).Value = streetname;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 40).Value = city;
                cmdString.Parameters.Add("@doc_state", SqlDbType.Char, 2).Value = docstate;
                cmdString.Parameters.Add("@zip", SqlDbType.Decimal, 5).Value = zip;
                cmdString.Parameters.Add("@office_phone", SqlDbType.NChar, 14).Value = officephone;
                cmdString.Parameters.Add("@personal_phone", SqlDbType.NChar, 14).Value = personalphone;
                cmdString.Parameters.Add("@work_email", SqlDbType.VarChar, 40).Value = workemail;
                cmdString.Parameters.Add("@personal_email", SqlDbType.VarChar, 40).Value = personalemail;
                cmdString.Parameters.Add("@speciality", SqlDbType.VarChar, 40).Value = speciality;
                cmdString.Parameters.Add("@salary", SqlDbType.Decimal, 8).Value = salary;
                //adapter and dataset
                SqlDataAdapter aAdapter = new SqlDataAdapter();
                aAdapter.SelectCommand = cmdString;
                DataSet aDataSet = new DataSet();
                // fill adapater
                aAdapter.Fill(aDataSet);
                //return dataSet
                return aDataSet;
            }
            catch (Exception ex)
            {
                throw new ArgumentException(ex.Message);
            }
            finally
            {
                myConn.Close();
            }

        }

        internal DataSet getphysician(string v1, string v2, string v3, string v4, string v5, string v6, string v7, string v8, string v9, DateTime dateTime, string v10, string v11, string v12, decimal v13, string v14, string v15, decimal v16)
        {
            throw new NotImplementedException();
        }

    }
}