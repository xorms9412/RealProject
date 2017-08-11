<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>구매 신청 페이지</title>
		<style>
			#editable{
				text-align:left;
				width:97%;
				height:300px;
				border: 1px solid lightgray;
				padding:5px;
				overflow:auto;
			}
			#subject{
				left:43%;
				display: block;
				position: absolute;
			}
			#buyWrite{
				position:absolute;
				top: 15%;
				left: 15%;
				border: 1px solid lightgray;
				padding: 50 150 50 150;
			}
			input {
				width:100%;
				border: 1px solid lightgray;
				border-radius: 0px;
				-webkit-appearance: none;
				height: 30px;
				font-size: 16px;
			​}
			#trade_start{
				width: 48%;
			}
			#trade_end{
				width: 49%;
			}
			.inBox{
				width: 500px;
			}
			#files{
				display: inline;
			}
			img{
				width: 100px;
				height: 100px;
				display: inline;
			}
			#save{
				width: 40%;
				margin-left: 100px;
			}
			#back{
				width: 40%;
			}
			.name{
				font-weight: 700;
			}
			table{
				width: 600px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="upbar.jsp"/>
		<div id="subject"><h1>주문서 작성</h1></div>
		<div id="writeForm">
			<form id="buyWrite" action="buy" method="post">
				<table>
					<input id="trade_alam" type="hidden" name="trade_alam" value="1"/>
					<tr>
						<td class="name">제목</td>
						<td class="inBox"><input type="text"  name="trade_title"/></td>
					</tr>
					<tr>
						<td class="name">구매자</td>
						<td class="inBox"><input type="text"  value="${sessionScope.loginId }" name="buy" readonly/></td>
					</tr>
					<tr>
						<td class="name">판매자</td>
						<td class="inBox"><input type="text" value="${seller}" name="sell" readonly/></td>
					</tr>
					<tr>
						<td class="name">구매내용</td>
						<td class="inBox">
							<div id="editable" contenteditable="true"></div>
							<input id="content" type="hidden" name="trade_content" value=""/>
						</td>
					</tr>
					<tr>
						<td class="name">파일첨부</td>
						<td>
							<div id="files"></div>
							<input type="button" onclick="fileUp()" value="파일 업로드"/>
						</td>
					</tr>
					<tr>
						<td class="name">금액</td>
						<td class="inBox"><input id="trade_price" type="text"  name="trade_price"/></td>
					</tr>
					<tr>
						<td class="name">기간</td>
						<td><input id="trade_start" type="date" name="trade_start"/>~<input id="trade_end" type="date" name="trade_end"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<input id="save" type="button" value="구매 신청"/>
							<input id="back" type="button" value="리스트" onclick="goBack()"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	</body>
	<script>
	
		function fileUp(){
			var myWin = window.open("./uploadForm","파일업로드","width=400, height=100");
		}
		
		function goBack(){
			location.href="./";
		}
		
		function tpdel(elem){
			console.log(elem.id);
			$.ajax({
				url:"./rest/tpDelete",
				type:"get",
				data:{"fileName":elem.id},
				dataType:"json",
				success:function(d){
					console.log(d);
					if(d.success == 1){
						var element = document.getElementById(elem.id);
						element.parentNode.removeChild(element);
					}
				},
				error:function(e){
					console.log(e);					
				}
			});
		}
		
		$("#save").click(function(){
			$("#content").val($("#editable").html());
			$("#buyWrite").submit();
		});
	
	</script>
</html>