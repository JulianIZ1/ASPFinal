﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPFinal
{
    public partial class AddPhysician : System.Web.UI.Page
    {
        // Global Varibales
        string dt, salFill;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            dt = DateTime.Now.ToString("MM/dd/yyyy");
            txtDOB.Text = dt;

            salFill = "20000";
            txtSalary.Text = salFill;

            ddlState.DataSource = StateManager.getStates();
            ddlState.DataTextField = "FullAndAbbrev";
            ddlState.DataValueField = "abbreviation";
            ddlState.SelectedValue = "PA";
            ddlState.DataBind();
        }

        protected void btnHidden_Click(object sender, EventArgs e)
        {
            string reply;
            // Adds into SQL database
            try
            {
                PhysicianDataTier.AddPhysician(txtFName.Text, txtMidInit.Text, txtLName.Text, ddlGender.Text, txtStreet.Text,
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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/viewPhysicians.aspx");
        }


    }
}