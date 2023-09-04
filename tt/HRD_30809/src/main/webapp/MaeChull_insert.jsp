<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<h2 style="text-align: center;">매출전표등록</h2>
	<form action="action.jsp" method="post" name="mci">
	<table border="1">
	<tr>
	<td>매출전표번호</td>
	<td><input type = "text" name="saleno"></td>
	</tr>
	
	<tr>
	<td>지점코드</td>
	<td><input type = "text" name="scode"></td>
	</tr>
	
	<tr>
	<td>판매일자</td>
	<td><input type = "text" name="saledate"></td>
	</tr>
	
	<tr>
	<td>피자코드</td>
	<td>
		<select name="pcode">
			<option value = "" selected disabled >피자선택</option>
			<option value = "AA01"  >AA01 고르곤졸라</option>
			<option value = "AA02"  >AA02 치즈피자</option>
			<option value = "AA03"  >AA03 페퍼로니피자</option>
			<option value = "AA04"  >AA04 콤비네이션</option>
			<option value = "AA05"  >AA05 고구마피자</option>
			<option value = "AA06"  >AA06 포테이토피자</option>
			<option value = "AA07"  >AA07 불고기피자</option>
			<option value = "AA08"  >AA08 나폴리피자</option>
			</select>
	</td>
	</tr>
	
	<tr>
	<td>판매수량</td>
	<td><input type = "text" name="amount"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="등록" onclick="return joincheck()">
		<input type="reset" value="다시쓰기"></td>
	</tr>
	</table>
	
	</form>
</body>
</html>