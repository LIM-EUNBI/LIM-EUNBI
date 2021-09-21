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
    
    <div class="room_list_center">
        <table class="reservation_table">
            <thead class="table_head">
            <tr>
                <th colspan='6' >예약된 객실</th>
                <th colspan='2'>
	                <select id="search_sel">
				    	<option value=1>전체</option>
				    	<option value=2>이름</option>    	
	    			</select>
	    			<input type="text" name="user_name" id="user" >
	    			<input type="button" name="search_btn" id="search_btn" value="검색">
    			</th>
            </tr>
        </thead>
        <tbody class="table_body" id="book_table">
           
        </tbody>
        </table>
    </div>

</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document)
	.ready(function(){
		
	})
	.on('click', '#delete_button', function(){
	    //var str = $('#book_table tr').val();
		var str1 = ""
		var tdArr = new Array();
		var btn = $(this);
		//var tr = $(this);
		var tr = btn.parent().parent();
		var td = tr.children();
		
		//console.log("클릭한 row의 모든 데이터 : "+tr.text());
		var bookcode = td.eq(6).text()
		//alert(bookcode)
		if(confirm('정말로 삭제하시겠습니까?')){
		$.post('http://localhost:8080/app/deleteBook', {bookcode:bookcode},
				function(result){
				console.log(result);
				alert('정상적으로 삭제되었습니다.');
				location.reload();
		},'text');
		}
	})
	.on('click','#search_btn',function(){
		if($('#search_sel').val()==1){
			$.post("http://localhost:8080/app/showBooking",{},function(result){
				console.log(result);
				$('#book_table').children('tr').remove();
				var maintr = '<tr><th>방 이름</th><th>타입</th><th>체크인</th><th>체크아웃</th><th>숙박 인원</th><th>예약자 성함</th><th>예약자 핸드폰 번호</th><th>삭제</th></tr>'
				$('#book_table').append(maintr);
				$.each(result, function(idx,value){
					str = '<tr> <td>'+value['roomname']+'</td> <td>'+value['typename']+'</td> <td>'+value['checkin']+'</td> <td>'+value['checkout']+'</td> <td>'+value['pcount']+'</td> <td>'+value['name']+'</td> <td id="bookcode" style="display:none">'+value['bookcode']+'</td> <td>'+value['mobile']+'</td> <td><input type=button id="delete_button" value="삭제"></td></tr>';
					$('#book_table').append(str);
				});
			},'json')	
		}
		else{
			var username = $('#user').val();
			$.post("http://localhost:8080/app/search_name",{username:username},function(result){
				console.log(result);
				$('#book_table').children('tr').remove();
				var maintr = '<tr><th>방 이름</th><th>타입</th><th>체크인</th><th>체크아웃</th><th>숙박 인원</th><th>예약자 성함</th><th>예약자 핸드폰 번호</th><th>삭제</th></tr>'
				$('#book_table').append(maintr);
				$.each(result, function(idx,value){
					str = '<tr> <td>'+value['roomname']+'</td> <td>'+value['typename']+'</td> <td>'+value['checkin']+'</td> <td>'+value['checkout']+'</td> <td>'+value['pcount']+'</td> <td>'+value['name']+'</td> <td id="bookcode" style="display:none">'+value['bookcode']+'</td> <td>'+value['mobile']+'</td> <td><input type=button id="delete_button" value="삭제"></td></tr>';
					$('#book_table').append(str);
				});
			},'json')	
		}
	}) 
</script>
</html>