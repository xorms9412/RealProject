<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Crimson+Text" rel="stylesheet">
				<link href="resources/css/style2.css" rel="stylesheet" type="text/css">
		
		<title>내 프로필 페이지</title>
	</head>
	<style>
	body{
		margin:0px;
		background-color: #f8f8f8;
	}
	
	#modifycontent{
		position: fixed;
		border: 1px solid lightgrey;
		width: 598px;
		padding: 10px 0px;
		text-align: center;
		top: 667px;
		cursor: pointer;
		border-radius:0.5em;
		-moz-border-radius: 0.5em;
		-webkit-border-radius: 0.5em;
		color : lightgrey;
	}
	
	#write{
		position: fixed;
		border: 1px solid lightgrey;
		width: 598px;
		padding: 10px 0px;
		text-align: center;
		top: 667px;
		cursor: pointer;
		border-radius:0.5em;
		-moz-border-radius: 0.5em;
		-webkit-border-radius: 0.5em;
		color : lightgrey;
	}
	#fileUp{
		cursor :pointer;
	}
	
	#writeClose{
			position : fixed;
			top : 93px;
			left : 950px;
		}
		#modifyclose{
			position : fixed;
			top : 93px;
			left : 950px;
		}
		#select{
			margin-left : 300px;
		}
	.wentwo {width:50px; height:50px; border-radius:200px; margin:0; overflow:hidden; float: left;}
		.followListPhotos{
			width: 50px;
			height: 50px;
		}
		#followerClose{
			position: fixed;
			top: 190px;
			left : 760px;
			cursor: pointer;
		}
		#followerMore:hover{
			color : black;
			border : 1px solid black;
		}
		#followMore:hover{
			color : black;
			border : 1px solid black;
		}
		#followerMore{
			position: fixed;
			border: 1px solid lightgrey;
			width: 298px;
			padding: 10px 0px;
			text-align: center;
			top: 742px;
			cursor: pointer;
			border-radius:0.5em;
 			-moz-border-radius: 0.5em;
			-webkit-border-radius: 0.5em;
			color : lightgrey;
		}
		#followClose{
			position: fixed;
			top: 190px;
			left : 760px;
			cursor: pointer;
		}
		#followMore{
			position: fixed;
			border: 1px solid lightgrey;
			width: 298px;
			padding: 10px 0px;
			text-align: center;
			top: 742px;
			cursor: pointer;
			border-radius:0.5em;
 			-moz-border-radius: 0.5em;
			-webkit-border-radius: 0.5em;
			color : lightgrey;
		}
		#toggle{
			width: 85px;
			display: inline;
			position: absolute;
			left: -13px;
		}
		.wen {width:200px; height:200px; border-radius:200px; margin:0 auto; overflow:hidden;}
		.wen img {height:auto; width:200px;}
		ul{
			display: inline;
			position: relative;
  			top: 0px;
		}
		li{
			position:relative;
			list-style-type: none;
			padding: 3px;
			width: 120px;
			margin-top: 20px;
			top:20px;
			left:0px;
		}
		#modifyPop{
			display: none;
			width: 700px;
			height: 800px;
			position: fixed;
			top: 100px;
			left: 300px;
			border: 3px solid black;
			background-color: white;
			z-index: 9001;
			background-color: white;
 			border:2px solid white;
			  border-radius:0.5em;
 			 -moz-border-radius: 0.5em;
			  -webkit-border-radius: 0.5em;
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
		}
		#writePop{
			display: none;
			width: 600px;
			height: 500px;
			position: fixed;
			margin-top : -70px;
			top: 285px;
			left: 350px;
			background-color: white;
			z-index: 9001;
			border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border: 2px solid white;
		}
		#followListPop{
			display: none;
			width: 300px;
			height: 600px;
			position: fixed;
			overflow:auto;
			top: 20%;
			left: 38%;
			border: 2px solid white;
			background-color: white;
			z-index: 9001;
			border-radius:0.5em;
 			-moz-border-radius: 0.5em;
			-webkit-border-radius: 0.5em;
		}
		#followerListPop{
			display: none;
			width: 300px;
			height: 600px;
			position: fixed;
			overflow:auto;
			top: 20%;
			left: 38%;
			border: 2px solid white;
			background-color: white;
			z-index: 9001;
			border-radius:0.5em;
 			-moz-border-radius: 0.5em;
			-webkit-border-radius: 0.5em;
		}
		#mask{
			position: absolute;
			left: 0;
			top: 0;
			z-index: 9000;
			background-color: #000;
			display: none;
		}
		a:link{
			color: black;
			text-decoration: none;
		}
		a:visited{
			color: black; 
			text-decoration: none;
		}
		#detailIntro{
			font-size: 20px;
			height: 100px;
			width: 600px;
			margin-left : 50px;
		}
		.bp{
			margin-top: 15px;
		    margin-right: 14px;
		    margin-bottom: 21px;
		    width: 400px;
		    height: 277px;
		}
		
		#showList{
			position: absolute;
		    top: 482px;
		    left: 19px;
		    margin-bottom: 60px;
		    z-index: 10;
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
		#editable{
			text-align:left;
			width:98%;
			height:150px;
			padding:5px;
			overflow:auto;
			color: darkgray;
		}
		#editableModify{
			text-align:left;
			width:98%;
			height:150px;
			padding:5px;
			overflow:auto;
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
			position: absolute;
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
		
		#modifyShow{
			display: none;
			width: 600px;
			height: 500px;
			position: fixed;
			margin-top : -70px;
			top: 285px;
			left: 350px;
			background-color: white;
			z-index: 9001;
			border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            border: 2px solid white;
		}
		#follow{
			cursor: pointer;
		}
		#follower{
			cursor: pointer;
		}
		#followClose{
			cursor: pointer;
		}
		.font{
			font-family: 'Crimson Text', serif;
			font-size : 30px;
		
		}
		.modifyKign{
			font-family: 'Crimson Text', serif;
			font-size : 25px;
		}
		.modifyfont{
			font-family: 'Crimson Text', serif;
			font-size : 17px;
			text-align : center;
		}
		.modifyForm input{
			vertical-align: top;
		}
		.modifyForm{
					text-align : center;
					
		
		} 
		.moditable{
			text-align : left;
		}
		#moditableone{
			margin-left : 220px;
		
		}
		#moditabletwo{
			margin-left : 200px;
		
		}
		#moditablethree{
			margin-left : 190px;
			
		}
		#go{
				margin-left : 627px;
			}
		#modify-btn{
			margin-left : 105px;
		}
		
		#pwModify{
			margin-left : 105px;
		}
		#photo{
			margin-left : 70px;
		}
		
		#profile_box{
			position:relative;
			float:left;
			height: 233px;
			margin-top: 100px;
			margin-bottom: 100px;
			width: 543px;
		}
		
		#imgplace{
			position:relative;
			width: 200px;
			height: 230px;
			top:0px;
			left:0px;
		}
		
		#profile_idnamebox{
			position: relative;
			width: 280px;
			height: 230px;
			top:-240px;
			left:245px;
			text-align: center;
		}
		
		#id{
			display:inline;
		}
		
		#name{
			position: relative;
			top:-25px;
		}
		
		#profile_intro{
			position: relative;
			top:-30px;
		}
		
		a{
			text-decoration: none;
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
		
		#menu_list{
			position: relative;
		    top: -14px;
		    left: -12px;
		}
		
		#follow{
			position: relative;
			top:3px;
			left:-50px;
		}
		
		#follower{
			position: relative;
			top:-65px;
			left:45px;
		}
		
		#writeForm{
			position: absolute;
			top:209px;
			left:-291px;
			height: 7px;
			width: 180px;
			
		}
		
		#menulist_con1{
			padding:11px;
		}
		
		#menulist_con2{
			padding:11px;
		}
		
		#menulist_con3{
			padding:11px;
		}
		
		#boardwrite_con{
			position: absolute;
		    top: 1px;
		    left: 0px;
		    height: 7px;
		    width: 180px;
		    padding-bottom: 18px;
		    padding-top: 2px;
		    padding-left: 10px;
		    padding-right: 10px;
		}
		#nameline{
			margin-top: 10px;
		    left: 320px;
		    position: fixed;
		    font-weight: 800;
		    font-size: x-large;
		}
		#detailCat{
		    position: fixed;
		    margin-top: -45px;
		    margin-left: 650px;
		    font-weight: 600;
		}
		#regDate{
		    margin-left: 612px;
		    position: fixed;
		    margin-top: -20px;
		    color: darkgray;
  				font-size: smaller;
		}
		#formLine{
			width: 693px;
		    border-top: 1px solid;
		    position: fixed;
		    margin-top: 237px;
		    margin-left: 3px;
		    color: darkgray;
		}
		#go{
			cursor: pointer;
			color: darkgray; 
		}
		#like{
		    margin-top: -40px;
		    position: fixed;
		    font-size: 0.8em;
		    color: darkred;
		    margin-left: 15px;
		}
		#tagName{
			position: fixed;
			margin-left: 15px;
			margin-top: 60px;
		}
		#tagLink{
			color: cornflowerblue;
		}
		#modify{
			cursor: pointer;
			color: darkgray;
			position: fixed;
		    margin-top: -90px;
		    margin-left: 657px;
		}
		#boardDelete{
			cursor: pointer;
			color: darkgray;
			position: fixed;
		    margin-top: -90px;
		    margin-left: 620px;
		}
		#replyContent { 
			position: fixed;
		    margin-top: 241px;
		    width: 600px;
		    height: 40px;
		}
		
		
	</style>
	<body>
		<jsp:include page="upbar.jsp"/>
		
		<div id="profile_box">
		
		<div id="imgplace" class="profileDetail">
			<!-- 프로필 사진이 들어갈 장소 -->
		</div>
		
		<div id=profile_idnamebox>
				<h1 id="id">${profile.user_id}</h1>
				<h2 id="name">${profile.user_name }</h2>
				<span id="profile_intro">${profile.user_intro }</span> <!-- 자기소개 길게 작성해보고 칸 조절 할 것 -->
				<h3 id="follow">Follow<br>${profile.follow_num }</h3>
				<h3 id="follower">Follower<br>${profile.follower_num }</h3>
			</div>
			
			<section class="links">
				<nav class="link-effect-10" id="link-effect-10">
					<a id="toggle" href="#" data-hover="MENU"><span>MENU</span></a>
					<a id="writeForm" href="#"><span id="boardwrite_con">글쓰기</span></a>
					<ul id="menu_list">
						<li><a href="./tradeList?id=${sessionScope.loginId}"><span id="menulist_con1">거래현황</span></a></li>
						<li><a href="./review?id=${sessionScope.loginId}"><span id="menulist_con2">구매후기</span></a></li>
						<li><a href="./logout"><span id="menulist_con3">로그아웃</span></a></li>
						<li><a href="#" id="profileModify"><span>프로필 수정</span></a></li>
					</ul>
				</nav>
			</section>	
				
		</div>
		
		<div id="mask"></div>
		
		<!-- 팝업창(프로필 상세보기) -->
		<div id="detailPop">
			<div id="detailPlace" style="margin-top:50px;">
				<!-- 프로필 상세보기 사진이 들어갈 장소 -->
			</div>
			<h1>${profile.user_id }</h1>
			<span class="font">Address</span><br/> ${profile.address }
			<br/>
			<div id="phoneNum">
			<span class="font">Phone Number</span><br/>
			</div>
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
		
		<!-- 팝업창(프로필 수정) -->
		<div id="modifyPop">
			<div id="imgplace2">
				<!-- 프로필 수정 팝업창에 프로필 사진이 들어갈 장소 -->
			</div>
			<br/>
			<div class="modifyForm">
			
			<form id="photoForm" method="post" enctype="multipart/form-data" action="">
				<input type="file" name="photo" id="photo" onchange="fileChange(this)"/>
				<input type="hidden" name="photoName" id="photoName"/>
				<input id="beforePhotoName" type="hidden" name="beforePhotoName" value="${profile.newfile }"/>
			</form>
			</div>
			<div class="modifyForm">
			<form action="profileModify" method="post">
				<span class="modifyKign">Comment</span><br/><textarea id="intro" rows="2" cols="80" name="intro">${profile.user_intro }</textarea>
				<input type="hidden" id="newfile" name="newfile"/>
				<input type="hidden" name="oldfile" value="${profile.oldfile }"/>
				<input type="hidden" name="user_id" value="${profile.user_id}"/>
				<br/>
				<table class="moditable" id="moditableone">
					<tr>
						<td><span class="modifyfont">Name</span></td>
						<td><input type="text" name="user_name" value="${profile.user_name }" readonly/></td>
					</tr>
					<tr>
						<td><span class="modifyfont">Email</span></td>
						<td><input type="text" name="user_email" value="${profile.user_email }"/></td>
					</tr>
					<tr>
						<td><span class="modifyfont">Phone Number</span></td>
						<td><input type="text" name="user_phone" value="${profile.user_phone }"/></td>
					</tr>
					<tr>
						<td><span class="modifyfont">Gender</span></td>
						<td><select name="user_gender">
								<option value="woman">여성</option>
								<option value="man">남성</option>
								<option value="" selected>선택 안됨</option>
							</select><input type="hidden" name="hidden_user_gender" value="${profile.gender }"/></td>
					</tr>
					<tr>		
						<td><span class="modifyfont">Birth Day</span></td>
						<td><input type="date" name="birth"/>
						<input type="hidden" name="hidden_birth" value="${profile.birth }"/></td>
					</tr>
				</table>
				<span class="modifyKign">Address</span>
				<table class="moditable" id="moditabletwo">
					<tr>
						<td><span class="modifyfont">Postal code</span></td>
						<td><input type="text" name="" class="postcodify_postcode5" value="" /><input type="button" id="postcodify_search_button" value="검색"/></td>
					</tr>
					<tr>
						<td><span class="modifyfont">Address</span></td>
						<td><input type="text" id="address_one" name="address_one" class="postcodify_address" value="" /></td>
					</tr>
					<tr>
						<td><span class="modifyfont">Detail Address</span></td>
						<td><input type="text" id="address_two" name="address_two" class="postcodify_details" value="" />
						<input type="hidden" name="hidden_address" value="${profile.address }"/></td>
					</tr>
					<tr>
						<td colspan="2"><input id="modify-btn" type="submit" value="프로필 수정"/>
						</td>
						</tr>
				</table>
			</form>
			<form>
				
				<span class="modifyKign">Change Password</span><br/>
				<table class="moditable" id="moditablethree">
					<tr>
						<td><span class="modifyfont">Password</span></td>
						<td><input type="text" id="beforePw"/></td>
					</tr>
					<tr>
						<td><span class="modifyfont">New Password</span></td>
						<td><input type="text" id="newPw"/></td>
					</tr>
					<tr>
						<td><span class="modifyfont">New Password Check</span></td> 
						<td><input type="text" id="newPwCheck"/></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" id="pwModify" value="비밀번호 변경"/><span id="pcs"></span>
						</td>
				</table>
			</form>
			<img src = "resources/img/x.png" width="15" style="margin-top : 20px;" id="back"/>
			
			</div>
		</div>
				
		<!-- 팝업창 글쓰기 -->
		<div id="writePop">
			<form id="sendForm" action="write" method="post" >
				<img src = "resources/img/x.png" width="15" style="margin-top : 133px; margin-left:-23px; position:fixed;" id="writeClose"/>
				<select id="select" size="1" name="cat" >
					<option value="sports">운동</option>
					<option value="design">디자인</option>
					<option value="성우">성우</option>
					<option value="IT">IT</option>
					<option value="consurting">컨설팅</option>
					<option value="marketing">마케팅</option>
					<option value="alcohol">주류,칵테일</option>
					<option value="art">그림</option>
					<option value="photo">사진</option>
					<option value="food">음식</option>
				</select>
				<div id="files"></div>
	 			<!-- <input type="button" onclick="fileUp()" value="파일 업로드"/> -->
	 			<img src ="resources/img/Add-icon.png" width="50px" style="margin-top : 10px; margin-left:5px" id="fileUp">
	 			<br/>
	 			<div id="editable" contenteditable="true">
	 			</div>
	 			
				<input id="content" type="hidden" name="content" value=""/>
				<input type="hidden" name="writer" value="${sessionScope.loginId }"/>
				
				<div id="tagZone">   
					<div id="tagInput">태그  : <input type="text" id="tag"/></div>
					<div id="tagBox" style="position:fixed;"></div>
					<div style="margin-left: 250px; margin-top: -24px;">태그된 사람 : <input type="text"	name="tag" id="tagIn" readonly/></div>
				</div>
				
				<div id ="writeZone">
	    			<div id="write">글 쓰기</div>
	  			</div>
			</form>
		</div>
		
		<div id="showList">
		<!-- 게시글들이 들어갈 장소 -->
			<section class="links" style="top:-550px;">
				<nav class="link-effect-10" id="link-effect-10">
					<a id="more" href="#" data-hover="더보기"><span>더보기</span></a>
				</nav>
			</section>
		</div>
	
		<div id="detailShow">
			<!-- 게시글 상세보기 장소-->
		</div>
		
		<div id="modifyShow">
			<!-- 게시글 수정 장소 -->
		</div>
		
		<div id="followListPop">
			<!-- 팔로우 리스트 장소 -->
		</div>
		
		<div id="followerListPop">
			<!-- 팔로워 리스트 장소 -->
		</div>
		
	</body>
			
	<script src="resources/js/vmc.slider.full.js"></script>
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<script>
	
	//글쓰기 버튼
	$("#write").mouseenter(function(){
		$("#write").css("color","black");
		$("#write").css("border","1px solid");
	});
	$("#write").mouseleave(function(){
		$("#write").css("color","lightgrey");
		$("#write").css("border","1px solid lightgrey");
	});
	
	//글쓰기 폼
	$("#editable").html("입력해주세요");
	
	$("#editable").focusout(function(){
		$("#editable").html("입력해주세요");
		$("#editable").css("color","darkgray");
	});
	$("#editable").focusin(function(){
		$("#editable").html("");
		$("#editable").css("color","black");
	});
	
	$("#fileUp").click(function(){
		fileUp();
		
	});
	console.log(document.getElementsByClassName('1'));
	if(document.getElementsByClassName('1').length == 0){
		$("#write").css("display","none");
		console.log("0임");
	}
	
	
	$("#files").bind("DOMSubtreeModified",function(){
		if(document.getElementsByClassName('1')){
			console.log(document.getElementsByClassName('1'));
			console.log(document.getElementsByClassName('1').length>0);
			$("#write").css("display","inline");
			console.log("1존재");
		}
		if(document.getElementsByClassName('1').length == 0){
			$("#write").css("display","none");
			console.log("1없음");
		}
	});
		var data;
		
		var start = 0;
		var end = 0;
		var stop = 0;
		
		var fstart = 0;
		var fend = 0;
		var fstop = 0;
		
		var fstart2 = 0;
		var fend2 = 0;
		var fstop2 = 0;
		
		var newfile = "${profile.newfile}";
		var preIdx = 0;
		var login = "${sessionScope.loginId}";
		var followGetChk = 0;
		var followerGetChk = 0;
		$("ul").hide();
		console.log("newfile : "+newfile);
		
		//원래 있던 사진 삭제 할 때
		function delFileModify(elem){
			console.log(elem.id);
			$.ajax({
				url:"./rest/fileDelList",
				type:"get",
				data:{"fileName":elem.id},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success == 1){
						//해당 요 소가 감싸고 있는 자식 요소를 삭제
						var element = document.getElementById(elem.id);
						element.parentNode.removeChild(element);
					}
				},
				error:function(e){
					console.log(e);					
				}
			});
		}
		
		//수정 할 사진들 삭제할 때
		function del(elem){
			console.log(elem.id);
			$.ajax({
				url:"./rest/uploadFileDelete",
				type:"get",
				data:{"fileName":elem.id},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success == 1){
						//해당 요 소가 감싸고 있는 자식 요소를 삭제
						var element = document.getElementById(elem.id);
						element.parentNode.removeChild(element);
					}
				},
				error:function(e){
					console.log(e);					
				}
			});
		}
		
		//수정 할 때 사진 삭제하기
		function modifyDel(){
			$.ajax({
				url:"./rest/modifyDel",
				type:"get",
				dataType:"json",
				success:function(d){
					console.log(d);
				},
				error:function(e){
					console.log(e);					
				}
			});
		}
		
		//수정 취소 할 때 사진 삭제 안하기
		function modifyNotDel(){
			 $.ajax({
					url:"./rest/modifyNotDel",
					type:"get",
					dataType:"json",
					success:function(d){
						console.log(d);
					},
					error:function(e){
						console.log(e);					
					}
				});
		}
		
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
		
		//새 비밀번호 매칭 확인 및 변경 아작스 실행
		$("#pwModify").click(function(){
			if($("#newPw").val() != $("#newPwCheck").val()){
				$("pcs").html("비밀번호가 일치하지 않습니다.");
			}else{
				data = {};
				data.newPw = $("#newPw").val();
				data.beforePw = $("#beforePw").val();
				data.id = "${profile.user_id}";
				AjaxCall2("./pwModify", data);
			}
		});
		
		//처음 프로필 사진이 등록이 안되어 있을 경우
		if(newfile != ""){
			var content = "<img alt='profilePhoto' width='200' height='230' src='resources/profilePhotos/"+newfile+"'/>";
			var content2 = "<div class='wen'><img id='imgtag2' alt='profilePhoto' width='100' src='resources/profilePhotos/"+newfile+"'/></div>";
			var content3 = "<div class='wen'><img id='detailImg' alt='profilePhoto' width='200' height='230' src='resources/profilePhotos/"+newfile+"'/></div>";
			$("#imgplace").append(content);
			$("#imgplace2").append(content2);
			$("#detailPlace").append(content3);
		}else{
			var content = "<img alt='profilePhoto' width='200' height='230' src='resources/profilePhotos/noprofile.jpg'/>";
			var content2 = "<img id='imgtag2' alt='profilePhoto' width='100' src='resources/profilePhotos/noprofile.jpg'/>";
			var content3 = "<img id='detailImg' alt='profilePhoto' width='200' height='230' src='resources/profilePhotos/noprofile.jpg'/>";
			$("#imgplace").append(content);
			$("#imgplace2").append(content2);
			$("#detailPlace").append(content3);
		}
	
		//프로필사진 업로드 함수
		function fileChange(e){
			var fullName = e.value;
			var photoName = fullName.substring(12);
			$("#photoName").val(photoName);
			
			var formdata = new FormData(document.getElementById("photoForm"));
			
			AjaxCall("./profilePhoto",formdata);
		}
		
		//프로필 사진 아작스 실행문
		function AjaxCall(ReqUrl, ReqData){
			$.ajax({
				contentType: false,
				processData: false,
				url: ReqUrl,
				data: ReqData,
				type: 'post',
				dataType: 'json',
				success: function(d){
					if(ReqUrl == "./profilePhoto"){
						console.log(d.path);
						var photoPath = d.path;
						$("#imgtag2").remove();
						$("#detailImg").remove();
						$("#beforePhotoName").remove();
						var content3 = "<div class='wen' style='margin-top:-200px;'><img id='imgtag2' alt='profilePhoto' width='100' src='"+photoPath+"''/>";
						var newfileName = photoPath.substring(24);
						console.log(newfileName);
						var content4 = "<input id='beforePhotoName' type='hidden' name='beforePhotoName' value='"+newfileName+"'/>";
						var content5 = "<img id='detailImg' alt='profilePhoto' width='200' height='230' src='"+photoPath+"''/>";
						$("#imgplace2").append(content3);
						$("#photoForm").append(content4);
						$("#newfile").val(newfileName);
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
					if(ReqUrl == "./pwModify"){
						console.log(d.result);
						if(d.result){
							alert("비밀번호가 변경되었습니다.");
							location.href = "./loginPage";
						}else{
							$("span").html("이전 비밀번호를 다시 입력해주세요.");
						}
					}
					if(ReqUrl == "./profileList"){
						console.log(d.profileList);
						var profileList = [];
						profileList = d['profileList'];
						addList(profileList);
					}
					if(ReqUrl=="./rest/repleRegist"){
						console.log(d.success);
						if(d.success == 1){
							alert("등록에 성공 했습니다.");
							$("#replyContent").val("");
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
					if(ReqUrl == "./rest/followList"){
						console.log(d.followList);
						followGetChk = 1;
						var followList = [];
						followList = d['followList'];
						followListDraw(followList);
					}
					if(ReqUrl == "./rest/followerList"){
						console.log(d.followerList);
						followerGetChk = 1;
						var followerList = [];
						followerList = d['followerList'];
						followerListDraw(followerList);
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	
		//추가 기능 숨기고 나타내기
		$("#toggle").click(function(e){
			console.log(e);
			if($("ul").css("display") == "none"){
				$("ul").show();
			}else{
				$("ul").hide();
			}
		});
		
		//팝업창 뜸과 동시에 어두워지는 바탕화면 함수
		function windowMask(){
			
			var maskHeight = $(document).height();
			var maskWidth = $(window).width();
			
			$("#mask").css("width",maskWidth).css("height",maskHeight);
			$("#mask").fadeTo("fast",0.4);
			$("#mask").css("display","inline");
		}
		
		//팝업창 열기(프로필 작성, 수정)
		$("#profileModify").click(function(){
			windowMask();
			$("#modifyPop").css("display","inline");
		});
		
		//팝업창 열기(프로필 상세보기)
		$(".profileDetail").click(function(){
			windowMask();
			$("#detailPop").css("display","inline");
		});
		
		//사진올리기(글쓰기)
		function fileUp(){
			//새창 띄움
			var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
		}

		//사진올리기(글수정)
		function fileUpModify(){
			//새창 띄움
			var myWin = window.open("./modifyUploadForm","파일업로드","width=400, height=100");
		}
		
		//팝업창 열기(글쓰기)
		$("#writeForm").click(function(){
			windowMask();
			$('#writePop').css("display","inline");	
		});
		
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
			if(content.writer != "${sessionScope.loginId}"){
				con += '<div id="nameline"><a href = "./timeline?id='+content.writer+'" >'+content.writer+'</a></div>';
			}else{
				con += '<div id="nameline">'+content.writer+'</div>';
			}
			con +='<div class="content" style="width:700px;height:450px;overflow:hidden; margin:55px auto;">';
			con +='<div id="slider">';
			for(var i=0; i<photoList.length; i++){
				con += "<img width='700' height='450' src='resources/upload/"+photoList[i].newfile+"'/>";
			}
			con+= '</div>';
			con+= '</div>';
			
			con += '<div id="detailCat">'+content.board_cat+'</div>';
			con += '<span id="regDate">'+content.reg_date+'</span>';

			con += '<div id="DetailContent" style="width:700px; margin-left:15px; position:fixed;">'+content.board_content+'</div>';
			if(!content.board_tag == ""){
				con += '<div id="tagName"><a id="tagLink" href="./timeline?id='+content.board_tag+'">#'+content.board_tag+'</a></div>'
			}

			con += '<div id="like">좋아요<b id="likenum"></b></div>';
			con += '<div id="formLine"></div>';
			con += '<table id="repleForm" class="board"><tr><td class="data"><input type="text" id="replyContent" rows="1" style="border: none;"/></td><td class="btn"></table>';
			con += '<div style="margin-left:625px; margin-top:244px;" id="go">댓글달기</div></td></tr><br/><table style="margin-top : -213px; position: fixed;  margin-left:15px;" id="repleZone"></tabel>';
			con += '<img src = "resources/img/x.png" width="15" style="top:45px; left:970px; position:fixed;" id="detailclose"/>';
			
			con += '<div id="modify" style="visibility:hidden">수정</div>';
			con += '<div id="boardDelete" style="visibility:hidden">삭제</div>';
			$("#detailShow").empty();
			$("#detailShow").append(con);
			$('#slider').vmcSlider({
				width: 700,
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
			if("${sessionScope.loginId}" == content.writer){
				$("#modify").css("visibility","visible");
				$("#boardDelete").css("visibility","visible");
			}
			repleList();
			likenum();
			$("#detailclose").click(function(){
				$("#detailShow").css("display","none");
				 $('#mask').hide();
			});
			
			$("#boardDelete").click(function(){
				location.href="./boardDelete?idx="+preIdx+"&login="+login;
			});
			//글 수정
			$("#modify").click(function(){
				$("#detailShow").empty();
				$("#detailShow").css("display","none");
				$("#modifyShow").css("display","inline");
				var cont ="";
				
				cont += '<form id="sendForm2" action="modify" method="post">'
					+'<img src = "resources/img/x.png" width="15" style="margin-top : 133px; margin-left:-23px; position:fixed;" id="modifyclose"/>'
					+'<select id="select" size="1" name="cat" style="display : block;">'
						+'<option value="sports">운동</option>'
						+'<option value="design">디자인</option>'
						+'<option value="성우">성우</option>'
						+'<option value="IT">IT</option>'
						+'<option value="consurting">컨설팅</option>'
						+'<option value="marketing">마케팅</option>'
						+'<option value="alcohol">주류,칵테일</option>'
						+'<option value="art">그림</option>'
						+'<option value="photo">사진</option>'
						+'<option value="food">음식</option>'
						+'</select>';
						
						for(var i=0; i<photoList.length; i++){
							var subNewfile = photoList[i].newfile;
							cont += "<a id='"+photoList[i].newfile+"' href='#' onclick='delFileModify(this)' style='margin'>"
							+"<img width='100' height='100' style='margin:10px; float:left' src='resources/upload/"+photoList[i].newfile+"'/>"	
							+"</a>";
						}
						
						var modifyContentBefore = content.board_content;
						var modifyContentAfter = modifyContentBefore.replace(/<div>/g, "");
						var modifyContentAfter = modifyContentAfter.replace(/<\/div>/g, "");
						
						cont+='<div id="filesModify" style="display: inline;"></div>'
						+'<img src ="resources/img/Add-icon.png" width="50px" style="margin-top : 10px; margin-left:5px; cursor: pointer;" id="fileUpModify">'
						+'<div id="editableModify" contenteditable="true">'+modifyContentAfter+'</div>'
						
						+'<input type="hidden" name="idx" value="'+content.board_idx+'"/>'
						+'<input type="hidden" name="division" value="profile"/>'
						+'<input type="hidden" name="modifyUserId" value="'+login+'"/>'
						+'<div id ="writeZone">'
						+'<div id="modifycontent">수정 하기</div>'
						+'</div>'
						+'</form>';
				$("#modifyShow").append(cont);
				
				$("#modifycontent").click(function(){
					$("#sendForm2").submit();
					modifyDel();
				});
				
				//사진 올리기 함수 실행(글 수정)
				$("#fileUpModify").click(function(){
					fileUpModify();
				});
				
				//글수정 버튼
				$("#modifycontent").mouseenter(function(){
					$("#modifycontent").css("color","black");
					$("#modifycontent").css("border","1px solid");
				});
				$("#modifycontent").mouseleave(function(){
					$("#modifycontent").css("color","lightgrey");
					$("#modifycontent").css("border","1px solid lightgrey");
				});
				
				$('#modifyclose').click(function() {
					$("#modifyShow").css("display","none");
					$('#mask').hide();
					modifyNotDel();
					$.ajax({
						url:"./rest/fileDelete",
						type:"get",
						dataType:"json",
						success:function(d){
							console.log(d);
							$("#filesModify").empty();
						},
						error:function(e){
							console.log(e);					
						}
					});
					$("#modifyShow").empty();
		  		});
			});//수정 끝
			
			
			
			//팝업창 닫기(프로필 상세보기 닫기)
			$("#readClose").click(function(){
				$("#detailShow").css("display","none");
				$("#mask").hide();
			});
			
			//댓글 등록
			$("#go").click(function(){
				url="./rest/repleRegist";
				data={};
				data.idx = preIdx;
				data.user = "${sessionScope.loginId}";
				data.content = $("#replyContent").val();
				console.log(data);
				AjaxCall2(url,data);
			});
			
			//좋아요
			$("#like").click(function(){
				url="./rest/like";
				data={};
				data.idx = preIdx;
				data.user = "${sessionScope.loginId}";
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
		
		//댓글 리스트 그리기
		function printList(list){
			$("#repleZone").empty();
			var content = "";
			
			list.forEach(function(item){
				content +="<tr>";
				content +="<td class='user'style='font-weight: 600; width:90px; border-right: 1px solid lightgray;'>"+item.replyer+"</td>";
				content +="<td>"+item.reple_content;
				if(item.replyer == "${sessionScope.loginId}"){
					content += "<a style='position:fixed; left:970px;' href='#' onclick='repleDel("+item.reple_idx+","+item.board_idx+")'> X</a>";
				}
				content +="</td></tr>";
			});
			$("#repleZone").append(content);		
		}
		
		//팝업창 닫기(프로필 작성 취소)
		$("#back").click(function(){
			$("#modifyPop").css("display","none");
			$("#intro").val("");
			$("#photo").val("");
			$("#mask").hide();
			$("#imgtag2").remove();
			$("#beforePhotoName").remove();
			var content = null;
			if(newfile == ""){
				content = "<img id='imgtag2' alt='profilePhoto' width='100' src='resources/profilePhotos/noprofile.jpg'/>";
			}else{
				content = "<img id='imgtag2' alt='profilePhoto' width='100' src='resources/profilePhotos/"+newfile+"'/>";
			}
			$("#imgplace2").append(content);
			//팝업창 닫을 시 등록되지 않은 프로필 사진 삭제
			data = {};
			data.delfile = $("#newfile").val();
			AjaxCall2("./delfile", data);
		});
		
		//팝업창 닫기(글쓰기)
		$('#writeClose').click(function() {
			$("#pop").css("display","none");
			$('#mask').hide();
			$('#writePop').css("display","none");	
	       $.ajax({
				url:"./rest/fileDelete",
				type:"get",
				dataType:"json",
				success:function(d){
					console.log(d);
					$("#editable").empty();
					$("#files").empty();
				},
				error:function(e){
					console.log(e);					
				}
			});
		});
		
		//팝업창 닫기(프로필 상세보기)
		$("#detailClose").click(function(){
			$("#mask").hide();
			$("#detailPop").css("display","none");
		});
		
		//주소창 열기
		$(function() { 
			$("#postcodify_search_button").postcodifyPopUp(); 
		});
		
		//게시글 리스트 가져오기
		function ListCall(){
			data = {};
			data.id = "${profile.user_id}";
			AjaxCall2("./profileList", data);
		}
		
		ListCall();
		
		//게시글 붙여넣기
		function addList(profileList){
			var content = "";
			
			end = start + 8;
			if(end > profileList.length){
				end = end - (end - profileList.length);
				stop = 1;
			}
			for(var i=start;i<end;i++){
				console.log("가져온 사진 : "+profileList[i].newFile);
				content += "<a href='javascript:;' onclick='aa("+profileList[i].board_idx+")'><img class='bp' alt='boardList' src='resources/upload/"+profileList[i].newFile+"'/></a>";
			}
			start = end;
			$("#showList").append(content);
		}
		
		//게시물 더보기
		$("#more").click(function(){
			if(stop == 0){
				ListCall();
			}else{
				alert("모든 게시물을 가져왔습니다.");
			}
		});
		
		//글쓰기
		$("#write").click(function(){
			$("#content").val($("#editable").html());
			$("#sendForm").submit();
		});
		
		//팔로우 리스트 가져오기
		$("#follow").click(function(){
			if(followGetChk == 0){
				data = {};
				data.follower = login;
				AjaxCall2("./rest/followList", data);
			}else{
				windowMask();
				$("#followListPop").css("display","inline");
			}
		});
		
		//팔로우 리스트 그리기
		function followListDraw(followList){
			var followCon = "";
			
			fend = fstart + 10;
			if(fend > followList.length){
				fend = fend - (fend - followList.length);
				fstop = 1;
			}
			followCon += "<table>";
			for(var i=fstart;i<fend;i++){
				console.log("가져온 사진 : "+followList[i].newfile);
				console.log("가져온 유저들 : "+followList[i].user_id);
				followCon += "<tr/>";
				if(followList[i].newfile == ""){
					followCon += "<td><div class='wentwo'><img class='followListPhotos' alt='profile' src='resources/profilePhotos/noprofile.jpg'/></div></td>";
				}else{
					followCon += "<td><div class='wentwo'><img class='followListPhotos' alt='profile' src='resources/profilePhotos/"+followList[i].newfile+"'/></div></td>";
				}
				followCon += "<td class='followListId'><a href='./timeline?id="+followList[i].user_id+"'>"+followList[i].user_id+"</a></td>";
				followCon += "</tr>";
			}
			followCon += "</table>";
			followCon += "<div id='followMore'>팔로우 더 가져오기</div>"
			followCon += "<img id='followClose' width='15' src='resources/img/x.png'/>";
			fstart = fend;
			$("#followListPop").append(followCon);
			windowMask();
			$("#followListPop").css("display","inline");
			
			//팔로우 리스트 팝업창 닫기
			$("#followClose").click(function(){
				$("#followListPop").css("display","none");
				$('#mask').hide();
			});
			
			//팔로우 리스트 더보기
			$("#followMore").click(function(){
				if(fstop == 0){
					followListDraw();
				}else{
					alert("모든 팔로우를 가져왔습니다.");
				}
			});
		}
		
		//팔로워 리스트 가져오기
		$("#follower").click(function(){
			if(followerGetChk == 0){
				data = {};
				data.follow = login;
				AjaxCall2("./rest/followerList", data);
			}else{
				windowMask();
				$("#followerListPop").css("display","inline");
			}
		});
		
		//팔로워 리스트 그리기
		function followerListDraw(followerList){
			var followerCon = "";
			
			fend2 = fstart2 + 10;
			if(fend2 > followerList.length){
				fend2 = fend2 - (fend2 - followerList.length);
				fstop2 = 1;
			}
			followerCon += "<table>";
			for(var i=fstart2;i<fend2;i++){
				console.log("가져온 사진 : "+followerList[i].newfile);
				console.log("가져온 유저들 : "+followerList[i].user_id);
				followerCon += "<tr>";
				if(followerList[i].newfile == ""){
					followerCon += "<td><div class='wentwo'><img class='followListPhotos' alt='profile' src='resources/profilePhotos/noprofile.jpg'/></div></td>";
				}else{
					followerCon += "<td><div class='wentwo'><img class='followListPhotos' alt='profile' src='resources/profilePhotos/"+followerList[i].newfile+"'/></div></td>";
				}
				followerCon += "<td class='followListId'><a href='./timeline?id="+followerList[i].user_id+"'>"+followerList[i].user_id+"</a></td>";
				followerCon += "</tr>";
			}
			followerCon += "</table>";
			followerCon += "<div id='followerMore'>팔로워 더 가져오기</div>"
			followerCon += "<img id='followerClose' width='15' src='resources/img/x.png'/>";

			fstart2 = fend2;
			$("#followerListPop").append(followerCon);
			windowMask();
			$("#followerListPop").css("display","inline");
			
			//팔로워 리스트 팝업창 닫기
			$("#followerClose").click(function(){
				$("#followerListPop").css("display","none");
				$('#mask').hide();
			});
			
			//팔로워 리스트 더보기
			$("#followerMore").click(function(){
				if(fstop2 == 0){
					followerListDraw();
				}else{
					alert("모든 팔로워를 가져왔습니다.");
				}
			});
		}
		
		//태그
		$("#tag").keyup(function(){
			if($("#tag").val()==""){
				console.log($("#tag").val());
				$("#tagBox").empty();
			}else{
				
				$.ajax({
					url:"./rest/tag",
					type:"post",
					data:{"tagName":$("#tag").val()
						,"id": login},
					dataType:"json",
					success:function(d){
						console.log(d);
						
						if(d.tagList[0] == "아이디가 없습니다."){
							$("#tagBox").empty();
							$("#tagBox").append();
						}else{
							tagList(d.tagList);
						}
						
					},
					error:function(e){
						console.log(e);					
					}
				});
			}
			
		});
		function tagOn(elem){
			$("#tagIn").val(elem.id);
			
			var element = document.getElementById(elem.id);
			element.parentNode.removeChild(element);
		}
		function tagList(tagList){
			$("#tagBox").empty();
			var tagCon = "";
			tagCon +="태그할 사람";
			tagCon +="<div id='tagDiv'>";
			for(var i=0; i<tagList.length; i++){
				tagCon +="<a id='"+tagList[i]+"' href='#' onclick='tagOn(this)'><b>"+tagList[i]+"</b></a></br>";
			}
			tagCon +="</div>";
			$("#tagBox").append(tagCon);		
			
		}
	</script>
</html>