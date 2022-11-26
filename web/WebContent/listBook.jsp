<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>List of Books</title>
</head>
<body style="background-color:#FFFDD0">

<div class="text-c">
<h1 style="text-align:center;font-family: Futura;">Book List</h1>
<h3>Genre Filter</h3>
<form method="get" action="listBook.jsp">
<select name="genre" id="genre">
	<option value="all">all</option>
	<option value="fiction">fiction</option>
	<option value="romance">romance</option>
	<option value="bildungsroman">bildungsroman</option>
	<option value="epic">epic</option>
	<option value="tragedy">tragedy</option>
	<option value="philosophy">philosophy</option>
</select>
<input type="submit" value="Filter">
</form>
</div>

<style>
    .text-c {
		text-align: center;
	}
	
	.form_pos { 
		position:relative;
		left:0;
		right:0;
		bottom:0;
		margin-left:auto;
		margin-right:auto;
	}
</style>

<br>
<%

String genre = request.getParameter("genre");
if(genre == null) {
	genre = "";
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

// Useful code for formatting currency values:
// NumberFormat currFormat = NumberFormat.getCurrencyInstance();
// out.println(currFormat.format(5.0);  // Prints $5.00

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

Connection con = DriverManager.getConnection(url, uid, pw);
// Print out the order summary information

if(!genre.equals("all")){
	String sql = "SELECT * FROM books WHERE genre=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, genre);
	ResultSet rst = pstmt.executeQuery();

%>
<h2 style="text-align:center;font-family: Futura;"><%=genre%> books</h2>
		<table border="1" style="margin-left:auto;margin-right:auto;font-family: Futura;">
				<tr>
					<th>ISBN</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Year Published</th>
					<th>Genre</th>
					<th>Quantity</th>
					<th>Borrowed(T/F)</th>
					<th>Total Amount</th>
				</tr>
			<%



		while(rst.next()) {
			%>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("isbn")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("bookName")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("author")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("yearPub")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("genre")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("qty")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("borrowed")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("originalAmt")%></td>
				</tr>
			<%
	}
} else{
	String sql = "SELECT * FROM books";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rst = pstmt.executeQuery();

%>
		<table border="1" style="margin-left:auto;margin-right:auto;font-family: Futura;">
				<tr>
					<th>ISBN</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Year Published</th>
					<th>Genre</th>
					<th>Quantity</th>
					<th>Borrowed(T/F)</th>
					<th>Total Amount</th>
				</tr>
			<%

// For each product create a link of the form
// addcart.jsp?id=productId&name=productName&price=productPrice
while(rst.next()) {
	%>
				<tr>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("isbn")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("bookName")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("author")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("yearPub")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("genre")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("qty")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getString("borrowed")%></td>
					<td style="text-align:center;font-family: Futura;"><%=rst.getInt("originalAmt")%></td>
				</tr>
				<%
	}
}
// Close connection
con.close();
%>
<div class="form_pos text-c">
<h3>Write the complete title of the book you want to borrow (including capitalizations):</h3>
<form method="get" action="borrowBook.jsp">
<input type="text" name="bookName" size="30">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>
</div>
</body>
</html>

