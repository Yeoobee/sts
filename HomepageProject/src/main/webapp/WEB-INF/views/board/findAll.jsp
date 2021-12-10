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
<script>
	function logout(){
		location.href="/members/logout";
	}
</script>
</head>
<body>
	<h2>findAll.jsp</h2>
	${sessionScope.loginId} 님 환영합니다!
	<button onclick="logout()">로그아웃</button><br>
	
	<a href="/members/findById?m_number=${sessionScope.loginNumber}">마이페이지</a>
	
	
	<a href="/board/save">글작성</a>
	
	<c:if test="${sessionScope.loginId eq 'admin'}">
	<a href="/members/memberList">회원목록</a>
	</c:if>
	
	<br><br>
	
	<div>
	<form action="/board/search" method="get">
		<select name="searchtype">
			<option value="b_title">제목</option>
			<option value="m_id">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어">
		<input type="submit" value="검색">
	</form>
	</div>
	
	<div>
	<table class="table">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>글내용</th>
			<th>조회수</th>
			<th>작성날짜</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach items="${boardList}" var="board">
			<tr>
				<td>${board.b_number}</td>
				<td><a href="/board/detail?b_number=${board.b_number}&page=${paging.page}">${board.b_title}</a></td>
				<td>${board.m_id}</td>
				<td>${board.b_contents}</td>
				<td>${board.b_hits}</td>
				<td>${board.b_date}</td>
				<td>${board.b_filename}</td>

			</tr>
		</c:forEach>
	</table>
</div>
	<div> 
		<c:choose>
			<c:when test="${paging.page<=1}">
				[이전]&nbsp;
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page-1}">[이전]</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/board/paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				[다음]
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>