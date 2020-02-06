<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchPhysician.aspx.cs" Inherits="ASPFinal.SearchPhysician" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <script type="text/javascript"> 
function SelectAll(id)
{
            //get reference of GridView control
            var grid = document.getElementById("<%= grdPhysician.ClientID %>");
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
            <a href="" class="active">Doctors</a>
            <a href="ViewPatients.aspx">Patients</a>
            <a href="Home.html">Logout</a>

        </div>
      <br />
    <br />
    <br />
    <br />
    <br />
    <table class="auto-style1">
        <tr><td class="searchPara"><asp:Label ID="lblPhysicianID" runat="server" Text="Physician ID:"></asp:Label><asp:TextBox ID="txtPhysicianID" runat="server" ToolTip="Enter Physician ID"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="PLease use only numbers" ControlToValidate="txtPhysicianID" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
            <td class="searchPara">&nbsp;</td>
            
            <td class="searchPara">&nbsp;</td>
            

        <tr><td><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ToolTip="Press to Search" /><asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" ToolTip="Press to Close" /></td></tr>
        <tr>
            <td colspan="2">
                    <asp:GridView ID="grdPhysician" AutoGenerateColumns="False" CssClass="GridView" runat="server" Width="100%" AllowPaging="True" AllowSorting="True">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="Go To First Page" LastPageText="Go To Last Page" Position="Top"  />
                        <Columns>

                            <asp:BoundField DataField="FNAME" HeaderText="First Name"  />
                            <asp:BoundField DataField="LNAME" HeaderText="Last Name"  />
                            <asp:BoundField HeaderText="Gender" DataField="Gender"  />
                            <asp:BoundField HeaderText="Office Phone" DataField="Office_Phone"  />
                            <asp:BoundField HeaderText="Work Email" DataField="Work_Email"  />
                            <asp:BoundField HeaderText="Speciality" DataField="Speciality"  />

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