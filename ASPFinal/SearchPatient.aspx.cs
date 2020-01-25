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
            if ((txtPatientID.Text.Trim() != "") && (txtFName.Text.Trim() != "") && (txtLName.Text.Trim() != "") && (txtMidInit.Text.Trim() !=""))
            {
                try
                {
                    Cache.Remove("PaitentData");
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
            ViewState["vPatientID"] = txtPatientID.Text.Trim();
            ViewState["vFName"] = txtFName.Text.Trim();
            ViewState["vMidInit"] = txtMidInit.Text.Trim();
            ViewState["vLName"] = txtLName.Text.Trim();
            ViewState["vgender"] = ddlGender.Text.Trim();



            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.GetPaitent(Convert.ToString(ViewState["vPatientID"]),
                Convert.ToString(ViewState["vFName"]), Convert.ToString(ViewState["vMidInit"]),
                Convert.ToString(ViewState["vLName"]), Convert.ToString(ViewState["vgender"]),
                Convert.ToString(ViewState["vstreet"]), Convert.ToString(ViewState["vCity"]),
                Convert.ToString(ViewState["vstate"]), Convert.ToString(ViewState["vzip"]),
                Convert.ToString(ViewState["vdob"]), Convert.ToString(ViewState["vphone1"]),
                Convert.ToString(ViewState["vphone2"]), Convert.ToString(ViewState["vemail"]))
                ;

            grdPatient.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["CustomerData"] != null)
            {
                Cache.Add("PaitentData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdPatient.DataBind();
        }
    }
}