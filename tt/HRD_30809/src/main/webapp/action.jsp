<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String saleno = request.getParameter("saleno");
    	String scode = request.getParameter("scode");
    	String saledate = request.getParameter("saledate");
    	String pcode = request.getParameter("pcode");
    	String amount = request.getParameter("amount");
    	
    	Class.forName("oracle.jdbc.OracleDriver"); 
  	  Connection con = DriverManager.getConnection
                  ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
  	  
  	  Statement stmt = null;
  	  try{
  		  stmt = con.createStatement();
  		  
  		  String sql ="INSERT INTO salelist values ('"+saleno+"','"+scode+"',to_date('"+saledate+"','yyyy-mm-dd'),'"+pcode+"',"+amount+")";
  		  
  		  stmt.executeUpdate(sql);
  		  
  	  }catch(Exception e)
  	  {
  		  e.printStackTrace();
  	  }
  	
    %>
    <jsp:include page="index.jsp"></jsp:include>
    
