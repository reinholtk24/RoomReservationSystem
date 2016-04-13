using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Home : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Home";

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        dateLabel.Visible = false;
        dateCalendar.Visible = false;
        timeLabel.Visible = false;
        timeDropDownList.Visible = false;
    }

    protected void dateCalendar_SelectionChanged(object sender, EventArgs e)
    {       
        dateSelected();
    }

    protected void timeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        buildingSelected();
    }

    protected void buildingSelected()
    {
        dateLabel.Visible = true;
        dateCalendar.Enabled = true;
        dateCalendar.Visible = true;
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



        RRSDB.SelectCommand = "SELECT * FROM [buildings]"; //stores command
        RRSDB.DataBind();
        DataView dv = (DataView)RRSDB.Select(DataSourceSelectArguments.Empty); //executes command and stores in dv

        
        for (int i =0; i < buildingDropDownList.Items.Count; i++)
        {
            if (buildingDropDownList.SelectedValue == dv.Table.Rows[i][0].ToString())
            {
                rowNum = i;
            }
        }//gets the row number of selected buidling in data base

        buildingDropDownList.SelectedIndex = rowNum;


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
    }
}