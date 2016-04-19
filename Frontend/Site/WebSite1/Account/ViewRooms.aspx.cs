using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ViewRooms : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "ViewRooms";
        storeSession(); 
    }

    protected void storeSession()
    {
        try
        {
           

            reserved_rooms.InsertCommand = "INSERT INTO [reserved_rooms] (reservationID, approved, room_owner, start_time, end_time, date, room_number, building_code, userId) VALUES (@1, @2, @3, @4, @5, @6, @7, @8, @9)";
          
            reserved_rooms.InsertParameters.Add("reservationID", null);
            reserved_rooms.InsertParameters.Add("approved",  "0");
            reserved_rooms.InsertParameters.Add("room_owner", Session["owner"].ToString());
            reserved_rooms.InsertParameters.Add("start_time", Session["startTime"].ToString());
            reserved_rooms.InsertParameters.Add("end_time", Session["endTime"].ToString());
            reserved_rooms.InsertParameters.Add("date", Session["date"].ToString());
            reserved_rooms.InsertParameters.Add("room_number", Session["roomNumber"].ToString());
            reserved_rooms.InsertParameters.Add("building_code", Session["buildingCode"].ToString());
            reserved_rooms.InsertParameters.Add("userId", Session["userId"].ToString());
            System.Diagnostics.Debug.WriteLine("it shoould have wrote");
            System.Diagnostics.Debug.WriteLine(reserved_rooms.InsertCommand.ToString());
           
            reserved_rooms.DataBind();
        }
        catch
        {


        }

    }

}