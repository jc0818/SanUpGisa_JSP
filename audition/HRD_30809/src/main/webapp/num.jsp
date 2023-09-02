<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	
	Statement stmt = null;
	
	try{
		stmt = con.createStatement();
		
		String sql = "select tp.ARTIST_ID,ta.ARTIST_NAME,SUM(tp.POINT) sp,TO_CHAR(sum(tp.point) / count(tp.ARTIST_ID), '999.00') avg , RANK() OVER (ORDER BY SUM(tp.point) DESC) RANK from TBL_POINT_201905 tp,TBL_ARTIST_201905 ta where tp.ARTIST_ID = ta.ARTIST_ID GROUP BY tp.ARTIST_ID,ta.ARTIST_NAME order by 5";
		
		ResultSet rs = stmt.executeQuery(sql);
	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참가자 등수 조회</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
<h2>참가자 등수 조회</h2>

<table border="1">

<tr>
<td>참가번호</td>
<td>참가자명</td>
<td>총점</td>
<td>평균</td>
<td>등수</td>
</tr>
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString("ARTIST_ID") %></td>
<td><%=rs.getString("ARTIST_NAME") %></td>
<td><%=rs.getString("sp") %></td>
<td><%=rs.getString("avg") %></td>
<td><%=rs.getString("RANK") %></td>
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