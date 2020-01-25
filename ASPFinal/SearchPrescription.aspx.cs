using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class SearchPrescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
<<<<<<< HEAD

        protected void Delete_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {

        }
<<<<<<< HEAD
<<<<<<< HEAD

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if ((txtPrescriptionID.Text.Trim() != "") && (txtMedicationName.Text.Trim() != "") && (txtPhysicianID.Text.Trim() != "") && (txtPatientID.Text.Trim() != ""))
            {
                try
                {
                    Cache.Remove("PrescriptionData");
                    DataBind();
                }
                catch (Exception Ex)
                {
                    throw new Exception(Ex.Message, Ex.InnerException);
                }
            }
        }
        private void DataBind()
        {
            PaitentDataTier aDatatier = new PaitentDataTier();
            ViewState["vPrescriptionID"] = txtPrescriptionID.Text.Trim();
            ViewState["vMedicationName"] = txtMedicationName.Text.Trim();
            ViewState["vPhysicianID"] = txtPhysicianID.Text.Trim();
            ViewState["vPatientID"] = txtPatientID.Text.Trim();



            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.GetPrescription(Convert.ToString(ViewState["vPrescriptionID"]),
                Convert.ToString(ViewState["vMedicationName"]), Convert.ToString(ViewState["vPhysicianID"]),
                Convert.ToString(ViewState["vPatientID"]))
                ;

            grdPrescription.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["CustomerData"] != null)
            {
                Cache.Add("PrescriptionData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdPrescription.DataBind();
        }
=======
>>>>>>> parent of 50d7ba7... Dashboard tabs are running
=======
>>>>>>> parent of a6653a9... datadbind for search patient
=======
>>>>>>> parent of a6653a9... datadbind for search patient
    }
}