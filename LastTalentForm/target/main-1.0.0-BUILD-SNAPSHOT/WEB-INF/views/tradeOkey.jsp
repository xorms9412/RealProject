<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
				<link href="https://fonts.googleapis.com/css?family=Crimson+Text" rel="stylesheet">
		
		<title>Insert title here</title>
		<style>
		
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
		  top:-1368px;
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
		  top:1380px;
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
			.font{
				font-family: 'Crimson Text', serif;
				font-size : 20px;
				padding : 10px 0 0 0;
				border-bottom : 1px solid lightgrey;
			
			}
			.infofont{
				font-family: 'Crimson Text', serif;
				font-size : 40px;
				color : grey;
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
				color : lightgrey;
				width : 100px;
				background-color : brown;
			}
			.tradeMemberProfile{
				text-align : center;
				margin-top : 50px;
				
			}
			.tradeMemberProfilediv{
				margin-top : -100px;
				margin-left : 35%;
				margin-bottom : 35px;
			}
			.chat{
				width : 50px;
			}
			
			.wen {width:200px; height:200px; border-radius:200px; margin:0 auto; overflow:hidden;}
			.wen img {height:auto; width:200px;}
			#btn-sit{
				text-align : center;
			}
		</style>
	</head>
	<body>
	<jsp:include page="upbar.jsp"/>
	<div style="height:60px;"></div>
	<div id="finishDiv"></div>
	<div class="tradeMemberProfilediv" id="buyProfile"></div>
	<div class="tradeMemberProfilediv" id="sellerProfile"></div>
	
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
			<td id="date">${list.trade_start}<br/>~${list.trade_end}</td>
			<th>재능 판매자</th>
			<td style="width : 450px;">${list.trade_sell}</td>
			
		</tr>
		<tr>
			<td colspan="4">${list.trade_content}</td>
		</tr>
		<tr>
			<td id="photosit" colspan="4">
			<c:forEach var="sex" items="${photo}" >
				<img width='400' src='resources/upload/${sex.newfile}'/>
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td id="chating" colspan ="4"><div id="_chatbox" style="display: none">
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
    <img class="chat" src="resources/img/chat.jpg" /></td>
		</tr>
	</table>
	
	
	<div id="btn-sit">
		
	</div>
	</body>
	<script>
	
	var loginIdtwo = "${sessionScope.loginIdtwo}";
	var seller = "${list.trade_sell}";
	var buyer = "${list.trade_buy}";
	var trade_state = "${list.trade_state}";
	var sellerProfilephoto = "${sellerProfile.newfile}";
	var buyerProfilephoto = "${buyerProfile.newfile}";
	$(document).ready(function(){
		var btn = "";
		var sellerProfile = "";
		var buyerProfile = "";
		if(trade_state == "2"){
			if(loginIdtwo==seller){
				btn += '<span id="soolock" style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-80px;" onclick="ingye()" data-hover="확 인"><span>인계확인</span></a>';
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
				buyProfile += "<table class='tradeMemberProfile'>";
				buyProfile +="<tr><td colspan='2' class='infofont'>Buyer Infomation</td></tr>";
				if(buyerProfilephoto!=""){
					buyProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"${buyerProfile.newfile}"+"'></div></td><td class='font'>Name</td></tr>";
				}else{
					buyProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"noprofile.jpg"+"'></div></td><td class='font'>Name</td></tr>";
				}
				buyProfile +="<tr><td>"+"${buyerProfile.user_name}"+"</td></tr>";
				buyProfile +="<tr><td class='font'>Address</td></tr>";
				buyProfile +="<tr><td style='width:200px;'>"+"${buyerProfile.address}"+"</td></tr>";
				buyProfile +="<tr><td class='font'>Phone</td></tr>";
				buyProfile +="<tr><td>"+"${buyerProfile.user_phone}"+"</td></tr>";
				buyProfile += "</table>";
				$("#sellerProfile").css("display","none");
				$("#buyProfile").append(buyProfile);
				$("#btn-sit").append(btn);
			}else if(loginIdtwo== buyer){
				btn += '<span id="soolock" style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-10px;" onclick="cansel()" data-hover="확 인"><span>취소하기</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';				sellerProfile += "<table class='tradeMemberProfile'>";
				sellerProfile +="<tr><td colspan='2' class='infofont'>Seller Infomation</td></tr>";
				if(sellerProfilephoto!=""){
					sellerProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"${sellerProfile.newfile}"+"'></div></td><td class='font'>Name</td></tr>";
				}else{
					sellerProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"noprofile.jpg"+"'></div></td><td class='font'>Name</td></tr>";
				}
				sellerProfile +="<tr><td>"+"${sellerProfile.user_name}"+"</td></tr>";
				sellerProfile +="<tr><td class='font'>Address</td></tr>";
				sellerProfile +="<tr><td style='width:200px;'>"+"${sellerProfile.address}"+"</td></tr>";
				sellerProfile +="<tr><td class='font'>Phone</td></tr>";
				sellerProfile +="<tr><td>"+"${sellerProfile.user_phone}"+"</td></tr>";
				sellerProfile += "</table>";
				$("#sellerProfile").append(sellerProfile);
				$("#btn-sit").append(btn);
			}
		}else if(trade_state =="3"){
			if(loginIdtwo==seller){
				btn += "<h2>인계하신 거래 입니다."+buyer+"님이 완료 되시면 거래는 종료 됩니다.</h2>";
				btn += '<span id="soolock" style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-10px;" onclick="list()" data-hover="확 인"><span>목록으로</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';				buyProfile += "<table class='tradeMemberProfile'>";
				buyProfile +="<tr><td colspan='2' class='infofont'>Buyer Infomation</td></tr>";
				if(buyerProfilephoto!=""){
					buyProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"${buyerProfile.newfile}"+"'></div></td><td class='font'>Name</td></tr>";
				}else{
					buyProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"noprofile.jpg"+"'></div></td><td class='font'>Name</td></tr>";
				}
				buyProfile +="<tr><td>"+"${buyerProfile.user_name}"+"</td></tr>";
				buyProfile +="<tr><td class='font'>Address</td></tr>";
				buyProfile +="<tr><td style='width:200px;'>"+"${buyerProfile.address}"+"</td></tr>";
				buyProfile +="<tr><td class='font'>Phone</td></tr>";
				buyProfile +="<tr><td>"+"${buyerProfile.user_phone}"+"</td></tr>";
				buyProfile += "</table>";
				$("#buyProfile").append(buyProfile);
				$("#sellerProfile").css("display","none");

				$("#btn-sit").append(btn);
			}else if(loginIdtwo== buyer){
				btn += "<h2>인수하시면 거래는 종료 됩니다.</h2>";
				btn += '<span id="soolock" style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-80px;" onclick="insoo()" data-hover="확 인"><span>인수확인</span></a>';
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
				sellerProfile += "<table class='tradeMemberProfile'>";
				sellerProfile +="<tr><td colspan='2' class='infofont'>Seller Infomation</td></tr>";
				if(sellerProfilephoto!=""){
					sellerProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"${sellerProfile.newfile}"+"'></div></td><td class='font'>Name</td></tr>";
				}else{
					sellerProfile +="<tr><td  rowspan='6'><div class='wen'><img src='resources/profilePhotos/"+"noprofile.jpg"+"'></div></td><td class='font'>Name</td></tr>";
				}
				sellerProfile +="<tr><td>"+"${sellerProfile.user_name}"+"</td></tr>";
				sellerProfile +="<tr><td class='font'>Address</td></tr>";
				sellerProfile +="<tr><td style='width:200px;'>"+"${sellerProfile.address}"+"</td></tr>";
				sellerProfile +="<tr><td class='font'>Phone</td></tr>";
				sellerProfile +="<tr><td>"+"${sellerProfile.user_phone}"+"</td></tr>";
				sellerProfile += "</table>";
				$("#sellerProfile").append(sellerProfile);
				$("#btn-sit").append(btn);
			}		
		}else if(trade_state =="4"){
			if(loginIdtwo==buyer){
				btn += "<h2>종료된 거래 입니다.</h2>";
				btn += '<span style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-100px;" onclick="list()" data-hover="확 인"><span>목록으로</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';
				btn += '<span style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-300px;" onclick="review()" data-hover="확 인"><span>리뷰 남기기</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';
				
			}else if(loginIdtwo==seller){
				btn += "<h2>종료된 거래 입니다.</h2>";
				btn += '<span style="float:left;">';
				btn += '<section class="links">';
				btn += '<nav class="link-effect-10" id="link-effect-10">';
				btn += '<a href="#" style="margin-left:-10px;" onclick="list()" data-hover="확 인"><span>목록으로</span></a>';
				btn += '</nav>';
				btn += '</section>';
				btn += '</span>';
			}
			$("#btn-sit").append(btn);
		}
		
		
	});
	function insoo(){
		location.href = "./insoo?idx="+${list.trade_idx}+"&id="+"${sessionScope.loginId}";
	}
	function cansel(){
		location.href = "./tradeDel?idx="+${list.trade_idx};
	}
	function ingye(){
		location.href = "./ingye?idx="+${list.trade_idx}+"&id="+"${sessionScope.loginId}";
	}
	function list(){
		location.href = "./tradeList?id="+loginIdtwo;
	}
	function review(){
		location.href = "./review?id="+seller;
	}
	//채팅 아이콘 클릭시 채팅창 나옴
	$(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "resources/img/chat.jpg") {
                $(".chat").attr("src", "resources/img/closeChat.jpg");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "resources/img/closeChat.jpg") {
                $(".chat").attr("src", "resources/img/chat.jpg");
                $("#_chatbox").css("display", "none");
            }
        }
    });
	</script>
	<script type="text/javascript">
	//채팅
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://192.168.0.140:80/main/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event);
    };
    webSocket.onopen = function(event) {
        onOpen(event);
    };
    webSocket.onmessage = function(event) {
        onMessage(event);
    };
    
    //서버에서 메시지 수신
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (!content == "") {
			$("#messageWindow").html($("#messageWindow").html()
				+ "<p class='chat_content'>" + sender + " : " + content + "</p>");
        }
    }
    
    //서버연결(채팅연결)
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
    }
    
    //서버연결 에러시 실행
    function onError(event) {
        alert(event.data);
    }
    
    //채팅 서버로 보내기
    function send() {
        if (!inputMessage.value == "") {
			$("#messageWindow").html($("#messageWindow").html()
				+ "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        webSocket.send(loginIdtwo + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    
    //엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    
    //채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
	</script>
	
</html>