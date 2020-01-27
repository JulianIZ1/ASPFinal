using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;

namespace ASPFinal
{
    public class PatientDataTier
    {
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);
        static System.Data.SqlClient.SqlCommand cmdString = new System.Data.SqlClient.SqlCommand();

        //
        public static DataSet AddPatient(string fname, string midint, string lname, string gender, string street, string city,
                                     string state, decimal zip, DateTime dob, string home, string cell, string email)
        {
            try
            {
                // Open Connection
                myConn.Open();

                // Clears Commmand
                cmdString.Parameters.Clear();

                // Command
                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "Add_Paitent";

                // Parameters
                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 50).Value = fname;
                cmdString.Parameters.Add("@midint", SqlDbType.Char, 1).Value = midint;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 50).Value = lname;
                cmdString.Parameters.Add("@gender", SqlDbType.Char, 6).Value = gender;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 60).Value = street;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 60).Value = city;
                cmdString.Parameters.Add("@pait_state", SqlDbType.Char, 2).Value = state;
                cmdString.Parameters.Add("@zip", SqlDbType.Decimal).Value = zip;
                cmdString.Parameters.Add("@dob", SqlDbType.DateTime2, 7).Value = dob;
                cmdString.Parameters.Add("@home_phone", SqlDbType.NChar, 14).Value = home;
                cmdString.Parameters.Add("@cell_phone", SqlDbType.NChar, 14).Value = cell;
                cmdString.Parameters.Add("@email", SqlDbType.VarChar, 60).Value = email;

                // Adapter and Dataset
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmdString;
                cmdString.ExecuteNonQuery();
                return null;
            }
            catch(Exception Ex)
            {
                throw new Exception(Ex.Message);
            }
            finally
            {
                myConn.Close();
            }
        }

        // Serach the paitent
        public DataSet GetPatient(string patid, string fname, string midint, string lname, string gender, string street, string city,
                                     string state, decimal zip, DateTime dob, string home, string cell, string email)
        {
            try
            {
                myConn.Open();                                          // Open Connection Strings
                cmdString.Parameters.Clear();                           // Clears all the parameters
                cmdString.CommandType = CommandType.StoredProcedure;    // Uses stored procedure
                cmdString.CommandTimeout = 1500;                        // Timeout command
                cmdString.CommandText = "Find_Patient";                 // Uses this store procedure

                // Defines the input parameters
                cmdString.Parameters.Add("@patient_id", SqlDbType.Int).Value = patid;
                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 50).Value = fname;
                cmdString.Parameters.Add("@midint", SqlDbType.Char, 1).Value = midint;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 50).Value = lname;
                cmdString.Parameters.Add("@gender", SqlDbType.Char, 6).Value = gender;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 60).Value = street;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 60).Value = city;
                cmdString.Parameters.Add("@pait_state", SqlDbType.Char, 2).Value = state;
                cmdString.Parameters.Add("@zip", SqlDbType.Decimal).Value = zip;
                cmdString.Parameters.Add("@dob", SqlDbType.DateTime2, 7).Value = dob;
                cmdString.Parameters.Add("@home_phone", SqlDbType.NChar, 14).Value = home;
                cmdString.Parameters.Add("@cell_phone", SqlDbType.NChar, 14).Value = cell;
                cmdString.Parameters.Add("@email", SqlDbType.VarChar, 60).Value = email;
                //adapter and dataset
                SqlDataAdapter aAdapter = new SqlDataAdapter();
                aAdapter.SelectCommand = cmdString;
                DataSet aDataSet = new DataSet();
                // fill adapater
                aAdapter.Fill(aDataSet);
                //return dataSet
                return aDataSet;
            }
            catch(Exception Ex)
            {
                throw new Exception(Ex.Message, Ex.InnerException);
            }
            finally
            {
                myConn.Close(); 
            }


        }

        public DataSet ViewPatient(string fname, string lname, string street, string city,
                                     string state, decimal zip, DateTime dob)
        {
            try
            {
                myConn.Open();
                cmdString.Parameters.Clear();

                cmdString.Connection = myConn;
                cmdString.CommandText = connString;

                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "ViewPatient";


                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 50).Value = fname;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 50).Value = lname;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 60).Value = street;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 60).Value = city;
                cmdString.Parameters.Add("@pait_state", SqlDbType.Char, 2).Value = state;
                cmdString.Parameters.Add("@zip", SqlDbType.Decimal).Value = zip;
                cmdString.Parameters.Add("@dob", SqlDbType.DateTime2, 7).Value = dob;

                SqlDataAdapter dataAdapter = new SqlDataAdapter();
                dataAdapter.SelectCommand = cmdString;
                DataSet dataSet = new DataSet();

                dataAdapter.Fill(dataSet);

                return dataSet;
            }
            catch (Exception Ex)
            {
                throw new Exception(Ex.Message);
            }
            finally
            {
                myConn.Close();
            }
        }
    }
}