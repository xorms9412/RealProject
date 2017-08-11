<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>상단바</title>
		<style>
			body{
				margin : 0 0 5 0px;
			}

			a:link{
				color: black;
				text-decoration: none;
			}
			
			a:visited{
				color: black; 
				text-decoration: none;
			}		
		
			#upbar{
				position:relative;
				margin-bottom:5px;
				padding:0px;
				background-color: black;
				width : 100%;
				height: 50px;
			}
			
			#home_btn{
				position:relative;
				float:left;
			}
			
			#home_img{
				width: 45px;
    			height: 45px;
    			margin: 3px;
			}
			
			#mypage_btn{
				position:relative;
				float:left;
			}
			
			#mypage_img{
				width: 45px;
    			height: 45px;
    			margin: 3px;
			}
			
			#logo{
				position:relative;
				float:left;
				left:35%;
			}
			
			#logo_img{
				width: 200px;
    			height: 57px;
			}
			
			#alam{
				position: relative;
				float:right;
				left:0px;
				width: 55px;
    			height: 50px;
			}
			
			#alam_img{
				width: 45px;
    			height: 45px;
    			margin: 3px;
			}
			
			#category_btn{
				position:relative;
				float:right;
			}
			
			#category_img{
				width: 45px;
    			height: 45px;
    			margin: 3px;
			}
			
			#alamlight{
				position: relative;
			    display: none;
			    width: 30px;
    			height: 30px;
			    right: -5px;
			    top: -48px;
			    bottom: 20px;
			    padding-bottom: 15px;
    			padding-left: 16px;
			}
			
			#alamlist{
				display: none;
			}
			
			#alamlist_list{
				width: 200px;
			    position: relative;
			    top: -30px;
			    left: -100px;
			    border: 2px solid red;
			    z-index: 9px;
			    background-color: white;
			}
			
			#shape{
				width: 0;
				height: 0;
				border: 13px solid red;
				border-top-width: 0px;
				border-right-color: transparent;
				border-left-color: transparent;
				margin: 10px;
				position: absolute;
				top: 43px;
				left: 3px;
			}
			
			#shape2{
				width: 0;
				height: 0;
				border: 12px solid white;
				border-top-width: 0px;
				border-right-color: transparent;
				border-left-color: transparent;
				margin: 10px;
				position: absolute;
				top: 46px;
				left: 4px;
				z-index: 10;
			}
			
			.alamlist_listcon{
			    margin-right: 6px;
			    margin-top: 10px;
			    margin-bottom: 10px;
			    border-bottom: 1px solid red;
			    padding-bottom: 8px;
			    width : 200px;
			}
			
		</style>
	</head>
	<body>
		<div id="upbar">
			<div id="home_btn">
				<img id="home_img" src="resources/upbar_img/upbar_main.png">
			</div>
			
			<div id="mypage_btn">
				<img id="mypage_img" src="resources/upbar_img/upbar_mypage.png"/>
			</div>
			
			<div id="logo">
				<img id="logo_img" src="resources/upbar_img/logo.png"/>
			</div>
			
			<div id="category_btn">
				<img id="category_img" src="resources/upbar_img/upbar_category.png">
			</div>
			
			<div id="alam">
				<img id="alam_img" src="resources/upbar_img/upbar_alam.png"/>
				<img id="alamlight" src="resources/upbar_img/alamon.png"/>
				<div id ="alamlist">
					<div id="shape"></div>
					<div id="shape2"></div>
					<div id="alamlist_list">
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		var url;
		var upbardata;
		var loginId="${sessionScope.loginId}";
		
		$(document).ready(function(){
			url = "./rest/alamOn";
			upbardata={};
			upbardata.sessionid = loginId;
			console.log(upbardata.sessionid);
			alamlight(url,upbardata);
		});
		
		function alamlight(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:"post",
				data:reqData,
				dataType:"json",
				success:function(d){
					if(d.success !=""){
						$("#alamlight").css("display","inline");
						console.log("알람표시");
						listPrint(d.success);
					}else{
						console.log("알림없음");
					}
					if(d.ingye !=""){
						$("#alamlight").css("display","inline");
						console.log("알람표시");
						ingyePrint(d.ingye);
					}else{
						console.log("알림없음");
					}
					if(d.finish !=""){
						$("#alamlight").css("display","inline");
						console.log("알람표시");
						finishPrint(d.finish);
					}else{
						console.log("알림없음");
					}
					if(d.soorock !=""){
						$("#alamlight").css("display","inline");
						console.log("알람표시");
						soorockPrint(d.soorock);
					}else{
						console.log("알림없음");
					}
					
				},
				error:function(e,staus){
					
				}
			});
		}
		
		
		
		
		$("#alamlight").click(function(){
			if($("#alamlist").css("display")=="none"){
				$("#alamlist").show();
			}else{
				$("#alamlist").hide();
			}
		});
		
		
		function listPrint(list){
			var content="";					
			for(var i=0; i<list.length; i++){
				content+= 
					"<div class='alamlist_listcon'><a id='ta"+i+"' href='tradeList?id="+"${sessionScope.loginId}"+"'>"+list[i].trade_buy+"님으로 부터 구매 요청이 왔습니다.</a></div>";
			}
			$("#alamlist_list").append(content);
			content ="";

		}
		
		function ingyePrint(list){
			var content="";					
			for(var i=0; i<list.length; i++){
				content+= "<div class='alamlist_listcon'><a id='ta"+i+"' href='tradeList?id="+"${sessionScope.loginId}"+"'>"+list[i].trade_sell+"님이 인수 확인 요청을 보냈습니다.</a></div>";
			}
			$("#alamlist_list").append(content);
			content ="";

		}
		

		function finishPrint(list){
			var content="";					
			for(var i=0; i<list.length; i++){
				content+= "<div class='alamlist_listcon'><a id='ta"+i+"' href='tradeList?id="+"${sessionScope.loginId}"+"'>"+list[i].trade_buy+"님과의 거래가 종료되었습니다.</a></div>";
			}
			$("#alamlist_list").append(content);
			content ="";
		}
		
		function soorockPrint(list){
			var content="";					
			for(var i=0; i<list.length; i++){
				content+= "<div class='alamlist_listcon'><a id='ta"+i+"' href='tradeList?id="+"${sessionScope.loginId}"+"'>"+list[i].trade_sell+"님이 거래를 수락하셨습니다.</a></div>";
			}
			$("#alamlist_list").append(content);
			content ="";
		}
		
		$("#mypage_btn").click(function(){
			location.href="./profile?loginId="+'${sessionScope.loginId}'+"";
		});
		
		$("#category_btn").click(function(){
			location.href="./selectCat";
		});
		
		
	</script>
</html>