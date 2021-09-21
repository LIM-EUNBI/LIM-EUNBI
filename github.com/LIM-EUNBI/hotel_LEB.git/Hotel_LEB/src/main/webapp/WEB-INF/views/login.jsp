<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>login</title>
	<link rel="stylesheet" href="resources/css/room.css">
<style>
#login_div{
 position:absolute;
 height:300px;
 width:500px;
 margin:-150px 0px 0px -200px;
 top:50%;
 left:50%;
 padding:5px;
 /*  border:1px solid purple;*/
}
</style>
</head>
<body>
<div id="login_div">
<h1><a href="home">로그인</a></h1><hr>
<form method="POST" action="check_user" id="form_login">
	<h3>ID &nbsp;&nbsp;: <input type=text name=userid id="user_id" required></h3>
	<h3>PW &nbsp;: <input type=password name=userpw id="user_pw" required></h3>
	<input type=submit value="로그인" id="submit_button">&nbsp;&nbsp;
	<input type=button value="회원가입" onclick="location.href='newbie'" id="join_btn">
</form>
</div>
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
	.ready(function(){
		alert("로그인에 실패하였습니다.");
	})
</script>
</html>