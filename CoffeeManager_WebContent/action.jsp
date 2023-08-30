<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String saleno = request.getParameter("saleno");
    String pcode = request.getParameter("pcode");
    String saledate = request.getParameter("saledate");
    String scode = request.getParameter("scode");
    String amount = request.getParameter("amount");
    
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521/xe",
			"system",
			"1234");
	Statement stmt = null;
	
	try{
		stmt = conn.createStatement();
		String sql = "insert into tbl_salelist_01 values('"+saleno+"','"+pcode+"',TO_DATE('"+saledate+"','YYYY-MM-DD'),'"+scode+"',"+amount+")";
		
		stmt.executeUpdate(sql);
		%>
		<jsp:include page="index.jsp"></jsp:include>
		<%
	}catch(Exception e)
	{
		e.printStackTrace();
	}
    %>
    
   
