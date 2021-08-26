<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 정보</title>
</head>
<body>
<h1>회원가입 정보</h1><hr>
<h3>이름 : ${pl.username }</h3>
<h3>아이디 : ${pl.userid }</h3>
<h3>비밀번호 : ${pl.passcode1 }</h3>
<h3>전화번호 : ${pl.mobile }</h3>
<button onclick="location.href='home'">홈으로 가기</button>
</body>
</html>