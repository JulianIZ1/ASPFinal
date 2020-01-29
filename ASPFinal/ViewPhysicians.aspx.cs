using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ASPFinal
{
    public partial class ViewPhysicians : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBind();
            }
            else
            {
                // Do nothing 
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {

                CheckBox chk = new CheckBox();
                Label lbl = new Label();
                string phyid = "";
                PhysicianDataTier std = new PhysicianDataTier();

                if (grdStudents.Rows.Count > 0)
                {

                    foreach (GridViewRow row in grdStudents.Rows)
                    {
                        chk = (CheckBox)row.FindControl("chkPhyID");

                        if (chk.Checked)
                        {
                            lbl = (Label)row.Controls[0].FindControl("hidPhyID");
                            phyid = lbl.Text.Trim();

                            std.DeletePhysician(phyid);
                        }

                    }
                    DataBind();
                }
            }
            catch
            {

            }
        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {

        }

        private void DataBind()
        {
            PhysicianDataTier aDatatier = new PhysicianDataTier();

            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.ViewPhysician("", "", "");

            grdStudents.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["CustomerData"] != null)
            {
                Cache.Add("StudentData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdStudents.DataBind();
        }
    }
}