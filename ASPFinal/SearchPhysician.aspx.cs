using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ASPFinal
{
    public partial class SearchPhysician : System.Web.UI.Page
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
            if ((txtPhysicianID.Text.Trim() != "") || (txtFName.Text.Trim() != "") || (txtLName.Text.Trim() != "") )
            {
                try
                {
                    Cache.Remove("PhysicianData");
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
            PhysicianDataTier aDatatier = new PhysicianDataTier();
            ViewState["vphyid"] = txtPhysicianID.Text.Trim();
            ViewState["vflame"] = txtFName.Text.Trim();

            ViewState["vlname"] = txtLName.Text.Trim();



            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.getphysician(Convert.ToString(ViewState["vphyid"]),
                Convert.ToString(ViewState["vflame"]),Convert.ToString(ViewState["vlname"]));

            grdPhysician.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["CustomerData"] != null)
            {
                Cache.Add("StudentData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdPhysician.DataBind();
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPhysicians.aspx");
        }
    }
}
