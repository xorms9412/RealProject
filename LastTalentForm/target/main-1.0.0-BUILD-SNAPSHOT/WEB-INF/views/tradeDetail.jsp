<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래신청 상세보기</title>
<style>
	b{
		display: none;
	}
	#btn-sit{
				text-align : center;
			}
			#tradeContent{
				text-align : center;
				border : 1px solid lightgrey;
				border-collapse: collapse;
				width : 960px;
				margin-top : 50px;
				margin-left : 160px;
			}
			#tradeContent tr td{
				border : 1px solid lightgrey;
				padding : 5px;
			}
			#tradeContent tr th{
				border : 1px solid lightgrey;
				padding : 5px;
				width : 100px;
				color : lightgrey;
				background-color : brown;
			}
	
		.links {
		  *zoom: 1;
		  padding: 8px;
		  -moz-box-sizing: border-box;
		  -webkit-box-sizing: border-box;
		  box-sizing: border-box;
		  text-align: center;
		  background: white;
		  position: relative;
		  width:200px;
		  height: 52px;
		  top:-888px;
		  left:558px;
		  float:left;
		}
		
		.links:before, .links:after {
		  content: "";
		  display: table;
		}
		
		.links:after {
		  clear: both;
		}
		
		.link-effect-10 a {
		  color: gray;
		  margin: 0 20px;
		  padding: 10px;
		  position: relative;
		  -moz-transition: ease-out 0.3s 0.1s;
		  -o-transition: ease-out 0.3s 0.1s;
		  -webkit-transition: ease-out 0.3s;
		  -webkit-transition-delay: 0.1s;
		  transition: ease-out 0.3s 0.1s;
		  left:-12px;
		  top:900px;
		  border: 1px solid gray;
		  font-weight:500;
		}
		
		.link-effect-10 a span::before {
		  height: 100%;
		  width: 2px;
		  background: black;
		  content: "";
		  position: absolute;
		  left: 0;
		  top: 0;
		  -moz-transform: scaleY(0);
		  -ms-transform: scaleY(0);
		  -webkit-transform: scaleY(0);
		  transform: scaleY(0);
		  -moz-transition: 0.3s;
		  -o-transition: 0.3s;
		  -webkit-transition: 0.3s;
		  transition: 0.3s;
		}
		
		.link-effect-10 a span::after {
		  height: 100%;
		  width: 2px;
		  background: black;
		  content: "";
		  position: absolute;
		  right: 0;
		  top: 0;
		  -moz-transform: scaleY(0);
		  -ms-transform: scaleY(0);
		  -webkit-transform: scaleY(0);
		  transform: scaleY(0);
		  -moz-transition: 0.3s;
		  -o-transition: 0.3s;
		  -webkit-transition: 0.3s;
		  transition: 0.3s;
		}
		
		.link-effect-10 a::before {
		  height: 2px;
		  width: 100%;
		  background: black;
		  content: "";
		  position: absolute;
		  left: 0;
		  top: 0;
		  -moz-transform: scaleX(0);
		  -ms-transform: scaleX(0);
		  -webkit-transform: scaleX(0);
		  transform: scaleX(0);
		  -moz-transition: 0.3s;
		  -o-transition: 0.3s;
		  -webkit-transition: 0.3s;
		  transition: 0.3s;
		}
		
		.link-effect-10 a::after {
		  height: 2px;
		  width: 100%;
		  background: black;
		  content: "";
		  position: absolute;
		  left: 0px;
		  bottom: 0;
		  -moz-transform: scaleX(0);
		  -ms-transform: scaleX(0);
		  -webkit-transform: scaleX(0);
		  transform: scaleX(0);
		  -moz-transition: 0.3s;
		  -o-transition: 0.3s;
		  -webkit-transition: 0.3s;
		  transition: 0.3s;
		}
		
		.link-effect-10 a:hover {
		  color: black;
		  font-weight:500;
		}
		
		.link-effect-10 a:hover::before, .link-effect-10 a:hover::after {
		  -moz-transform: scaleX(1);
		  -ms-transform: scaleX(1);
		  -webkit-transform: scaleX(1);
		  transform: scaleX(1);
		}
		
		.link-effect-10 a:hover span::before, .link-effect-10 a:hover span::after {
		  -moz-transform: scaleY(1);
		  -ms-transform: scaleY(1);
		  -webkit-transform: scaleY(1);
		  transform: scaleY(1);
		}
</style>
</head>
<body>
	<jsp:include page="upbar.jsp"/>
	<div style="height:70px;"></div>
	
	<table id = "tradeContent">
		<tr>
			<th>재능 제목</th>
			<td colspan = '3'>${list.trade_title}</td>
		</tr>
		<tr>
			<th>재능 금액</th>
			<td>${list.trade_price}</td>
			<th>재능 구매자</th>
			<td>${list.trade_buy}</td>
		</tr>
		<tr>
			<th>기간</th>
			<td id="date">${list.trade_start}<br/>~ ${list.trade_end}</td>
			<th>재능 판매자</th>
			<td style="width : 450px;">${list.trade_sell}</td>
			
		</tr>
		<tr>
			<td colspan="4">${list.trade_content}</td>
		</tr>
		<tr>
			<td id="photosit" colspan="4">
			
			</td>
		</tr>
	</table>
	<div id="btn-sit"></div>
	
</body>
<script>
	var loginIdtwo = "${sessionScope.loginIdtwo}";
	$(document).ready(function(){
		var btn = "";
		var seller = "${list.trade_sell}";
		var buyer = "${list.trade_buy}";
		var trade_state = "${list.trade_state}";
		if(trade_state == "1"){
			if(loginIdtwo==seller){
				
				btn += '<span id="soolock" style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-80px;" onclick="soolock()" data-hover="확 인"><span>수락하기</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';
				btn += '<span id="cansel">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a style="margin-left:-300px;" href="#" onclick="cansel()" data-hover="확 인"><span>거절하기</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';

				$("#btn-sit").append(btn);
			}else if(loginIdtwo== buyer){
				btn += '<span id="list" style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-80px;" onclick="list()" data-hover="확 인"><span>목록으로</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';
				btn += '<span id="cansel">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a style="margin-left:-300px;" href="#" onclick="cansel()" data-hover="확 인"><span>취소하기</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';
				$("#btn-sit").append(btn);
			}	
		}
		

		
		var conten = "";
		<c:forEach var="sex" items="${photo}" >
			conten += "<img width='400' height='300' src='resources/upload/"+'${sex.newfile}'+"'/>";
		</c:forEach>
		$("#photosit").append(conten);
		
	});
	function soolock(){
		location.href = "./tradeOk?idx="+${list.trade_idx};
	}
	function list(){
		location.href = "./tradeList?id="+"${sessionScope.loginId}";
	}
	function cansel(){
		location.href = "./tradeDel?idx="+${list.trade_idx};
	}
 	
</script>
</html>