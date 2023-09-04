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
			String sql = "select b.saleno,c.scode,c.sname,TO_CHAR(B.saledate,'yyyy-mm-dd') saledate,a.pcode,a.pname,b.amount,TO_CHAR(a.cost * b.amount,'999,999,999') cost from pizza a,salelist b,shop c where a.pcode = b.pcode and b.scode = c.scode ORDER by 1";
			
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
<td>매출전표번호</td>
<td>지점</td>
<td>판매일자</td>
<td>피자코드</td>
<td>피자명</td>
<td>판매수량</td>
<td>매출액</td>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString("saleno") %></td>
<td><%=rs.getString("scode") %>-<%=rs.getString("sname") %></td>
<td><%=rs.getString("saledate") %></td>
<td><%=rs.getString("pcode") %></td>
<td><%=rs.getString("pname") %></td>
<td><%=rs.getString("amount") %></td>
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