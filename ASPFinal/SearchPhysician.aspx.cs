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
            if ((txtPhysicianID.Text.Trim() != "") && (txtFName.Text.Trim() != "") && (txtLName.Text.Trim() != "") && (ddlGender.Text.Trim() != "") && (txtOfficePhone.Text.Trim() != "") && (txtWorkEmail.Text.Trim() != "") && (txtPosition.Text.Trim() != "") && (txtSpecialty.Text.Trim() != ""))
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
            ViewState["vPhysicianID"] = txtPhysicianID.Text.Trim();
            ViewState["vFName"] = txtFName.Text.Trim();
            ViewState["vLName"] = txtLName.Text.Trim();
            ViewState["vOfficePhone"] = txtOfficePhone.Text.Trim();
            ViewState["vWorkEmail"] = txtWorkEmail.Text.Trim();
            ViewState["vPosition"] = txtPosition.Text.Trim();
            ViewState["vSpecialty"] = txtSpecialty.Text.Trim();
            ViewState["vgender"] = ddlGender.Text.Trim(); 



            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.GetPhysician(Convert.ToString(ViewState["vPhysicianID"]), 
                Convert.ToString(ViewState["vFName"]), Convert.ToString(ViewState["vLName"]),
                Convert.ToString(ViewState["vOfficePhone"]), Convert.ToString(ViewState["vWorkEmail"]),
                Convert.ToString(ViewState["vPosition"]), Convert.ToString(ViewState["vSpecialty"]),
                Convert.ToString(ViewState["vgender"]))
                ;

            grdPhysician.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["CustomerData"] != null)
            {
                Cache.Add("PhysicianData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdPhysician.DataBind();
        }
    }
}