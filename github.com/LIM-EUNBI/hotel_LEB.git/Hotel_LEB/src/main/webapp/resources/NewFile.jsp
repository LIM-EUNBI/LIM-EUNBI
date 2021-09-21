<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#test {
   position: relative; /* #wrapper에 투명도를 주면 컨텐츠도 같이 투명해지기 때문에.. */
   width:100%;
   height:100%;
   
}
#test::after {
    content : "";
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    background-image: url(background1.jpg); 
    width: 100%;
    height: 100%;
    opacity : 0.5;
    z-index: -1;
}
</style>
</head>
<body>
<div id="test">
<h1>hello</h1>
</div>
</body>
</html>