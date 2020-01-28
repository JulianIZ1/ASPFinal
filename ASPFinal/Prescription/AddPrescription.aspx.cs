using ASPFinal.DataTiers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class AddPrescription : System.Web.UI.Page
    {
        string dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            dt = DateTime.Now.ToString("MM/dd/yyyy");
            txtRefillDate.Text = dt;

        }

        

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string reply;
            // Adds into SQL database
            try
            {
                PrescriptionDataTier.AddPrescription(Convert.ToString(txtRXNum.Text), txtMedicationName.Text, decimal.Parse(txtRefillAmount.Text),
                    DateTime.Parse(txtRefillDate.Text), Convert.ToString(txtDosage.Text), txtIntakeMethod.Text, txtFrequency.Text, Convert.ToInt32(txtPatID.Text),
                    Convert.ToInt32(txtPhysID.Text));

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