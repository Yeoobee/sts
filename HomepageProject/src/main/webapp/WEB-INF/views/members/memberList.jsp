<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>memberList.jsp</h2>
	
	<table class="table">
	<tr>
	<th>번호</th>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>이메일</th>
	<th>전화번호</th>
	<th>삭제</th>
	</tr>
	<c:forEach items="${mList}" var="mList">
			<tr>
				<td>${mList.m_number}</td>
				<td>${mList.m_id}</td>
				<td>${mList.m_password}</td>
				<td>${mList.m_name}</td>
				<td>${mList.m_email}</td>
				<td>${mList.m_phone}</td>
				<td><a href="/members/delete?m_number=${mList.m_number}">삭제</a></td>



			</tr>
		</c:forEach>
	</table>
</body>
</html>