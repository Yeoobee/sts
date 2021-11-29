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
	<h2>update.jsp</h2>
	
	<form action="update" method="POST">
	
	번호:<input type="hidden" name="t_number" value="${trainee.t_number}" readonly>
	이름:<input type="text" name="t_name" value="${trainee.t_name}" readonly>
	나이:<input type="text" name="t_age" value="${trainee.t_age}" readonly>
	전화번호:<input type="text" name="t_phone" value="${trainee.t_phone}">
	집주소:<input type="text" name="t_address" value="${trainee.t_address}">
	<input type="submit" value="수정">
	
	</form>
	
</body>
</html>