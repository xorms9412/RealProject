<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<link rel="stylesheet" href="resources/css/hi.css">

		
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>카테고리 선택</title>
	
   <!--  
   	<script type="text/javascript">
        $(document).ready(function(){
          
          //페이지 열리때 checkbox초기화 
          $('input[type=checkbox]').prop("checked",false);

          /* CheckBox image */
          $('.chkbox img').click(function () {

            //체크 박스의 체크 유무를 확인하기 위해 checked값을 얻어옴.
            var isChecked = $(this).parent().find('input[type=checkbox]').prop("checked"); 
            console.log(isChecked); //boolean값으로 true, false    

            //현재의 체크 상태의 반대값을 저장( true이면 false로 )
            isChecked = !isChecked;
            
            //체크박스의 체크상태와 체크박스 이미지 변경 
            $(this).parent().find('input[type=checkbox]').prop("checked", isChecked);
            $(this).attr("src", "resources/img/chkbox_" + isChecked + ".png");
          });

        });
    </script>
     -->
     
     <style>
		.highlight{
			border : 3px solid red;
		}
		
		body{
			background-color: #f8f8f8;
		}
		
		#main_category{
			position: relative;
			margin :0 auto;
			width: 750px;
   			height: 610px;
   			top:70px;
   			background-color: white;
   			box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
		}
		
		#category_list{
			position: relative;
			left:5px;
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
		  background: white;
		  position: relative;
		  width:90px;
		  height: 45px;
		  top:145px;
		  left:640px;
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
		
		#category_ok{
			position: relative;
			top:0px;
			left:10px;
		}
		
	</style>
</head>
<body>
<jsp:include page="upbar.jsp"/>

