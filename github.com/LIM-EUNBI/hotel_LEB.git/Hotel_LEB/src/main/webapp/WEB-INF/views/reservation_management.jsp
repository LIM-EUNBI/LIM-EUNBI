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
        <input type="date" name="period1" id="period"> ~ <input type="date" name="period2" id="period">
        <h3 style="padding-right: 19%;">예약 가능 ▽ </h3>
        <select size=7 multiple id="select_room">
            <option>데이지</option>
            <option>장미</option>
            <option>핑크뮬리</option>
            <option>해바라기</option>
            <option>사피니아</option>
            <option>로즈마리</option>
        </select>
    </div>
    <div class="room_list_right">
        <h3>객실 이름 ▷ <input type="text" name="room_name" id="room_name"></h3>
        <h3>숙박 기간 ▷ <input type="date" name="date_1" id="period"> ~ <input type="date" name="date_2" id="period"></h3>
        <h3>숙박 인원 ▷ <input type="text" name="people_num" id="check_number"> 명</h3>
        <h3>1박 비용 ▷ <input type="text" name="price_a_day" id="price"> 원</h3>
        <h3>총 숙박비 ▷ <input type="text" name="total_price" id="total_price"> 원</h3>
        <h3>예약자 성함 ▷ <input type="text" name="user_name" id="user_name"></h3>
        <h3>예약자 핸드폰 번호 ▷ <input type="text" name="user_num" id="user_num"></h3>
        <div class="button_list">
            <input type="submit" value="등록" id="submit_button">
            <input type="button" name="delete" value="삭제" id="delete_button">
            <input type="reset" value="clear" id="clear_button">
        </div>
    </div>
    
</div>
</body>
</html>