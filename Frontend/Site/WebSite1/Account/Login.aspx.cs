using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using WebSite1;

public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Room selected index after login.");
            System.Diagnostics.Debug.WriteLine(Session["roomSelected"]);
            System.Diagnostics.Debug.WriteLine(Session["buildingCode"]);
            System.Diagnostics.Debug.WriteLine(Session["roomNumber"]);
            System.Diagnostics.Debug.WriteLine(Session["owner"]);
            System.Diagnostics.Debug.WriteLine(Session["numberOfSeats"]);
            System.Diagnostics.Debug.WriteLine(Session["startTime"]);
            System.Diagnostics.Debug.WriteLine(Session["endTime"]);
            System.Diagnostics.Debug.WriteLine(Session["date"]);
            System.Diagnostics.Debug.WriteLine(UserName.Text);
            System.Diagnostics.Debug.WriteLine(Password.Text);

            usersTable.SelectParameters.Add("university_email", UserName.Text); 

            usersTable.SelectCommand = "SELECT * FROM [users] WHERE (university_email = \"" + UserName.Text + "\") and (password = \"" + Password.Text + "\")";
            //usersTable.SelectParameters["university_email"].DefaultValue = UserName.Text;
            //usersTable.SelectParameters["password"].DefaultValue = Password.Text; 
            usersTable.DataBind();
            DataView currentUser = null;
           
            try
            {
                currentUser = (DataView)usersTable.Select(DataSourceSelectArguments.Empty);

                System.Diagnostics.Debug.WriteLine(currentUser.Table.Rows.Count);
                System.Diagnostics.Debug.WriteLine(currentUser.Table.Rows[0][6]);
                Session["userEmail"] = currentUser.Table.Rows[0][0];
                Session["firstName"] = currentUser.Table.Rows[0][1];
                Session["lastName"] = currentUser.Table.Rows[0][2]; 
                Session["admin"] = currentUser.Table.Rows[0][5]; 
                Session["userId"] = currentUser.Table.Rows[0][6];
                
                System.Diagnostics.Debug.WriteLine(Session["userId"]);
                System.Diagnostics.Debug.WriteLine(Session["userEmail"]);
                System.Diagnostics.Debug.WriteLine("Checking if admin priviledges is 1 or not!!!");
                System.Diagnostics.Debug.WriteLine(Session["admin"]);

                Server.Transfer("ViewRooms.aspx", true); 

                /*
                for (int i = 0; i < 1; i++)
                {
                    for (int j = 0; j < 7; j++)
                    {
                        System.Diagnostics.Debug.Write(currentUser.Table.Rows[i][j] + "  ");

                    }

                    System.Diagnostics.Debug.WriteLine(" ");
                }*/
            }
            catch
            {
                System.Diagnostics.Debug.WriteLine("Wrong username or password exception caught.");
                userPassErrorLabel.Visible = true; 
            }

      
            

            /*
            if (IsValid)
            {
                // Validate the user password
                var manager = new UserManager();
                ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    FailureText.Text = "Invalid username or password.";
                    ErrorMessage.Visible = true;
                }
            }*/
        
       }
            
}