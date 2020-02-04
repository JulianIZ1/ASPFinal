using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ASPFinal.DataTiers;
using System.Text;

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

        protected void Refresh_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
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

        public void lbtnEdit_Click(object sender, CommandEventArgs e)
        {
            string recordToBeEdited;

            try
            {
                recordToBeEdited = e.CommandArgument.ToString().Trim();

                StringBuilder sb = new StringBuilder();
                sb.Append("<script language='JavaScript'>");
                sb.Append("window.open('UpdatePrecription.aspx?ID=" + recordToBeEdited + "' , 'UpdatePrecription',");
                sb.Append("'width=525, height=525, menubar=no, resizeable=yes, left=50, right=50, scrollbars=yes');");
                sb.Append("</script");

                // Register script
                ClientScript.RegisterClientScriptBlock(GetType(), "PopupScript", sb.ToString());
            }
            catch
            {

            }
            finally
            {

            }
        }
    }
}