<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link href="resources/css/style2.css" rel="stylesheet" type="text/css">

		<title>Insert title here</title>
		<style>
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
			#go{
				margin-left : 627px;
			}
		.img:hover{
			opacity : 0.5;
		}
			.img{
				cursor: pointer;
				float: left;
				margin : 10px;
				background-size: 400px;
				z-index : 0;
			}
			.hover{
				visibility: hidden;
				color: black;
				}
				#pop{
			  	display: none;
				width: 700px;
				height: 850px;
				position: fixed;
				margin-top : -70px;
				top: 100px;
				left: 300px;
				background-color: white;
				z-index: 9001;
				border-bottom-left-radius: 10px;
               border-bottom-right-radius: 10px;
               border-top-left-radius: 10px;
               border-top-right-radius: 10px;
               border: 2px solid white;">

			   }
			#mask{
				position: absolute;
				left: 0;
				top: 0;
				z-index: 9000;
				background-color: #000;
				display: none;
		}
		#repleZone{
			margin-top:10px;
			width: 100%;
			text-align: left;	
		}
		#like,#close,#modify,#modifycontent{
			cursor: pointer;
		}
		
		#upbar{
			border: 1px solid black;
			width: 100%;
			height: 50px;
			text-align: center;
			
		}
			.photo-grid-container { margin:50px auto 30px auto; max-width:960px;}
			
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
			#replyContent { 
				position: fixed;
			    margin-top: 241px;
			    width: 600px;
			    height: 40px;
			}
		</style>
	</head>
	<body>
	<jsp:include page="upbar.jsp"/>
	<div style="height : 10px;"></div>
		<div class="photo-grid-container" data-jq-sortable-photos-grid-id="0" style="position: relative; height: 1249px;">
		
		</div>
		<div id="pop">
		
		</div>
		<div id="mask"></div>
	</body>
			<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> 
		<script src="resources/jquery-sortable-photos.js"></script> 
		<script src="resources/js/vmc.slider.full.js"></script>
	<script>
	
	var photoList = "";
	var i = 0;
	var j = 0;
	var z = 0;

	var hoverList ="";
	$(document).ready(function(){
		
		<c:forEach var="list" items="${photos}">
		
		photoList += '<div class="photo-grid-item jq-sortable-photos-item ui-draggable	ui-draggable-handle ui-droppable"';
		
		photoList +=	'data-grid-item-id="0-'+i+'"'; 
		photoList +=	'data-row-id="'+j+'"'; 
		photoList += 	'style="position: absolute; top: 0px; left: 0px;">';
		photoList += '<div id="photoList'+i+'"></div>';
		photoList +=	'<img class="img" style="z-index :1; max-width: none; width: 301px; height: 167px;" id="'+${list.board_idx}+'" src="resources/upload/'+'${list.newfile}'+'">';
		photoList += '</div>';
		i++;
		if((i%3)==0){
			j++;
		}
		</c:forEach>
		$(".photo-grid-container").append(photoList);

		<c:forEach var="list" items="${list}" >
		hoverList += '<div class="${list.board_idx}" style="z-index:3; position:absolute; display:none; top:40%; left:45%; text-align:center;">';
		hoverList +=	'${list.board_likeNum }'+'<br/>';
		hoverList +=	'${list.board_cat}'+'<br/>';
		hoverList +=	'${list.reg_date}'+'<br/>';
		hoverList +=	'${list.writer}';
		hoverList += '</div>';
		$("#photoList"+z).append(hoverList);
		z++;
		hoverList = "";
		</c:forEach>

		$('.photo-grid-container').sortablePhotos({
		    selector: '> .photo-grid-item',
			  padding: 7
		  });
		
	function fileUp(){
		//새창 띄움
		var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
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
	
	//원래 있던 사진 삭제 할 
	function delFile(elem){
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
	//팝업창 뜸과 동시에 어두워지는 바탕화면 함수
	function windowMask(){
		
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$("#mask").css("width",maskWidth).css("height",maskHeight);
		$("#mask").fadeTo("fast",0.4);
		$("#mask").css("display","inline");
	}
	var imgidx = "";
		$(".img").hover(function(e){
			imgidx=e.target.id;
			$("."+imgidx).css("display","inline");
			console.log(e);
			console.log(e.target.id);
			console.log(e.target.className);
			
			$("#"+imgidx).click(function(){
				$.ajax({
					url:"./rest/detail",
					type:"post",
					data:{idx : imgidx},
					dataType:"json",
					success:function(d){	
						windowMask();
						 $('#pop').css("display","inline");	
						 contentCall(d.content,d.photoList);
					},
					error:function(e){
						console.log(e);
					}
				});
			});
		},
			function(e){
			$("."+imgidx).css("display","none");
		}
		);
		
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
							$("#replyContent").val("");
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
		
		//댓글 지우기
		function repleDel(reple_idx, idx){
			url="./rest/repleDel";
			data={};
			data.idx = imgidx;
			data.repleIdx = reple_idx;
			sendAjax(url,data);
		}
		
		//댓글 리스트 보기
		function repleList(){
			url="./rest/repleList";
			data={};
			data.idx = imgidx; 
			sendAjax(url,data);
		}
		
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
				content +="<td class='user'style='font-weight: 600; width:90px; border-right: 1px solid lightgray;'>"+item.replyer+"</td>";
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
			var con = "";
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
			$("#pop").empty();
			$("#pop").append(con);
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
			repleList();
			likenum();
			$("#detailclose").click(function(){
				$("#pop").css("display","none");
				 $('#mask').hide();
			});
			
			
			//댓글 등록
			$("#go").click(function(){
				url="./rest/repleRegist";
				data={};
				data.idx = imgidx;
				data.user = "${sessionScope.loginId}";
				data.content = $("#replyContent").val();
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
		
	});
		
		
		
	</script>
</html>