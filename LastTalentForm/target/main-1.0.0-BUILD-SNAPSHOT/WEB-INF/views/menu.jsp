<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
	<title>http://www.blueb.co.kr</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen"/>
	<style>
		body{
			font-family:Arial;
			
		}
		span.reference{
			position:fixed;
			left:10px;
			bottom:10px;
			font-size:12px;
		}
		span.reference a{
			color:#aaa;
			text-transform:uppercase;
			text-decoration:none;
			text-shadow:1px 1px 1px #000;
			margin-right:30px;
		}
		span.reference a:hover{
			color:white;
		}
		ul.sdt_menu{
			margin-top:100px;
		}
		h1.title{
			text-indent:-9000px;
			background:transparent url(resources/title.png) no-repeat top left;
			width:633px;
			height:69px;
		}
		ul.sdt_menu{
	margin:0;
	padding:0;
	list-style: none;
	font-family:"Myriad Pro", "Trebuchet MS", sans-serif;
	font-size:14px;
	width:1280px;
}
ul.sdt_menu a{
	text-decoration:none;
	outline:none;
}
ul.sdt_menu li{
	float:left;
	width:170px;
	height:85px;
	position:relative;
	cursor:pointer;
	padding : 0 22 0 21;
}
ul.sdt_menu li > a{
	position:absolute;
	top:0px;
	left:0px;
	width:170px;
	height:85px;
	z-index:12;
	background:transparent url(resources/images/overlay.png) no-repeat bottom right;
	/* -moz-box-shadow:0px 0px 2px #000 inset;
	-webkit-box-shadow:0px 0px 2px #000 inset;
	box-shadow:0px 0px 2px #000 inset; */
}
ul.sdt_menu li a img{
	border:none;
	position:absolute;
	width:0px;
	height:0px;
	bottom:0px;
	left:85px;
	z-index:100;
	-moz-box-shadow:0px 0px 4px #000;
	-webkit-box-shadow:0px 0px 4px #000;
	box-shadow:0px 0px 4px #000;
}
ul.sdt_menu li span.sdt_wrap{
	position:absolute;
	top:25px;
	left:0px;
	width:170px;
	height:60px;
	z-index:15;
}
ul.sdt_menu li span.sdt_active{
	position:absolute;
	background:white;
	top:85px;
	width:170px;
	height:0px;
	left:0px;
	z-index:14;
	/* -moz-box-shadow:0px 0px 4px #000 inset;
	-webkit-box-shadow:0px 0px 4px #000 inset;
	box-shadow:0px 0px 4px #000 inset; */
}
ul.sdt_menu li span span.sdt_link,
ul.sdt_menu li span span.sdt_descr,
ul.sdt_menu li div.sdt_box a{
	margin-left:15px;
	text-transform:uppercase;
	text-shadow:1px 1px 1px #000;
}
ul.sdt_menu li span span.sdt_link{
	color:black;
	font-size:24px;
	float:left;
	clear:both;
}
ul.sdt_menu li span span.sdt_descr{
	color:black;
	float:left;
	clear:both;
	width:155px; /*For dumbass IE7*/
	font-size:10px;
/* 	letter-spacing:1px;
 */}
ul.sdt_menu li div.sdt_box{
	display:block;
	position:absolute;
	width:170px;
	overflow:hidden;
	height:170px;
	top:85px;
	left:0px;
	display:none;
	background:white;
}
ul.sdt_menu li div.sdt_box a{
	float:left;
	clear:both;
	line-height:30px;
	color:gray;
}
ul.sdt_menu li div.sdt_box a:first-child{
	margin-top:15px;
}
ul.sdt_menu li div.sdt_box a:hover{
	color:white;
}
	</style>
</head>

<body>
<div class="content">
	<ul id="sdt_menu" class="sdt_menu">
		<li>
			<a href="mypage?id=${sessionScope.loginId}">
				<img src="resources/images/2.jpg" alt=""/>
				<span class="sdt_active"></span>
				<span class="sdt_wrap">
					<span class="sdt_link">About me</span>
					<span class="sdt_descr">Get to know me</span>
				</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="resources/images/1.jpg" alt=""/>
				<span class="sdt_active"></span>
				<span class="sdt_wrap">
					<span class="sdt_link">Portfolio</span>
					<span class="sdt_descr">My work</span>
				</span>
			</a>
			<div class="sdt_box">
					<a href="#">Websites</a>
					<a href="#">Illustrations</a>
					<a href="#">Photography</a>
			</div>
		</li>
		<li>
			<a href="#">
				<img src="resources/images/3.jpg" alt=""/>
				<span class="sdt_active"></span>
				<span class="sdt_wrap">
					<span class="sdt_link">Inspiration</span>
					<span class="sdt_descr">Where ideas get born</span>
				</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="resources/images/4.jpg" alt=""/>
				<span class="sdt_active"></span>
				<span class="sdt_wrap">
					<span class="sdt_link">Photos</span>
					<span class="sdt_descr">I like to photograph</span>
				</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="resources/images/5.jpg" alt=""/>
				<span class="sdt_active"></span>
				<span class="sdt_wrap">
					<span class="sdt_link">Blog</span>
					<span class="sdt_descr">I write about design</span>
				</span>
			</a>
		</li>
		<li>
			<a href="#">
				<img src="resources/images/6.jpg" alt=""/>
				<span class="sdt_active"></span>
				<span class="sdt_wrap">
					<span class="sdt_link">Projects</span>
					<span class="sdt_descr">I like to code</span>
				</span>
			</a>
			<div class="sdt_box">
				<a href="#">Job Board Website</a>
				<a href="#">Shopping Cart</a>
				<a href="#">Interactive Maps</a>
			</div>
		</li>
	</ul>
</div>

<!-- The JavaScript -->
<script type="text/javascript" src="resources/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="resources/jquery.easing.1.3.js"></script>
<script type="text/javascript">
	$(function() {
		$('#sdt_menu > li').bind('mouseenter',function(){
			var $elem = $(this);
			$elem.find('img')
				 .stop(true)
				 .animate({
					'width':'170px',
					'height':'170px',
					'left':'0px'
				 },400,'easeOutBack')
				 .andSelf()
				 .find('.sdt_wrap')
				 .stop(true)
				 .animate({'top':'140px'},500,'easeOutBack')
				 .andSelf()
				 .find('.sdt_active')
				 .stop(true)
				 .animate({'height':'170px'},300,function(){
				var $sub_menu = $elem.find('.sdt_box');
				if($sub_menu.length){
					var left = '170px';
					if($elem.parent().children().length == $elem.index()+1)
						left = '-170px';
					$sub_menu.show().animate({'left':left},200);
				}	
			});
		}).bind('mouseleave',function(){
			var $elem = $(this);
			var $sub_menu = $elem.find('.sdt_box');
			if($sub_menu.length)
				$sub_menu.hide().css('left','0px');
			
			$elem.find('.sdt_active')
				 .stop(true)
				 .animate({'height':'0px'},300)
				 .andSelf().find('img')
				 .stop(true)
				 .animate({
					'width':'0px',
					'height':'0px',
					'left':'85px'},400)
				 .andSelf()
				 .find('.sdt_wrap')
				 .stop(true)
				 .animate({'top':'25px'},500);
		});
	});
</script>
</body>
</html>