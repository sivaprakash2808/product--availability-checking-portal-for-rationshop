<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ include file="include/dbconnect.jsp" %>

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
            <form action="" method="post">
                <br /><br />
                <div align="center">   
                    Enter Customer Ration Number <input type="text" name="rno" />
                    <br /><br />
                    <input type="submit" name="btn" value="Search" />
                </div>
            </form>

            <% if (request.getParameter("btn") != null) { %>
            <table width="98%" align="center">
                <tr>
                    <td colspan="11" align="center"><strong>Customer Details</strong></td>
                </tr>
                <tr>
                    <td colspan="11">&nbsp;</td>
                </tr>
                <tr>
                    <td width="1%">&nbsp;</td>
                    <td width="7%"><div align="center" class="style6"><strong>Id</strong></div></td>
                    <td width="10%"><div align="center" class="style6"><strong>Ration Number</strong></div></td>
                    <td width="11%"><div align="center" class="style6"><strong>Customer Name</strong></div></td>
                    <td width="11%"><div align="center" class="style6"><strong>Gender</strong></div></td>
                    <td width="11%"><div align="center" class="style6"><strong>Age</strong></div></td>
                    <td width="9%"><div align="center" class="style6"><strong>Family Members</strong></div></td>
                    <td width="10%"><div align="center" class="style6"><strong>Contact No</strong></div></td>
                    <td width="10%"><div align="center" class="style6"><strong>Aadhaar Number</strong></div></td>
                    <td width="10%"><div align="center" class="style6"><strong>Address</strong></div></td>
                    <td width="10%"><div align="center" class="style6"><strong>Zip Code</strong></div></td>
                   
                </tr>
                <tr>
                    <td colspan="10">&nbsp;</td>
                </tr>
                <%
                    String rno = request.getParameter("rno");
                    Connection conn = (Connection) application.getAttribute("DBConnection");
                    String query = "SELECT * FROM customer WHERE rno=?";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, rno);
                    ResultSet rs = pstmt.executeQuery();
                    int i = 1;
                    while (rs.next()) {
                %>
                <tr>
                    <td width="1%">&nbsp;</td>
                    <td><div align="center"><%= rs.getInt("id") %></div></td>
                    <td><div align="center"><%= rs.getString("rno") %></div></td>
                    <td><div align="center"><%= rs.getString("name") %></div></td>
                    <td><div align="center"><%= rs.getString("gender") %></div></td>
                    <td><div align="center"><%= rs.getInt("age") %></div></td>
                    <td><div align="center"><%= rs.getString("family") %></div></td>
                    <td><div align="center"><%= rs.getString("phone") %></div></td>
                    <td><div align="center"><%= rs.getString("adhar") %></div></td>
                    <td><div align="center"><%= rs.getString("line1") %> <%= rs.getString("line2") %></div></td>
                    <td><div align="center"><%= rs.getString("zip") %></div></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <%
                        i++;
                    }
                    rs.close();
                    pstmt.close();
                %>
                <tr>
                    <td colspan="10" align="center">&nbsp;</td>
                </tr>
            </table>
            <% } %>
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
