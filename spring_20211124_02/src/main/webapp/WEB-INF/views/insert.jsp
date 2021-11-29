<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input{
display: block;
}
</style>
</head>
<body>
	<h2>훈련생 등록화면</h2>
	
	<form action="insert" method="POST">
	이름:<input type="text" name="t_name">
	나이:<input type="text" name="t_age">
	전화번호:<input type="text" name="t_phone">
	성별:<select name="t_gender">
	<option value="남">남</option>
	<option value="여">여</option>
	</select>
	생년월일:<input type="date" name="t_birth">
	집주소:<input type="text" name="t_address">
	<input type="submit" value="확인">
	
	</form>
	
</body>
</html>
