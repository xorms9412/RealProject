<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.active{
		display : none;
	}
	body{
	font-family:Arial, Helvetica, sans-serif;
	margin:0 auto;
}
a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
a:visited {
	color: #666;
	font-weight:bold;
	text-decoration:none;
}
a:active,
a:hover {
	color: #bd5a35;
	text-decoration:underline;
}


table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding : 10px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;
	width : 150px;
	

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child{
}
table tr:first-child th:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr{
	text-align: center;
}
table tr td:first-child{
	border-left: 0;
}
table tr td {
	padding:10px 20px 10px 20px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td{
	border-bottom:0;
}
table tr:last-child td:first-child{
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}
#buyList_Btn{
  margin-left : -70px; 
}
</style>
</head>
<body>
		<jsp:include page="upbar.jsp"/>
	
		<div id="tradeList">
		<div id="tradeListMenu">
			<div id="buyList_Btn" style="float:left;">
				<img id="buyListhover" src="resources/img/buyListhover.gif">
				<img id="buyListnoover" style="display:none;" src="resources/img/buyListnoclick.gif">
			</div>
			<div id="sellList_Btn">
				<img id="selllistnoover" src="resources/img/sellListnoclick.gif"/>
				<img id="selllisthover" style="display:none;" src="resources/img/SellListclick.gif"/>
			</div>	
		</div>
		
		<div style="margin-left:200px;">
		<div id="buyList">
			
		</div>
		
		<div id="sellList" class="active">
			
		</div>
		</div>
	</div>
</body>
<script>
	var buyList = "";
	var sellList = "";
	$(document).ready(function(){
		buyList += "<table cellspacing='0'>";
		buyList += "<tr><th>진행 상태</th><th>제목</th><th>판매자</th><th>기간</th><th>금액</th></tr>";
		<c:forEach items ="${buyList}" var = "list">
			buyList += "<tr>";
			var tradestate = "${list.trade_state}";
			if(tradestate=="1"){
				buyList += "<td><img src='resources/img/거래준비중.gif'></td>";
				buyList += "<td><a href='./tradeDetail?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";

			}else if(tradestate=="2"){
				buyList += "<td><img src='resources/img/거래중.gif'></td>";
				buyList += "<td><a href='./tradeOkPage?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";

			}else if(tradestate=="3"){
				buyList += "<td><img src='resources/img/거래중.gif'></td>";
				buyList += "<td><a href='./tradeOkPage?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";

			}else if(tradestate=="4"){
				buyList += "<td><img src='resources/img/거래종료.gif'></td>";
				buyList += "<td><a href='./tradeOkPage?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";

			}
			buyList += "<td>"+"${list.trade_sell}"+"</td>";
			buyList += "<td>"+"${list.trade_start}"+"<br/>~"+"${list.trade_end}"+"</td>";
			buyList += "<td>"+${list.trade_price}+"</td>";
			buyList += "</tr>";
		</c:forEach>
		buyList += "</table>";
		$("#buyList").append(buyList);
		
		sellList += "<table cellspacing='0'>";
		sellList += "<tr><th>진행 상태</th><th>제목</th><th>구매자</th><th>기간</th><th>금액</th></tr>";

		<c:forEach items ="${sellList}" var = "list">
			sellList += "<tr>";
			var sell_trade_state = "${list.trade_state}";
			if(sell_trade_state==1){
				sellList += "<td><img src='resources/img/거래준비중.gif'></td>";
				sellList += "<td><a href='./tradeDetail?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";
			}else if(sell_trade_state==2){
				sellList += "<td><img src='resources/img/거래중.gif'></td>";
				sellList += "<td><a href='./tradeOkPage?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";
			}else if(sell_trade_state==3){
				sellList += "<td><img src='resources/img/거래중.gif'></td>";
				sellList += "<td><a href='./tradeOkPage?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";

			}else if(sell_trade_state==4){
				sellList += "<td><img src='resources/img/거래종료.gif'></td>";
				sellList += "<td><a href='./tradeOkPage?idx="+${list.trade_idx}+"'>"+"${list.trade_title}"+"</a></td>";

			}

			sellList += "<td>"+"${list.trade_buy}"+"</td>";
			sellList += "<td>"+"${list.trade_start}"+"~<br/>"+"${list.trade_end}"+"</td>";
			sellList += "<td>"+${list.trade_price}+"</td>";
			sellList += "</tr>";

		</c:forEach>
		sellList += "</table>";
		$("#sellList").append(sellList);
		
	});
	
	$("#sellList_Btn").click(function(){
		$("#buyList").addClass("active");
		$("#sellList").removeClass("active");
		$("#buyListnoover").css("display","block");
		$("#buyListhover").css("display","none");
		$("#selllisthover").css("display","block");
		$("#selllistnoover").css("display","none");

	});
	$("#buyList_Btn").click(function(){
		$("#sellList").addClass("active");
		$("#buyList").removeClass("active");
		$("#buyListhover").css("display","block");
		$("#buyListnoover").css("display","none");
		$("#selllistnoover").css("display","block");
		$("#selllisthover").css("display","none");

	});
	
	
</script>
</html>