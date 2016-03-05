
namespace Test2
{
	using System;
	using System.Collections.Generic;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.HtmlControls;
	using System.Data;
	using System.IO;
	using Mono.Data.Sqlite;

	public partial class Default : System.Web.UI.Page
	{
		
		public void button1Clicked (object sender, EventArgs args)
		{
			button1.Text = "Results";

			List<string> myList = new List<string> (); 
			int counter = 0; 

			var connection = GetConnection ();

			Console.WriteLine (connection); 
			using (var cmd = connection.CreateCommand ()) {
				connection.Open ();
				cmd.CommandText = "SELECT * FROM users";
				using (var reader = cmd.ExecuteReader ()) {
					while (reader.Read ()) {
						Console.Error.Write ("(Row ");
						Write (reader, 0);
						myList.Add(Convert.ToString(reader.GetString (0))); 
						for (int i = 1; i < reader.FieldCount; ++i) {
							Console.Error.Write(" ");
							myList.Add (Convert.ToString (reader[i])); 
							Write (reader, i); 


						}
						Console.Error.WriteLine(")");
						counter = counter + 1; 
					}
				}
				connection.Close ();
			}

			HtmlTable table1 = new HtmlTable();

			table1.Border = 1;
			table1.CellPadding = 3;
			table1.CellSpacing = 3;
			table1.BorderColor = "red";


				HtmlTableRow row;
			    HtmlTableCell cell;
			    int ounter = 0; 	
			int total = (myList.Count / 6);
			Console.WriteLine (total); 
			Console.WriteLine (myList.Capacity); 

				for (int i=0; i<total; i++)
				{
					// Create a new row and set its background color.
					row = new HtmlTableRow(); 
					row.BgColor = (i%2==0 ? "lightyellow" : "lightcyan"); 
					
					for (int j=0; j<=5; j++)
					{
					    cell = new HtmlTableCell();
						// Create a cell and set its text.
						cell = new HtmlTableCell();
						cell.InnerHtml = myList[ounter];
					    ounter = ounter + 1;
						// Add the cell to the current row.
						row.Cells.Add(cell);
					}
					// Add the row to the table.
					table1.Rows.Add(row);
				}

				// Add the table to the page.
				this.Controls.Add(table1);

		}


		static SqliteConnection GetConnection()
		{
			string frontend_path = Path.GetDirectoryName(Path.GetDirectoryName(System.IO.Directory.GetCurrentDirectory()));
			//string db = Path.Combine (wanted_path, "RRSDB.db");
			string system_path = new DirectoryInfo (frontend_path).Parent.FullName;
			string fileName = "Backend/RRSDB.db";
			string path = Path.Combine(system_path, fileName);

			//string CurrentDirectory = new DirectoryInfo (path).Parent.FullName; 
			//string FileSystemDir = new DirectoryInfo (CurrentDirectory).Parent.FullName;

			Console.WriteLine (path);

			//string frontEndDir = Path.Combine (FileSystemDir, "FrontEnd");
			//string DBPath = Path.Combine (frontEndDir, "RRSDB.db"); 
			//Console.WriteLine (DBPath); 
			//Console.WriteLine (path); 
			bool exists = File.Exists(path);
			Console.Write (exists); 

			var conn = new SqliteConnection ("Data Source=" + path);
			
			return conn;
		}

		static void Write(SqliteDataReader reader, int index)
		{
			Console.Error.Write("({0} '{1}')",
			                    reader.GetName(index),
			                    reader [index]);
		}
	}
}

