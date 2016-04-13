<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>ROOM RESERVATION SYSTEM.</h2>
    <h2>Building&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="buildingDropDownList" runat="server" DataTextField="building" DataValueField="building" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="RRSDB">

        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="buildingButton" runat="server" Height="36px" OnClick="Button1_Click" Text="Enter" Width="85px" />
    </h2>
    <h2>
        <asp:Label ID="dateLabel" runat="server" Text="Date" Visible="False"></asp:Label>
&nbsp;<asp:Calendar ID="dateCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Enabled="False" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" OnSelectionChanged="dateCalendar_SelectionChanged" Visible="False" Width="350px" NextPrevFormat="FullMonth">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
        <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
    </h2>
    <h2>&nbsp;<asp:Label ID="timeLabel" runat="server" Text="Time" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="timeDropDownList" runat="server" Enabled="False" OnSelectedIndexChanged="timeDropDownList_SelectedIndexChanged" Visible="False">
        </asp:DropDownList>
    </h2>
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h2>
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>
        <asp:SqlDataSource ID="RRSDB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [buildings]"></asp:SqlDataSource>
    </h2>
    <p>Michael, Kyle, Courtney, Denny, Trevor</p>
</asp:Content>
