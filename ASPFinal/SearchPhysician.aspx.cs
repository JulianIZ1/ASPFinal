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
            if ((txtPhysicianID.Text.Trim() != "") || (txtFName.Text.Trim() != "") || (txtLName.Text.Trim() != "") || (ddlGender.Text.Trim() != "") || (txtOfficePhone.Text.Trim() != "") || (txtWorkEmail.Text.Trim() != "") || (txtPosition.Text.Trim() != "") || (txtSpecialty.Text.Trim() != ""))
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
            ViewState["vmidinit"] = txtMidint.Text.Trim();
            ViewState["vlname"] = txtLName.Text.Trim();
            ViewState["vgender"] = ddlGender.Text.Trim();
            ViewState["vofficephone"] = txtOfficePhone.Text.Trim();
            ViewState["vworkemail"] = txtWorkEmail.Text.Trim();
            ViewState["vposition"] = txtPosition.Text.Trim();
            ViewState["vspeciality"] = txtSpecialty.Text.Trim();


            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.getphysician(Convert.ToString(ViewState["vphyid"]),
                Convert.ToString(ViewState["vflame"]), Convert.ToString(ViewState["vmidinit"]),
                Convert.ToString(ViewState["vlname"]), Convert.ToString(ViewState["vgender"]), 
                Convert.ToString(ViewState["vofficephone"]), Convert.ToString(ViewState["vworkemail"]),
                Convert.ToString(ViewState["vposition"]), Convert.ToString(ViewState["vspeciality"]),
                Convert.ToString(ViewState["vdatetime"]), Convert.ToString(ViewState["vstreetname"]),
                Convert.ToString(ViewState["vcity"]), Convert.ToString(ViewState["vdoc_state"]),
                Convert.ToString(ViewState["vzip"]), Convert.ToString(ViewState["vpersonalphone"]),
                Convert.ToString(ViewState["personalemail"]), Convert.ToString(ViewState["salary"]));

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
