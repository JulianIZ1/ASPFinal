<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutPage.aspx.cs" Inherits="ASPFinal.AboutPage" %>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" EnablePageMethods="true"></asp:ScriptManager>
            <div class="navbar verticalCenter" align="right" style="background-color:black">
                <img src="Images/Logo2.png" class="logo" />
                <a href="Home.html">Home</a>
                <a href="">Company</a>
                <a href=""class="active">About</a>
                <a href="">Contact</a>
                <a href="Dashboard.aspx">Login</a>


            </div>   

 <div class="title">
			    About Us<br />
                <div class="missionStatement">
                    We strive to build a future in medicine that encourages friendliness, low costs, <br />excellent service, and customer satisfaction.
                    <br /><br /><br />

                </div> 
		    </div>	                   
	    </div>  
        <div class="footer">&copy XYZ Corp. | (111)123-4567 | ABC Morea, Mega, PA | XYZCorp@Zipps.com</div>
    </div>      
    
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

