<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ASPFinal.Dashboard" %>
<asp:Content ID="ContentPlaceHolder1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <link href="main.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="DashboardCSS.css" />
    <div class="navbar verticalCenter" align="right" style="background-color:black">
            <img src="Images/logo2.jpg" class="logo"/>
            <a href="" class="active">Dashboard</a>
            <a href="ViewPrescriptions.aspx">Prescriptions</a>
            <a href="ViewPhysicians.aspx">Doctors</a>
            <a href="ViewPatients.aspx">Patients</a>
            <a href="Home.html">Logout</a>

        </div>
    <div class="mainBack">
        <div class="welcomeDiv roundBorders">
            <div class="clockDiv">
                <iframe src="http://free.timeanddate.com/clock/i6lx9lsv/n4561/fn6/fs16/fcfff/tct/pct/ftb/pa8/tt0/tw1/th1/ta1/tb4" frameborder="0" width="100%" height="100%" allowTransparency="true"></iframe>
            </div>
            <asp:Label ID="lblWelcome" runat="server" Text="Welcome" CssClass="welcomeMsg"></asp:Label>
            <div id="cont_4218ecce3bb6b06f69973c0f8000b7e5" class="auto-style2">
                <script type="text/javascript" async src="https://www.theweather.com/wid_loader/4218ecce3bb6b06f69973c0f8000b7e5"></script>
            </div>
        </div>
        <div class="titleDiv">
            Umbrella Health | Dashboard
        </div>        
        <div class="customerInfoDiv roundBorders">
            <div class="infoHeader">
                WARNING!!  
            </div>
            <table class="customerInfoTable">
            <tr>
                <td colspan="2">
                                    <p>Many patients experience death like behaviors, do not take with food or water.</p>
                                    <p>Do not breath water, you are not a fish.</p>
                                    <p>May cause large growth of brain</p>
                </td>
            </tr>
        </table>
        </div>
        <div class="contactDiv roundBorders">
         <iframe src="https://home.modernhealthcare.com/" style="border-width:0" width="100%" height="100%" margin-top:"7%" frameborder="0" scrolling="yes"></iframe>
        </div>
        <div class="calendarDiv roundBorders">
            <iframe src="https://calendar.google.com/calendar/embed?src=halsaisfmi43pt7kv8jnm57tb0%40group.calendar.google.com&ctz=America%2FNew_York" style="border-width:0" width="100%" height="100%" margin-top:"7%" frameborder="0" scrolling="yes"></iframe>
        </div>
        <div class="presInfoDiv roundBorders">
            <div class="infoHeader">
                Physicians
            </div>
            <table class="presInfoTable">
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdPhysicians" AutoGenerateColumns="False" CssClass="GridView" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="10">
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="Go To First Page" LastPageText="Go To Last Page" Position="Top"  />
                        <Columns>
                            <asp:BoundField DataField="FNAME" HeaderText="First Name"  />
                            <asp:BoundField DataField="LNAME" HeaderText="Last Name"  />
                            <asp:BoundField HeaderText="Speciality" DataField="Speciality"  />                          
                        </Columns>   
                        <EmptyDataTemplate>
                            No Records Found Matching Your Search!
                        </EmptyDataTemplate>
                    </asp:GridView>                
                </td>
            </tr>
        </table>
        </div>
        <table class="callDiv roundBorders">
            <tr>
                <th>
                        <div class="auto-style1">
                            Office Hours :
                                </div>
                   
                         <p><font size="4" color="White">Monday - 9:00 Am to 9:00 Pm</font></p>
                                                    <br />
                         <p><font size="4" color="White">Tuesday - 9:00 Am to 9:00 Pm</font></p>
                                                    <br />
                         <p><font size="4" color="White">Wednesday - 9:00 Am to 9:00 Pm</font></p>
                                                    <br />
                         <p><font size="4" color="White">Thursday - 9:00 Am to 9:00 Pm</font></p>
                                                    <br />
                         <p><font size="4" color="White">Friday - 9:00 Am to 6:30 Pm</font></p>
                </th>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 15%;
            position: absolute;
            left: 1px;
            top: 0;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            vertical-align: middle;
            font-size: 25px;
            color: white;
            text-align: left;
            font-family: 'Modern No. 20';
            border-bottom: 1px solid #939393;
        }
        .auto-style2 {
            width: 67%;
            height: 110%;
            color: white;
            position: absolute;
            right: 0%;
            top: -15%;
            border-left: 2px solid red;
        }
    </style>
</asp:Content>

