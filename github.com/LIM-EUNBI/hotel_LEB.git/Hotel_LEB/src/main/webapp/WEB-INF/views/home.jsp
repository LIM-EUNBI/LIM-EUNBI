<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>로그인</h1><hr>
<form method="POST" action="check_user">
	ID : <input type=text name=userid required><br>
	PW : <input type=text name=userpw required><br>
	<input type=submit value="로그인">	
</form>
<button onclick="location.href='newbie'">회원가입</button>
</body>
</html>
