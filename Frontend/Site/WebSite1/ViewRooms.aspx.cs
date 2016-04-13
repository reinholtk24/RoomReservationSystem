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
    }
}