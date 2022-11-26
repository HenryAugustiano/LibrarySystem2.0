<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Your Book has been Successfully Added to the Database</h1>
<%


String isbn = request.getParameter("isbn");
if(isbn == null)
	isbn = "0";
String bookName = request.getParameter("bookName");
if(bookName == null)
	bookName = "";
String author = request.getParameter("author");
if(author == null)
	author = "";
String yearpub = request.getParameter("yearpub");
if(yearpub == null)
	yearpub = "0";
String genre = request.getParameter("genre");
if(genre == null)
	genre = "";
String qty = request.getParameter("qty");
if(qty == null)
	qty = "0";
String borrowed = request.getParameter("borrowed");
if(borrowed == null)
	borrowed = "";
String originalAmt = request.getParameter("originalAmt");
if(originalAmt == null)
	originalAmt = "0";

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

    String sql2 = "INSERT INTO books VALUES (?,?,?,?,?,?,?,?)";
    PreparedStatement pstmt = con.prepareStatement(sql2);
    pstmt.setInt(1,Integer.parseInt(isbn));
    pstmt.setString(2,bookName);
    pstmt.setString(3,author);
    pstmt.setInt(4,Integer.parseInt(yearpub));
    pstmt.setString(5,genre);
    pstmt.setInt(6,Integer.parseInt(qty));
    pstmt.setString(7,borrowed);
    pstmt.setInt(8,Integer.parseInt(originalAmt));
    pstmt.executeUpdate();

    con.close();
%>
<a href="login.jsp">Back to Login Page</a>
</body>
</html>