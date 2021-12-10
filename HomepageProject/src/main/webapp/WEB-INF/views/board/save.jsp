<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글작성</h2>

	<form action="/board/save" method="post" enctype="multipart/form-data">
		작성자 <input type="text" name="m_id" value="${sessionScope.loginId}"> <br>
		제목: <input type="text" name="b_title"> <br>
		내용:<br><textarea name="b_contents" rows="5"></textarea> <br>
		파일: <input type="file" name="b_file"><br>
		<input type="submit" value="작성">		
	</form>
	
</body>
</html>