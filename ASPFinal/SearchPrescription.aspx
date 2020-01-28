﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchPrescription.aspx.cs" Inherits="ASPFinal.SearchPrescription" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <script type="text/javascript"> 
function SelectAll(id)
{
            //get reference of GridView control
            var grid = document.getElementById("<%= grdStudents.ClientID %>");
            //variable to contain the cell of the grid
            var cell;
            
            if (grid.rows.length > 0)
            {
                //loop starts from 1. rows[0] points to the header.
                for (i=1; i<grid.rows.length; i++)
                {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];
                    //loop according to the number of childNodes in the cell
                    for (j=0; j<cell.childNodes.length; j++)
                    {           
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type =="checkbox")
                        {
                        //assign the status of the Select All checkbox to the cell checkbox within the grid
                            cell.childNodes[j].checked = document.getElementById(id).checked;
                        }
                    }
                }
            }
        }

</script>
    <link href="main.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <div class="navbar verticalCenter" align="right" style="background-color:black">
            <img src="Images/logo2.png" class="logo"/>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="" class="active">Prescriptions</a>
            <a href="ViewPhysicians.aspx">Doctors</a>
            <a href="ViewPatients.aspx">Patients</a>
            <a href="Home.html">Logout</a>

        </div>
      <br />
    <br />
    <br />
    <br />
    <br />
    <table class="auto-style1">
        <tr><td class="searchPara"><asp:Label ID="lblPrescriptionID" runat="server" Text="Prescription ID:"></asp:Label><asp:TextBox ID="txtPrescriptionID" runat="server"></asp:TextBox></td>
            <td class="searchPara"><asp:Label ID="lblMedicationName" runat="server" Text="Medication Name:"></asp:Label><asp:TextBox ID="txtMedicationName" runat="server"></asp:TextBox></td>
            <td class="searchPara"><asp:Label ID="lblPhysicianID" runat="server" Text="Physician ID:"></asp:Label><asp:TextBox ID="txtPhysicianID" runat="server"></asp:TextBox></td>
            <td class="searchPara"><asp:Label ID="lblPatientID" runat="server" Text="Patient ID:"></asp:Label><asp:TextBox ID="txtPatientID" runat="server"></asp:TextBox></td>
        
        <tr><td><asp:Button ID="btnSearch" runat="server" Text="Search" /><asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" /></td></tr>
        <tr>
            <td colspan="2">
                    <asp:GridView ID="grdStudents" AutoGenerateColumns="False" CssClass="GridView" runat="server" Width="100%" AllowPaging="True">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="Go To First Page" LastPageText="Go To Last Page" Position="Top"  />
                        <Columns>
                            <asp:BoundField DataField="Prescription_ID" HeaderText="Prescription ID" SortExpression="Prescription_ID" />
                            <asp:BoundField DataField="Medication_Name" HeaderText="Medication Name" SortExpression="Medication_Name" />
                            <asp:BoundField HeaderText="Physician ID" DataField="Physician_ID" SortExpression="Physician_ID" />
                            <asp:BoundField HeaderText="Patient ID" DataField="Patient_ID" SortExpression="Patient_ID" />
                        </Columns>   
                        <EmptyDataTemplate>
                            No Records Found Matching Your Search!
                        </EmptyDataTemplate>
                    </asp:GridView>                
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
        .auto-style2 {
            width: 5%;
            height: 1%;
            text-align: right;
            color: white;
        }
    </style>
</asp:Content>