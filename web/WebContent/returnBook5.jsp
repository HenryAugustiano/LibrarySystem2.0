<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
</head>
<body style="background-color:#FFFDD0;">
<%-- load paypal script (personal project Henry) --%>
<script src="https://www.paypal.com/sdk/js?client-id=test&currency=USD"></script>
<h1 style="text-align:center;font-family: Futura;">Your book status: </h1>
<%


String bname = request.getParameter("bname"); //get bname 
if(bname == null)
    bname ="";
String bid = request.getParameter("bid"); //get bname 
if(bid == null)
    bid ="";
String uname = request.getParameter("uname"); //get bname 
if(uname == null)
    uname ="";    


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

String sql2 = "";
long difference = 0;
if(bid.equals("book1") ){ //if want to return book1
    sql2 = "SELECT date1 FROM users WHERE uname = ?";
    PreparedStatement pstmt = con.prepareStatement(sql2);
    pstmt.setString(1, uname);
    ResultSet rst = pstmt.executeQuery();
    rst.next();

    //get day diff
    Date date = Date.valueOf(LocalDate.now()); //date now
    Date dateDika = rst.getDate("date1");       //date sql
    long diff = date.getTime() - dateDika.getTime(); 
    difference = TimeUnit.DAYS.convert(diff,TimeUnit.MILLISECONDS);
    //all fine
}else{
    sql2 = "SELECT date2 FROM users WHERE uname = ?";
    PreparedStatement pstmt = con.prepareStatement(sql2);
    pstmt.setString(1, uname);
    ResultSet rst = pstmt.executeQuery();
    rst.next();

    //get day diff
    Date date = Date.valueOf(LocalDate.now());
    Date dateDika = rst.getDate("date2");
    long diff = date.getTime() - dateDika.getTime();
    difference = TimeUnit.DAYS.convert(diff,TimeUnit.MILLISECONDS);
    //all fine
}

long fee = 0;
if(difference>14)
    fee = (difference-14)*2;
else
    fee = 0 ;


%>
<h2>your late fee is : $ <%=fee%></h2>
<script src="https://www.paypal.com/sdk/js?client-id=AYljRqeLA-qNIB4VaTWvi27Xxd1Hqdp5uoUp9hqAfYozU9YUVAoL9fOL2NnG-h_o-UB7fLqOLjGKsjfe&currency=CAD"></script>
<div id="paypal-button-container"></div>
<script>
    paypal.Buttons({
    // Sets up the transaction when a payment button is clicked
    createOrder: (data, actions) => {
    return actions.order.create({
    purchase_units: [{
    amount: {
    value: <%=fee%> // get late fee
    }
                    }]
                                });
   },
     onApprove: (data, actions) => {
	          return actions.order.capture().then(function(orderData) {
                // Successful capture! For dev/demo purposes:
	            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
	            const transaction = orderData.purchase_units[0].payments.captures[0];
	            const element = document.getElementById('paypal-button-container');
	            element.innerHTML = '<h3>Thank you for your payment!</h3>';
	          });
        }
	      }).render('#paypal-button-container');
	    </script>

<%


con.close();
%>
<a href="login.jsp">Back to Login Page</a>
</body>
</html>