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
    <div class="room_list_left1">
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
        <select size=7 multiple id="select_room3">

        </select>
    </div>
    <div class="room_list_right1">
    	<!-- <form action="book" method="post"> --><input type="hidden"><br><br>
        <h3>객실 이름 &nbsp;&nbsp;&nbsp;▷ <input type="text" name="room_name" id="room_name" required readonly></h3>
        <h3>숙박 기간 &nbsp;&nbsp;&nbsp;▷ <input type="date" name="date_1" id="period1_2" required readonly><br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~ <input type="date" name="date_2" id="period2_2" required readonly></h3>
        <h3>숙박 인원 &nbsp;&nbsp;&nbsp;▷ <input type="text" name="people_num" id="check_number" > 명</h3>
        <h3>1박 비용 &nbsp;&nbsp;&nbsp;&nbsp;▷ <input type="text" name="price_a_day" id="price" > 원</h3>
        <h3>총 숙박비 &nbsp;&nbsp;&nbsp;▷ <input type="text" name="total_price" id="total_price" > 원</h3>
        <h3>예약자 성함 ▷ <input type="text" name="user_name" id="user_name" ></h3>
        <h3>핸드폰 번호 ▷ <input type="text" name="user_num" id="user_num" ></h3>
        <input type="hidden" name="roomcode" id="roomcode">
        <input type="hidden" name="bookcode" id="bookcode">
        <div class="button_list">
            <input type="button" value="등록" id="submit_button">
            <input type="button" name="delete" value="삭제" id="delete_button">
            <input type="reset" value="clear" id="clear_button">
        </div>
        <!-- </form> -->
    </div>
    <div class="room_list">
    <div class="room_list_right2">
        <h3 style="padding-right: 17%;">예약된 객실 ▽</h3>
        <div>
            <select size=7 multiple id="select_room5">

            </select>
        </div>
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
				$('#select_room3').children('option').remove();
				$.each(result, function(idx,value){
					str='<option value="'+value['roomcode']+'">'+value['roomname']+', '+value['typename']+', '+value['howmany']+', '+value['howmuch']+'</option>';
					$('#select_room3').append(str);
				});
		},'json')
		$.post('http://localhost:8080/app/searchBook',{checkin:checkin,checkout:checkout,typecode:typecode},
				function(result){
				console.log(result);
				$('#select_room5').children('option').remove();
				$.each(result, function(idx,value){
					str=str='<option value="'+value['roomcode']+' '+value['bookcode']+'">'+value['roomname']+', '+value['typename']+', '+value['checkin']+', '+value['checkout']+', '+value['pcount']+', '+value['name']+', '+value['mobile']+', '+value['price']+ '</option>';
					$('#select_room5').append(str);
				})
		},'json');
		
	})
	.on('click', '#select_room3', function(){
		var str = $('#select_room3 option:selected').text();
		var roomcode = String($('#select_room3 option:selected').val())
		var room = String(str).split(',');
		var checkin = String($('#period1_1').val());
		var checkout = String($('#period2_1').val());
		$('#room_name').val(room[0]);
		//$('#check_number').val(room[2]);
		$('#price').val(room[3]);
		$('#period1_2').val(checkin);
		$('#period2_2').val(checkout);
		$('#roomcode').val(roomcode);
		
		checkin = new Date(checkin);
		checkout = new Date(checkout);
		
		if(checkin > checkout){
			alert('체크인 날짜를 확인해 주세요.');
			return false;
		}
		
		var ms = Math.abs(checkout-checkin);
		var days = Math.ceil(ms/(1000*60*60*24));
		var price = parseInt($('#price').val())
		var total = days*price;
		/* var p = checkin.split('-');
		var p1 = checkout.split('-');
		p=parseInt(p[2]);
		p1=parseInt(p1[2]); */
		$('#total_price').val(total);
	})
	.on('click', '#submit_button', function(){
		var roomname = $('#room_name').val();
		var checkin = $('#period1_2').val();
		var checkout = $('#period2_2').val();
		var pcount = $('#check_number').val();
		var price = $('#total_price').val();
		var name = $('#user_name').val();
		var mobile = $('#user_num').val();
		var roomcode = $('#roomcode').val();
		if(pcount == '' || name == '' || mobile == ''){ 
			alert('누락된 값이 있습니다.')
			return false;
			}
		
		if($('#bookcode').val()==""){
			$.post('http://localhost:8080/app/addBook',
				{checkin:checkin, checkout:checkout, pcount:pcount, price:price, name:name, mobile:mobile, roomcode:roomcode},
				function(result){
					console.log(result);
					$('#clear_button').trigger('click');
					$('#select_room5').children('option').remove();
					$('#btn_search').trigger('click');
			},'text')
		}
		else{
			var bookcode = $('#bookcode').val();
			$.post('http://localhost:8080/app/updateBook',
					{bookcode:bookcode,checkin:checkin, checkout:checkout, pcount:pcount, price:price, name:name, mobile:mobile, roomcode:roomcode},
					function(result){
						console.log(result);
						$('#clear_button').trigger('click');
						$('#select_room5').children('option').remove();
						$('#btn_search').trigger('click');
				},'text')
		}
		
	})
	.on('click', '#clear_button', function(){
		$('#roomcode, #period1_2, #period2_2, #check_number, #total_price, #user_name, #user_num, #roomcode, #price, #room_name').val('');
	})
	.on('click', '#select_room5', function(){
		var str = $('#select_room5 option:selected').text();
		var str2 = $('#select_room5 option:selected').val();
		var book = String(str).split(',');
		var code = String(str2).split(" ");
		var roomcode = $.trim(code[0])
		var bookcode = $.trim(code[1])
		
		$('#room_name').val(book[0]);
		//$('#check_number').val(room[2]);
		$('#price').val(book[8]);
		$('#period1_2').val($.trim(book[2]));
		$('#period2_2').val($.trim(book[3]));
	
		$('#check_number').val($.trim(book[4]));
		$('#user_name').val($.trim(book[5]));
		$('#user_num').val($.trim(book[6]));
		$('#total_price').val($.trim(book[7]));
		$('#bookcode').val(bookcode);
		$('#roomcode').val(roomcode);
		
	})
	.on('click', '#delete_button', function(){
		var bookcode = $('#bookcode').val();
		if(confirm('정말로 삭제하시겠습니까?')){
		$.post('http://localhost:8080/app/deleteBook', {bookcode:bookcode},
				function(result){
				console.log(result);
				$('#clear_button').trigger('click');
				$('#select_room5').children('option').remove();
				$('#btn_search').trigger('click');
		},'text');
		}
	})
</script>
</html>


