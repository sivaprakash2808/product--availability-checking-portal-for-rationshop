<%@ include file="include/dbconnect.jsp" %>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>

<%
    // Start session


    // Retrieve the database connection from the application scope
    Connection conn = (Connection) application.getAttribute("DBConnection");

    if (conn == null) {
        throw new ServletException("Database connection not initialized.");
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
.style21 {
    color: #FFFFFF;
    font-weight: bold;
    font-size: 24px;
}
.style23 {
    color: #CC0033;
    font-size: 14px;
    font-weight: bold;
}
.style24 {
    color: #FF0000;
    font-weight: bold;
    font-size: 14px;
}
-->
</style>
<script>
function chg() {
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
                <table width="41%" height="393" border="0" align="center">
                    <tr>
                        <td colspan="2" align="center"><div class="style5"><h3>View Stocks</h3></div></td>
                    </tr>
                    <tr>
                        <td height="39">DAY</td>
                        <td>
                            <select name="date">
                                <option value="1">1</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td height="34">MONTH</td>
                        <td>
                            <select name="month">
                                <option value="january">January</option>
                                <option value="february">February</option>
                                <option value="march">March</option>
                                <option value="april">April</option>
                                <option value="May">May</option>
                                <option value="June">June</option>
                                <option value="July">July</option>
                                <option value="Auguest">August</option>
                                <option value="September">September</option>
                                <option value="October">October</option>
                                <option value="November">November</option>
                                <option value="December">December</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input name="btn" type="submit" id="btn" value="Submit" />
                            <input type="reset" name="Submit2" value="Reset" />
                        </td>
                    </tr>
                </table>
            </form>
            <%
            if (request.getParameter("btn") != null) {
                try {
                    
                    
                       String date = request.getParameter("date");
    String month = request.getParameter("month");
                    
                    String selectQuery = "SELECT * FROM stocks WHERE date = ? AND mon = ?";
                    PreparedStatement selectStmt = conn.prepareStatement(selectQuery);
                    selectStmt.setString(1, date);
                    selectStmt.setString(2, month);
                    ResultSet rs = selectStmt.executeQuery();
            %>
            <table width="50%" border="2" align="center">
                <tr>
                    <th scope="col" colspan="4">Stock Details</th>
                </tr>
                <tr>
                    <td>Date</td>
                    <td>Month</td>
                    <td>Product</td>
                    <td>Quantity</td>
                </tr>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("date") %></td>
                    <td><%= rs.getString("mon") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("qty") %></td>
                </tr>
                <%
                }
                rs.close();
                selectStmt.close();
                %>
            </table>
            <%
                } catch (SQLException e) {
                    e.printStackTrace();
                    throw new ServletException("Database query error: " + e.getMessage());
                }
            }
            %>
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
            Copyrights And Reserved @ RATION PRODUCT AVAILABILITY CHECKING PORTAL
        </div>
        <div class="cleaner"></div>
    </div> 
</div> 
</body>
</html>
