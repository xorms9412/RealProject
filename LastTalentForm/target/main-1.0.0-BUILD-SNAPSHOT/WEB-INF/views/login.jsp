
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>Insert title here</title>
		<link rel="icon" href="resources/img/icon.png">
		<link rel="stylesheet" href="resources/css/common.css">
		<link rel="stylesheet" href="resources/css/login.css">
		
	</head>
	<body>
	
	
		<section class="container" style = "margin-top : 200px;">
		    <article class="half">
			        <h1>Talent Farm</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">Sign in</a></span>
				            <span class="tab signup"><a href="#signup">Find Id</a></span>
				            <span class="tab signdown"><a href="#signdown">Find PW</a></span>
				            
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="login" method="post">
						                    <input type="text" name="userId" id="email" class="inpt" required="required" placeholder="Your id">
						                    <label for="text">Your email</label>
						                    <input type="password" name="userPw" id="password" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">Remember me</label><br/>
						                    <label for="remember">Talent Farm is your first time ?<a href="joinForm">Join</a></label>
						                    <div class="submit-wrap">
							                        <input type="submit" value="Sign in" class="submit">
							                        <a href="#" class="more">Forgot your password?</a>
						                    </div>
        					        </form>
    				        </div>
    				        <div class="signup-cont cont">
               				 <div class="changeForm">
						                    <input type="text"  id="userName" class="inpt" required="required" placeholder="Your name">
						                    <label for="text">Your name</label>
                   							<input type="text" id="emaili" class="inpt" required="required" placeholder="Your email">
						                    <label for="text">Your email</label>
						                    <input type="date" id="birth" class="inpt" required="required" placeholder="Your Birthday">
                						    <label for="password">Your Birthday</label>
                						    <div id="idlist"></div>
						                    <div class="submit-wrap">
							                <input type="button" id="btn-layerSend" value="Sign up" class="submit">
							               	<a href="#" class="more">Terms and conditions</a>
						                    </div>
        					        </div>
           					</div>
           					<div class="signdown-cont cont">
               				 <div class="changeForm">
						                    <input type="text"  id="userIdpw" class="inpt" required="required" placeholder="Your Id">
						                    <label for="name">Your ID</label>
						                    <input type="text"  id="userNamepw" class="inpt" required="required" placeholder="Your Name">
						                    <label for="name">Your Name</label>
                   							<input type="text" id="emailpw" class="inpt" required="required" placeholder="Your email">
						                    <label for="text">Your email</label>
						                    <input type="date" id="birthpw" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
						                    <div class="submit-wrap">
						               		<input type="button" id="btn-layerSendpw" value="Sign up" class="submit">
							                <a href="#" class="more">Terms and conditions</a>
						                    </div>
        					        </div>
           					</div>
			        </div>
		    </article>
		    		    		    <div class="half bg"></div>
		    
	</section>
		
	</body>
	<script>
	/* var msg = ${msg};
	if(msg != ""){
		alert(msg);
	} */
	$('.container .bg').mousemove(function(e){
	    var amountMovedX = (e.pageX * -1 / 30);
	    var amountMovedY = (e.pageY * -1 / 9);
	    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
	});
	var url;
	var data;
    $('#btn-layerSend').click(function(){
    	data={};
		data.name = $("#userName").val();
		data.email = $("#emaili").val();
		data.birth = $("#birth").val();
		ajaxCall("./rest/findid", data);

    });
    
    $('#btn-layerSendpw').click(function(){
    	data={};
    	data.id = $("#userIdpw").val();
		data.name = $("#userNamepw").val();
		data.email = $("#emailpw").val();
		data.birth = $("#birthpw").val();
		ajaxCall("./rest/findpw", data);

    });
	$('.tabs .tab').click(function(){
	    if ($(this).hasClass('signin')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signin-cont').show();
	    } 
	    if ($(this).hasClass('signup')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signup-cont').show();
	    }else if ($(this).hasClass('signdown')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signdown-cont').show();
	    }
	});
	   function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				dataType:'json',
				data: reqData,
				success:function(d){
					console.log(d);
					if(reqUrl=="./rest/findid"){
						if(d.id!=""){
							var content = "<p>"+d.id+"</p>";
							$("#idlist").append(content);
							$("#userName").val() = "";
							$("#email").val() = "";
							$("#birth").val() = "";
						}else{
							alert(d.findidmsg);
							$("#userName").val() = "";
							$("#email").val() = "";
							$("#birth").val() = "";
						}
					}
					if(reqUrl=="./rest/findpw"){
						if(d.success==1){
							alert(d.msg);
							$("#userIdpw").val() = "";
							$("#userNamepw").val() = "";
							$("#emailpw").val() = "";
							$("#birthpw").val() = "";
						}else{
							alert(d.msg);
							$("#userIdpw").val() = "";
							$("#userNamepw").val() = "";
							$("#emailpw").val() = "";
							$("#birthpw").val() = "";
						}
					}
				},
				error:function(e){
					console.log(e);
				}				
			});			
		}
	</script>
</html>