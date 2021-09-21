<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<h1><a href=newbie>회원가입</a></h1><hr>
<form id="join" method="POST" action="join">
	<h3>이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type=text name=username id=user_name required></h3>
	<h3>아이디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type=text name=userid id=user_id required></h3>
	<h3>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type=password name=passcode id="passcode1" required></h3>
	<h3>비밀번호 확인 : <input type=password name=passcode2 id="passcode2" required></h3>
	<h3>핸드폰 번호 &nbsp;&nbsp;&nbsp;: <input type=text name=mobile id="user_num" required></h3>
	<input type=submit value="회원가입" id="submit_button">
	<input type=submit value="취소" id="clear_button" onclick="location.href='home'">
</form>
</div>
	<!-- <button value="login" onclick="location.href='login'">로그인</button> -->
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document)
	.on('click',"#submit_button",function(){
		var passcode1 = String($('#passcode1').val());
		var passcode2 = String($('#passcode2').val());
		if(passcode1!=passcode2){
			alert("비밀번호를 확인해주세요.");
			return false;
		}
	})
</script>
</html>