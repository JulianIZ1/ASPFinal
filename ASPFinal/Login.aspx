<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASPFinal.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>  
  
<html xmlns="http://www.w3.org/1999/xhtml">  

<body>  
    
    <div>  
      
        <table class="auto-style1">  
            <tr>  
                <td colspan="6" style="text-align: center; vertical-align: top">  
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Log In " forecolor="White"></asp:Label>  
                </td>  
            </tr>  
            <tr>  
                
                <td style="text-align: right">  
                    <asp:Label ID="lblUserId" runat="server" Font-Size="X-Large" Text="UserId :" forecolor="White"></asp:Label>  
                </td>  
                <td style="text-align: left">  
                    <asp:TextBox ID="txtUserID" runat="server" Font-Size="X-Large"></asp:TextBox>  
                </td>  

            </tr>  
            <tr>  
                
                <td style="text-align: right">  
                    <asp:Label ID="lblPassword" runat="server" Font-Size="X-Large" Text="Password :" forecolor="White"></asp:Label>  
                </td>  
                <td style="text-align: left">  
                    <asp:TextBox ID="txtPassword" runat="server" Font-Size="X-Large" TextMode="Password"></asp:TextBox>  
                </td>  
                
                </tr>  
            <tr>  
                <td></td>
                <td style="text-align: left">  
                    <asp:Button ID="Button1" runat="server" BorderStyle="None" Font-Size="X-Large" OnClick="Button1_Click" Text="Log In" />  
                </td>  

            </tr>  
            <tr>
                <td></td>
                <td style="text-align: left">  
                    <asp:Label ID="Label4" runat="server" Font-Size="X-Large" forecolor="White"></asp:Label>  
                </td>  
 
            </tr>  
        </table>  
      
    </div>  
 
</body>  
</html>  


</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title></title>  
    <style type="text/css">  
        .auto-style1 {  
            width: 100%;  
        }  
    </style>  


</asp:Content>