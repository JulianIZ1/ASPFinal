using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ASPFinal
{
    public class PaitentDataTier
    {
        static String connString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);
        static System.Data.SqlClient.SqlCommand cmdString = new System.Data.SqlClient.SqlCommand();

        public DataSet GetPaitent(string patientid, string fname, string MidInit, string lname, string gender, string street, string city, string state, string zip, string dob, string phone1, string phone2, string email, string phone, string statementType)
        {
            try
            {
                myConn.Open(); // Opens connection
                cmdString.Parameters.Clear();

                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "Patient_Procedures";

                cmdString.Parameters.Add("@patient_id", SqlDbType.Int).Value = patientid;
                cmdString.Parameters.Add("@fname", SqlDbType.VarChar, 25).Value = fname;
                cmdString.Parameters.Add("@midint", SqlDbType.VarChar, 1).Value = MidInit;
                cmdString.Parameters.Add("@lname", SqlDbType.VarChar, 25).Value = lname;
                cmdString.Parameters.Add("@gender", SqlDbType.Char, 6).Value = gender;
                cmdString.Parameters.Add("@dob", SqlDbType.DateTime).Value = dob;
                cmdString.Parameters.Add("@streetname", SqlDbType.VarChar, 40).Value = street;
                cmdString.Parameters.Add("@city", SqlDbType.VarChar, 60).Value = city;
                cmdString.Parameters.Add("@pait_state", SqlDbType.Char, 2).Value = state;
                cmdString.Parameters.Add(new SqlParameter("@zip", SqlDbType.Decimal) { Precision = 5, Scale = 0 }).Value = zip;
                cmdString.Parameters.Add("@home_phone", SqlDbType.NChar, 14).Value = phone1;
                cmdString.Parameters.Add("@cell_phone", SqlDbType.NChar, 14).Value = phone2;
                cmdString.Parameters.Add("@email", SqlDbType.VarChar, 60).Value = email;
                cmdString.Parameters.Add("@statmentType", SqlDbType.NVarChar, 20).Value = "Select";

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

        internal DataSet GetPaitent(string v1, string v2, string v3, string v4, string v5, string v6, string v7, string v8, string v9, string v10, string v11, string v12, string v13)
        {
            throw new NotImplementedException();
        }
    }
}