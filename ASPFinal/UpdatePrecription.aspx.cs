using ASPFinal.DataTiers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class UpdatePrecription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PrescriptionDataTier dataTier = new PrescriptionDataTier();
                if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    DataSet dataSet = new DataSet();
                    string precid = Request.QueryString["ID"];
                    dataSet = dataTier.GetPrescriptionByID(precid);

                    if (Request.QueryString["ID"].Trim().ToUpper() == "EDIT")
                    {

                    }
                    else
                    {
                        //Response.Redirect("~/ViewPatients.aspx");
                        lblPrescriptionID.Text = dataSet.Tables[0].Rows[0]["prescription_id"].ToString();
                        
                        txtRXNum.Text = dataSet.Tables[0].Rows[0]["rx_number"].ToString();
                        txtMedicationName.Text = dataSet.Tables[0].Rows[0]["medication_name"].ToString();
                        txtRefillAmt.Text = dataSet.Tables[0].Rows[0]["refill_amt"].ToString();
                        lblRefillDate.Text = dataSet.Tables[0].Rows[0]["refill_date"].ToString();
                        txtDosage.Text = dataSet.Tables[0].Rows[0]["dosage"].ToString();
                        txtIntakeMethod.Text = dataSet.Tables[0].Rows[0]["intake_method"].ToString();
                        txtFrequency.Text = dataSet.Tables[0].Rows[0]["frequency"].ToString();
                        txtPatID.Text = dataSet.Tables[0].Rows[0]["patient_id"].ToString();
                        txtPhyID.Text = dataSet.Tables[0].Rows[0]["physician_id"].ToString();
                    }
                }
            }
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
        }

        protected void btnHidden_Click(object sender, EventArgs e)
        {
            string reply;
            // Adds into SQL database
            try
            {
                PrescriptionDataTier.UpdatePrescription(lblPrescriptionID.Text, txtRXNum.Text, txtMedicationName.Text, Convert.ToDecimal(txtRefillAmt.Text), Convert.ToDateTime(lblRefillDate.Text), txtDosage.Text,
                    txtIntakeMethod.Text, txtFrequency.Text, Convert.ToInt32(txtPhyID.Text));

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

    }
}