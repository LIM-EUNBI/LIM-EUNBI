<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>로그인</h1><hr>
<form method="POST" action="check_user">
	ID : <input type=text name=userid required><br>
	PW : <input type=text name=userpw required><br>
	<input type=submit value="로그인">	
</form>
<button value="취소" onclick="location.href='home'">홈으로 가기</button>
</body>
</html>