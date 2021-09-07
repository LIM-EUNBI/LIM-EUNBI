<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
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
    <div class="room_list_left">
    <div class="none_div"></div>
    <div class="room_list_center">
        <table class="reservation_table">
            <thead class="table_head">
            <tr>
                <th colspan='7'>예약된 객실</th>
            </tr>
        </thead>
        <tbody class="table_body" id="book_table">
            <tr>
                <th>방 이름</th>
                <th>타입</th>
                <th>체크인</th>
                <th>체크아웃</th>
                <th>숙박 인원</th>
                <th>예약자 성함</th>
                <th>예약자 핸드폰 번호</th>
            </tr>
        </tbody>
        </table>
    </div>
</div>
<div class="room_list_right">
    	<form action="book" method="post">
        <h3>객실 이름 ▷ <input type="text" name="room_name" id="room_name"></h3>
        <h3>숙박 기간 ▷ <input type="date" name="date_1" id="period1_2"> ~ <input type="date" name="date_2" id="period2_2"></h3>
        <h3>숙박 인원 ▷ <input type="text" name="people_num" id="check_number"> 명</h3>
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
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document)
	.ready(function(){
		$.post("http://localhost:8080/app/showBooking",{},function(result){
			console.log(result);
			$.each(result, function(idx,value){
				str = '<tr> <td>'+value['roomname']+'</td> <td>'+value['typename']+'</td> <td>'+value['checkin']+'</td> <td>'+value['checkout']+'</td> <td>'+value['pcount']+'</td> <td>'+value['name']+'</td> <td>'+value['mobile']+'</tr>';
				$('#book_table').append(str);
			});
			/* $.each(result, function(idx,value){
				str='<option value="'+value['roomcode']+' '+value['typecode']+'">'+value['roomname']+','+value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
				$('#select_room').append(str);
			}); */
		},'json')	
	})
	.on('click', '#book_table tr', function(){
		var str = ""
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		//console.log("클릭한 row의 모든 데이터 : "+tr.text());
		
		var roomname = td.eq(0).text();
		var roomtype = td.eq(1).text();
		var checkin = td.eq(2).text();
		var checkout = td.eq(3).text();
		var pcount = td.eq(4).text();
		var username = td.eq(5).text();
		var mobile = td.eq(6).text();
		
		str += "클릭된 Row의 값 : "+roomname+", "+roomtype+", "+checkin+", "+
			checkout+", "+pcount+", "+username+", "+mobile
		console.log(str)
		
		
		var period1 = checkin.substring(0,10);
		var period2 = checkout.substring(0,10);
		//alert(period)
		
		$('#room_name').val(roomname);
		$('#period1_2').val(period1);
		$('#period2_2').val(period2);
		$('#check_number').val(pcount);
		$('#user_name').val(username);
		$('#user_num').val(mobile);
		
		
	})
</script>
</html>