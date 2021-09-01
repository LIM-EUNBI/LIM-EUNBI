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
    <div class="room_list">
    <div class="none_div"></div>
    <div class="room_list_center">
        <table class="reservation_table">
            <thead class="table_head">
            <tr>
                <th colspan='5'>예약된 객실</th>
            </tr>
        </thead>
        <tbody class="table_body">
            <tr>
                <th>방 이름</th>
                <th>숙박 기간</th>
                <th>숙박 인원</th>
                <th>예약자 성함</th>
                <th>예약자 핸드폰 번호</th>
            </tr>
            <tr>
                <td>데이지</td>
                <td>2021/8/12~13</td>
                <td>2</td>
                <td>임은비</td>
                <td>01080753708</td>
            </tr>
            <tr>
                <td>장미</td>
                <td>2021/8/14~15</td>
                <td>2</td>
                <td>임담비</td>
                <td>01080753708</td>
            </tr>
            <tr>
                <td>사피니아</td>
                <td>2021/8/27~29</td>
                <td>6</td>
                <td>임금비</td>
                <td>01080753708</td>
            </tr>
        </tbody>
        </table>
    </div>
</div>
</body>
</html>