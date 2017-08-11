<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
						<link href="resources/css/style2.css" rel="stylesheet" type="text/css">
				<link href="https://fonts.googleapis.com/css?family=Crimson+Text" rel="stylesheet">
		
		<title>상대방 프로필 페이지</title>
		<style>
		.wen {width:200px; height:200px; border-radius:200px; margin:0 auto; overflow:hidden;}
		.wen img {height:auto; width:200px;}
		#detailIntro{
			font-size: 20px;
			height: 100px;
			width: 600px;
			margin-left : 50px;
		}
		.font{
			font-family: 'Crimson Text', serif;
			font-size : 30px;
		
		}
		#detailPop{
			display: none;
			width: 700px;
			height: 800px;
			position: absolute;
			top: 100px;
			left: 300px;
			background-color: white;
			z-index: 9001;
			text-align : center;
			background-color: lightgrey;
 			border:2px solid lightgrey;
			  border-radius:0.5em;
 			 -moz-border-radius: 0.5em;
			  -webkit-border-radius: 0.5em;
		}
			body{
				margin:0px;
				background-color: #f8f8f8;
			}
			
			#profilephoto{
				margin-top : 58px;
				margin-left : 302px;
				margin-right : 50px;
				float : left;
				
				position: relative;
				top:0px;
				left:0px;
				width: 200px;
				height: 230px;
			}
			
			
			a{
				text-decoration: none;
			}
			
			#profile{
				margin-top : 200px;
				margin-left : 300px;
			}
		
			
			#name{
				position: relative;
				top:-26px;	
			}
	
			#profileDetail{
				text-decoration: none;
			}
			.img:hover{
				opacity: 0.5;
			}
			
			
			
			
			
			.links {
		  *zoom: 1;
		  padding: 8px;
		  -moz-box-sizing: border-box;
		  -webkit-box-sizing: border-box;
		  box-sizing: border-box;
		  text-align: center;
		  background: #f8f8f8;
		  position: relative;
		  width:100px;
		  height: 52px;
		  top:-468px;
		  left:558px;
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
		  top:4px;
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
		
		#profile_idnamebox{
			position: relative;
			width: 280px;
			height: 230px;
			top:-240px;
			left:547px;
			text-align: center;
		}
		
		#profile_intro{
			position: relative;
			top:-31px;
			display: block;
		}
		
		#follow{
			position: relative;
		    top: 2px;
		    left: -50px;
		}
			
		#follower{
			position: relative;
		    top: -67px;
		    left: 45px;
		}
		
		#toggle{
			width: 85px;
		    display: inline;
		    position: absolute;
		    left: 289px;
		    top: 275px;
		}	
		
		#ejqhrl{
			position: relative;
			display:none;
			top: 288px;
			left: 293px;
			width: 245px;
			height: 215px;
		}
		
		#profile_tradereview{
			margin-left: 8px;
    		margin-right: 8px;
		}
		
		#profile_tradewrite{
			margin-left: 11px;
    		margin-right: 11px;
		}
		
		#profile_tradewritecan{
			position: relative;
		    top: 51px;
		    left: -160px;
		}
		
		#followBtn{
			position: absolute;
		    top: 480px;
		    left: 11px;
		    width: 180px;
		    height: 7px;
		}
		
		.followBtn_text{
			position: absolute;
		    height: 24px;
		    width: 65px;
		    left: 0px;
		    top: 2px;
		    padding-left: 68px;
		    padding-right: 68px;
		}
		
		#bbsphoto{
			margin-top: 82px;
		    margin-left: 19px;
		    margin-bottom: 65px;
		    clear: left;
		}
		
		.img{
			margin-right : 14px;
		}
			
			
			
			#idtwo{
				font-size : 30px;
			}
			
			#mask{
				position: absolute;
				left: 0;
				top: 0;
				z-index: 9000;
				background-color: #000;
				display: none;
			}
			
			textarea { 
			padding: 9px;
			border: solid 1px #E5E5E5;
			outline: 0;
			font: normal 13px/100% Verdana, Tahoma, sans-serif;
			width: 200px;
			background: #FFFFFF url('http://store.blueb.co.kr/data/201010/IJ12864517897808/bg_form.png') left top repeat-x;
			background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF));
			background: -moz-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 25px);
			box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			-moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			-webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px;
			}

		textarea { 
			width: 670px;
			max-width: 670px;
			height: 20px;
			line-height: 100%;
			}
		#detailShow{
			
			display: none;
			width: 700px;
			height: 850px;
			position: fixed;
			top: 100px;
			left: 300px;
			border: 3px solid black;
			background-color: white;
			z-index: 9001;
							margin-top : -70px;
			
				border-bottom-left-radius: 10px;
               border-bottom-right-radius: 10px;
               border-top-left-radius: 10px;
               border-top-right-radius: 10px;
               border: 2px solid white;
		}
		.bp:hover{
			opacity : 0.5;
		}
			
			#detailPop{
			display: none;
			width: 700px;
			height: 800px;
			position: fixed;
			top: 100px;
			left: 300px;
			background-color: white;
			z-index: 9001;
			text-align : center;
			background-color: lightgrey;
 			border:2px solid lightgrey;
			  border-radius:0.5em;
 			 -moz-border-radius: 0.5em;
			  -webkit-border-radius: 0.5em;
			  margin-top : -30px;
		}
			
			.bp{
				margin-top: 15px;
				margin-right: 14px;
				margin-bottom: 21px;
				width: 400px;
				height: 277px;
			}
			
			#more{
			cursor: pointer;
		    border: 1px solid black;
		    width: 1206px;
		    height: 26px;
		    position: fixed;
		    text-align: center;
		    top: 94%;
		    left: -1px;
		    z-index: 1px;
		    background-color: white;
		}
		
		#profilephoto_css{
			width: 200px;
    		height: 230px;
		}
		
		
		
		</style>
	</head>
	<body>
		<jsp:include page="upbar.jsp"/>
		
		<div style="height:42px;"></div>
		<!-- 팝업창(프로필 상세보기) -->
		<div id="detailPop">
			<div id="detailPlace" style="margin-top:50px;">
				<!-- 프로필 상세보기 사진이 들어갈 장소 -->
			</div>
			<h1>${profile.user_id }</h1>
			<span class="font">Name</span><br/> ${profile.user_name }
			<br/>
			<span class="font">Email-Address</span><br/> ${profile.user_email }
			<br/>
			<span class="font">Birth Day</span><br/> 
			${profile.birth }
			<br/>
			<div id="detailGender"><span class="font">Gender</span><br/> </div>
			<span class="font">Comment</span><br/> 
			<div id="detailIntro">
				${profile.user_intro }
			</div>
			<img id="detailClose" width="15" src="resources/img/x.png"/>
		</div>
	
		<div id="profilephoto" class="profileDetail"></div>
		
		<div id="profile_idnamebox">
			<h1 id="id">${profile.user_id}</h1>
			<h2 id="name">${profile.user_name}</h2>
			<span id="profile_intro">${profile.user_intro }</span>
			<h3 id="follow">Follow<br/>${profile.follow_num}</h3>
			<h3 id="follower">Follower<br/>${profile.follower_num}</h3>
		</div>
		
		<section class="links">
			<nav class="link-effect-10" id="link-effect-10">
				<a id="toggle" href="#" data-hover="MENU">
					<span>MENU</span>
				</a>
					
				<div id="ejqhrl">
					<a href="review?id=${profile.user_id}">
						<span id="profile_tradereview">구매후기</span>
					</a>
						
					<a  id="profile_tradewritecan" href="#" onclick="location.href='./buyWrite?id=${profile.user_id}'">
						<span id="profile_tradewrite">구매신청</span>
					</a>
				</div>
					
				<a id="followBtn"  href="#" onclick="location.href='./follow?id=${profile.user_id}'"></a>
			</nav>
		</section>
		
		<div id="bbsphoto">
			<section class="links" style="top:-620px;">
				<nav class="link-effect-10" id="link-effect-10">
					<a id="more" href="#" data-hover="더보기"><span>더보기</span></a>
				</nav>
			</section>
		</div>
		
		<div id="detailShow">
			<!-- 게시글 상세보기 장소-->
		</div>
		<div id="mask"></div>
	</body>
	
	<script src="resources/js/vmc.slider.full.js"></script>
	
	<script>
	var fileMap={};
	var newfile = "${profile.newfile}";
	var gender = "${profile.gender}";
	var login = "${sessionScope.loginId}";
	var content = "";
	var content3 = "";
	
	var start = 0;
	var end = 0;
	var stop = 0;
	
	//팝업창 열기(프로필 상세보기)
	$("#idtwo").click(function(){
		windowMask();
		$("#detailPop").css("display","inline");
	});
	
	//팝업창 닫기(프로필 상세보기 닫기)
	$("#detailClose").click(function(){
		$("#detailPop").css("display","none");
		$("#mask").hide();
	});
	
	//프로필 상세보기 성별
	var detailGender = "${profile.gender }";
	if(detailGender == "man"){
		detailGender = "남성";
		$("#detailGender").append(detailGender);
	}else{
		detailGender = "여성";
		$("#detailGender").append(detailGender);
	}
	
	//프로필 상세보기 전화번호
	var fullPhone = "${profile.user_phone}";
	var phone1 = fullPhone.substring(0,3);
	var phone2 = fullPhone.substring(3,7);
	var phone3 = fullPhone.substring(7,11);
	var newPhone = phone1+"-"+phone2+"-"+phone3;
	$("#phoneNum").append(newPhone);
	
	//팔로우 가져오기
	var data = {};
	data.follow = "${profile.user_id}";
	data.follower = login;
	AjaxCall("./rest/getFollow", data);
	
	//아작스 실행문
	function AjaxCall(reqUrl, reqData){
		$.ajax({
			url: reqUrl,
			data: reqData,
			type: 'post',
			dataType: 'json',
			success: function(d){
				console.log(d.result);
				if(d.result == 1){
					$("#followBtn").html("<span class='followBtn_text'>언팔로우</span>");
				}else{
					$("#followBtn").html("<span class='followBtn_text'>팔로우</span>");
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
	//아작스 실행문
	function AjaxCall2(ReqUrl, ReqData){
		$.ajax({
			url: ReqUrl,
			data: ReqData,
			type: 'post',
			dataType: 'json',
			success: function(d){
				
				if(ReqUrl=="./rest/repleRegist"){
					console.log(d.success);
					if(d.success == 1){
						alert("등록에 성공 했습니다.");
						$("#content").val("");
						repleList();
					}else{
						alert("등록에 실패 했습니다.");
					}
				}	
				if(ReqUrl=="./rest/repleList"){
					printList(d.list);
				}
				if(ReqUrl=="./rest/repleDel"){
					if(d.success == 1){
						alert("삭제에 성공 했습니다.");
						repleList();
					}else{
					}
				}
				if(ReqUrl=="./rest/like"){
					if(d.success == 1){
						alert("좋아요!");
						likenum();
					}else{
						alert("좋아요 취소");
						likenum();
						}
				}
				if(ReqUrl=="./rest/likenum"){
					$("#likenum").html(d.likenum);
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
	console.log(newfile);
	if(newfile!=""){
		content += "<img id='profilephoto_css' src='resources/profilePhotos/"+newfile+"'/></div>";
		$("#profilephoto").append(content);
		content3 = "<div class='wen'><img id='detailImg' alt='profilePhoto' src='resources/profilePhotos/"+newfile+"'/></div>";
		$("#detailPlace").append(content3);
	}else{
		if(gender=="man"){
			content += "<img src='resources/img/man.png'/>";
			content3 = "<img id='detailImg' alt='profilePhoto' width='200' height='230' src='resources/img/man.png'/>";
			
		}else{
			content += "<img src='resources/img/woman.png'/>";
			content3 = "<img id='detailImg' alt='profilePhoto' width='200' height='230' src='resources/img/woman.png'/>";
		}	
		$("#detailPlace").append(content3);
		$("#profilephoto").append(content);
	}
	
	//게시물 더보기
	$("#more").click(function(){
		if(stop == 0){
			ListCall();
		}else{
			alert("모든 게시물을 가져왔습니다.");
		}
	});
	
	$("#name").click(function(){
		location.href = "";
	});
	
	//게시글 붙여넣기
	function addList(profileList){
		var content = "";
		console.log(profileList);
		end = start + 8;
		if(end > profileList.length){
			end = end - (end - profileList.length);
			stop = 1;
		}
		for(var i=start;i<end;i++){
			console.log("가져온 사진 : "+profileList[i].newFile);
			content += "<a href='javascript:;' onclick='aa("+profileList[i].board_idx+")'><img class='bp' alt='boardList' src='resources/upload/"+profileList[i].newFile+"'/></a>";
		}
		start = end + 1;
		$("#bbsphoto").append(content);
	}
	
	

	
	var i = 0;
	var proList = new Array();
	
	<c:forEach items="${bphoto}" var="list">
		var listObj = {};
		listObj.board_idx = "${list.board_idx}";
		listObj.newFile = "${list.newFile}";
		proList[i] = listObj;
		i++;
	</c:forEach>
	
	addList(proList);
	
	//게시글 상세보기를 위한 내용 가져오기
	function aa(e){
		$.ajax({
			url:"./rest/detail",
			type:"post",
			data:{idx : e},
			dataType:"json",
			success:function(d){	
				windowMask();
				 $('#detailShow').css("display","inline");
				 contentCall(d.content,d.photoList);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	//팝업창 열기(게시글 상세보기)
	function contentCall(content,photoList){			
		var con="";	
		preIdx = content.board_idx;
		con +='<div class="content" style="width:600px;height:450px;overflow:hidden; margin:50px auto;">';
		con +='<div id="slider">';
		for(var i=0; i<photoList.length; i++){
			
			con += "<img width='600' height='450' src='resources/upload/"+photoList[i].newfile+"'/>";
		}
		con+= '</div>';
		con+= '</div>';
		if(content.writer != "${sessionScope.loginId}"){
			con += '<div id="nameline" style="height:30px; margin-top:-40px;"><a href = "./timeline?id='+content.writer+'" >'+content.writer+'</a></div>';
		}else{
			con += '<div id="nameline"  style="height:30px; margin-top:-40px;">'+content.writer+'</div>';
		}
		con += content.board_cat;
		con += '<span style="margin-left : 560px;">'+content.reg_date+'</span><br/><br/>';

		con += '<div id="DetailContent" style="width:700px; text-align:center;">'+content.board_content+'</div>';
		if(!content.board_tag==""){
			con += '</br>태그 된 사람 : <input type="text" id="'+content.board_tag+'" value="'+content.board_tag+'" readonly/>';
		}

		con += '<div id="like" style="margin-top:20px;">좋아요<b id="likenum"></b></div>';
		con += '<table id="repleForm" class="board"><tr><td class="data"><textarea id="content" rows="1"></textarea></td><td class="btn"></table>';
		con += '<button style="margin-left:627px;" id="go">댓글달기</button></td></tr><br/><table style="margin-top : -140px;" id="repleZone"></tabel>';
		con +=	'<img src = "resources/img/x.png" width="15" style="top:45px; left:970px; position:fixed;" id="close"/>';
		
		$("#detailShow").empty();
		$("#detailShow").append(con);
		$('#slider').vmcSlider({
			width: 600,
			height: 450,
			gridCol: 10,
			gridRow: 5,
			gridVertical: 20,
			gridHorizontal: 10,
			autoPlay: false,
			ascending: true,
			effects: [
				'fade'
			],
			ie6Tidy: false,
			random: true,
			duration: 2000,
			speed: 900
		});
	
		repleList();
		likenum();
		$("#close").click(function(){
			$("#detailShow").css("display","none");
			 $('#mask').hide();
		});
		//팝업창 닫기(게시글 상세보기 닫기)
		$("#readClose").click(function(){
			$("#detailShow").css("display","none");
			$("#mask").hide();
		});
		
		//댓글 등록
		$("#go").click(function(){
			url="./rest/repleRegist";
			data={};
			data.idx = preIdx;
			data.user = login;
			data.content = $("#cont").val();
			console.log(data);
			AjaxCall2(url,data);
		});
		
		//좋아요
		$("#like").click(function(){
			url="./rest/like";
			data={};
			data.idx = preIdx;
			data.user = login;
			AjaxCall2(url,data);
		});
	}
	
	//댓글 리스트 보기
	function repleList(){
		url="./rest/repleList";
		data={};
		data.idx = preIdx; 
		AjaxCall2(url,data);
	}
	
	//좋아요
	function likenum(){
		url="./rest/likenum";
		data={};
		data.idx = preIdx;
		AjaxCall2(url,data);
	}
	
	//댓글 지우기
	function repleDel(reple_idx, idx){
		url="./rest/repleDel";
		data={};
		data.idx = preIdx;
		data.repleIdx = reple_idx;
		AjaxCall2(url,data);
	}
	
	//댓글 리스트 보여주기
	function printList(list){
		$("#repleZone").empty();
		var content = "";
		
		list.forEach(function(item){
			content +="<tr>";
			content +="<td class='user'>"+item.replyer+"</td>";
			content +="<td>"+item.reple_content;
			if(item.replyer == "${sessionScope.loginId}"){
				content += "<a href='#' onclick='repleDel("+item.reple_idx+","+item.board_idx+")'> X</a>";
			}
			content +="</td></tr>";
		});
		
		$("#repleZone").append(content);		
		
	}
	
	$("#toggle").click(function(){
		if($("#ejqhrl").css("display")=="none") {
	        $("#ejqhrl").show();
	    } else {
	        $("#ejqhrl").hide();
	    }
	});
	//팝업창 열기(프로필 상세보기)
	$(".profileDetail").click(function(){
		windowMask();
		$("#detailPop").css("display","inline");
	});
	
	//팝업창 뜸과 동시에 어두워지는 바탕화면 함수
	function windowMask(){
		
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$("#mask").css("width",maskWidth).css("height",maskHeight);
		$("#mask").fadeTo("fast",0.4);
		$("#mask").css("display","inline");
	}
	</script>
</html>