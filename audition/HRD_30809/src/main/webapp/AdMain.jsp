<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글애 깨지지 않도록 UTF-8로 받음
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>

<title>오디션-등록</title> 
<link rel = "stylesheet" href="css/style.css">
</head>



<style type="text/css">
	a:nth-child(1) {
	 	text-decoration: underline;
	}
</style>

<header> <jsp:include page="header.jsp" /> </header>
<nav> <jsp:include page="nav.jsp" /> </nav>

<body>	
<center>
<script type="text/javascript" src="reset.js"></script>
<section> 
<h3> 오디션 등록 </h3>

<%
	// try()
	// catch(){}
%>
<form name="frm_insert" action="action.jsp" method="post" >
	<table border = 1>
		<tr>
			<td align="center">참가번호</td>
			<td align="left">
				<input type="text" name="artist_id" value=""> 
				 * 참가번호는 (A000) 4자리입니다.
			</td>
		</tr>
		<tr>
			<td align="center">참가자명</td>
			<td align="left"><input type="text" name="artist_name" value=""></td>
		</tr>
		<tr>
			<td align="center">생년월일</td> 
			<td align="left">
				<input type="text" name="birth_y" value="">년
			    <input type="text" name="birth_m" value="">월 
			    <input type="text" name="birth_d" value="">일
		    </td>
		</tr>
		<tr>
			<td align="center">성별</td>
			<td align="left">
				<input type="radio" name="artist_gender" value="M">남성
				<input type="radio" name="artist_gender" value="F">여성
			</td>
		</tr>
		<tr>
			<td align="center">특기</td>
			<td align="left">
				<select name="talent" onchange="chaneLangSelect()">
					<option value="" selected disabled>특기선택</option>
					<option value="1">[1]보컬</option>
					<option value="2">[2]댄스</option>
					<option value="3">[3]랩</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="center">소속사</td>
			<td align="left"><input type="text" name="agency" value=""></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit"  value="오디션 등록"  onclick="return insertChect()">
				<input type="submit"  value="다시쓰기"    onclick="return resetText()">
			</td>
		</tr>
	</table>
</form>
<br><br><br><br>
</section>
</center>
<footer> <jsp:include page="footer.jsp" /> </footer>
</body>
</html>