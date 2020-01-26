using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ASPFinal
{
    public class PatientDataTier
    {
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);
        static System.Data.SqlClient.SqlCommand cmdString = new System.Data.SqlClient.SqlCommand();

        public DataSet getpatient(int patid, string fname, string midint, string lname, string v, DateTime dateTime, string gender, string streetname, string city, Decimal zip, string paitstate, string homephone, string cellphone, string email, string statementtype)
        {
            try
            {
                myConn.Open();   //open connection
                cmdString.Parameters.Clear();      //clear command argument
                //command
                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "Find_Paitent";  //name of stored procedure
                //Define input parameter
                cmdString.Parameters.Add("@patient_id", SqlDbType.Int).Value = patid;    //parameter names must match and in same
                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 25).Value = fname;
                cmdString.Parameters.Add("@midint", SqlDbType.VarChar, 1).Value = midint;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 25).Value = lname;
                cmdString.Parameters.Add("@dob", SqlDbType.DateTime).Value = dateTime;
                cmdString.Parameters.Add("@gender", SqlDbType.Char, 6).Value = gender;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 40).Value = streetname;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 40).Value = city;
                cmdString.Parameters.Add("@pait_state", SqlDbType.Char, 2).Value = paitstate;
                cmdString.Parameters.Add("@zip", SqlDbType.Decimal, 5).Value = zip;
                cmdString.Parameters.Add("@home_phone", SqlDbType.NChar, 14).Value = homephone;
                cmdString.Parameters.Add("@cell_phone", SqlDbType.NChar, 14).Value = cellphone;
                cmdString.Parameters.Add("@email", SqlDbType.VarChar, 60).Value = email;
                cmdString.Parameters.Add("@statementType", SqlDbType.NVarChar, 20).Value = statementtype;
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

        internal DataSet getpatient(string patid, string fname, string midint, string lname, string gender, DateTime dateTime, string streetname, string city, string paitstate, decimal zip, string homephone, string cellphone, string email, string statementtype)
        {
             String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
             SqlConnection myConn = new SqlConnection(connString);
             System.Data.SqlClient.SqlCommand cmdString = new System.Data.SqlClient.SqlCommand();

            try
            {
                myConn.Open();   //open connection
                cmdString.Parameters.Clear();      //clear command argument
                //command
                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "Find_Patient";  //name of stored procedure
                //Define input parameter
                cmdString.Parameters.Add("@patient_id", SqlDbType.Int).Value = patid;    //parameter names must match and in same
                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 25).Value = fname;
                cmdString.Parameters.Add("@midint", SqlDbType.VarChar, 1).Value = midint;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 25).Value = lname;
                cmdString.Parameters.Add("@dob", SqlDbType.Date).Value = dateTime;
                cmdString.Parameters.Add("@gender", SqlDbType.Char, 6).Value = gender;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 40).Value = streetname;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 40).Value = city;
                cmdString.Parameters.Add("@pait_state", SqlDbType.Char, 2).Value = paitstate;
                cmdString.Parameters.Add("@zip", SqlDbType.Decimal, 5).Value = zip;
                cmdString.Parameters.Add("@home_phone", SqlDbType.NChar, 14).Value = homephone;
                cmdString.Parameters.Add("@cell_phone", SqlDbType.NChar, 14).Value = cellphone;
                cmdString.Parameters.Add("@email", SqlDbType.VarChar, 60).Value = email;
                cmdString.Parameters.Add("@statementType", SqlDbType.NVarChar, 20).Value = statementtype;
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
    }
}