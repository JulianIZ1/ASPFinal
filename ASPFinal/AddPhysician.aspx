<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddPhysician.aspx.cs" Inherits="ASPFinal.AddPhysician" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">    
    <script type="text/javascript">
        function Validate() {          
            var isValid = false;
            isValid = Page_ClientValidate('firstGroup');        
            if (isValid) {
                isValid = Page_ClientValidate('secondGroup');   
                if (isValid) {
                } else {
                    alert("Something is wrong with your data. Please check your inputs and try again.");
                }              
            } else {
                alert("Something is wrong with your data. Please check your inputs and try again.");
            }                   
            return isValid;
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
    <table class="auto-style1" style="color:white; background-color:black">

        <tr>
            <td class="auto-style2">*First Name:</td>
            <td>
                asp:TextBox ID="txtFName" stsyle="width:90%;" runat="server" ToolTip="Enter First Name Here"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A first name is required." Text="A first name is required." ValidationExpression = "^[\s\S]{1,}$" ControlToValidate="txtFName" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Middle Initial:</td>
            <td>
                <asp:TextBox ID="txtMidInit" style="width:90%;" runat="server" ToolTip="Enter Middle Initial Here"></asp:TextBox>
            </td>
        </tr>
        <tr>           <td class="auto-style2">*Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" style="width:90%;" runat="server" ToolTip="Enter Last Name Here"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="A last name is required." Text="A last name is required." ValidationExpression = "^[\s\S]{1,}$" ControlToValidate="txtLName" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender:</td>
            <td>
                <asp:DropDownList ID="ddlGender" style="width:90%;" runat="server" ToolTip="Select Gender">
                    <asp:ListItem>MALE</asp:ListItem>
                    <asp:ListItem>FEMALE</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="the gender is required." Text="The gender is required." ValidationExpression = "^[\s\S]{1,}$" ControlToValidate="ddlGender" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style2">Street:</td>
            <td>
                <asp:TextBox ID="txtStreet" style="width:90%;" runat="server" ToolTip="Enter Street Address"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">City:</td>
            <td>
                <asp:TextBox ID="txtCity" style="width:90%;" runat="server" ToolTip="Enter City Name"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">State:</td>
            <td>
                <asp:DropDownList ID="ddlState" style="width:90%;" runat="server" ToolTip="Select a State">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Zip:</td>
            <td>
                <asp:TextBox ID="txtZIP" style="width:90%;" runat="server" ToolTip="Enter Zip Code"></asp:TextBox>
            </td>           
        </tr>
        <tr>
            <td class="auto-style2">*Date of Birth</td>
            <td>
                <asp:TextBox ID="txtDOB" style="width:90%;" runat="server" ToolTip="Enter Date of Birth"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please specify a DOB." Text="Please specify a DOB." ValidationExpression = "^[\s\S]{0,5}$" ControlToValidate="txtDOB" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
                <asp:CompareValidator
                    id="dateValidator" runat="server" 
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="txtDOB" 
                    ErrorMessage="Please enter a valid date." ValidationGroup="secondGroup"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Office Phone:</td>
            <td>
                <asp:TextBox ID="txtOfficePhone" style="width:90%;" runat="server" ToolTip="Enter Office Phone"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Personal Phone</td>
            <td>
                <asp:TextBox ID="txtPersonalPhone" style="width:90%;" runat="server" ToolTip="Enter Personal Phone"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email:</td>
            <td>
                <asp:TextBox ID="txtEmailI" style="width:90%;" runat="server" ToolTip="Enter Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Work Email:</td>
            <td>
                <asp:TextBox ID="txtWorkEmail" style="width:90%;" runat="server" ToolTip="Enter Work Email"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Specialty:</td>
            <td>
                <asp:TextBox ID="txtSpecialty" style="width:90%;" runat="server" ToolTip="Enter Specialty"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="A specialty is required." Text="A specialty is required." ValidationExpression = "^[\s\S]{1,}$" ControlToValidate="txtSpecialty" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Salary:</td>
            <td>
                <asp:TextBox ID="txtSalary" style="width:90%;" runat="server" ToolTip="Enter Salary"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="A salary is required." Text="A salary is required." ValidationExpression = "^[\s\S]{1,}$" ControlToValidate="txtSalary" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>               
            </td>
            <td>
                <asp:Button ID="btnAdd" runat="server" Text="Verify Data" ValidationGroup="firstGroup" AutoPostBack="false" OnClientClick="return Validate()" ToolTip="Press to Verify Data"/>
                <asp:Button ID="btnHidden" runat="server" Text="Add Record" OnClick="btnHidden_Click" ToolTip="Press to Update Record"/>
                
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