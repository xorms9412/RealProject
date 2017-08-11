<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Talent Farm</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="resources/css/styles.css" />
		<link rel="stylesheet" href="resources/css/iview.css" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/animate.css" />
		
		<script src="resources/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="resources/raphael-min.js"></script>
		<script type="text/javascript" src="resources/jquery.easing.js"></script>
		<script type="text/javascript" src="resources/jquery.lettering.js"></script>
		<script type="text/javascript" src="resources/jquery.fittext.js"></script>
		<script type="text/javascript" src="resources/jquery.textillate.js"></script>
		


		<script src="resources/iview.js"></script>
		<script>
			$(document).ready(function(){
				$('#iview').iView({
					pauseTime: 7000,
					directionNav: false,
					controlNav: true,
					tooltipY: -15
				});
			});
		</script>
	<style>
		#start{
			width : 900px;
			border: 1px solid grey;
			padding : 10px;
			margin-left : 178px;
			text-align : center;
		}
		.tit{
			font-size : 25px;
			color : grey;
		}
	</style>
	</head>

	<body>
	
	<div>
	</div>
	<div id="cont" style="margin-top : 70px;">
		

	<div class="container">
		<div style="font-size : 70px;">Talent Farm</div>
		<div id="iview" style="margin-top : -5px;">
			<div data-iview:image="resources/img/manstyle.jpg" data-iview:transition="slice-top-fade,slice-right-fade">
				<div class="iview-caption caption1" data-x="80" data-y="200">Talent Farm<sup>&trade;</sup></div>
				<div class="iview-caption" data-x="80" data-y="275" data-transition="wipeRight"></div>
				<div class="iview-caption" data-x="254" data-y="320" data-transition="wipeLeft" style="font-size : 30px; width:400px;"><i>당신의 <b>재능을 응원합니다</b></i></div>
			</div>

			<div data-iview:image="resources/img/music.jpg" data-iview:transition="zigzag-drop-top,zigzag-drop-bottom" data-iview:pausetime="3000">
				<div class="iview-caption caption5" data-x="60" data-y="280" data-transition="wipeDown" style="width : 400px;">Talent Farm에서 당신을 보여주세요!</div>
				<div class="iview-caption caption6" data-x="300" data-y="350" data-transition="wipeUp"><a href="#">Example URL-link</a></div>
			</div>
			<div data-iview:image="resources/img/study.jpg">
				<div class="iview-caption caption4" data-x="50" data-y="80" data-width="312" data-transition="fade">Some of iView's Options:</div>
				<div class="iview-caption blackcaption" data-x="50" data-y="135" data-transition="wipeLeft" data-easing="easeInOutElastic">Touch swipe for iOS and Android devices</div>
				<div class="iview-caption blackcaption" data-x="50" data-y="172" data-transition="wipeLeft" data-easing="easeInOutElastic">Image And Thumbs Fully Resizable</div>
				<div class="iview-caption blackcaption" data-x="50" data-y="209" data-transition="wipeLeft" data-easing="easeInOutElastic">Customizable Transition Effect</div>
				<div class="iview-caption blackcaption" data-x="50" data-y="246" data-transition="wipeLeft" data-easing="easeInOutElastic">Freely Positionable and Stylable Captions</div>
				<div class="iview-caption blackcaption" data-x="50" data-y="283" data-transition="wipeLeft" data-easing="easeInOutElastic">Cross Browser Compatibility!</div>
			</div>

			<div data-iview:image="resources/img/artist.jpg">
				<div class="iview-caption caption7" data-x="0" data-y="0" data-width="180" data-height="480" data-transition="wipeRight"><h3>The Responsive Caption</h3>This is the product that you <b><i>all have been waiting for</b></i>!<br><br>Customize this slider with just a little HTML and CSS to your very needs. Give each slider some captions to transport your message.<br><br>All in all it works on every browser (including IE6 / 7 / 8) and on iOS and Android devices!</div>
			</div>

			<div data-iview:image="resources/img/programmer.jpg">
				<div class="iview-caption caption5" data-x="60" data-y="150" data-transition="wipeLeft">What are you waiting for?</div>
				<div class="iview-caption caption6" data-x="160" data-y="230" data-transition="wipeRight">Get it Now!</div>
			</div>
		</div>
	</div>
<div class="tit" style="text-align :center; margin-top : -10px;">Hide not your <span style="color:red;">talents.</span></div>
<div class="tit" style="text-align :center;">They for use were made</div>
<div class="tit" style="text-align :center; margin-bottom : 15px;">What`s sundial in the shade.</div>

<div id= "start">Start</div>
</div>


<script type="text/javascript" src="resources/jquery.fullscreen.js"></script>
<script type="text/javascript">
	
	
	$(document).ready(function(){
		$(".tit").textillate({ loop:true, in: { effect: 'fadeIn', shuffle: true }, out: { effect: 'fadeOut', shuffle: false } });
	});	

	$("#start").click(function(){
		location.href = "loginPage";
	});

</script>

	</body>
</html>