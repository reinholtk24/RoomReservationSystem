<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>ROOM RESERVATION SYSTEM.</h2>
    <h2>
        <asp:GridView ID="roomsGridView" runat="server" AutoGenerateColumns="False" EnableViewState="True" Height="420px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ViewStateMode="Enabled" Visible="False" Width="989px" AutoGenerateSelectButton="True">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="Building Code" HeaderText="Building Code" SortExpression="Building Code" />
                <asp:BoundField DataField="Room Number" HeaderText="Room Number" SortExpression="Room Number" />
                <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" />
                <asp:BoundField DataField="Number Of Seats" HeaderText="Number Of Seats" SortExpression="Number Of Seats" />
            </Columns>
            <SelectedRowStyle BackColor="#0066FF" />
        </asp:GridView>
    </h2>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button align="center" ID="selectRoom" runat="server" Height="37px" Width="260px" OnClick="selectRoom_Click" Text="Confirm Selection" Visible="False" PostBackUrl="~/Account/Login.aspx"/>
    </p>
    <h2 id="buildingHeader">
        <asp:Label ID="Label1" runat="server" Text="Building"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="buildingDropDownList" runat="server" DataTextField="building" DataValueField="building" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="buildings">

        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="buildingButton" runat="server" Height="36px" OnClick="Button1_Click" Text="Enter" Width="85px" />
        </h2>
        <asp:Label ID="dateLabel" runat="server" Text="Date" Visible="False"></asp:Label>
        <asp:Calendar ID="dateCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Enabled="False" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" OnSelectionChanged="dateCalendar_SelectionChanged" Visible="False" Width="350px" NextPrevFormat="FullMonth">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
        <TodayDayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
    <h2>&nbsp;<asp:Label ID="timeLabel" runat="server" Text="Time" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="timeDropDownList" runat="server" Enabled="False" OnSelectedIndexChanged="timeDropDownList_SelectedIndexChanged" Visible="False" AutoPostBack="True">
        </asp:DropDownList>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="viewButton" runat="server" Height="37px" OnClick="Button1_Click1" Text="View Rooms" Width="185px" Visible="False" />
    </h2>
    <h2>
        &nbsp;</h2>
    <h2>
        <asp:SqlDataSource ID="buildings" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [buildings]" OnSelecting="buildings_Selecting" ></asp:SqlDataSource>
        <asp:SqlDataSource ID="room_status" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="room_status_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [room_status]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="rooms" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [rooms]" OnSelecting="rooms_Selecting"></asp:SqlDataSource>
        <asp:SqlDataSource ID="buildingsTwo" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [buildings]"></asp:SqlDataSource>
    </h2>
    <p>Michael, Kyle, Courtney, Denny, Trevor</p>
</asp:Content>
