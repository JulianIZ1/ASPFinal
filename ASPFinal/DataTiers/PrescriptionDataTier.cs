﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace ASPFinal.DataTiers
{
    public class PrescriptionDataTier
    {
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);
        static System.Data.SqlClient.SqlCommand cmdString = new System.Data.SqlClient.SqlCommand();

        public static object DropDownList1 { get; private set; }

        public static DataSet AddPrescription(string rxnum, string medic, decimal amt, DateTime refill_date, string dosage, string intake, 
                                                string freq, int patid, int phyid)
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
                cmdString.CommandText = "Add_Prescription";

                // Parameters
                cmdString.Parameters.Add("@rx_number", SqlDbType.Char, 3).Value = rxnum;
                cmdString.Parameters.Add("@medication_name", SqlDbType.VarChar, 50).Value = medic;
                cmdString.Parameters.Add("@refill_amt", SqlDbType.Decimal).Value = amt;
                cmdString.Parameters.Add("@refill_date", SqlDbType.DateTime2, 7).Value = refill_date;
                cmdString.Parameters.Add("@dosage", SqlDbType.Char, 3).Value = dosage;
                cmdString.Parameters.Add("@intake_method", SqlDbType.VarChar, 250).Value = intake;
                cmdString.Parameters.Add("@frequency", SqlDbType.VarChar, 50).Value = freq;
                cmdString.Parameters.Add("@patient_id", SqlDbType.Int).Value = patid;
                cmdString.Parameters.Add("@physician_id", SqlDbType.Int).Value = phyid;

                // Adapter and Dataset
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = cmdString;
                cmdString.ExecuteNonQuery();
                return null;
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