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
                LoadData();
            }
            else
            {
                // Do nothing 
            }
        }

        private void LoadData()
        {
            PatientDataTier dataTier = new PatientDataTier();
            DataSet dataSet = new DataSet();

            dataSet = dataTier.ViewPatient();
            grdStudents.DataSource = dataSet.Tables[0];
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