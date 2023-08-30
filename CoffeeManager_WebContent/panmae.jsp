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
   		String sql = "select tsl.saleno,tp.pcode,tsl.saledate,ts.scode,tp.name,tsl.amount,TO_CHAR(SUM(tp.cost * tsl.amount),'999,999,999,999') cost from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode = tsl.pcode INNER JOIN tbl_shop_01 ts ON tsl.scode = ts.scode GROUP BY tsl.saleno,tp.pcode,tsl.saledate,ts.scode,tp.name,tsl.amount,cost ORDER BY 1";
   		
   		ResultSet rs = stmt.executeQuery(sql);
   	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<table border="1">
<tr>
<td>비번호</td>
<td>상품코드</td>
<td>판매날짜</td>
<td>매장코드</td>
<td>상품명</td>
<td>판매수량</td>
<td>총판매액</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%=rs.getString("saleno")%></td>
<td><%=rs.getString("pcode")%></td>
<td><%=rs.getString("saledate")%></td>
<td><%=rs.getString("scode")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("amount")%></td>
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>