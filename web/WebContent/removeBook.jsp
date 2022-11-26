<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Library</title>
</head>
<body style="background-color:#FFFDD0;">


<h2>Enter Book you want to remove:</h2>
<form method="get" action="removeBookSuccess.jsp">
    ISBN:<br> <input type="text" name="isbn">
    <input type="submit">
</form>

</body>
</html>

