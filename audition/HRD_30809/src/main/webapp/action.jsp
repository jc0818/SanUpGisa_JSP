<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("artist_id");
	String name = request.getParameter("artist_name");
	String birth_y = request.getParameter("birth_y");
	String birth_m = request.getParameter("birth_m");
	String birth_d = request.getParameter("birth_d");
	
	birth_m = birth_m.trim();							// 월 앞 뒤의 공백 문자 제거
	birth_d = birth_d.trim();							// 일 앞 뒤의 공백 문자 제거
	
	if(birth_m.length() == 1) birth_m = "0" + birth_m;	// 월 한 자리만 입력된 경우 앞에 '0' 붙이기
	if(birth_d.length() == 1) birth_d = "0" + birth_d;	// 일 한 자리만 입력된 경우 앞에 '0' 붙이기
	String birth = birth_y + birth_m + birth_d;			// 년월일 연결하기
	
	String gender = request.getParameter("artist_gender");
	String talent = request.getParameter("talent");
	String agency = request.getParameter("agency");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
                    ("jdbc:oracle:thin:@//localhost:1521/xe", 
                     "system", "1234");
		Statement  stmt = con.createStatement();
		String sql = 			
			" INSERT INTO tbl_artist_201905 "+
			" VALUES( '"+ id 			     + "', "+
		    		 "'"+ name    			 + "', "+ 
		    		 "'"+ birth				 + "', "+ 
		    		 "'"+ gender 			 + "', "+ 
		    		 "'"+ talent 	         + "', "+ 
		    		 "'"+ agency 	         + "') ";
		stmt.executeUpdate(sql);
	} 
	catch(Exception e) {
		e.printStackTrace();
	}
%>
	<jsp:include page="AdMain.jsp"></jsp:include>