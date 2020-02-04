using ASPFinal.DataTiers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class AddPrescription : System.Web.UI.Page
    {
        string dt;
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);

        protected void Page_Load(object sender, EventArgs e)
        {
            dt = DateTime.Now.ToString("MM/dd/yyyy");
            txtRefillDate.Text = dt;

            if (!IsPostBack)
            {
                try
                {
                    myConn.Open();
                    SqlCommand com = new SqlCommand("select * from patient", myConn);
                    SqlDataAdapter sqlData = new SqlDataAdapter(com);
                    DataSet ds = new DataSet();
                    sqlData.Fill(ds);
                    ddlPatientID.DataTextField = ds.Tables[0].Columns["patient_id"].ToString();
                    ddlPatientID.DataSource = ds.Tables[0];
                    ddlPatientID.DataBind();
                }
                finally
                {
                    myConn.Close();
                }

                try
                {
                    myConn.Open();
                    SqlCommand com = new SqlCommand("select * from physician", myConn);
                    SqlDataAdapter sqlData = new SqlDataAdapter(com);
                    DataSet ds = new DataSet();
                    sqlData.Fill(ds);
                    ddlPhysID.DataTextField = ds.Tables[0].Columns["physician_id"].ToString();
                    ddlPhysID.DataSource = ds.Tables[0];
                    ddlPhysID.DataBind();
                }
                finally
                {
                    myConn.Close();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string reply;
            // Adds into SQL database
            try
            {
                PrescriptionDataTier.AddPrescription(Convert.ToString(txtRXNum.Text), txtMedicationName.Text, decimal.Parse(txtRefillAmount.Text),
                    DateTime.Parse(txtRefillDate.Text), Convert.ToString(txtDosage.Text), txtIntakeMethod.Text, txtFrequency.Text, Convert.ToInt32(ddlPatientID.SelectedItem.ToString()),
                    Convert.ToInt32(ddlPhysID.SelectedItem.ToString()));

                reply = "Success";
                lblDisplay.Text = reply;
            }
            catch (Exception Ex)
            {
                throw new Exception(Ex.Message);
            }
            finally
            {

            }
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPrescriptions.aspx");
        }

    }
}