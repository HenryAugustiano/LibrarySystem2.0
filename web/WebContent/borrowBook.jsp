<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">

<div class="text-c">
<style>
    .text-c {
		text-align: center;
	}
</style>
<%

String bookName = request.getParameter("bookName");
if(bookName == null) {
	bookName = "";
}

//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

Connection con = DriverManager.getConnection(url, uid, pw);

String sql = "SELECT book1, book2 FROM users";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setInt(1, uid);
return stmt.executeQuery();




con.close();

%>
</body>
</html>