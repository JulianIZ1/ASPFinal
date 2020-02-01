<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddPatient.aspx.cs" Inherits="ASPFinal.AddPatient" %>
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
}
    </script>
<script type="text/javascript">
    function Page_ValidationSummariesReset(){
        if(typeof(Page_ValidationSummaries) == "undefined")
            return;
        for(var i = 0; i < Page_ValidationSummaries.length; i++)
            Page_ValidationSummaries[i].style.display = "none';
}
</script>
    <link href="main.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" EnablePageMethods="true"></asp:ScriptManager>
    <div class="navbar verticalCenter" align="right" style="background-color:black">
            <img src="Images/logo2.jpg" class="logo"/>
            <a href="Dashboard.aspx">Dashboard</a>
            <a href="ViewPrescriptions.aspx">Prescriptions</a>
            <a href="ViewPhysicians.aspx">Doctors</a>
            <a href="" class="active">Patients</a>
            <a href="Home.html">Logout</a>

        </div>
    <table class="auto-style1" style="color:white; background-color:black">
        <tr>
            <td class="auto-style2">* First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" style="width:90%;" runat="server" ToolTip="Enter First Name Here"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A first name is required." Text="A first name is required." ControlToValidate="txtFName" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtFName" runat="server" ErrorMessage="Names only contain letters"
                   ValidationExpression="^[a-zA-Z]$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Middle Initial:</td>
            <td>
                <asp:TextBox ID="txtMidInit" style="width:90%;" runat="server" ToolTip="Enter Middle Initial Here"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtMidInit" runat="server" ErrorMessage="Names only contain letters"
                   ValidationExpression="^[a-zA-Z]$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">* Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" style="width:90%;" runat="server" ToolTip="Enter Last Name Here"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="A last name is required." Text="A last name is required." ControlToValidate="txtLName" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtLName" runat="server" ErrorMessage="Names only contain letters"
                   ValidationExpression="^[a-zA-Z]$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">* Gender:</td>
            <td>
                <asp:DropDownList ID="ddlGender" style="width:90%;" runat="server" ToolTip="Select Gender">
                    <asp:ListItem>MALE</asp:ListItem>
                    <asp:ListItem>FEMALE</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">* Date of Birth</td>
            <td>               
                <asp:TextBox ID="txtDOB" style="width:90%;" runat="server" ToolTip="Enter Date of Birth: YYYY\DD\MM"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please specify a DOB." Text="Please specify a DOB." ControlToValidate="txtDOB" EnableClientScript="false" ValidationGroup="firstGroup" ToolTip="Enter Date of Birth"></asp:RequiredFieldValidator>
                <asp:CompareValidator
                    id="dateValidator" runat="server" 
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="txtDOB" 
                    ErrorMessage="Please enter a valid date." ValidationGroup="secondGroup"></asp:CompareValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Dates must be in this format: MM/DD/YYYY" ControlToValidate="txtDOB"
                    ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Street:</td>
            <td>
                <asp:TextBox ID="txtStreet" style="width:90%;" runat="server" ToolTip="Enter Street Address"></asp:TextBox>
                <br />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="A street address is required." Text="A street address is required." ControlToValidate="txtStreet" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">City:</td>
            <td>
                <asp:TextBox ID="txtCity" style="width:90%;" runat="server" ToolTip="Enter City Name"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="A City is required." Text="A City is required." ControlToValidate="txtCity" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">State:</td>
            <td>
                <asp:DropDownList ID="ddlState" style="width:90%;" runat="server" ToolTip="Select a State"></asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="A state is required." Text="A state is required." ControlToValidate="ddlState" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
            </td>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Zip:</td>
            <td>
                <asp:TextBox ID="txtZIP" style="width:90%;" runat="server" ToolTip="Enter Zip Code"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="A zip is required." Text="A zip is required." ControlToValidate="txtCity" EnableClientScript="false" ValidationGroup="firstGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtZIP" ErrorMessage="Zip codes only use numbers" ValidationExpression="^\d{5}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Home Phone:</td>
            <td>
                <asp:TextBox ID="txtHomePhone" style="width:90%;" runat="server" ToolTip="Enter Home Phone"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtHomePhone" runat="server" ErrorMessage="Please enter phone number as follows, (123)456-7890"
                    ValidationExpression="^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$" ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Cell Phone</td>
            <td>
                <asp:TextBox ID="txtCellPhone" style="width:90%;" runat="server" ToolTip="Enter Cell Phone"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtCellPhone" runat="server" ErrorMessage="Please enter phone number as follows, (123)456-7890"
                    ValidationExpression="^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$" ></asp:RegularExpressionValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email:</td>
            <td>
                <asp:TextBox ID="txtEmailI" style="width:90%;" runat="server" ToolTip="Enter Email"></asp:TextBox>
                <br />
            </td>
        </tr>


        <tr>
            <td>               
            </td>
            <td>
                <asp:Button ID="btnAdd" runat="server" Text="Verify Data" ValidationGroup="firstGroup" AutoPostBack="false" OnClientClick="return Validate()" ToolTip="Press to Verify Data"/>
                <asp:Button ID="btnHidden" runat="server" Text="Update Record" OnClick="btnHidden_Click" ToolTip="Press to Update Record"/>
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" ToolTip="Press to Close" />
                <asp:Label ID="lblDisplay" runat="server"></asp:Label>
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
