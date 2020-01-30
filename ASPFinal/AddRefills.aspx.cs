using ASPFinal.DataTiers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class AddRefills : System.Web.UI.Page
    {
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string dt = DateTime.Now.ToString();
            lblRefillDate.Text = dt;

            try
            {
                myConn.Open();
                SqlCommand com = new SqlCommand("select * from prescription", myConn);
                SqlDataAdapter sqlData = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                sqlData.Fill(ds);
                ddlPrescriptionID.DataTextField = ds.Tables[0].Columns["prescription_id"].ToString();
                ddlPrescriptionID.DataSource = ds.Tables[0];
                ddlPrescriptionID.DataBind();
            }
            finally
            {
                myConn.Close();
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPrescriptions.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string choice = ddlAction.Text.ToString();
            if (choice == "Add")
            {
                PrescriptionDataTier dataTier = new PrescriptionDataTier();
                dataTier.SubstractValue();
            }
            else
            {
                lblDisplay.Text = "No u";
             }
        }
    }
}