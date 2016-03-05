<%@ Page Language="C#" Inherits="Test2.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head runat="server">
	<title>Default</title>
</head>
<body bgcolor="#E6E6FA">
	<h1>This is a test to fetch information from the database and print it into a table.</h1>
	<h3> Click the button below to generate a table with the information from the users table in the RRSDB.db.</h3>
	<form id="form1" runat="server">
		<asp:Button id="button1" runat="server" Text="Click me!" OnClick="button1Clicked" />
	</form>
</body>
</html>
