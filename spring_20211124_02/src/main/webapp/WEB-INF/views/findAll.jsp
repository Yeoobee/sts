<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL(JSP Standard Tag Library) 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
	<h2>findAll.jsp</h2>
	<table class="table">
	<tr>
	<th>번호</th>
	<th>이름</th>
	<th>나이</th>
	<th>전화번호</th>
	<th>성별</th>
	<th>생년월일</th>
	<th>주소</th>
	<th>조회</th>
	<th>삭제</th>
	
	</tr>
		<c:forEach items="${tList}" var="t">
		<tr>
			<td>${t.t_number}</td>
			<td>${t.t_name}</td>
			<td>${t.t_age}</td>
			<td>${t.t_phone}</td>
			<td>${t.t_gender}</td>
			<td>${t.t_birth}</td>
			<td>${t.t_address}</td>
			<!-- detail 이라는 주소로 t_number 파라미터를 전달함. 링크로 서버에 데이터 전송. 서버에서 t_number를 받아서 sysout으로 출력-->
			<td><a href="detail?t_number=${t.t_number}">조회</a></td>
			<td><a href="delete?t_number=${t.t_number}">삭제</a></td>
			<td><a href="update?t_number=${t.t_number}">수정</a></td>
	</tr>
	</c:forEach>
	</table>	
	
	<br>	
	
</body>
</html>