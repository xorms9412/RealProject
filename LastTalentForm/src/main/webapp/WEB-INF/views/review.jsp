<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
				<link href="resources/css/style2.css" rel="stylesheet" type="text/css">
		
		<title>Insert title here</title>
		<style>
		
		
			#pop{
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
			#content { 
				position: fixed;
			    margin-top: 241px;
			    width: 600px;
			    height: 40px;
			}
			#detailpop{
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
		   #editable{
				text-align:left;
				width:98%;
				height:150px;
				padding:5px;
				overflow:auto;
				color: darkgray;
			}
			#subject{
				margin-top: 20;
			    width: 100%;
			    text-align: center;
			}
			#writebtn{
				margin-left : 1150px;
				margin-top : 50px;
			}
			#reviewphoto{
				position: absolute;
			    top: 223px;
			    left: 19px;
			    margin-bottom: 60px;
			    z-index: 10;
			}
			#mask{
				position: absolute;
				left: 0;
				top: 0;
				z-index: 9000;
				background-color: #000;
				display: none;
			}
			#like,#close{
				cursor: pointer;
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
			#cat{
				border: none;
				font-size: xx-large;
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
			.img{
				margin-top: 15px;
			    margin-right: 14px;
			    margin-bottom: 21px;
			    width: 400px;
			    height: 277px;
			    cursor: pointer;
			}
			.img:hover{
				opacity : 0.5;
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
		  width:120px;
		  height: 45px;
		  left:1140px;
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
		
	
		
		</style>
	</head>
	<body>
		<jsp:include page="upbar.jsp"/>
	
		<div id="mask"></div>
	
		<div style="height : 42px;"></div>
		<div id="subject"><h1><span style="color:red;">${seller }</span>님의 판매 상품 구매 후기</h1></div>
		<div id="category_ok">
			<section class="links">
				<nav class="link-effect-10" id="link-effect-10">
					<a href="#" onclick="popon()" data-hover="확 인"><span>리뷰작성</span></a>
				</nav>
			</section>
		</div>
		
		
		<div id="reviewphoto">
		
		</div>
		<div id="detailpop">
		
		</div>
		<div id="pop">
			<form id="sendForm" action="reviewwrite" method="post">
				<img src = "resources/img/x.png" width="15" style="margin-top : 10px; margin-left:573px; position:fixed; cursor:pointer;" id="writeClose"/>
				<input id="cat" type="text" value="후기" name="cat" readonly/><br/>
				<b>판매자</b><input style="border:none;" type="text" value="${seller}" name="seller" readonly/><br/>
				<b>구매자</b><input style="border:none;" type="text" value="${sessionScope.loginId}" name="buyer" readonly/>
				<div id="files"></div>
	 			<!-- <input type="button" onclick="fileUp()" value="파일 업로드"/> -->
				<img src ="resources/img/Add-icon.png" width="50px" style="margin-top : 10px; margin-left:5px; cursor: pointer;" id="fileUp">
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
	</body>
	<script src="resources/js/vmc.slider.full.js"></script>
	<script>
	$("#write").mouseenter(function(){
		$("#write").css("color","black");
		$("#write").css("border","1px solid");
	});
	$("#write").mouseleave(function(){
		$("#write").css("color","lightgrey");
		$("#write").css("border","1px solid lightgrey");
	});
	
	$("#editable").html("입력해주세요");
	
	$("#editable").focusin(function(){
		$("#editable").html("");
		$("#editable").css("color","black");
	});
	
	$("#fileUp").click(function(){
		fileUp();
	});
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
	$('#writeClose').click(function() {
		$("#pop").css("display","none");
		$('#mask').hide();
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
	$(document).ready(function() {
		 $('#pop').hide();
   });
	function popon(){
		windowMask();
		$('#pop').show();
	}

	function fileUp(){
		//새창 띄움
		var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
	}
	
	$("#write").click(function(){
		$("#content").val($("#editable").html());
		$("#sendForm").submit();
	});
	
	//팝업창 배경색 검게 변경
	function windowMask(){
		
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$("#mask").css("width",maskWidth).css("height",maskHeight);
		$("#mask").fadeTo("fast",0.4);
		$("#mask").css("display","inline");
	}

	//글쓰기 창 닫기
	 $('#close').click(function() {
	       $('#pop').hide();
	       $('#mask').hide();
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
	
		//object 에서 키만 뽑아 내는 과정
		var img="";
		<c:forEach items="${reviewList}" var="list">
			img += "<img class='img' id='"+${list.board_idx}+"' src='resources/upload/"+"${list.newFile}"+"'/>";
		</c:forEach>
		
		$("#reviewphoto").append(img);
			
		var imgidx = "";
				
		var data;
		var url = "";
		$(".img").hover(function(e){
			$(e.target.childNodes).css("visibility","visible");
			imgidx=e.target.id;
			console.log(imgidx);
			$(".img").click(function(d){
				data = {};
				data.idx = d.currentTarget.id; 
				console.log(data);
				url = "./rest/detail";
				ajaxCall(url,data);
			});
		});
		
		//상세보기 아작스 실행문
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					windowMask();
					 $('#detailpop').css("display","inline");	
					 contentCall(d.content,d.photoList);
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
		
		//댓글 지우기
		function repleDel(reple_idx, idx){
			url="./rest/repleDel";
			data={};
			data.idx = imgidx;
			data.repleIdx = reple_idx;
			sendAjax(url,data);
		}
		
		//아작스 실행문
		function sendAjax(reqUrl, reqData){
			console.log(reqUrl, reqData);
			$.ajax({
				url:reqUrl,
				type:"get",
				data:reqData,
				dataType:"json",
				success:function(d){				
					if(reqUrl=="./rest/repleRegist"){
						console.log(d.success);
						if(d.success == 1){
							alert("등록에 성공 했습니다.");
							$("#content").val("");
							repleList();
						}else{
							alert("등록에 실패 했습니다.");
						}
					}	
					if(reqUrl=="./rest/repleList"){
						printList(d.list);
					}
					if(reqUrl=="./rest/repleDel"){
						if(d.success == 1){
							alert("삭제에 성공 했습니다.");
							repleList();
						}else{
						}
					}
					if(reqUrl=="./rest/like"){
						if(d.success == 1){
							alert("좋아요!");
							likenum();
						}else{
							alert("좋아요 취소");
							likenum();
							}
					}
					if(reqUrl=="./rest/likenum"){
						$("#likenum").html(d.likenum);
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}

		//댓글 리스트 보기
		function repleList(){
			url="./rest/repleList";
			data={};
			data.idx = imgidx; 
			sendAjax(url,data);
		}
		
		//좋아요 수 늘리기
		function likenum(){
			url="./rest/likenum";
			data={};
			data.idx = imgidx;
			sendAjax(url,data);
		}
		
		//댓글 리스트 그리기
		function printList(list){
			$("#repleZone").empty();
			var content = "";
			
			list.forEach(function(item){
				content +="<tr>";
				content +="<td class='user' style='font-weight: 600;'>"+item.replyer+"</td>";
				content +="<td>"+item.reple_content;
				if(item.replyer == "${sessionScope.loginId}"){
					content += "<a style='position:fixed; left:970px;' href='#' onclick='repleDel("+item.reple_idx+","+item.board_idx+")'> X</a>";
				}
				content +="</td></tr>";
			});
			$("#repleZone").append(content);		
		}
		
		//상세보기 
		function contentCall(content,photoList){			
			var con="";	
			
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
			con += '<table id="repleForm" class="board"><tr><td class="data"><input type="text" id="content" rows="1" style="border: none;"/></td><td class="btn"></table>';
			con += '<div style="margin-left:625px; margin-top:244px;" id="go">댓글달기</div></td></tr><br/><table style="margin-top : -213px; position: fixed;  margin-left:15px;" id="repleZone"></tabel>';
			con += '<img src = "resources/img/x.png" width="15" style="top:45px; left:970px; position:fixed; cursor:pointer;" id="detailclose"/>';
			
			con += '<div id="modify" style="visibility:hidden">수정</div>';
			$("#detailpop").empty();
			$("#detailpop").append(con);
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
			}
			repleList();
			likenum();
			$("#detailclose").click(function(){
				$('#detailpop').css("display","none");	
				 $('#mask').hide();
			});
			
			//댓글 등록
			$("#go").click(function(){
				url="./rest/repleRegist";
				data={};
				data.idx = imgidx;
				data.user = "${sessionScope.loginId}";
				data.content = $("#content").val();
				console.log(data);
				sendAjax(url,data);
			});
			
			//좋아요
			$("#like").click(function(){
				url="./rest/like";
				data={};
				data.idx = imgidx;
				data.user = "${sessionScope.loginId}";
				sendAjax(url,data);
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
		
		//태그
		$("#tag").keyup(function(){
			$.ajax({
				url:"./rest/tag",
				type:"post",
				data:{"tagName":$("#tag").val()
					,"id": "${sessionScope.loginId}"},
				dataType:"json",
				success:function(d){
					console.log(d);
					tagList(d.tagList);
				},
				error:function(e){
					console.log(e);					
				}
			});
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