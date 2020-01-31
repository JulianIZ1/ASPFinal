using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class UpdatePatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PatientDataTier dataTier = new PatientDataTier();
                if(!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    DataSet dataSet = new DataSet();
                    string patid = Request.QueryString["ID"];
                    dataSet = dataTier.FindByID(patid);
                    if(Request.QueryString["ID"].Trim().ToUpper() == "EDIT")
                    {
                        
                    }
                    else
                    {
                        //Response.Redirect("~/ViewPatients.aspx");
                        lblPatientID.Text = dataSet.Tables[0].Rows[0]["patient_id"].ToString();
                        txtFName.Text = dataSet.Tables[0].Rows[0]["fname"].ToString();
                        txtMidInit.Text = dataSet.Tables[0].Rows[0]["midint"].ToString();
                        txtLName.Text = dataSet.Tables[0].Rows[0]["lname"].ToString();
                        ddlGender.Text = dataSet.Tables[0].Rows[0]["gender"].ToString();
                        txtDOB.Text = dataSet.Tables[0].Rows[0]["dob"].ToString();
                        txtStreet.Text = dataSet.Tables[0].Rows[0]["streetname"].ToString();
                        txtCity.Text = dataSet.Tables[0].Rows[0]["city"].ToString();
                        ddlState.Text = dataSet.Tables[0].Rows[0]["pait_state"].ToString();

                        ddlState.DataSource = StateManager.getStates();
                        ddlState.DataTextField = "FullAndAbbrev";
                        ddlState.DataValueField = "abbreviation";
                        ddlState.SelectedValue = "PA";
                        ddlState.DataBind();

                        txtZIP.Text = dataSet.Tables[0].Rows[0]["zip"].ToString();
                        txtHomePhone.Text = dataSet.Tables[0].Rows[0]["home_phone"].ToString();
                        txtCellPhone.Text = dataSet.Tables[0].Rows[0]["cell_phone"].ToString();
                        txtEmailI.Text = dataSet.Tables[0].Rows[0]["email"].ToString();
                    }
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.close();", true);
        }

        protected void btnHidden_Click(object sender, EventArgs e)
        {
            string reply;
            // Adds into SQL database
            try
            {
                PatientDataTier.UpdatePatient(lblPatientID.Text, txtFName.Text, txtMidInit.Text, txtLName.Text, ddlGender.Text, txtStreet.Text,
                    txtCity.Text, ddlState.Text, decimal.Parse(txtZIP.Text), txtHomePhone.Text, txtCellPhone.Text, txtEmailI.Text);

                reply = "Success";
                lblDisplay.Text = reply;
            }
            catch (Exception Ex)
            {
                throw new Exception(Ex.Message);
            }
            finally
            {

            }
        }
    }
}