<!-- 
    <div class="wrap_chkbox">
        <div class="chkbox">
          <input type="checkbox" name="chk" id="chk"/>
          <img src="https://s-media-cache-ak0.pinimg.com/400x/cb/c9/98/cbc998a86208ae4df3b8cae5ce109275.jpg" />
        </div>
        <p>체크 박스 모양 변경</p>
    </div>
    <button onclick="next()">확인</button> -->
    
 	<div id="main_category">
    <h1>카테고리 선택</h1>
    <h2>최대 <span style="color : red;">5</span>개까지 선택 가능 합니다</h2>
    
     <div id="category_list">
    <div class="_3MLvK _3Eqb6">
    	<div style="height : 500px">
    		<div class="_tr _2a" style="height : 500px">
    			<!-- react-empty: 24 -->
    			<div class="_ts _2c _tt"  data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(0px) translateY(0px); width: 136px;">
    				<div>
					    <button aria-pressed="false"  class="CoGGB _2ErzO">
					    	<div class="_8C6AR">
					    		<div class="_3rkxP">
					    			<div class="_1ya97" id="manstyle" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/ec/50/45/ec50459ed005769b27e00bfd5a97e625.jpg&quot;);">
					    				<div class="CRcyx">
					    					<div class="_1t--X _3DBIo">
					    						<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">남성스타일</div>
					    					</div>
					    				</div>
					    			</div>
					    		</div>
					    	</div>
					    </button>
					 </div>
				</div>
				
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(150px) translateY(-136px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="wood" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/a1/a3/c0/a1a3c0191f64679f0e014e36a3840593.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">목재</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(300px) translateY(-272px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="food" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/e9/3c/98/e93c98fb4c5ff69680b504586896e52f.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">음식</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(450px) translateY(-408px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="photo" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/76/22/5b/76225b3c2d672b5ddb6afc0bc5724488.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">사진</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(600px) translateY(-544px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="trip" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/e8/99/9f/e8999facf7cb7045c4ec767ab77fa76a.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">여행</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(0px) translateY(-530px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="art" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/b2/72/b2/b272b24af4ed6ec8fa75bf7e2f198b47.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">그림</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(150px) translateY(-666px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="star" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/13/68/cf/1368cf182822a07f04601330c98159a6.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">유명인,연예인</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(300px) translateY(-802px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="book" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/14/10/89/141089c1fd5ddb33f19bd92e3911442c.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">책</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(450px) translateY(-938px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="sports" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/85/81/a4/8581a41efcdee223c0d7eb2577636233.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">운동</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(600px) translateY(-1074px); width: 136px;">
					<div>
						<button aria-pressed="false" class="CoGGB _2ErzO">
							<div class="_8C6AR">
								<div class="_3rkxP">
									<div class="_1ya97" id="alcohol" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/53/43/65/53436500af6ea99be8b35b1d90f1478d.jpg&quot;);">
										<div class="CRcyx">
											<div class="_1t--X _3DBIo">
												<div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">주류,칵테일</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</button>
					</div>
				</div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(0px) translateY(-1063px); width: 136px;"><div><button aria-pressed="false" class="CoGGB _2ErzO"><div class="_8C6AR"><div class="_3rkxP"><div class="_1ya97" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/e5/a0/2a/e5a02a23acf91d35e4951426518a1487.jpg&quot;);" id="design"><div class="CRcyx"><div class="_1t--X _3DBIo"><div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">디자인</div></div></div></div></div></div></button></div></div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(150px) translateY(-1199px); width: 136px;"><div><button aria-pressed="false" class="CoGGB _2ErzO"><div class="_8C6AR"><div class="_3rkxP"><div class="_1ya97" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/42/9e/a9/429ea92b4c9ed2bb66c26195ab03754f.jpg&quot;);" id="IT"><div class="CRcyx"><div class="_1t--X _3DBIo"><div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">IT</div></div></div></div></div></div></button></div></div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(300px) translateY(-1334px); width: 136px;"><div><button aria-pressed="false" class="CoGGB _2ErzO"><div class="_8C6AR"><div class="_3rkxP"><div class="_1ya97" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/eb/d6/45/ebd645aa75f458e3a63958c8873b8f8a.jpg&quot;);" id="consulting"><div class="CRcyx"><div class="_1t--X _3DBIo"><div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">컨설팅</div></div></div></div></div></div></button></div></div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(450px) translateY(-1470px); width: 136px;"><div><button aria-pressed="false" class="CoGGB _2ErzO"><div class="_8C6AR"><div class="_3rkxP"><div class="_1ya97" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/7b/ae/c8/7baec831b14b27e778c85a03c51938be.jpg&quot;);"><div class="CRcyx"><div class="_1t--X _3DBIo"><div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">여성패션</div></div></div></div></div></div></button></div></div>
				<div class="_ts _2c _tt" data-grid-item="true" style="top: 0px; left: 0px; transform: translateX(600px) translateY(-1606px); width: 136px;"><div><button aria-pressed="false" class="CoGGB _2ErzO"><div class="_8C6AR"><div class="_3rkxP"><div class="_1ya97" style="background-image: url(&quot;https://s-media-cache-ak0.pinimg.com/400x/20/da/c8/20dac80facf9036915a9cad0e681ea2d.jpg&quot;);" id="marketing"><div class="CRcyx"><div class="_1t--X _3DBIo"><div class="_sk _sj _sl _sc _56 _sd _nj _nk _nl _nm">마케팅</div></div></div></div></div></div></button></div></div>
			</div>
		</div>
	</div>

	<div id="category_ok">
		<section class="links">
			<nav class="link-effect-10" id="link-effect-10">
				<a href="#" onclick="go()" data-hover="확 인"><span>확 인</span></a>
			</nav>
		</section>
	</div>
		
    <script>
    	var catdata = new Array();
    	var chcnt = 0;
		$("._1ya97").click(function(e){
			console.log(e.currentTarget.innerText);
			console.log(e.currentTarget.id); 
			$(this).toggleClass("highlight");
			var className =  $(this).attr('class');

			if(className=="_1ya97 highlight"){
				catdata.push(e.currentTarget.id);
				chcnt ++;
			}else{
				catdata.splice(catdata.indexOf(this.id),1);
				chcnt --;
			}
			if(chcnt>5){
				alert("최대 5개까지 선택 가능합니다.");
				catdata.pop();
				$(this).removeClass("highlight");
				chcnt--;

			}
			/* console.log(className); */
			console.log(chcnt);
			console.log(catdata);
		});
		var i = 0;
		function go(){
			if(chcnt<=5){
				var url = "./mainlist?";
				if(catdata.length==1){
					url += "catone="+catdata[0]+"&chcnt="+chcnt;
				}else if(catdata.length==2){
					url += "catone="+catdata[0]+"&cattwo="+catdata[1]+"&chcnt="+chcnt;
				}else if(catdata.length==3){
					url += "catone="+catdata[0]+"&cattwo="+catdata[1]+"&catthree="+catdata[2]+"&chcnt="+chcnt;
				}else if(catdata.length==4){
					url += "catone="+catdata[0]+"&cattwo="+catdata[1]+"&catthree="+catdata[2]+"&catfour="+catdata[3]+"&chcnt="+chcnt;
				}else if(catdata.length==5){
					url += "catone="+catdata[0]+"&cattwo="+catdata[1]+"&catthree="+catdata[2]+"&catfour="+catdata[3]+"&catfive="+catdata[4]+"&chcnt="+chcnt;
				}
				
				location.href= url;
			}
		};

    </script>
</body>


</html>