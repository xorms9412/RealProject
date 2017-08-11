<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>메인 페이지</title>
		<style type="text/css">
			 #pop{
			  	display: none;
				width: 700px;
				height: 800px;
				position: absolute;
				top: 100px;
				left: 300px;
				border: 3px solid black;
				background-color: white;
				z-index: 9001;
			   }
			#mask{
				position: absolute;
				left: 0;
				top: 0;
				z-index: 9000;
				background-color: #000;
				display: none;
		}
			   #editable{
					text-align:left;
					width:98%;
					height:400px;
					border: 1px solid gray;
					padding:5px;
					overflow:auto;
				}
		</style>
	</head>
	
	<body>
		<button onclick="popon()">글 쓰기</button>
		<button onclick="location.href='selectCat'">이동</button>
		<div id="pop">
			<form id="sendForm" action="write" method="post">
				<select id="select" size="1" name="cat" >
					<option value="sports">운동</option>
					<option value="design">디자인</option>
					<option value="성우">성우</option>
				</select>
	 			<div id="editable" contenteditable="true">
	 			</div>
	 			<div id="files"></div>
	 			<input type="button" onclick="fileUp()" value="파일 업로드"/>
				<input id="content" type="hidden" name="content" value=""/>
				<input type="hidden" name="writer" value="${sessionScope.loginId }"/>   
						
				<div>
	    			<div id="write" style="width:100px; margin:auto;">글 쓰기</div>
	    			<div id="close" style="width:100px; margin:auto;">닫기</div>
	  			</div>
			</form>
		</div>
		<div id="mask"></div>
	</body>
	<script>
	 	
	//팝업창 뜸과 동시에 어두워지는 바탕화면 함수
	function windowMask(){
		
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		$("#mask").css("width",maskWidth).css("height",maskHeight);
		$("#mask").fadeTo("fast",0.4);
		$("#mask").css("display","inline");
	}
		function popon(){
			windowMask();
			 $('#pop').css("display","inline");	
		}

		function fileUp(){
			//새창 띄움
			var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
		}
		$("#write").click(function(){
			$("#content").val($("#editable").html());
			$("#sendForm").submit();
		});
			
		 $('#close').click(function() {
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
	</script>
</html>