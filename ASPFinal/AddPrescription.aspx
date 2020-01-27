<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddPrescription.aspx.cs" Inherits="ASPFinal.AddPrescription" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
    <link href="main.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <div class="navbar verticalCenter" align="right" style="background-color:black">
            <img src="Images/logo2.png" class="logo"/>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="ViewPrescriptions.aspx">Prescriptions</a>
            <a href="ViewPhysicians.aspx">Doctors</a>
            <a href="" class="active">Patients</a>
            <a href="Home.html">Logout</a>
        </div>
    <table class="auto-style1" style="color:white; background-color:black">
        <tr>
            <td class="auto-style2">*RX Number:</td>
            <td>
                <asp:TextBox ID="txtRXNum" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblRXNum" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Medication Name:</td>
            <td>
                <asp:TextBox ID="txtMedicationName" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblMedName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Refill Amount</td>
            <td>
                <asp:TextBox ID="txtRefillAmount" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblRefillAmt" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Refill Date</td>
            <td>
                <asp:TextBox ID="txtRefillDate" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblRefillDate" runat="server"></asp:Label>
            </td>  
        </tr>
        <tr>
            <td class="auto-style2">*Dosage:</td>
            <td>
                <asp:TextBox ID="txtDosage" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblDosage" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Intake Method:</td>
            <td>
                <asp:TextBox ID="txtIntakeMethod" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblIntakeMethod" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Frequency:</td>
            <td>
                <asp:TextBox ID="txtFrequency" style="width:80%;" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblFrequency" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Patient ID:</td>
            <td>
                <asp:TextBox ID="txtPatID" runat="server"></asp:TextBox>
                <br />               
                <asp:Label ID="lblPatID" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Physician ID:</td>
            <td>
                <asp:TextBox ID="txtPhysID" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblPhyID" runat="server" Text=""></asp:Label>                
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" Text="Add Record" CausesValidation="False" OnClick="btnAdd_Click"/>
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
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
