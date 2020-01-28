using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ASPFinal.DataTiers;

namespace ASPFinal
{
    public partial class SearchPrescription : System.Web.UI.Page
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
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPrescriptions.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if ((txtPrescriptionID.Text.Trim() != ""))
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
            PrescriptionDataTier aDatatier = new PrescriptionDataTier();
            ViewState["vprescid"] = txtPrescriptionID.Text.Trim();
            
            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.getprescription(Convert.ToInt32(ViewState["vprescid"]));

            grdStudents.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["CustomerData"] != null)
            {
                Cache.Add("PrescriptionData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdStudents.DataBind();
        }
    }
}