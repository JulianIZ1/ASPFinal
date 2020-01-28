using System;
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
        public DataSet ViewPrescription(string precid)
        {
            try
            {
                myConn.Open();   //open connection
                cmdString.Parameters.Clear();      //clear command argument
                //command
                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "Search_Prescription";  //name of stored procedure
                //Define input parameters
                cmdString.Parameters.Add("@PrescriptionID", SqlDbType.VarChar, 25).Value = precid;
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
        public DataSet getprescription(Int32 precid)
        {
            try
            {
                myConn.Open();   //open connection
                cmdString.Parameters.Clear();      //clear command argument
                //command
                cmdString.Connection = myConn;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "find_prescription";  //name of stored procedure
                //Define input parameter
                cmdString.Parameters.Add("@prescription_id", SqlDbType.Int).Value = precid;    //parameter names must match and in same
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
        public DataSet DeletePrescription(string precid)
        {
            try
            {
                //open connection
                myConn.Open();
                //Clear command argument
                cmdString.Parameters.Clear();
                //command
                cmdString.Connection = myConn;
                cmdString.CommandText = connString;
                cmdString.CommandType = CommandType.StoredProcedure;
                cmdString.CommandTimeout = 1500;
                cmdString.CommandText = "Delete_Prescription";

                //define input parameters
                cmdString.Parameters.Add("@Prescription_id", SqlDbType.Int).Value = precid;

                //adapter and dataset
                SqlDataAdapter aAdapter = new SqlDataAdapter();
                aAdapter.SelectCommand = cmdString;
                DataSet aDataSet = new DataSet();

                //filladapter
                aAdapter.Fill(aDataSet);
                //return data set
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