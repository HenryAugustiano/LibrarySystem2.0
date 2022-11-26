<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Your Account has been Successfully Created</h1>
<%

String username = request.getParameter("uname");
if(username == null)
	username = "";
String password = request.getParameter("pass");
if(password == null)
	password = "";
String level = request.getParameter("lvl");
if(level == null)
	level = "2";

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

String sql = "INSERT INTO users (uname, password, lvl, book1, book2, date1, date2) " +
            "VALUES (?,?,?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, username);
pstmt.setString(2, password);
pstmt.setInt(3, Integer.parseInt(level));
pstmt.setString(4, null);
pstmt.setString(5, null);
pstmt.setString(6, null);
pstmt.setString(7, null);
pstmt.executeUpdate();

con.close();
%>
<a href="login.jsp">Back to Login Page</a>
</body>
</html>
