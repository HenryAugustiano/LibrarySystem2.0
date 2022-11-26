<%@ page import="java.sql.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<h1 style="text-align:center;font-family: Futura;">Your book status: </h1>
<%


String uname = request.getParameter("uname");//get the uname from user (by form)
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

String sql2 = "SELECT book1, book2, date1, date2 FROM users WHERE uname = ?";
PreparedStatement pstmt = con.prepareStatement(sql2);

//get the uname from prev page (returnBook.jsp)
pstmt.setString(1,uname);
ResultSet rst = pstmt.executeQuery();

%>
<table class="styled-table"; border="1" style="border-collapse:collapse;margin-left:auto;margin-right:auto;;font-family: Futura;">
    <th>
        <tr>
            <th>book1</th>
            <th>book2</th>
            <th>date1</th>
            <th>date2</th>
        </tr>
    </th>
<%
while(rst.next()){
%>	
			<tr>
                <td style="text-align:center;font-family: Futura;"><%=rst.getString("book1") %></td>
                <td style="text-align:center;font-family: Futura;"><%=rst.getString("book2")%></td>
                <td style="text-align:center;font-family: Futura;"><%=rst.getString("date1")%></td>
                <td style="text-align:center;font-family: Futura;"><%=rst.getString("date2")%></td>
            </tr>
<%
}
%>
   
 <h2>What do you want to return?</h2>  

<form method="get" action="returnBook3.jsp">
    Enter book name:<br><input type="text" name="bname">
    <br> 
    which category (book1 or book2):<br> <input type="text" name="bid">
     <br> 
    confirm your uname again:<br> <input type="text" name="uname">
    <input type="submit">
</form>

<%
    con.close();
%>
</body>
</html>