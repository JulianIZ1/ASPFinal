﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddRefills.aspx.cs" Inherits="ASPFinal.AddRefills" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <script type="text/javascript">
        function Validate() {          
            var isValid = false;
            isValid = Page_ClientValidate('firstGroup');        
            if (isValid) {
                isValid = Page_ClientValidate('secondGroup');   
                if (isValid) {
                    addData();
                }               
            }                   
            return isValid;
        }
        function addData() {         
            var clickButton = document.getElementById("<%= btnHidden.ClientID %>");
            clickButton.click();
        }
    </script>
    <table class="auto-style1" style="color:white; background-color:black">
        <tr>
            <td class="auto-style2">Prescription ID:</td>
            <td>
                <asp:DropDownList ID="ddlPrescriptionID" style="width:80%;" runat="server" ToolTip="Select Prescription ID"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Action:</td>
            <td>
                <asp:DropDownList ID="ddlAction" style="width:80%;" runat="server" ToolTip="Select an Action">
                    <asp:ListItem>Add</asp:ListItem>
                    <asp:ListItem>Remove</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Amount:</td>
            <td>
                <asp:TextBox ID="txtAmount" style="width:80%;" runat="server" ToolTip="Enter Amount"></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtAmount" runat="server" ErrorMessage="Refill amount can only be numbers"
                   ValidationExpression="^[0-9]$"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style2">Refill Date:</td>
            <td>
                <asp:Label ID="lblRefillDate" style="width:80%;" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>               
            </td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update Record" ValidationGroup="firstGroup" OnClientClick="return Validate()" OnClick="btnUpdate_Click" ToolTip="Press to Update Record"/>
                <asp:Button ID="btnHidden" runat="server" Text="" width="0" Height="0" />
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" ToolTip="Press to Close" />
                <asp:Label ID="lblDisplay" runat="server" />
            </td>
        </tr>
        
    </table>
    
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 39%;
            height: 90%;
        }
        .auto-style2 {
            width: 120px;
            text-align: right;
        }
    </style>
</asp:Content>
