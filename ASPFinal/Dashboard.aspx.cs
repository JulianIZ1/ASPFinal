using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class Dashboard : System.Web.UI.Page
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
            PhysicianDataTier aDatatier = new PhysicianDataTier();

            DataSet aDataSet = new DataSet();
            aDataSet = aDatatier.ViewPhysician("", "", "");

            grdPhysicians.DataSource = aDataSet.Tables[0];

            // Cache for a while
            if (Cache["StudentData"] != null)
            {
                Cache.Add("StudentData", new DataView(aDataSet.Tables[0]),
                    null, System.Web.Caching.Cache.NoAbsoluteExpiration, System.TimeSpan.FromMinutes(10),
                    System.Web.Caching.CacheItemPriority.Default, null);
            }
            grdPhysicians.DataBind();
        }

    }
}