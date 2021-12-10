<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/test.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<h2>detail.jsp</h2>
	
	<table class="table">
	<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>글내용</th>
	<th>조회수</th>
	<th>작성시간</th>
	<th>사진</th>
	<th>수정</th>
	<th>삭제</th>

	</tr>
	<tr>
				<td>${board.b_number}</td>
				<td>${board.b_title}</td>
				<td>${board.m_id}</td>
				<td>${board.b_contents}</td>
				<td>${board.b_hits}</td>
				<td>${board.b_date}</td>
	<td><img alt="" src="/resources/upload/${board.b_filename}"></td>
	
	<td><c:if test="${sessionScope.loginId eq board.m_id}">
	<a href="/board/update?b_number=${board.b_number}">수정</a>
	</c:if>
	</td>
	<td><c:if test="${sessionScope.loginId eq board.m_id or sessionScope.loginId eq 'admin' }">
	<a href="/board/delete?b_number=${board.b_number}">삭제</a>
	</c:if>
	</td>
	
	
	
	
	</tr>
	</table>
	
	<!-- 댓글작성 -->				
	<div id ="comment-write">
		<input type="text" id="m_id" value= "${sessionScope.loginId}" readonly>
		<input type="text" id="c_contents" placeholder="댓글내용">
		<button id="comment-write-btn">댓글등록</button>
	</div>
	
	<!-- 댓글목록출력 -->
	<div id="comment-list">
		<table class="table">
			<tr>
				<th>댓글번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
			<c:forEach items="${commentList}" var="comment">
				<tr>
					<td>${comment.c_number}</td>
					<td>${comment.m_id}</td>
					<td>${comment.c_contents}</td>
					<td>${comment.c_date}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	

</body>

<script>
	
	$("#comment-write-btn").click(function(){
		console.log("댓글등록버튼 클릭");
		/* ajax 문법을 이용하여 댓글 작성자, 작성내용을 comment/save 주소로 post방식으로 전송하는
			코드를 작성.
			CommentController도 하나 선언해서 여기서 보낸 데이터를 받는지 sysout으로 출력.
			팁)data:{"c_writer": 작성자입력값, "c_contents" : 내용입력값}
		*/
		const commentWriter = $("#m_id").val();
		const commentContents = $("#c_contents").val();	
		const boardNumber='${board.b_number}';
		console.log(commentWriter,commentContents,boardNumber);
		$.ajax({
			type: 'post',
			url: '/comment/save',
			data:{'m_id': commentWriter, 'c_contents' : commentContents, 'b_number' :boardNumber},
			dataType: 'json',
			success: function(result){
				console.log(result);
				let output = "<table class='table'>";
				output += "<tr><th>댓글번호</th>";
				output += "<th>작성자</th>";
				output += "<th>내용</th>";
				output += "<th>작성시간</th></tr>";
				for(let i in result){
					output += "<tr>";
					output += "<td>"+result[i].c_number+"</td>";
					output += "<td>"+result[i].m_id+"</td>";
					output += "<td>"+result[i].c_contents+"</td>";
					output += "<td>"+result[i].c_date+"</td>";
					output += "</tr>";
				}
				output += "</table>";
				// id가 comment-list인 div에 출력
				document.getElementById('comment-list').innerHTML = output;
				// 댓글 입력창을 비움. 
				document.getElementById('m_id').value='';
				document.getElementById('c_contents').value='';
			},
			error: function(){
				console.log("문제있음")
			}
		});
		
		
	});
	
</script>

</html>