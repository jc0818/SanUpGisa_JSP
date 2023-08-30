<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Class.forName("oracle.jdbc.driver.OracleDriver");
   	Connection conn = DriverManager.getConnection(
   			"jdbc:oracle:thin:@localhost:1521/xe",
   			"system",
   			"1234");
   	Statement stmt = null;
   	
   	try{
   		stmt = conn.createStatement();
   		String sql = "select tsl.scode,ts.sname,TO_CHAR(SUM(tp.cost * tsl.amount),'999,999,999,999') cost from  tbl_shop_01 ts INNER JOIN tbl_salelist_01 tsl ON tsl.scode = ts.scode INNER JOIN tbl_product_01 tp ON tp.pcode = tsl.pcode GROUP BY tsl.scode,ts.sname ORDER BY 1";
   		
   		ResultSet rs = stmt.executeQuery(sql);
   	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
<table border="1">
<tr>

<td>매장코드</td>
<td>매장명</td>
<td>총판매액</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString("scode")%></td>
<td><%=rs.getString("sname")%></td>
<td><%=rs.getString("cost")%></td>
</tr>
<%
}
   	}catch(Exception e)
   	{
   		e.printStackTrace();
   	}
%>
</table>
</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>