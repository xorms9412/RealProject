<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<title>Insert title here</title>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
			<link rel="stylesheet" href="resources/css/login.css">
	
		<link rel="icon" href="resources/img/icon.png">
	</head>
	<body>
		<%-- <table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" id="userId"/>
					<input id="overlay" type="button" value="중복확인"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="userPw"/></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" id="pwChk"/><br/>
					<span id="matchMsg"></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="userName"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" id="gender" name="gender" value="man" checked/>남자
          			<input type="radio" id="gender" name="gender" value="woman"/>여자</td>
			</tr>
			<tr>
				<td>생년 월일</td>
				<td><input type="date" id="birthday" value="${birth }" style="color: black;"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" id="email"/></td>
			</tr>
			<tr>
				<td>전화 번호</td>
				
				<td><select id="number">
                    	<option value="010">010</option>
                    	<option value="011">011</option>
                    	<option value="016">016</option>
                    	<option value="017">017</option>
                    	<option value="019">019</option>
                    </select>-
                    <input type="Number" id="fowNum" value="${fownumber }"/>-
                    <input type="Number" id="backNum" value="${backnumber }"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					우편 번호 : <input type="text" name="" class="postcodify_postcode5" value="" />
					도로명 주소 : <input type="text" id="address_one" name="address_one" class="postcodify_address" value="" /><br />
					상세 주소 : <input type="text" id="address_two" name="address_two" class="postcodify_details" value="" /><br />
				</td>
			<tr>
				<td colspan="2">
					<input id="regist" type="button" value="회원가입"/>
					<input type="button" onclick="home()" value="취소" />
				</td>
			</tr>
		</table> --%>
		
	
		<section class="container" style = "height : 800px;">
		    <article class="half" style = "width : 60%; margin-left : 135px;">
			        <h1>Talent Farm Regist</h1>
		        
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="login" method="post">
						                    <input type="text" name="userId" id="userId" class="inpt" required="required" placeholder="Your id">
						                    <label for="text">Your email</label><input id="overlay" type="button" value="중복확인"/>
						                    
						                    <input type="password" name="userPw" id="userPw" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
                						    
                						    <input type="password" name="userPw" id="pwChk" class="inpt" required="required" placeholder="Checkde password">
                						    <label for="password">Your password</label><span id="matchMsg"></span>
                						    
                						    <input type="text" name="userName" id="userName" class="inpt" required="required" placeholder="Your Name">
						                    <label for="text">Your name</label>
                						    
                						    <input type="text" name="userName" id="email" class="inpt" required="required" placeholder="Your Emaill Address">
						                    <label for="text">Your name</label>
						                    
						                    <input type="radio" id="gender" name="gender" value="man" checked/>남자
						                    <label for="radio">Your gender</label>
          									<input type="radio" id="gender" name="gender" value="woman"/>여자
          									<label for="radio">Your gender</label>
          									<div style="margin-bottom : 10px;"></div>
          									
          									<input type="date" name="birth" id="birthday" class="inpt" required="required" placeholder="Your Birthday">
						                    <label for="text">Your birthday</label>
						                    
						                    <input type="text" name="userId" id="number" placeholder="Your"  style = "height : 42px; width : 105px; color: #999999; border: 1px solid #d9d9d9; padding: 16px 13px;" size="3"> -
						                    <input type="text" name="userId" id="fowNum" placeholder="Phone"  style = "height : 42px; width : 105px; color: #999999; border: 1px solid #d9d9d9; padding: 16px 13px;" size="3"> -
						                    <input type="text" name="userId" id="backNum" placeholder="Number"  style = "height : 42px; width : 105px; color: #999999; border: 1px solid #d9d9d9;padding: 16px 13px; margin-bottom:10px;" size="3">
						                   
						                 
						          		    <input type="text" name="" class="postcodify_postcode5" placeholder="Postal code"  style="height : 42px; width : 275px; margin-bottom:10px; color: #999999; border: 1px solid #d9d9d9; padding: 16px 13px;" value="" />
											<input type="button" id="postcodify_search_button" value="Search"/><br />
											<input type="text" id="address_one" name="address_one" placeholder="Address" style = "height : 42px; width : 340px; margin-bottom:10px; color: #999999; border: 1px solid #d9d9d9; padding: 16px 13px;" class="postcodify_address" value="" /><br />
											<input type="text" id="address_two" name="address_two" placeholder="Detail Address" style = "height : 42px; width : 340px; margin-bottom:10px; color: #999999; border: 1px solid #d9d9d9; padding: 16px 13px;" class="postcodify_details" value="" /><br />
											<input id="regist" type="button" value="회원가입"/>
											<input type="button" onclick="home()" value="취소" />
											
											       
        					        </form>
    				        </div>
    				       
			        </div>
		    </article>
	</section>
	<script>
		var chkSum = 0;
		var url;
		var data;
		//비밀번호 확인
		$("#pwChk").keyup(function(){
			if($("#userPw").val() != $("#pwChk").val()){
				$("#matchMsg").html("일치 하지 않습니다.");
				$("#matchMsg").css("color","red");
			}else{
				$("#matchMsg").html("일치 합니다.");
				$("#matchMsg").css("color","green");
				chkSum ++;
			}
		});
		
		//중복 확인
		$("#overlay").click(function(){
			data ={};
			data.id = $("#userId").val();
			ajaxCall("./rest/overlay",data);
		});
		
		//회원가입
		$("#regist").click(function(){
		
			data={};
			data.id = $("#userId").val();
			data.pw = $("#userPw").val();
			data.name = $("#userName").val();
			data.email = $("#email").val();
			data.gender = $(":input:radio[name=gender]:checked").val();
			data.phone = $("#number").val()+$("#fowNum").val()+$("#backNum").val();
			data.birth = $("#birthday").val();
			data.address = $("#address_one").val()+$("#address_two").val();
			if(data.id ==""){
				alert("아이디을 입력하세요.");
				return false;
			}else if(data.pw ==""){
				alert("패스워드를 입력하세요.");
				return false;
			}else if(data.name ==""){
				alert("이름을 입력하세요.");
				return false;
			}else if(data.email ==""){
				alert("이메일을 입력하세요.");
				return false;
			}else if(data.phone ==""){
				alert("휴대폰 번호를 다 입력하세요.");
				return false;
			}
			if(chkSum<2){
				alert("중복확인과 비밀번호 확인을 해 주세요!");
			}else{
				ajaxCall("./rest/join", data);
			}			
		});
		
		function home(){
			location.href = "./loginPage";
			
		}
		
		//ajax 실행
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/overlay"){
						if(d.use == "Y"){
							chkSum ++;
							alert("사용 가능한 아이디 입니다.");
						}else{
							alert("누군가가 사용 하고 있는 아이디 입니다.");
							$("#userId").val("");
						}
					}else{
						if(d.success == 1){
							alert("가입에 성공 하였습니다.");
							location.href="./";
						}else{
							alert("가입에 실패 하였습니다. 다시 입력 해 주세요!");
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
		$(function() { $("#postcodify_search_button").postcodifyPopUp(); });

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</html>