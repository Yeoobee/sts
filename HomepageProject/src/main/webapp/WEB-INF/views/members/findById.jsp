<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input{
		display:block;
	}
</style>

<script>
	function update(){
		const pw = document.getElementById('m_password').value;
		const pwDB ='${members.m_password}';
		if(pw==pwDB){
			update_form.submit();
		}else{
			alert('비번틀림');
		}
	}
</script>
</head>

<body>
	<h2>findById</h2>
	
	<form action="/members/update" method="post" enctype="multipart/form-data"  name="update_form">
	<input type="hidden" name="m_number" value="${members.m_number}" readonly>
	아이디<input type="text" name="m_id" value="${members.m_id}" readonly >
	비밀번호 체크(필수)<input type="password" name="m_password" id="m_password">
	이름<input type="text" name="m_name" value="${members.m_name}" readonly>
	이메일<input type="text" name="m_email" value="${members.m_email}">
	전화번호<input type="text" name="m_phone" value="${members.m_phone}">
	프로필사진 <input type="file" name="m_file">
	<input type="button" value="수정" onclick="update()">
	</form>
	
	
</body>
</html>