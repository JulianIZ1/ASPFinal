using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ASPFinal
{
    public partial class SearchPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Do end it
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if ((txtPatientID.Text.Trim() != "") || (txtFName.Text.Trim() != "") || (txtLName.Text.Trim() != ""))
            {
                try
                {
                    Cache.Remove("PatientData");
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
            PatientDataTier aDatatier = new PatientDataTier();
            ViewState["vpatid"] = txtPatientID.Text.Trim();
            ViewState["vfname"] = txtFName.Text.Trim();
            ViewState["vlname"] = txtLName.Text.Trim();

            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.GetPatient(Convert.ToString(ViewState["vpatid"]), Convert.ToString(ViewState["vFname"]),
               Convert.ToString(ViewState["vLname"]));

            grdPatient.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["PatientData"] == null)
            {
                Cache.Add("PatientData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdPatient.DataBind();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPatients.aspx");
        }

    }
}
