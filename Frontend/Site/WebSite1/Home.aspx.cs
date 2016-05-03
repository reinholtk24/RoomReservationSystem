using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections;

public partial class Home : Page
{
    public string building_code;

    public DataTable avialable;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Home";

      /*  if(!IsPostBack)
        {
            goto 
        }*/
        
    }

    public DataSet dataset2;
   
    public static class GlobalVars
    {
        public static int GlobalInt = 256;
        public static List<RadioButton> listOfRadioButtons = new List<RadioButton>();
        public static DataView roomsAvailable = new DataView();
        public static Table roomsTable = new Table();
       
    }
 
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateLabel.Visible = false;
        dateCalendar.Visible = false;
        timeLabel.Visible = false;
        timeDropDownList.Visible = false;
        viewButton.Visible = false;
    }

    protected void dateCalendar_SelectionChanged(object sender, EventArgs e)
    {       
        if(dateCalendar.SelectedDate < dateCalendar.TodaysDate)
        {
            dateErrorLabel.Visible = true;
        }
        else
        {
            dateErrorLabel.Visible = false;
            dateSelected();
        }
     
        
    }

    protected void timeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (timeDropDownList.Visible == true) 
        {
            timeSelected(); 
        }
        else
        {
            //Do Nothing 
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        buildingSelected();
    }

    protected void buildingSelected()
    {

        dateLabel.Visible = true;
        dateCalendar.Enabled = true;
        dateCalendar.SelectedDate = DateTime.Today; 
        dateCalendar.Visible = true;
    }

    protected void timeSelected()
    {
        viewButton.Visible = true;
        viewButton.Enabled = true;
        viewButton.Visible = true;
    }
    protected void dateSelected()
    {
        checkDateBounds();
        timeLabel.Visible = true;
        timeDropDownList.Visible = true;
        timeDropDownList.Enabled = true;
    }
    
    private void checkDateBounds()
    {
        int rowNum =0;

        int open_time = 0;
        int close_time =0;

        const int weekday_open_time_index =2;
        const int weekday_close_time_index =3;
        const int sat_open_time_index =4;
        const int sat_close_time_index =5;
        const int sun_open_time_index =6;
        const int sun_close_time_index =7;

        buildings.SelectCommand = "SELECT * FROM [buildings]"; //stores command
        buildings.DataBind();
        DataView dv = (DataView)buildings.Select(DataSourceSelectArguments.Empty); //executes command and stores in dv

        
        for (int i =0; i < buildingDropDownList.Items.Count; i++)
        {
            if (buildingDropDownList.SelectedValue == dv.Table.Rows[i][0].ToString())
            {

                rowNum = i;
            }
        }//gets the row number of selected buidling in data base

        buildingDropDownList.SelectedIndex = rowNum;
        building_code = dv.Table.Rows[rowNum][1].ToString();

        DayOfWeek day = dateCalendar.SelectedDate.DayOfWeek;
 
        if (day == DayOfWeek.Monday || day == DayOfWeek.Tuesday || day == DayOfWeek.Wednesday || day == DayOfWeek.Thursday || day == DayOfWeek.Friday)
        {
             open_time = (int)dv.Table.Rows[rowNum][weekday_open_time_index];
             close_time = (int)dv.Table.Rows[rowNum][weekday_close_time_index];
        }

        else if (day == DayOfWeek.Saturday)
        {
             open_time = (int)dv.Table.Rows[rowNum][sat_open_time_index];
             close_time =  (int)dv.Table.Rows[rowNum][sat_close_time_index];
        }

        else if (day == DayOfWeek.Sunday)
        {
            open_time = (int)dv.Table.Rows[rowNum][sun_open_time_index];
            close_time =  (int)dv.Table.Rows[rowNum][sun_close_time_index]; 
        }


        string close_time_ampm; //stores the closed time in am or pm format
        if (open_time < 1100)
        {
            close_time_ampm = close_time.ToString().PadLeft(4, '0').Insert(2, ":").Insert(4, " am");
        }
        else if (open_time >= 1100 && open_time < 1200)
        {
            close_time_ampm = close_time.ToString().PadLeft(4, '0').Insert(2, ":").Insert(4, " am");
        }
        else if (open_time < 100)
        {
            close_time_ampm = close_time.ToString().Insert(0, "12").PadLeft(4, '0').Insert(2, ":").Insert(4, " am");
        }
        else
        {
            int temp = open_time - 1200;
            close_time_ampm = temp.ToString().PadLeft(4, '0').Insert(2, ":").Insert(4, " pm");
        }//converts the millitary close_time in databse to am pm format
        //doing this outside loop for effieciency 

        timeDropDownList.Items.Clear();

        int time = open_time; // time counter for intervals in loop incremented by and hour
        while (true)
        {
            string start_reserve_time;
            string end_reserve_time;
            

            if (time < 1000)
            {
                start_reserve_time = time.ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " am");
                if ((time+100) < 1000)
                {
                    end_reserve_time = (time + 100).ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " am");
                }
                else
                {
                    end_reserve_time = (time + 100).ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " am");
                }
                
            }
            else if (time < 1100)
            {
                start_reserve_time = time.ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " am");
                end_reserve_time = (time + 100).ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " am");
            }
            else if (time >= 1100 && time < 1300)
            {
                if (time < 1200)
                {
                    start_reserve_time = time.ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " am");
                }
                else
                {
                    start_reserve_time = time.ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " pm");
                }

                if ((time+100) < 1200)
                {
                    end_reserve_time = ((time) + 100).ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " am");
                }
                else if ((time+100) == 1200)
                {
                    end_reserve_time = ((time) + 100).ToString().PadLeft(3, '0').Insert(2, ":").Insert(5, " pm");
                }
                else
                {
                    end_reserve_time = (((time-1200) + 100)).ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " pm");
                }              
            }
            else
            {
                int temp = time - 1200;
                if ((temp+100) < 1000)
                {
                    start_reserve_time = temp.ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " pm");
                    end_reserve_time = (temp + 100).ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " pm");
                }
                else
                {
                    start_reserve_time = temp.ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " pm");
                    end_reserve_time = (temp + 100).ToString().PadLeft(4, '0').Insert(2, ":").Insert(5, " pm");
                }
                
            }//converts reserve start and end time to am pm format 


            if (close_time < 1200)
            {
                close_time_ampm = close_time.ToString().PadLeft(3, '0').Insert(1, ";").Insert(4, " am");
            }
            else
            {
                int temp = close_time - 1200;
                close_time_ampm = temp.ToString().PadLeft(3, '0').Insert(1, ":").Insert(4, " pm");
            }


            if (time == 0 && close_time == 0)
            {
                timeDropDownList.Items.Add("Building Closed Today");
                break;
            }
            else if ((time + 100) < close_time)
            {
                time += 100;
                timeDropDownList.Items.Add(start_reserve_time + " - " + end_reserve_time);
            }
            else
            {
                timeDropDownList.Items.Add(start_reserve_time + " - " + end_reserve_time);
                break;
            }
        }

        dv.Dispose();
        dv = null;
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        viewRooms(); 
       
    }

    protected void viewRooms()
    {
        string buildingCode = getBuildingCode(buildingDropDownList.SelectedItem.ToString());
        Session["bldCode"] = buildingCode; 
        string timesRequested = timeDropDownList.SelectedItem.ToString();
        string[] timeInterval = timesRequested.Split(' ');
        //timeInterval is the is an array that will hold 5 items which is the interval of time the user selected. Example: [0] -> 8:00 [1] -> pm [2] -> - [3] -> 9:00 [4] -> pm 
        int startTime = getStartTime(timeInterval[0], timeInterval[1]); //getStartTime takes the start time example 8:00 PM  timeInterval[0] contains the number and timeInterval[1] contains AM or PM
        Session["startTime"] = startTime; 
        int hourInMilitaryTime = 100; 
        int endTime = startTime + hourInMilitaryTime; // We can get the endTime by adding an hour onto the start_time because the user can only reserve a room for an interval of 1 hour. 
        Session["endTime"] = endTime; 

        string usr_day = dateCalendar.SelectedDate.DayOfWeek.ToString();
        string selectedDate = dateCalendar.SelectedDate.ToString();
        string[] dateNTime = selectedDate.Split(' ');
        string usr_date = dateNTime[0];
        System.Diagnostics.Debug.WriteLine("Date in vs date format: ", usr_date);
        Session["date"] = usr_date; 
        string usr_day_code = getDayCode(usr_day); 

        DataView totalRooms = generateRoomsQuery(buildingCode); //This generates the initial query to display to the user
        System.Diagnostics.Debug.WriteLine("Printing totalRooms Count");
        System.Diagnostics.Debug.WriteLine(totalRooms.Table.Rows.Count.ToString()); 

        int num = totalRooms.Table.Rows.Count;
        for (int i = 0; i < num; i++)
        {
            for (int j = 0; j < 8; j++)
            {
                System.Diagnostics.Debug.Write(totalRooms.Table.Rows[i][j] + "  ");

            }

            System.Diagnostics.Debug.WriteLine(" ");
        }

        DataView classesInRooms = generateRoomStatusQuery(startTime, endTime, buildingCode, usr_day_code); //This query of classesInRooms will be removed from the total rooms query 
        
        DataView firstPassRooms = totalMinusClasses(totalRooms, classesInRooms);

        DataView roomsAvailable = checkIfReserved(firstPassRooms); // Check building code start time and the date here 

        //GlobalVars.roomsAvailable = firstPassRooms; 

        displayRoomsAvailableToUser(roomsAvailable);

        /*
        //////////////////////////////////////////////TEST PRINT for all clasesInRooms in user selected building
        
         
        int num = firstPassRooms.Table.Rows.Count;
        for (int i = 0; i < num; i++)
        {
            for (int j = 0; j < 8; j++)
            {
                System.Diagnostics.Debug.Write(firstPassRooms.Table.Rows[i][j] + "  ");

            }

            System.Diagnostics.Debug.WriteLine(" ");
        }/*
        //////////////////////////////////////////////END TEST PRINT
        */
    }

    private int getStartTime(string startTime, string amOrPm)
    {
        int returnStartTime = 0;
        int numValue = 0;

        if(amOrPm == "am")
        {
            startTime = startTime.Replace(':', ' ');
            string preppedSTime = startTime.Trim();
            string start_time = Regex.Replace(preppedSTime, @"\s+", "");

            bool parsed = Int32.TryParse(start_time, out numValue);

            if (!parsed)
            {
                Console.WriteLine("Int32.TryParse could not parse '{0}' to an int.\n", start_time);
            }
            else
            {
                returnStartTime = numValue;
                System.Diagnostics.Debug.WriteLine(returnStartTime);
            }

        }
        else if( amOrPm == "pm")
        {
            startTime = startTime.Replace(':', ' ');
            string preppedSTime = startTime.Trim();
            string start_time = Regex.Replace(preppedSTime, @"\s+", "");

            bool parsed = Int32.TryParse(start_time, out numValue);

            if (!parsed)
            {
                Console.WriteLine("Int32.TryParse could not parse '{0}' to an int.\n", start_time);
            }
            else
            {
                if(numValue == 1200)
                {
                    returnStartTime = 1200; 
                }
                else
                {
                    returnStartTime = numValue + 1200;
                    System.Diagnostics.Debug.WriteLine(returnStartTime);
                }
             
            }
        }
        else
        {
            System.Diagnostics.Debug.WriteLine("AM , PM , ERROR");
        }

        return returnStartTime;

    }
    private string getBuildingCode(string buildingName)
    {
        string buildingCode = "";

        buildingsTwo.SelectCommand = "SELECT * FROM [buildings] WHERE (building = \"" + buildingName + "\")";
        System.Diagnostics.Debug.WriteLine(buildingsTwo.SelectCommand.ToString()); 
        buildingsTwo.DataBind();
        DataView buildings = (DataView)buildingsTwo.Select(DataSourceSelectArguments.Empty);

        buildingCode = buildings.Table.Rows[0][1].ToString();

        return buildingCode; 
    }
    
    private DataView generateRoomsQuery(string usrBldCode)
    {
        rooms.SelectCommand = "SELECT * FROM [rooms] WHERE (building_code = \"" + usrBldCode + "\")";
        System.Diagnostics.Debug.WriteLine("checking rooms query select command");
        System.Diagnostics.Debug.WriteLine(rooms.SelectCommand.ToString()); 
        rooms.DataBind();
        DataView roomsFromBuilding = (DataView)rooms.Select(DataSourceSelectArguments.Empty);

        return roomsFromBuilding; 
    }
    
    private DataView generateRoomStatusQuery(int sTime, int eTime, string usr_bld_code, string usrDay)
    {
        rooms.SelectCommand = "SELECT * FROM [room_status] WHERE (building_code = \"" + usr_bld_code + "\") and (start_time < " + sTime + ") and (end_time > " + sTime + ") and (end_time < " + eTime + ") and (" + usrDay + " = 1) or (building_code = \"" + usr_bld_code + "\") and (start_time >= " + sTime + ") and (end_time <= " + eTime + ") and (" + usrDay + " = 1) or (building_code = \"" + usr_bld_code + "\") and (start_time > " + sTime + ") and (end_time < " + eTime + ") and (" + usrDay + " = 1)";
        System.Diagnostics.Debug.WriteLine(rooms.SelectCommand);
        rooms.DataBind();
        DataView roomsFromBuilding = (DataView)rooms.Select(DataSourceSelectArguments.Empty);

        return roomsFromBuilding;
    }

    private DataView checkIfReserved(DataView firstRoomsPass)
    {
        // Check building code start time and the date here 

        DataView reserved = (DataView)reservedData.Select(DataSourceSelectArguments.Empty);
       
        int allRowsCounter = firstRoomsPass.Table.Rows.Count;
        int reservedCounter = reserved.Table.Rows.Count;
        List<int> rowsToRemove = new List<int>();
          
        //int numOfCols = 1; 
        System.Diagnostics.Debug.WriteLine("Checking rooms in the reserved rooms table."); 
        ///TEST PRINT
        
        for (int i = 0; i < allRowsCounter; i++)
        {
            for (int j = 0; j < reservedCounter; j++)
            {
                System.Diagnostics.Debug.WriteLine(firstRoomsPass.Table.Rows[i][0]);
                System.Diagnostics.Debug.WriteLine(firstRoomsPass.Table.Rows[i][1]);
                System.Diagnostics.Debug.WriteLine(firstRoomsPass.Table.Rows[i][2]);
                System.Diagnostics.Debug.WriteLine(firstRoomsPass.Table.Rows[i][3]);
                System.Diagnostics.Debug.WriteLine("Reserved Table:::::::::::::: ");
                System.Diagnostics.Debug.WriteLine(reserved.Table.Rows[j][0]);

                if( firstRoomsPass.Table.Rows[i][1].ToString() == reserved.Table.Rows[j][0].ToString())
                {
                    System.Diagnostics.Debug.WriteLine("Rooms to be removed from the first pass table:::::::: "); 
                    System.Diagnostics.Debug.WriteLine(reserved.Table.Rows[j][0].ToString()); 
                    firstRoomsPass.Table.Rows.RemoveAt(i);
                    allRowsCounter = allRowsCounter - 1;
                    i = i - 1; 
                    
                }
            }

            System.Diagnostics.Debug.WriteLine(" ");
        }

        return firstRoomsPass; 
    }

    private string getDayCode(string usrDayOfWeek)
    {
        string dayCode = ""; 

        switch(usrDayOfWeek)
        {
            case("Monday"):
                dayCode = "MON"; 
                break;
            case("Tuesday"):
                dayCode = "TUE";
                break;
            case("Wednesday"):
                dayCode = "WED";
                break;
            case("Thursday"):
                dayCode = "THR";
                break;
            case("Friday"):
                dayCode = "FRI";
                break;
            case("Saturday"):
                dayCode = "SAT";
                break;
            case("Sunday"):
                dayCode = "SUN";
                break;
            default: 
                System.Diagnostics.Debug.WriteLine("Error with converting day of week into day code");
                break;
        }

        return dayCode;
    }

    private DataView totalMinusClasses(DataView allRooms, DataView roomsHaveClass)
    {
        int allRowsCounter = allRooms.Table.Rows.Count; 
        int classRowsCounter = roomsHaveClass.Table.Rows.Count;
        //List<int> rowsToRemove = new List<int>();

        for (int i = 0; i < classRowsCounter; i++)
        {
            for (int j = 0; j < allRowsCounter; j++)
            {
                if( allRooms.Table.Rows[j][1].ToString() == roomsHaveClass.Table.Rows[i][1].ToString() ) //This means the room is in both queries and needs to be removed from the total rooms query. 
                {
                    allRooms.Table.Rows.RemoveAt(j);
                    allRowsCounter = allRowsCounter - 1;
                    if(j == 0)
                    {
                        j = 0; 
                        continue; 
                    }
                    else
                    {
                        j = j - 1;
                    }
                     
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine(allRooms.Table.Rows[j][1]);
                    System.Diagnostics.Debug.WriteLine(roomsHaveClass.Table.Rows[i][1]);
                    continue; 
                }
            }

        }

        return allRooms; 
    }


    /*private DataView checkIfReserved(DataView roomList)
    {

    }*/

    protected void displayRoomsAvailableToUser(DataView listOfRoomsAvailable)
    {
        dateLabel.Visible = false;
        buildingDropDownList.Visible = false;
        Label1.Visible = false; 
        buildingButton.Visible = false; 
        dateCalendar.Visible = false;
        timeLabel.Visible = false;
        timeDropDownList.Visible = false;
        viewButton.Visible = false;

        avialable = new DataTable();
        DataColumn column;
        DataRow row;

        //roomsGridView.DataSource = listOfRoomsAvailable.Table;
       // System.Diagnostics.Debug.WriteLine(roomsGridView.Rows.Count); 

        //roomsGridView.DataBind();

        /*
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.Int32");
        column.ColumnName = "id";
        column.ReadOnly = true;
        column.Unique = true;
        // Add the Column to the DataColumnCollection.
        avialable.Columns.Add(column);
        */


        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "Building Code";
        column.AutoIncrement = false;
        column.Caption = "Building Code";
        column.ReadOnly = false;
        column.Unique = false;
        avialable.Columns.Add(column); // Add the column to the table.

        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "Room Number";
        column.AutoIncrement = false;
        column.Caption = "Room #";
        column.ReadOnly = false;
        column.Unique = false;
        avialable.Columns.Add(column); // Add the column to the table.

        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "Owner";
        column.AutoIncrement = false;
        column.Caption = "Owner";
        column.ReadOnly = false;
        column.Unique = false;
        avialable.Columns.Add(column); // Add the column to the table.

        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "Number Of Seats";
        column.AutoIncrement = false;
        column.Caption = "# seats";
        column.ReadOnly = false;
        column.Unique = false;
        avialable.Columns.Add(column); // Add the column to the table.
        /*
        DataColumn[] PrimaryKeyColumns = new DataColumn[1];
        PrimaryKeyColumns[0] = avialable.Columns["id"];
        avialable.PrimaryKey = PrimaryKeyColumns;
        */
        // Instantiate the DataSet variable.

        dataset2 = new DataSet();

        // Add the new DataTable to the DataSet.
        dataset2.Tables.Add(avialable);

        for (int i = 0; i < listOfRoomsAvailable.Table.Rows.Count; i++)
        {
            row = avialable.NewRow();
            row["Building Code"] = listOfRoomsAvailable.Table.Rows[i][0];
            row["Room Number"] = listOfRoomsAvailable.Table.Rows[i][1];
            row["Owner"] = listOfRoomsAvailable.Table.Rows[i][2];
            row["Number Of Seats"] = listOfRoomsAvailable.Table.Rows[i][3];
            avialable.Rows.Add(row);
        }

        GlobalVars.roomsAvailable = listOfRoomsAvailable; 


        GlobalVars.GlobalInt = 90;

        roomsGridView.Enabled = true;
        System.Diagnostics.Debug.WriteLine("rooms grid");
        System.Diagnostics.Debug.WriteLine(avialable.Rows.Count);

        roomsGridView.DataSource = avialable;
        roomsGridView.DataBind();
        System.Diagnostics.Debug.WriteLine("rooms grid");
        System.Diagnostics.Debug.WriteLine(roomsGridView.Rows.Count);

        roomsGridView.Visible = true;
        
    }

    protected void buildings_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void room_status_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void rooms_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void selectRoom_Click(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        roomsGridView.Visible = true;
        dateErrorLabel.Visible = false; 
        selectRoom.Visible = true;
        foreach (GridViewRow gridRow in roomsGridView.Rows)
        {
            if(gridRow.RowIndex != roomsGridView.SelectedIndex)
            {
                gridRow.Visible = false; 
            }
            else
            {
                gridRow.Visible = true; 

            }
        }
        getRow(); 
    }

    private void getRow()
    {
        roomsGridView.Visible = true;
        System.Diagnostics.Debug.WriteLine("Number of rows in data grid");
        Session["roomSelected"] = roomsGridView.SelectedIndex.ToString(); 
        System.Diagnostics.Debug.WriteLine(roomsGridView.Rows.Count);
        System.Diagnostics.Debug.WriteLine(roomsGridView.SelectedIndex.ToString());
        System.Diagnostics.Debug.WriteLine("Selected Row: " ); 
        System.Diagnostics.Debug.WriteLine(GlobalVars.roomsAvailable.Table.Rows[roomsGridView.SelectedIndex][2]);
        Session["buildingCode"] = GlobalVars.roomsAvailable.Table.Rows[roomsGridView.SelectedIndex][0]; 
        Session["roomNumber"] = GlobalVars.roomsAvailable.Table.Rows[roomsGridView.SelectedIndex][1]; 
        Session["owner"] = GlobalVars.roomsAvailable.Table.Rows[roomsGridView.SelectedIndex][2];
        Session["numberOfSeats"] = GlobalVars.roomsAvailable.Table.Rows[roomsGridView.SelectedIndex][3]; 
        
    }
}