<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>로그인</h1><hr>
<form method="POST" action="check_user" id="form_login">
	ID : <input type=text name=userid required><br>
	PW : <input type=password name=userpw required><br>
	<input type=submit value="로그인">	
</form>
<button onclick="location.href='newbie'">회원가입</button>
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$('document')
	.on('submit','#form_login',function(){
		var userid = $.trim($('input[name=userid]').val());
		var userpw = $.trim($('input[name=userpw]').val());
		if(userid==''){
			alert('아이디를 확인해주세요.');
			return false;
		}
		if(userpw==''){
			alert('비밀번호를 확인해주세요.');
			return false;
		}
	})
</script>
</html>
