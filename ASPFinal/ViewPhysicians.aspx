﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewPhysicians.aspx.cs" Inherits="ASPFinal.ViewPhysicians" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <script type="text/javascript">

        function SelectAll(id) {
            //get reference of GridView control
            var grid = document.getElementById("<%= grdStudents.ClientID %>");
            //variable to contain the cell of the grid
            var cell;

            if (grid.rows.length > 0) {
                //loop starts from 1. rows[0] points to the header.
                for (i = 1; i < grid.rows.length; i++) {
                    //get the reference of first column
                    cell = grid.rows[i].cells[0];
                    //loop according to the number of childNodes in the cell
                    for (j = 0; j < cell.childNodes.length; j++) {
                        //if childNode type is CheckBox                 
                        if (cell.childNodes[j].type == "checkbox") {
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
    <table class="auto-style1">
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>     
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" onclick="NewPhysician" OnCommand="NewPhysician" CommandName="NewPhysician" runat="server" NavigateUrl="~/AddPhysician.aspx" ToolTip="Click Here to Add a Record">Add a Record</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink2" onclick="SearchPhysician" OnCommand="SearchPhysician" CommandName="SearchPhysician" runat="server" NavigateUrl="~/SearchPhysician.aspx" ToolTip="Click Here to Search Records">Search Records</asp:HyperLink>
                </td>
                <td>
                    <div class="buttonContainer" style="clear:both;width:100%;text-align:left">
                    <asp:Button ID="btn_Refresh" runat="server" Text="Refresh" OnClick="Refresh_Click" CssClass="simpleshape1"/>
                   </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdStudents" AutoGenerateColumns="False" CssClass="GridView" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="5" ToolTip="Click Here to Go to the Last Page">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="Go To First Page" LastPageText="Go To Last Page" Position="Bottom"  />
                        <Columns>
                            <asp:TemplateField HeaderText="Customer ID" >  
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbSelectAll" runat="server"  /> &nbsp;
                                    <asp:LinkButton ID="lbtnDelete" runat="server" OnCommand="Delete_Click" CommandName="lbtnDelete" CommandArgument='<%#Eval("Physician_ID") %>'>Delete</asp:LinkButton>
                                </HeaderTemplate>          
                                <ItemTemplate> 
                                    <asp:CheckBox ID="chkPhyID" runat="server" AutoPostBack="false" /> 
                                    <asp:Label ID="hidPhyID" runat="server" Text='<%#Eval("Physician_ID") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="FNAME" HeaderText="First Name" />
                            <asp:BoundField DataField="MIDINT" HeaderText="Middle Initial" />
                            <asp:BoundField DataField="LNAME" HeaderText="Last Name"  />
                            <asp:BoundField HeaderText="Gender" DataField="Gender"  />
                            <asp:BoundField DataField="STREETNAME" HeaderText="Street"  />
                            <asp:BoundField DataField="CITY" HeaderText="City"  />
                            <asp:BoundField DataField="DOC_STATE" HeaderText="State"  />
                            <asp:BoundField HeaderText="ZIP" DataField="ZIP"  />
                            <asp:BoundField HeaderText="Date of Birth" DataField="DOB" />
                            <asp:BoundField HeaderText="Office Phone" DataField="Office_Phone"  />
                            <asp:BoundField HeaderText="Personal Phone" DataField="Personal_Phone"  />                           
                            <asp:BoundField HeaderText="Email" DataField="WORK_EMAIL"  />
                            <asp:BoundField HeaderText="Email" DataField="PERSONAL_EMAIL"  />
                            <asp:BoundField HeaderText="Speciality" DataField="Speciality" />
                            <asp:BoundField HeaderText="Salary" DataField="Salary" />

                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" OnCommand="lbtnEdit_Click" CommandName="lbtnEdit" CommandArgument='<% # Eval("Physician_ID")%>'>Edit</asp:LinkButton>&nbsp;&nbsp;
                                </ItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgDelete" runat="server" CommandArgument='<% # Eval("Physician_ID")%>' OnCommand="Delete_Click" CommandName="btnDelete" ImageUrl="~/images/Delete.png" Height ="30"  Width ="30" CausesValidation="false"  />||
                                    <asp:ImageButton ID="imgEdit" runat="server" CommandArgument='<% # Eval("Physician_ID") %>' OnCommand="lbtnEdit_Click" CommandName="lbtnEdit" ImageUrl="~/images/Edit.jpg" Height ="30"  Width ="30" CausesValidation="false" />        
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />           
                            </asp:TemplateField>    
                        </Columns>   
                        <EmptyDataTemplate>
                            No Records Found Matching Your Search!
                        </EmptyDataTemplate>
                    </asp:GridView>                
                </td>
            </tr>
        </table>
</asp:Content>
