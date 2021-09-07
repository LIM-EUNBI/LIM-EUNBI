<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>reservation_management</title>
    <link rel="stylesheet" href="resources/css/room.css">
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
        <h3 style="padding-right: 19%;">숙박 기간 ▽ </h3>
        <input type="date" name="period1" id="period1_1"> ~ <input type="date" name="period2" id="period2_1"><br><br>
        <select size=4 multiple id="select_roomtype">
            <option value=1>Suite Room</option>
            <option value=2>Family Room</option>
            <option value=3>Double Room</option>
            <option value=4>Single Room</option>
        </select><br>
        <input type="button" value="조회" id="btn_search">
        <h3 style="padding-right: 19%;">예약 가능 ▽ </h3>
        <select size=7 multiple id="select_room">
           <!--  <option>데이지</option>
            <option>장미</option>
            <option>핑크뮬리</option>
            <option>해바라기</option>
            <option>사피니아</option>
            <option>로즈마리</option> -->
        </select>
    </div>
    <div class="room_list_right">
    	<form action="book" method="post">
        <h3>객실 이름 ▷ <input type="text" name="room_name" id="room_name"></h3>
        <h3>숙박 기간 ▷ <input type="date" name="date_1" id="period1_2"> ~ <input type="date" name="date_2" id="period2_2"></h3>
        <h3>숙박 인원 ▷ <input type="text" name="people_num" id="check_number"> 명</h3>
        <h3>1박 비용 ▷ <input type="text" name="price_a_day" id="price"> 원</h3>
        <h3>총 숙박비 ▷ <input type="text" name="total_price" id="total_price"> 원</h3>
        <h3>예약자 성함 ▷ <input type="text" name="user_name" id="user_name"></h3>
        <h3>예약자 핸드폰 번호 ▷ <input type="text" name="user_num" id="user_num"></h3>
        <input type="hidden" name="roomcode" id="roomcode">
        <div class="button_list">
            <input type="submit" value="등록" id="submit_button">
            <input type="button" name="delete" value="삭제" id="delete_button">
            <input type="reset" value="clear" id="clear_button">
        </div>
        </form>
    </div>
    
</div>
</body> 
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document)
	.on('click', '#btn_search', function(){
		var checkin = String($('#period1_1').val());
		var checkout = String($('#period2_1').val());
		var typecode = String($('#select_roomtype').val());
		$.post('http://localhost:8080/app/searchRoom',{checkin:checkin,checkout:checkout,typecode:typecode},
				function(result){
				console.log(result);
				$('#select_room').children('option').remove();
				$.each(result, function(idx,value){
					str='<option value="'+value['roomcode']+'">'+value['roomname']+', '+value['typename']+', '+value['howmany']+', '+value['howmuch']+'</option>';
					$('#select_room').append(str);
				});
		},'json')
	})
	.on('click', '#select_room', function(){
		var str = $('#select_room option:selected').text();
		var roomcode = String($('#select_room option:selected').val())
		var room = String(str).split(',');
		var checkin = String($('#period1_1').val());
		var checkout = String($('#period2_1').val());
		$('#room_name').val(room[0]);
		//$('#check_number').val(room[2]);
		$('#price').val(room[3]);
		$('#period1_2').val(checkin);
		$('#period2_2').val(checkout);
		$('#roomcode').val(roomcode);

		var p = checkin.split('-');
		var p1 = checkout.split('-');
		p=parseInt(p[2]);
		p1=parseInt(p1[2]);
		$('#total_price').val((p1-p)*room[3]);
	})
	/* .on('click', '#submit_button', function(){
		alert($('#price').val()+
		$('#period1_2').val()+
		$('#period2_2').val()+
		$('#roomcode').val()+
		$('#total_price').val());
	}) */
</script>
</html>


