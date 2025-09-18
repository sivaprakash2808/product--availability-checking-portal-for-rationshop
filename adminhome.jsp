<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="include/dbconnect.jsp" %>
<%
    // Start session
   

    // Retrieve the database connection from the application scope
  
    // Retrieve the database connection from the application scope
    Connection conn = (Connection) application.getAttribute("DBConnection");

    if (conn == null) {
        throw new ServletException("Database connection not initialized.");
    }

    // Extract form parameters (excluding id)
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String age = request.getParameter("age");
    String family = request.getParameter("family");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String line1 = request.getParameter("line1");
    String line2 = request.getParameter("line2");
    String zip = request.getParameter("zip");
    String rno = request.getParameter("rno");
    String adhar = request.getParameter("adhar");

    if (request.getParameter("btn") != null) {
        try {
            // Check if the register number already exists
            String checkQuery = "SELECT * FROM customer WHERE rno = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, rno);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Register number already taken
                out.println("<script>alert('Register number already taken');</script>");
            } else {
                // Insert the new customer (excluding id)
                String insertQuery = "INSERT INTO customer (name, gender, age, family, email, phone, line1, line2, zip, rno, adhar) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, name);
                insertStmt.setString(2, gender);
                insertStmt.setString(3, age);
                insertStmt.setString(4, family);
                insertStmt.setString(5, email);
                insertStmt.setString(6, phone);
                insertStmt.setString(7, line1);
                insertStmt.setString(8, line2);
                insertStmt.setString(9, zip);
                insertStmt.setString(10, rno);
                insertStmt.setString(11, adhar);

                int rows = insertStmt.executeUpdate();

                if (rows > 0) {
                    // Insert successful
                    out.println("<script>alert('Inserted successfully');</script>");
                } else {
                    // Insert failed
                    out.println("<script>alert('Insert failed');</script>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database query error: " + e.getMessage());
        }
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>E-RationShop</title>
<meta name="keywords" content="free templates, Business Website, Free CSS Template, CSS, HTML" />
<meta name="description" content="Business Template is a free css template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet" type="text/css" media="screen,projection" />
<style type="text/css">
<!--
.style8 {
	color: #000066;
	font-weight: bold;
	font-size: 16px;
}
.style17 {
	font-size: 24px;
	color: #CCCCCC;
}
.style21 {color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
}
.style23 {color: #CC0033; font-size: 14px; font-weight: bold; }
.style24 {color: #FF0000; font-weight: bold; font-size: 14px; }
-->
</style>
<script>
function chg()
{
window.location.href = 'http://www.google.com';
}
</script>
</head>
<body>
<div id="templatemo_header_wrapper">
<div class="style1" id="templatemo_header">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="style2 style17"><span class="style21">RATION PRODUCT AVAILABILITY CHECKING PORTAL</span></p>
    <p class="style2 style17">&nbsp;</p>
    <p class="style5">&nbsp;</p>
  </div>
</div> 
<%@ include file="include/adminlink.jsp" %>

<div id="tempatemo_content_wrapper">

    <div id="templatemo_content">
      <div id="content_panel">
        <p align="center">&nbsp;</p>
      
       
	    <form id="f1" name="f1" method="post" action="#">
  <table width="38%" height="393" border="0" align="center">
	
    <tr>
          <td colspan="2"  align="center" ><div class="style5"><h3>Customers Enrollment</h3></div></td>
    
    </tr>
	
    <tr>
     
      <td width="39%" height="41">Customer Name(Card Holder Name)</td>
      <td width="61%"><input name="name" type="text" id="name" required/>
      </td>
      
    </tr>
	
    <tr>
     
      <td height="39">Gender</td>
      <td><input name="gender" type="radio" value="male" required/>
        Male
           
           <input name="gender" type="radio" value="female" />Female</td>
    
    </tr>
	
	 <tr>
     
      <td height="34">Age</td>
      <td>
        <input name="age" type="text" id="age"required />
      </td>
	
    <tr>
     
      <td height="34">Family Members</td>
      <td>
        <input name="family" type="text" id="family" required/>
      </td>
     
    </tr>
	
    <tr>
     
      <td height="35">Email Id</td>
      <td><input name="email" type="text" id="email" required/></td>
      
    </tr>
	
	
	  <tr>
      <td height="33">Phone Number </span></td>
      <td><input name="phone" type="text" id="phone" required/></td>
      
    </tr>
	
	   <tr>
      <td height="33">Address Line 1</td>
      <td><input type="text" name="line1"required /></td>
       </tr>
	
	<tr>
      <td height="33">Address Line 2</td>
      <td><input type="text" name="line2" required/></td>
    </tr>
	
		<tr>
    
      <td height="32">Zipcode</td>
      <td><input type="text" name="zip" id="zip" required></td>
     
    </tr>
	
	
	<tr>
    
      <td height="34">Ration Card Number</td>
      <td><input type="text" name="rno" id="rno" required></td>
     
    </tr>
	
	

	<tr>
    
      <td height="34">Aadhaar Card Number</td>
      <td><input type="number" name="adhar" id="adhar" required></td>
     
    </tr>

  
	<tr>
      <td>&nbsp;</td>
      <td><input name="btn" type="submit" id="btn" value="Submit" />
      <input type="reset" name="Submit2" value="Reset" /></td>
    </tr>
</table>
	   
	   
	   
 
  <div class="cleaner">
  <p>&nbsp;</p>
</div>
            
      </div> <!-- end of content panel -->
        
        <div class="cleaner"></div>
  </div> <!-- end of content -->
    
</div> <!-- end of content wrapper -->

<div id="templatemo_footer_wrapper">

	<div id="templatemo_footer">
	  <div class="section_w920">
        Copyrights And Reserved @ RATION PRODUCT AVAILABILITY CHECKING PORTAL</div>
        <div class="cleaner"></div>
  </div> 
</div> 
</body>
</html>