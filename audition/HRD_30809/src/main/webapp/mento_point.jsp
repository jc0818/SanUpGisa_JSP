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
		
		String sql ="select tp.SERIAL_NO,tp.ARTIST_ID,ta.ARTIST_NAME,ta.ARTIST_BIRTH,tp.POINT,tm.MENTO_NAME from TBL_POINT_201905 tp,TBL_MENTO_201905 tm,TBL_ARTIST_201905 ta where ta.ARTIST_ID = tp.ARTIST_ID AND tp.MENTO_ID = tm.MENTO_ID order by 1";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 점수조회</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
<h2>멘토 점수 조회</h2>
<table border="1">
<tr>
<td>채점번호</td>
<td>참가번호</td>
<td>참가자명</td>
<td>생년월일</td>
<td>점수</td>
<td>평점</td>
<td>멘토</td>
</tr>
<% while(rs.next()){%>
<tr>
<td><%=rs.getString("SERIAL_NO")%></td>
<td><%=rs.getString("ARTIST_ID")%></td>
<td><%=rs.getString("ARTIST_NAME")%></td>
<td><%=rs.getString("ARTIST_BIRTH")%></td>
<td><%=rs.getInt("POINT")%></td>
<td><% 
int p = rs.getInt("POINT");
if(p >= 90)
{
	out.print("A");
}else if(p >= 80)
{
	out.print("B");
}else if(p >= 70)
{
	out.print("C");
}else if(p >= 60)
{
	out.print("D");
}else
{
	out.print("F");
}
%>
</td>
<td><%=rs.getString("MENTO_NAME")%></td>
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