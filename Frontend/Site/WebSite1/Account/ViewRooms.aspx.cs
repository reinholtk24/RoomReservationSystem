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
        DataView usersFirstName = (DataView) userFirstName.Select(DataSourceSelectArguments.Empty);
        roomsReservedTableLable.Text = "Hello " + usersFirstName.Table.Rows[0][0].ToString() + "! Here is Your Room Status Table: ";
        roomsReservedTableLable.Visible = true; 

        foreach(GridViewRow gridRow in reserverdGridView.Rows)
        {
            for (int i = 0; i < reserverdGridView.Columns.Count; i++)
            {
                if (gridRow.Cells[0].Text.Contains("0"))
                {
                    gridRow.Cells[0].Text = gridRow.Cells[0].Text.Replace(@"0", "pending");
                    gridRow.Cells[0].ForeColor = System.Drawing.Color.CornflowerBlue; 
                }
            }
        }

        if(Session["admin"].ToString() == "1")
        {
            adminTableLabel.Text = "Rooms that need your attention: ";
            adminTableLabel.Visible = true; 
            adminGridView.Visible = true; 
            
            foreach (GridViewRow gridRow in adminGridView.Rows)
            {
                for (int i = 0; i < adminGridView.Columns.Count; i++)
                {
                    if (gridRow.Cells[2].Text.Contains("0"))
                    {
                        gridRow.Cells[2].Text = gridRow.Cells[2].Text.Replace(@"0", "pending");
                        gridRow.Cells[2].ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                }
            }
            
            
        }
    }

    protected void storeSession()
    {
        try
        {
            
            reserved_rooms.InsertParameters.Add("reservationID", null);
            reserved_rooms.InsertParameters.Add("approved",  "0");
            reserved_rooms.InsertParameters.Add("room_owner", Session["owner"].ToString());
            reserved_rooms.InsertParameters.Add("start_time", Session["startTime"].ToString());
            reserved_rooms.InsertParameters.Add("end_time", Session["endTime"].ToString());
            reserved_rooms.InsertParameters.Add("date", Session["date"].ToString());
            reserved_rooms.InsertParameters.Add("room_number", Session["roomNumber"].ToString());
            reserved_rooms.InsertParameters.Add("building_code", Session["buildingCode"].ToString());
            reserved_rooms.InsertParameters.Add("userId", Session["userId"].ToString());
            reserved_rooms.InsertParameters.Add("user_first_name", Session["firstName"].ToString());
            reserved_rooms.InsertParameters.Add("user_last_name", Session["lastName"].ToString());

            System.Diagnostics.Debug.WriteLine("reservationID ");
            System.Diagnostics.Debug.WriteLine("approved ", "0");
            System.Diagnostics.Debug.WriteLine("room_owner ", Session["owner"].ToString());
            System.Diagnostics.Debug.WriteLine("start_time ", Session["startTime"].ToString());
            System.Diagnostics.Debug.WriteLine("end_time ", Session["endTime"].ToString());
            System.Diagnostics.Debug.WriteLine("date ", Session["date"].ToString());
            System.Diagnostics.Debug.WriteLine("room_number ", Session["roomNumber"].ToString());
            System.Diagnostics.Debug.WriteLine("building_code ", Session["buildingCode"].ToString());
            System.Diagnostics.Debug.WriteLine("userId ", Session["userId"].ToString());
            System.Diagnostics.Debug.WriteLine("it shoould have wrote");
            System.Diagnostics.Debug.WriteLine(reserved_rooms.InsertCommand.ToString());
            
            reserved_rooms.Insert();

            Session["owner"] = null; 
            Session["startTime"] = null;
            Session["endTime"] = null;
            Session["date"] = null; 
            Session["roomNumber"] = null;
            Session["buildingCode"] = null;
            


           // reserved_rooms.DataBind();
        }
        catch
        {
            System.Diagnostics.Debug.WriteLine("Data did not bind."); 

        }

    }
    protected void adminGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "adminAccept")
        {

            System.Diagnostics.Debug.WriteLine("Accepted!");

            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument);

            adminGridView.SelectedIndex = index;
            adminGridView.SelectedRowStyle.BackColor = System.Drawing.Color.LawnGreen; 

            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            GridViewRow selectedRow = adminGridView.Rows[index];

            System.Diagnostics.Debug.WriteLine(selectedRow.Cells[0].Text);
            System.Diagnostics.Debug.WriteLine(selectedRow.Cells[1].Text);
            System.Diagnostics.Debug.WriteLine(selectedRow.Cells[2].Text);
            System.Diagnostics.Debug.WriteLine(selectedRow.Cells[3].Text);
            System.Diagnostics.Debug.WriteLine(selectedRow.Cells[4].Text);
            System.Diagnostics.Debug.WriteLine(selectedRow.Cells[5].Text);

        }

        if (e.CommandName == "adminDeny")
        {

            System.Diagnostics.Debug.WriteLine("Denied!");

            int index = Convert.ToInt32(e.CommandArgument);

            adminGridView.SelectedIndex = index;
            adminGridView.SelectedRowStyle.BackColor = System.Drawing.Color.Red;

            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            GridViewRow selectedRow = adminGridView.Rows[index];

        }

    }



    protected void adminGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string name = 
 

        //System.Diagnostics.Debug.WriteLine("Here is the string with the text selected from adminGridView!  ", name);
        System.Diagnostics.Debug.WriteLine("Hopefully this is the value I want.");
        string item = adminGridView.Rows[adminGridView.SelectedIndex].Cells[0].Text; 
        System.Diagnostics.Debug.WriteLine(item); 
    }
   
}