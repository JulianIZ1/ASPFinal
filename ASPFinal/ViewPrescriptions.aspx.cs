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
    public partial class ViewPrescriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptInclude("Test", "MyScript.js");

            if (!IsPostBack)
            {
                DataBind();
            }
            else
            {
                // Do nothing 
            }
        }

        private void DataBind()
        {

            PrescriptionDataTier aDatatier = new PrescriptionDataTier();

            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.ViewPrescription("");

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



        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {

                CheckBox chk = new CheckBox();
                Label lbl = new Label();
                string precid = "";
                PrescriptionDataTier std = new PrescriptionDataTier();

                if (grdStudents.Rows.Count > 0)
                {

                    foreach (GridViewRow row in grdStudents.Rows)
                    {
                        chk = (CheckBox)row.FindControl("chkPreID");

                        if (chk.Checked)
                        {
                            lbl = (Label)row.Controls[0].FindControl("hidPreID");
                            precid = lbl.Text.Trim();

                            std.DeletePrescription(precid);
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
    }
}