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
    public partial class UpdatePhysician : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PhysicianDataTier dataTier = new PhysicianDataTier();
                if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    DataSet dataSet = new DataSet();
                    string phyid = Request.QueryString["ID"];
                    dataSet = dataTier.FindByID(phyid);


                    if (Request.QueryString["ID"].Trim().ToUpper() == "EDIT")
                    {

                    }
                    else
                    {
                        //Response.Redirect("~/ViewPatients.aspx");
                        lblPhysicianID.Text = dataSet.Tables[0].Rows[0]["physician_id"].ToString();
                        txtFName.Text = dataSet.Tables[0].Rows[0]["fname"].ToString();
                        txtMidInit.Text = dataSet.Tables[0].Rows[0]["midint"].ToString();
                        txtLName.Text = dataSet.Tables[0].Rows[0]["lname"].ToString();
                        ddlGender.Text = dataSet.Tables[0].Rows[0]["gender"].ToString();
                        txtDOB.Text = dataSet.Tables[0].Rows[0]["dob"].ToString();
                        txtStreet.Text = dataSet.Tables[0].Rows[0]["streetname"].ToString();
                        txtCity.Text = dataSet.Tables[0].Rows[0]["city"].ToString();
                        ddlState.Text = dataSet.Tables[0].Rows[0]["doc_state"].ToString();

                        ddlState.DataSource = StateManager.getStates();
                        ddlState.DataTextField = "FullAndAbbrev";
                        ddlState.DataValueField = "abbreviation";
                        ddlState.SelectedValue = "PA";
                        ddlState.DataBind();

                        txtZIP.Text = dataSet.Tables[0].Rows[0]["zip"].ToString();
                        txtOfficePhone.Text = dataSet.Tables[0].Rows[0]["office_phone"].ToString();
                        txtPersonalPhone.Text = dataSet.Tables[0].Rows[0]["personal_phone"].ToString();
                        txtEmailI.Text = dataSet.Tables[0].Rows[0]["personal_email"].ToString();
                        txtWorkEmail.Text = dataSet.Tables[0].Rows[0]["work_email"].ToString();
                        txtSpecialty.Text = dataSet.Tables[0].Rows[0]["speciality"].ToString();
                        txtSalary.Text = dataSet.Tables[0].Rows[0]["salary"].ToString();
                    }
                }
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewPhysicians.aspx");
        }

        protected void btnHidden_Click(object sender, EventArgs e)
        {
            string reply;
            // Adds into SQL database
            try
            {
                PhysicianDataTier.UpdatePhysician(lblPhysicianID.Text, txtFName.Text, txtMidInit.Text, txtLName.Text, ddlGender.Text, txtStreet.Text,
                    txtCity.Text, ddlState.Text, decimal.Parse(txtZIP.Text), DateTime.Parse(txtDOB.Text), txtOfficePhone.Text,
                    txtPersonalPhone.Text, txtEmailI.Text, txtWorkEmail.Text, txtSpecialty.Text, decimal.Parse(txtSalary.Text));

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