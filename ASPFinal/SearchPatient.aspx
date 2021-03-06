﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchPatient.aspx.cs" Inherits="ASPFinal.SearchPatient" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <script type="text/javascript"> 
function SelectAll(id)
{
            //get reference of GridView control
            var grid = document.getElementById("<%= grdPatient.ClientID %>");
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
            <img src="Images/logo2.jpg" class="logo"/>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="ViewPrescriptions.aspx">Prescriptions</a>
            <a href="ViewPhysicians.aspx">Doctors</a>
            <a href="" class="active">Patients</a>
            <a href="Home.html">Logout</a>

        </div>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ajaxToolkit:AutoCompleteExtender ID="acePatientID" runat="server" ServiceMethod="GetCompletionPatientID" TargetControlID="txtPatientID" UseContextKey="True" CompletionInterval="1" EnableCaching="true" CompletionSetCount="12" MinimumPrefixLength="1" DelimiterCharacters=";, :"></ajaxToolkit:AutoCompleteExtender>


    <table class="auto-style1">
        <tr><td class="searchPara"><asp:Label ID="lblPatientID" runat="server" Text="Patient ID:"></asp:Label><asp:TextBox ID="txtPatientID" runat="server" ToolTip="Enter Patient ID"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="PLease use only numbers" ControlToValidate="txtPatientID" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
            <td class="searchPara">&nbsp;</td>
            <td class="searchPara"></td>
        </tr>        
        <tr><td><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ToolTip="Press to Search"/><asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" ToolTip="Press to Close" /></td></tr>
        <tr>
            <td colspan="2">
                    <asp:GridView ID="grdPatient" AutoGenerateColumns="False" CssClass="GridView" runat="server" Width="100%" AllowPaging="True" AllowSorting="True">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="Go To First Page" LastPageText="Go To Last Page" Position="Top"  />
                        <Columns>
                             <asp:BoundField DataField="Patient_ID" HeaderText="Patient ID"  />
                            <asp:BoundField DataField="FNAME" HeaderText="First Name"  />
                            <asp:BoundField DataField="MIDINT" HeaderText="Middle Initial"  />
                            <asp:BoundField DataField="LNAME" HeaderText="Last Name"  />
                            <asp:BoundField HeaderText="GENDER" DataField="Gender"  />
                            <asp:BoundField DataField="STREETNAME" HeaderText="Street"  />
                            <asp:BoundField DataField="CITY" HeaderText="City"  />
                            <asp:BoundField DataField="PAIT_STATE" HeaderText="State"  />
                            <asp:BoundField HeaderText="ZIP" DataField="ZIP"  />
                            <asp:BoundField HeaderText="Date of Birth" DataField="DOB"  />
                            <asp:BoundField HeaderText="Home Phone" DataField="Home_Phone"  />
                            <asp:BoundField HeaderText="Cell Phone" DataField="Cell_Phone"  />                           
                            <asp:BoundField HeaderText="Email" DataField="Email"  />


                             <asp:TemplateField></asp:TemplateField>


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
        </style>
</asp:Content>