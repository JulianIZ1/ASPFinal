﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class ViewPatients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptInclude("Test", "MyScript.js");

            if(!IsPostBack)
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
            PatientDataTier aDatatier = new PatientDataTier();

            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.ViewPatient("", "", "");

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
                string patid = "";
                PatientDataTier std = new PatientDataTier();
                if (grdStudents.Rows.Count > 0)
                {
                    foreach (GridViewRow row in grdStudents.Rows)
                    {
                        chk = (CheckBox)row.FindControl("chkPatID");
                        if (chk.Checked)
                        {
                            lbl = (Label)row.Controls[0].FindControl("hidPatID");
                            patid = lbl.Text.Trim();
                            std.DeletePatient(patid);
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
                sb.Append("window.open('UpdatePatient.aspx?ID=" + recordToBeEdited + "' , 'UpdatePatient',");
                sb.Append("'width=1000, height=1000, menubar=no, resizeable=yes, left=50, right=50, scrollbars=yes');");
                sb.Append("</script");

                // Register script
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", sb.ToString());
            }
            catch
            {

            }
            finally
            {

            }
        }

        protected void grdStudents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}