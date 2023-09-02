<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Class.forName("oracle.jdbc.OracleDriver");
    	Connection con = DriverManager.getConnection
    			("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    	
    	Statement stmt  = null;
    	
    	try{
    		stmt = con.createStatement();
    		String sql = "select * from TBL_ARTIST_201905";
    		
    		ResultSet rs = stmt.executeQuery(sql);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<center>
<h2>참가자목록조회</h2>
<table border="1">
<tr>
<td>참가번호</td>
<td>참가자명</td>
<td>생년월일</td>
<td>성별</td>
<td>특기</td>
<td>소속사</td>
</tr>
<% while(rs.next()){ %>
<tr>
<td><%= rs.getString("ARTIST_ID")%></td>
<td><%= rs.getString("ARTIST_NAME")%></td>
<td><%= rs.getString("ARTIST_BIRTH")%></td>
<td><%= rs.getString("ARTIST_GENDER").equals("F") ? "남자":"여자" %></td>
<td><% if(rs.getString("TALENT").equals("1")){out.print("보컬");}else if(rs.getString("TALENT").equals("2")){out.print("댄스");}else{out.print("랩");}%></td>
<td><%= rs.getString("AGENCY")%></td>
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