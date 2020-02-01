<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddPrescription.aspx.cs" Inherits="ASPFinal.AddPrescription" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
    <link href="main.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <div class="navbar verticalCenter" align="right" style="background-color:black">
            <img src="Images/logo2.jpg" class="logo"/>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href=""class="active">Prescriptions</a>
            <a href="ViewPhysicians.aspx">Doctors</a>
            <a href="VeiwPatients">Patients</a>
            <a href="Home.html">Logout</a>
        </div>
    <table class="auto-style1" style="color:white; background-color:black">
        <tr>
            <td class="auto-style2">*RX Number:</td>
            <td>
                <asp:TextBox ID="txtRXNum" style="width:80%;" runat="server" ToolTip="Enter RX Number"></asp:TextBox>
                <br />
                <asp:Label ID="lblRXNum" runat="server" Text=""></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtRXNum" ErrorMessage="RX Number needs to be filled" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtRXNum" runat="server" ErrorMessage="RX Numbers are only numbers"
                   ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Medication Name:</td>
            <td>
                <asp:TextBox ID="txtMedicationName" style="width:80%;" runat="server" ToolTip="Enter Medication Name"></asp:TextBox>
                <br />
                <asp:Label ID="lblMedName" runat="server" Text=""></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="A Medication Nameis required." Text="Medication Name is required." ControlToValidate="txtMedicationName" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
              
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Refill Amount</td>
            <td>
                <asp:TextBox ID="txtRefillAmount" style="width:80%;" runat="server" ToolTip="Enter Refill Amount"></asp:TextBox>
                <br />
                <asp:Label ID="lblRefillAmt" runat="server" Text=""></asp:Label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtRefillAmount" runat="server" ErrorMessage="Names only contain letters"
                   ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Refill Date</td>
            <td>
                <asp:TextBox ID="txtRefillDate" style="width:80%;" runat="server" ToolTip="Enter Refill Date"></asp:TextBox>
                <br />
                <asp:Label ID="lblRefillDate" runat="server"></asp:Label>
            </td>  
        </tr>
        <tr>
            <td class="auto-style2">*Dosage:</td>
            <td>
                <asp:TextBox ID="txtDosage" style="width:80%;" runat="server" ToolTip="Enter Dosage"></asp:TextBox>
                <br />
                <asp:Label ID="lblDosage" runat="server" Text=""></asp:Label>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtDosage" runat="server" ErrorMessage="Names only contain letters"
                   ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Intake Method:</td>
            <td>
                <asp:TextBox ID="txtIntakeMethod" style="width:80%;" runat="server" ToolTip="Enter Intake Method"></asp:TextBox>
                <br />
                <asp:Label ID="lblIntakeMethod" runat="server" Text=""></asp:Label>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A Intake Method is required." Text="Intake Method is required." ControlToValidate="txtIntakeMethod" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
              
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Frequency:</td>
            <td>
                <asp:TextBox ID="txtFrequency" style="width:80%;" runat="server" ToolTip="Enter Frequency"></asp:TextBox>
                <br />
                <asp:Label ID="lblFrequency" runat="server" Text=""></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="A Frequency is required." Text="Frequency is required." ControlToValidate="txtFrequency" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
              

            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Patient ID:</td>
            <td>
                <asp:TextBox ID="txtPatID" runat="server" ToolTip="Enter Patient ID"></asp:TextBox>
                <br />               
                <asp:Label ID="lblPatID" runat="server" Text=""></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Patient ID is required." Text="Patient ID is required." ControlToValidate="txtPatID" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
              
            </td>
        </tr>
        <tr>
            <td class="auto-style2">*Physician ID:</td>
            <td>
                <asp:TextBox ID="txtPhysID" runat="server" ToolTip="Enter Physician ID"></asp:TextBox>
                <br />
                <asp:Label ID="lblPhyID" runat="server" ToolTip="Enter Physician ID"></asp:Label> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="A Physician ID is required." Text=" Physician ID is required." ControlToValidate="txtPhysID" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
              
            </td>
            
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" Text="Add Record" CausesValidation="False" OnClick="btnAdd_Click" ToolTip="Press to Add Record"/>
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
