<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/room.css">
<title>room_management</title>
</head>
<body>
    <div class="menu_div">
        <h1 style="text-align: center;"><a href="room_management">호텔 객실관리</a></h1>
        <hr>
        <h3 class="menu1"><a href="room_management">객실 관리</a></h3>
        <h3 class="menu"><a href="reservation_management">예약 등록</a></h3>
        <h3 class="menu"><a href="show_all">예약 보기</a></h3>
        <h3 class="menu"><a href="logout">로그아웃</a></h3>
        <hr>
    </div>
    <div class="room_list">
    <div class="room_list_left">
        <h3 style="padding-right: 17%;">객실 목록 ▽</h3>
        <div>
            <select size=7 multiple id="select_room">
               <c:forEach items="${list }" var="room">
					<option value='${room.roomcode} ${room.typecode}'>${room.roomname},${room.typename},${room.howmany }, ${room.howmuch }</option>
				</c:forEach>
            </select>
        </div>
    </div>
    <div class="room_list_right">
        <h3>객실 이름 ▷ <input type="text" name="room_name" id="room_name"></h3>
        <input type="hidden" name="roomcode" id="roomcode">
        <h3>객실 분류 ▽ </h3>
        <select size=7 multiple id="select_room1">
            <c:forEach items="${roomType}" var="roomType">
            	<option value='${roomType.typecode }'>${roomType.name }</option>
            </c:forEach>
        </select>
        <h3>숙박 가능 인원 ▷ <input type="text" name="check_number" id="check_number"> 명</h3>
        <h3>1박 요금 ▷ <input type="text" name="price" id="price"> 원</h3>
        <div class="button_list">
        <input type="submit" value="등록" id="submit_button">
        <input type="button" name="delete" value="삭제" id="delete_button">
        <input type="button" value="clear" id="clear_button">
        </div>
    </div>
</div>

<%-- <%
	String loginid = (String)session.getAttribute("loginid");
	if(!loginid.equals("ever3622")){
		response.sendRedirect("login");
	}
%> --%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document)
	.ready(function(){
		$.post("http://localhost:8080/app/getRoomList",{},function(result){
			console.log(result);
		},'json')		
	})
	.on('click', '#select_room', function(){
		var str = $('#select_room option:selected').text(); // option값 가져오기
		var str1 = $('#select_room').val(); // value에서 typecode 가져오기
		var pk = String(str1).split(" "); // typecode를 가져오기 위해 split
		var typecode = parseInt(pk[1]) // int로 타입변환
		var roomcode = parseInt(pk[0])
		var room = String(str).split(','); // option에서 가져온 값들 배열로 슬라이싱

		$('#room_name').val(room[0]);
		$('#check_number').val(room[2]);
		$('#price').val(room[3]);
		$('#roomcode').val(roomcode);
	 	if(typecode==1){
			$('#select_room1').val(1).prop("selected", true);
		}else if(typecode==2){
			$('#select_room1').val(2).prop("selected", true);
		}else if(typecode==3){
			$('#select_room1').val(3).prop("selected", true);
		}else if(typecode==4){
			$('#select_room1').val(4).prop("selected", true);
		}
	})
	.on('click', '#clear_button', function(){
		$('#room_name,#check_number,#price').val('');
		$('#select_room1 option:selected').prop("selected", false);
	})
</script>
</body>
</html>