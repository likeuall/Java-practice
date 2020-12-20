<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member findId = (Member) session.getAttribute("findId");
%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 성공</title>
<% %>
<style>
.container {
	padding: 16px;
	margin: auto;
	margin-top: 100px;
	width: 480px;
}

.form-group input[type=text], .form-group input[type=password], .form-group input[type=email] {
	width: 98%;
	height:100%;
	padding: 15px;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

.form-group input[type=text]:focus, .form-group input[type=password]:focus, .form-group input[type=email]:focus
	{
	background-color: #dddddd;
	outline: none;
}

.result2{
	font-weight: 800;
	font-size: 15px;
	color:green;
}

.btn-dark, .btn-success {
	color: white;
    height: 54px;
    margin-bottom: 10px;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.form-group, .login-search {
	font-size: 12px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
		  <h2 align="center">아이디 찾기</h2><br>
			  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
			  <div class=icon align="center"><i class='fas fa-address-card' style='font-size:48px;color:mediumseagreen'></i></div>
			  <div class="result result1" align="center">
			   	 고객님의 <br> 아이디 찾기가 완료되었습니다. 
			  </div>
			  <div class="result result2" align="center">
			     	아이디 : <%=findId.getMemId()%>
			  </div><br>
			  
			  <!-- 별표처리하기  -->
			  <script>
			  	$(function(){
			  		
			  		var str = $(".result2").children()
			  		
			  		$view['name'] = str;
			  		mb_internal_encoding(mb_detect_encoding($view['name'],'UTF-8,EUC-KR'));
			  		echo ($len=mb_strlen($view['name']))>2 ? mb_substr($view['name'],0,1).str_repeat('*',$len-2).mb_substr($view['name'],-1,1) : $view['name']; 
			  		


			  	});
			  </script>
			    <button type="submit" class="btn btn-success" id="loginPage">로그인하기</button>
			    <script>
			    	$(function(){
			    		$("#loginPage").click(function(){
			    			location.href="<%=broccoli%>/login.me";
			    		})
			    	})
			    </script>
		</div>
		<div class="col-sm-4"></div>
	</div>
</div>

<%@ include file="../common/footer.jsp"%>
</body>
</html>