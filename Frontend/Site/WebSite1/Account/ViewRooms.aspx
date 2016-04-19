<%@ Page Title="ViewRooms" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewRooms.aspx.cs" Inherits="ViewRooms" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h2>
    <h2>&nbsp;</h2>
    <h2>&nbsp;</h2>
    <h2>
        <asp:SqlDataSource ID="reserved_rooms" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [rooms_reserved] WHERE [userId] = ?" InsertCommand="INSERT INTO [rooms_reserved] ([reservationID], [approved], [room_owner], [start_time], [end_time], [date], [room_number], [building_code], [userId]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [rooms_reserved]" UpdateCommand="UPDATE [rooms_reserved] SET [reservationID] = ?, [approved] = ?, [room_owner] = ?, [start_time] = ?, [end_time] = ?, [date] = ?, [room_number] = ?, [building_code] = ? WHERE [userId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="userId" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="reservationID" Type="String" />
                <asp:Parameter Name="approved" Type="Int64" />
                <asp:Parameter Name="room_owner" Type="String" />
                <asp:Parameter Name="start_time" Type="Object" />
                <asp:Parameter Name="end_time" Type="Int64" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="room_number" Type="String" />
                <asp:Parameter Name="building_code" Type="String" />
                <asp:Parameter Name="userId" Type="Int64" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="reservationID" Type="String" />
                <asp:Parameter Name="approved" Type="Int64" />
                <asp:Parameter Name="room_owner" Type="String" />
                <asp:Parameter Name="start_time" Type="Object" />
                <asp:Parameter Name="end_time" Type="Int64" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="room_number" Type="String" />
                <asp:Parameter Name="building_code" Type="String" />
                <asp:Parameter Name="userId" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h2>

</asp:Content>