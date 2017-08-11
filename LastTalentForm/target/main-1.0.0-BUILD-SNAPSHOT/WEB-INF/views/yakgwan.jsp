<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>Insert title here</title>
		<style>
			
		</style>
	</head>
	<body>
	<p class="ua"><input type="checkbox" id="uaAll" 
	
	onclick="CheckAll()"> <label for="uaAll">넥슨 서비스 이용약관, 개인정보 수집 및 이용에 <span>모두 동의</span>합니다.</label></p>
		<div class="uaCnts">
            <input id="ucAgreement_chkUa1" type="checkbox" name="del_unit[]"> 
            <label for="ucAgreement_chkUa1">탤런트팜 서비스 이용약관 동의 <span>(필수)</span></label></p>
            <iframe class="uaTxt" frameborder="0" src="/html/stipulation/service.html" title="넥슨 서비스 이용약관"></iframe>
		</div>
		</p>
		<img id="btn-show-checked" src="https://ssl.nx.com/S2/membership/2011/button/bt_agree.gif" width="115" height="39" alt="동의">
		<img id="reset" src="https://ssl.nx.com/S2/membership/2011/button/bt_cancel.gif" width="115" height="39" alt="취소">
     
	
	




	</body>
	<script>
	$(function() {
		 
	    $("#btn-show-checked").click(function() {
	    	var chk1=document.frmJoin.U_checkAgreement1.checked;
        	var chk2=document.frmJoin.U_checkAgreement2.checked;	
	    	console.log(yn);
	       if(yn=='y'){
	    	   location.href = "joinForm";
	       }else{
	    	   alert("약관에 동의하지 않았습니다.");
	       }
	    });
	    $("#reset").click(function(){
	    	location.href = "./loginPage";
	    });
	    
	});
	var check = false;
	function CheckAll(){
		var chk = document.getElementsByName("del_unit[]");
		if(check == false){
			check = true;
			for(var i=0; i<chk.length;i++){                                                                    
				chk[i].checked = true;
			}
		}else{
			check = false;	
			for(var i=0; i<chk.length;i++){                                                                    
				chk[i].checked = false;     //모두 해제
			}
		}	
	}
	</script>
</html>