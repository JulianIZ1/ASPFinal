﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace ASPFinal
{
    public partial class ViewPhysicians : System.Web.UI.Page
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

        public void lbtnEdit_Click(object sender, CommandEventArgs e)
        {
            string recordToBeEdited;

            try
            {
                recordToBeEdited = e.CommandArgument.ToString().Trim();

                StringBuilder sb = new StringBuilder();
                sb.Append("<script language='JavaScript'>");
                sb.Append("window.open('UpdatePhysician.aspx?ID=" + recordToBeEdited + "' , 'UpdatePhysician',");
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

        private void DataBind()
        {
            PhysicianDataTier aDatatier = new PhysicianDataTier();

            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.ViewPhysician("", "", "");

            grdStudents.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["StudentData"] != null)
            {
                Cache.Add("StudentData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdStudents.DataBind();
        }

    }
}