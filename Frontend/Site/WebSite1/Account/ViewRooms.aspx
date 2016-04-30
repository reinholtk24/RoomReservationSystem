<%@ Page Title="ViewRooms" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewRooms.aspx.cs" Inherits="ViewRooms" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="~/Content/bootstrap.cyborg.css" rel="stylesheet" type="text/css" />
    <link href="~/Content/bootstrap.cyborg.min.css" rel="stylesheet" type="text/css" />
    
    <h2> 
        <asp:Label ID="roomsReservedTableLable" runat="server" CssClass="col-md-10" Font-Size="XX-Large" Visible="False"></asp:Label>
    </h2>
    <p> 
        &nbsp;</p>
    <h2>
        <asp:GridView ID="reservedGridView" runat="server" AutoGenerateColumns="False" DataSourceID="reserved_rooms_for_grid_view" EmptyDataText="There are no rooms currently being processed for this account." CssClass="table table-striped" OnSelectedIndexChanged="reservedGridView_SelectedIndexChanged" OnRowCommand="reservedGridView_RowCommand">
            <Columns>
                <asp:ButtonField Text="Select Room" CommandName="roomSelected" HeaderText="Select">
                <ControlStyle ForeColor="White" />
                </asp:ButtonField>
                <asp:BoundField DataField="approved" HeaderText="Status" SortExpression="approved" />
                <asp:BoundField DataField="start_time" HeaderText="Start Time" SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="End Time" SortExpression="end_time" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:BoundField DataField="room_number" HeaderText="Room Number" SortExpression="room_number" />
                <asp:BoundField DataField="building_code" HeaderText="Building Code" SortExpression="building_code" />
                <asp:BoundField DataField="reservationID" HeaderText="reservationID" InsertVisible="False" ReadOnly="True" SortExpression="reservationID" />
            </Columns>
            <SelectedRowStyle BackColor="#FF6600" />
        </asp:GridView>
    </h2>
    <h2>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="newRoomBtn" runat="server" CssClass="btn-primary" Text="Reserve New Room" Font-Size="X-Large" OnClick="newRoomBtn_Click" />
        &nbsp;&nbsp;
        <asp:Button ID="unReserveBtn" runat="server" CssClass="btn-danger" Font-Size="X-Large" Text="Un-Reserve Room" OnClick="unReserveBtn_Click1" />

    &nbsp;<asp:Label ID="selectRoomError" runat="server" CssClass="label-danger" Font-Size="Medium" Text="Please select a room from above" Visible="False"></asp:Label>
    </h2>
    <p>

        &nbsp;</p>
    <h2>
        <asp:Label ID="adminTableLabel" runat="server" Text="" Visible="False"></asp:Label>
    </h2>
    <h2>
        <asp:GridView ID="adminGridView" runat="server" AutoGenerateColumns="False" DataSourceID="admin_rooms" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table" Visible="False" OnRowCommand="adminGridView_RowCommand"  OnSelectedIndexChanged="adminGridView_SelectedIndexChanged" DataKeyNames="reservationID">
            <Columns>
                <asp:ButtonField Text="Approve" CommandName="adminAccept" HeaderText="Accept">
                <ControlStyle ForeColor="#33CC33" />
                </asp:ButtonField>
                <asp:ButtonField CommandName="adminDeny" Text="Deny" HeaderText="Deny">
                <ControlStyle ForeColor="Red" />
                </asp:ButtonField>
                <asp:BoundField DataField="approved" HeaderText="Status" SortExpression="approved" />
                <asp:BoundField DataField="start_time" HeaderText="Start Time" SortExpression="start_time" />
                <asp:BoundField DataField="end_time" HeaderText="End Time" SortExpression="end_time" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:BoundField DataField="room_number" HeaderText="Room Number" SortExpression="room_number" />
                <asp:BoundField DataField="building_code" HeaderText="Building Code" SortExpression="building_code" />
                <asp:BoundField DataField="user_first_name" HeaderText="Requester's First Name" SortExpression="user_first_name" />
                <asp:BoundField DataField="user_last_name" HeaderText="Requester's Last Name" SortExpression="user_last_name" />
                <asp:BoundField DataField="reservationID" HeaderText="reservationID" InsertVisible="False" ReadOnly="True" SortExpression="reservationID" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </h2>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="approveBtn" runat="server" CssClass="btn-success" Font-Size="X-Large" OnClick="approveBtn_Click" Text="Approve" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="denyBtn" runat="server" CssClass="btn-danger" Font-Size="X-Large" OnClick="denyBtn_Click" Text="Deny" Visible="False" />
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    <h2>
        <asp:SqlDataSource ID="reserved_rooms" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [rooms_reserved] WHERE [userId] = ?" InsertCommand="INSERT INTO [rooms_reserved] ([reservationID], [approved], [room_owner], [start_time], [end_time], [date], [room_number], [building_code], [userId], [user_first_name], [user_last_name]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [rooms_reserved]" UpdateCommand="UPDATE [rooms_reserved] SET [reservationID] = ?, [approved] = ?, [room_owner] = ?, [start_time] = ?, [end_time] = ?, [date] = ?, [room_number] = ?, [building_code] = ? WHERE [userId] = ?">
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
                <asp:Parameter Name="user_first_name" Type="String" />
                <asp:Parameter Name="user_last_name" Type="String" />
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
        <asp:SqlDataSource ID="reserved_rooms_for_grid_view" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [approved], [start_time], [end_time], [date], [room_number], [building_code], [reservationID] FROM [rooms_reserved] WHERE ([userId] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="userId" SessionField="userId" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="userFirstName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [first_name] FROM [users] WHERE ([userId] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="userId" SessionField="userId" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="unReserveRoom" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [rooms_reserved] WHERE [reservationID] = ?" InsertCommand="INSERT INTO [rooms_reserved] ([reservationID], [approved], [room_owner], [start_time], [end_time], [date], [room_number], [building_code], [userId], [user_first_name], [user_last_name]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [rooms_reserved] WHERE ([reservationID] = ?)" UpdateCommand="UPDATE [rooms_reserved] SET [approved] = ?, [room_owner] = ?, [start_time] = ?, [end_time] = ?, [date] = ?, [room_number] = ?, [building_code] = ?, [userId] = ?, [user_first_name] = ?, [user_last_name] = ? WHERE [reservationID] = ?">
            <DeleteParameters>
                <asp:SessionParameter Name="reservationID" SessionField="reservationID" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="reservationID" Type="Int64" />
                <asp:Parameter Name="approved" Type="Int64" />
                <asp:Parameter Name="room_owner" Type="String" />
                <asp:Parameter Name="start_time" Type="Int64" />
                <asp:Parameter Name="end_time" Type="Int64" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="room_number" Type="String" />
                <asp:Parameter Name="building_code" Type="String" />
                <asp:Parameter Name="userId" Type="Int64" />
                <asp:Parameter Name="user_first_name" Type="String" />
                <asp:Parameter Name="user_last_name" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="reservationID" SessionField="reservationID" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="approved" Type="Int64" />
                <asp:Parameter Name="room_owner" Type="String" />
                <asp:Parameter Name="start_time" Type="Int64" />
                <asp:Parameter Name="end_time" Type="Int64" />
                <asp:Parameter Name="date" Type="String" />
                <asp:Parameter Name="room_number" Type="String" />
                <asp:Parameter Name="building_code" Type="String" />
                <asp:Parameter Name="userId" Type="Int64" />
                <asp:Parameter Name="user_first_name" Type="String" />
                <asp:Parameter Name="user_last_name" Type="String" />
                <asp:Parameter Name="reservationID" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="admin_rooms" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [approved], [start_time], [end_time], [date], [room_number], [building_code], [user_first_name], [user_last_name], [reservationID] FROM [rooms_reserved] WHERE ([room_owner] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="room_owner" SessionField="userEmail" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="approved" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [rooms_reserved] WHERE [reservationID] = ?" InsertCommand="INSERT INTO [rooms_reserved] ([reservationID], [approved]) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [reservationID], [approved] FROM [rooms_reserved] WHERE ([reservationID] = ?)" UpdateCommand="UPDATE [rooms_reserved] SET [approved] = 1 WHERE [reservationID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="reservationID" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="reservationID" Type="Int64" />
                <asp:Parameter Name="approved" Type="Int64" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="reservationID" SessionField="approvedIndex" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="reservationID" SessionField="approvedIndex" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="denied" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [rooms_reserved] WHERE [reservationID] = ?" InsertCommand="INSERT INTO [rooms_reserved] ([reservationID], [approved]) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [reservationID], [approved] FROM [rooms_reserved] WHERE ([reservationID] = ?)" UpdateCommand="UPDATE [rooms_reserved] SET [approved] = -1 WHERE [reservationID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="reservationID" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="reservationID" Type="Int64" />
                <asp:Parameter Name="approved" Type="Int64" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="reservationID" SessionField="deniedIndex" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="reservationID" SessionField="deniedIndex" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h2>

</asp:Content>