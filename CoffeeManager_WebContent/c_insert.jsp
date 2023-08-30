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
		String sql = "select MAX(saleno) + 1 saleno from tbl_salelist_01";
		
		ResultSet rs = stmt.executeQuery(sql); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
<form action="action.jsp" type="post">
<table border="1">
<%while(rs.next()){ %>
<tr>
<td>비번호</td><td><input name="saleno" type="text" value="<%= rs.getInt("saleno") %>"></td>
</tr>
<tr>
<td>상품코드</td><td><input name="pcode" type="text" name=""></td>
</tr>
<tr>
<td>판매날짜</td><td><input name ="saledate"type="date"></td>
</tr>
<tr>
<td>매장코드</td><td><input name ="scode" type="text"></td>
</tr>
<tr>
<td>판매수량</td><td><input name = "amount" type="text"></td>
</tr>
<tr>
<td><button type="submit">등 록</button></td>
<td><button type="result">취 소</button></td>
</tr>
</table>
<%
   	}
}catch(Exception e)
   	{
   		e.printStackTrace();
   	}
   	
%>
</form>
</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>