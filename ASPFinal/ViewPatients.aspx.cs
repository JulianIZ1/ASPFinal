using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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



        protected void Delete_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnEdit_Click(object sender, EventArgs e)
        {
            
        }

    }
}