<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Your book status: </h1>
<%


String bname = request.getParameter("bname"); //get bname 
String bid = request.getParameter("bid");//get the bookid from user (by form)
String uname = request.getParameter("uname");//get the uname from user (by form)
if(bname == null)
    bname ="";
if(bid == null)
    bid ="";
if(uname ==null)
    uname="";


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

String sql2 ="";
if(bid == "book1"){ //if want to return book1
    sql2 = "UPDATE users SET book1 = ?, date1 = ? WHERE uname = ?";
}else{
    sql2 = "UPDATE users SET book2 = ?, date2 = ?  WHERE uname = ?";
}

PreparedStatement pstmt = con.prepareStatement(sql2);
pstmt.setString(1, null);
pstmt.setDate(2,null);
pstmt.setString(3,uname);



pstmt.executeUpdate();

con.close();
%>
<form method="get" action="returnBook4.jsp">
<input type="hidden" name="bname" value=<%=bname%>> 
<input type="hidden" name="bid" value=<%=bid%>> 
<input type="hidden" name="uname" value=<%=uname%>> 
</form>
</body>
</html>
<jsp:forward page="returnBook4.jsp" />

