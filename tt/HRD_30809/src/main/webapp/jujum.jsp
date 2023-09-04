<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Class.forName("oracle.jdbc.OracleDriver");
	  Connection con = DriverManager.getConnection
              ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	  
	  	Statement stmt = null;
	  	
	  	try{
	  		stmt = con.createStatement();
	  		String sql ="select s.scode,s.sname,TO_CHAR(sum(l.amount * p.cost),'999,999,999,999') cost from shop s, salelist l,pizza p WHERE l.scode = s.scode and p.pcode = l.pcode GROUP BY s.scode,s.sname ORDER by 1";
	  		
	  		ResultSet rs = stmt.executeQuery(sql);
	  	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr>
<td>지점 코드</td>
<td>지점명</td>
<td>총매출액</td>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString("scode") %></td>
<td><%=rs.getString("sname") %></td>
<td><%=rs.getString("cost") %></td>
</tr>
<%
}
	  	}catch(Exception e)
	  	{
	  		e.printStackTrace();
	  	}
%>
</table>
</body>
</html>