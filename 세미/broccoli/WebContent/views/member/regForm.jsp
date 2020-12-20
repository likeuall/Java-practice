<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>브로콜리 회원가입</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container {
	padding: 16px;
	margin: auto;
	margin-top: 100px;
	width: 480px;
}

#basic input[type=text], #basic input[type=password], #basic input[type=email] {
	width: 98%;
	height:100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

#basic input[type=text]:focus, #basic input[type=password]:focus, #basic input[type=email]:focus
	{
	background-color: #dddddd;
	outline: none;
}

hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 20px;
}

.checkbtn{
	background-color: #4CAF50;
	color: white;
	padding: 15px 15px 10px;
	margin-top: 14px;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.addressbtn {
	background-color: #4CAF50;
	color: white;
	padding: 15px 15px 13px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 98%;
	opacity: 0.9;
}

.registerbtn{
	background-color: #4CAF50;
	color: white;
	padding: 15px 15px 13px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 120%;
	opacity: 0.9;
}


/* 기타 */
#basic td {
	width: 80%;
}

#additional td {
	padding-left: 20px;
}


span {
	font-size: 12px;
	color: mediumseagreen;
}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form action="<%=broccoli %>/member.me" method="post">
					<h2 align="center">회원가입</h2>
					<div align="right">
						<span>*필수입력사항</span>
					</div>
					<hr>
					<table id="basic" style="width:100%;">
						<tr>
							<td>
								<label for="memId"><b>아이디<span>*</span></b></label> 
								<input type="text" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" name="memId" id="memId" required > 
								<div class="id regEx"></div>
                        	</td>
							<td>
								<input type="button" class="checkbtn" id="checkbtn1" value="중복확인"></input>
									<script>
										//ID 유효성검사 
											$(function(){
												
												$("#checkbtn1").click(function(){
													
													var id = $("#memId").val(); 
													if(id == ""){
													 	alert("아이디를 입력해주세요");
														return false;
													 }
													
													//1105 AJAX 중복체크 
													$.ajax({
														url:"idCheck.me",
														type:"get",
														data:{idCheck:$("#memId").val()},
														success:function(result2){
															
																if(result2=="fail"){
																	
																	$(".id.regEx").html("사용할 수 없는 아이디입니다").css("color","red");
																	$("#memId").focus();
																
																}else{
																	
																	var regEx = /^[a-z\d]{6,}$/i;
																	var result1 = regEx.exec(id);
																	
																	if(result1 != null){																
																		$(".id.regEx").html("사용할 수 있는 아이디입니다").css("color","green");
																	}																	
																}
														}
													});
													
												});
												
											});
								</script>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="memName"><b>이름<span>*</span></b></label> 
								<input type="text" placeholder="이름을 입력해 주세요" name="memName" id="memName" required>
								<div class="name regEx"></div>
								<script>
									//이름 유효성확인
									$(function(){
										$("#memName").keyup(function(){
											var regEx = /[가-힣]{2,}/;
											var result = regEx.exec($(this).val());
											if(result!=null){
												$(".name.regEx").html("");
											}else{
												$(".name.regEx").html("한글만 입력가능합니다");
												$(".name.regEx").css("color","red").css("font-size","10px");
											}
										}); 
									});
								</script>
							</td>
							<td></td>
						</tr>
						
						
						<tr>
							<td>
								<label for="memPwd"><b>비밀번호<span>*</span></b></label> 
								<input type="password" placeholder="비밀번호를 입력해주세요" name="memPwd"	id="memPwd" required> 
								<div class="pwd regEx"></div>
								<script>
									//비밀번호유효성확인
									$(function(){
										$("#memPwd").keyup(function(){
											
											var regEx = /^[a-z\d]{8,15}$/i;
											var result = regEx.exec($(this).val());
											
											// 추가 : 비밀번호 규칙 정규식
											// 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
										    // var regEx = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-z]{2,50}).{8,50}$/i;

											
											if(result!=null){
												$(".pwd.regEx").html("유효한 비밀번호입니다").css("color","green");
											}else{
												$(".pwd.regEx").html("영대소문자, 숫자, 8-15자리")
												$(".pwd.regEx").css("color","red").css("font-size","10px");
											}
										});
									});
								</script>
                    		</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<label for="pwdRepeat"><b>비밀번호 확인<span>*</span></b></label>
								<input type="password" placeholder="비밀번호를 한번 더 입력해 주세요" name="pwdRepeat" id="pwdRepeat" required>
								<div class="repwd regEx"></div>
								<script>
								//비밀번호 일치유무  
								$(function(){
									$("#pwdRepeat").keyup(function(){
										if($("#memPwd").val()==$(this).val()){
											$(".repwd.regEx").html("비밀번호가 일치합니다");
											$(".repwd.regEx").css("color","green");
										}else{
											$(".repwd.regEx").html("비밀번호가 일치하지 않습니다");
											$(".repwd.regEx").css("color","red").css("font-size","10px");
										}
									});
								});
								</script>
			                </td>
							<td></td>
						</tr>
			
						<tr>
							<td>
								<label for="email"><b>이메일<span>*</span></b></label> 
								<input type="text" placeholder="예:broccoli@broccoli.com" name="email" id="email" required>
								<div class="email regEx"></div>
							</td>
							<td>
								<button type="button" class="checkbtn" id="checkbtn2">중복확인</button> <br>
								<script>
									//이메일 중복 및 유효성 검사 
									$(function(){
										
										$("#checkbtn2").click(function(){
											
											var email = $("#email").val();
											if(email == ""){
											 	alert("이메일 형식에 맞게 입력해주세요");
												return;
											 }
											
											
											//1105 AJAX 중복체크 
											$.ajax({
												url:"emailCheck.me",
												type:"get",
												data:{emailCheck:$("#email").val()},
												success:function(result2){
													
													if(result2=="fail"){
														
														$(".email.regEx").html("이미 등록된 이메일입니다").css("color","red");
														$("#email").focus();
													
													}else{

														var regEx = /^[a-z\d\_\.]+@[a-z\d\-]+\.[a-z\d\-]+$/i;
														var result1 = regEx.exec(email);
					
														if(result1 != null){
															$(".email.regEx").html("사용할 수 있는 이메일입니다").css("color","green");
														}else{
															$(".email.regEx").html("다시 이메일을 입력해주세요");
															$(".email.regEx").css("color","red").css("font-size","10px");
														}
													}
												}
											});
									});
								});
							</script>
							</td>
						</tr>
						<tr>
							<td>
								<label for="mobile"><b>휴대폰<span>*</span></b></label> 
								<input type="text" placeholder="- 포함해 주세요" name="mobile" id="mobile" required>
								<div class="mobile regEx"></div>
								<script>
									//휴대폰 유효성검사
									$(function(){
										$("#mobile").keyup(function(){
											
											var regEx = /^01([0|1|6|7|8|9]?)[-](\d{3,4})[-](\d{4})$/;
											var result = regEx.exec($(this).val());
			
											if(result!=null){
												$(".mobile.regEx").html("");
											}else{
												$(".mobile.regEx").html("올바르지 않은 형식입니다"); 
												$(".mobile.regEx").css("color","red").css("font-size","10px");
											}
										});
									});
								</script>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<label for="address"><b>주소<span>*</span></b></label>
								<input type="button" class="addressbtn" id="addressbtn" value="주소검색"></input>
								<input type="text" placeholder="우편번호" name="zipcode" id="zipcode">
								<input type="text" placeholder="주소" name="address" id="address">
								<input type="text" placeholder="상세주소" name="addrDetail" id="addrDetail">
								<input type="text" placeholder="참고항목" name="addrExtra" id="addrExtra">
								<!-- 주소검색 버튼 클릭시 다음 주소 API 팝업 -->
								<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								$(function(){
									$("#addressbtn").click(function(){
									    new daum.Postcode({
									        oncomplete: function(data) {
									            
									        	var addr = '';
									        	var extraAddr = '';
									        	
									        	if(data.userSelectedType === 'R'){
									        		addr = data.roadAddress;
									        		
									        	}else{
									        		addr = data.jibunAddress;
									        	}
									        	

								                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								                if(data.userSelectedType === 'R'){
								                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
								                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								                        extraAddr += data.bname;
								                    }
								                    // 건물명이 있고, 공동주택일 경우 추가한다.
								                    if(data.buildingName !== '' && data.apartment === 'Y'){
								                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								                    }
								                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								                    if(extraAddr !== ''){
								                        extraAddr = ' (' + extraAddr + ')';
								                    }
								                    
									                
									                // 회원가입양식에 바로 넣기  (javascript to jquery)
								                    // 조합된 참고항목을 해당 필드에 넣는다.
								                    //document.getElementById("addrExtra").value = extraAddr;
									                $("input[name=addrExtra]").first().val(extraAddr);
								                
								                } else {
								                    //document.getElementById("addrExtra").value = '';
								                    $("input[name=addrExtra]").first().val(extraAddr);
								                }
								                
								                // 우편번호와 주소 정보를 해당 필드에 넣는다.
								                //document.getElementById('zipcode').value = data.zonecode;
								                //document.getElementById("address").value = addr;
								                $("input[name=zipcode]").first().val(data.zonecode);
								                $("input[name=address]").first().val(addr);
								                
								                // 커서를 상세주소 필드로 이동한다.
								                //document.getElementById("addrDetail").focus();
								                $("input[name=addrDetail]").first().focus();
								                
									        }
									    }).open();
										
									})
								})
								</script>

								
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2"><label for="gender"><b>성별</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<input type="radio" name="gender" id="male" value="M"><label for="male"> &nbsp;남자&nbsp;&nbsp;&nbsp; </label> 
								<input type="radio" name="gender" id="female" value="F"><label for="female"> &nbsp;여자&nbsp;&nbsp;&nbsp; </label> 
								<input type="radio" name="gender" id="na" value="NA" checked><label for="na"> &nbsp;선택안함 </label></td>
						</tr>
					</table>
					<hr>
					<table id="additional">
						<tr>
							<th>이용약관<br>동의<span>*</span></th>
							<td>
								<input type="checkbox" id="terms"> <label for="terms">전체 동의합니다</label><br> 
								<input type="checkbox" id="terms1" name="chk"> <label for="terms1">이용약관동의<span>(필수)</span></label>
								<a href="#myModal1" data-toggle="modal">약관보기></a><br>
							 	<input	type="checkbox" id="terms2" name="chk"> 
							 	<label for="terms2">개인정보처리방침 동의 <span>(필수)</span></label>
							 	<a href="#myModal2" data-toggle="modal">약관보기></a><br> 
							 	<input type="checkbox" id="terms3" name="chk"> <label for="terms3">개인정보처리방침 동의 <span>(선택)</span></label> 
							 	<a	href="#myModal3" data-toggle="modal">약관보기></a><br> 
							 	<input type="checkbox" id="terms4" name="chk"> <label for="terms4">본인은 만14세 이상입니다 <span>(필수)</span></label></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th colspan="4"><button type="submit" class="registerbtn">회원가입</button></th>
						</tr>
					</table>
				</form>
				
				
				<script>
					// 전체선택할 수 있는 jquery 
					$(function() {
						$("#terms").click(function() {
							if ($("#terms").prop("checked")) {
								$("input[name=chk]").prop("checked", true);
							} else {
								$("input[name=chk]").prop("checked", false);
							}
						})
					});
					
				</script>
				
				
				
			<div class="col-sm-3"></div>
			
				<!-- Modal -->
				<div class="modal fade" id="myModal1" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">이용약관</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								
							</div>
							<div class="modal-body">

								<div class="txt_view">
									<!--1조-->
									제1조(목적)<br> 이 약관은 주식회사 브로콜리 회사(전자상거래 사업자)가 운영하는 인터넷사이트
									마켓브로콜리(이하 "브로콜리"라 한다)에서 제공하는 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에
									있어 브로콜리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br> *PC통신,
									스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다. <br>
									<br>

									<!--2조-->
									제2조(정의)<br> ① "브로콜리"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게
									제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며,
									아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br> ② "이용자"란 "브로콜리"에 접속하여 이
									약관에 따라 "브로콜리"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br> ③ ‘회원’이라
									함은 "브로콜리"에 회원등록을 한 자로서, 계속적으로 "브로콜리"가 제공하는 서비스를 이용할 수 있는 자를
									말합니다.<br> ④ ‘비회원’이라 함은 회원에 가입하지 않고 "브로콜리"가 제공하는 서비스를 이용하는
									자를 말합니다.<br> ⑤ "휴면회원"이라 함은 "브로콜리"의 ‘회원’중 1년 이상 서비스 이용 기록이
									없는 자를 말합니다. 휴면 회원은 "브로콜리"의 정책에 따라 서비스 이용이 제한 될 수 있으며, 다시 서비스를
									이용하기 위하여는 거래 안전 등을 위하여 "브로콜리"가 정하는 본인확인 절차 등을 이행하여야 올바른 ‘회원’의
									서비스를 이용할 수 있습니다.<br> <br>

									<!--3조-->
									제3조 (약관 등의 명시와 설명 및 개정) <br> ① "브로콜리"는 이 약관의 내용과 상호 및 대표자
									성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함),
									전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알
									수 있도록 브로콜리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수
									있도록 할 수 있습니다.<br> ② "브로콜리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는
									내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는
									팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br> ③ "브로콜리"는「전자상거래 등에서의
									소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」,
									「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」,
									「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br> ④
									"브로콜리"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자
									7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일
									이상의 사전 유예기간을 두고 공지합니다. 이 경우 "브로콜리"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여
									이용자가 알기 쉽도록 표시합니다.<br> ⑤ "브로콜리"가 약관을 개정할 경우에는 그 개정약관은 그
									적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로
									적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의
									공지기간 내에 "브로콜리"에 송신하여 "브로콜리"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
									⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률,
									약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는
									상관례에 따릅니다.
								</div>
								<div class="txt_view">
									<!--4조-->
									제4조(서비스의 제공 및 변경)<br> ① "브로콜리"는 다음과 같은 업무를 수행합니다.<br>
									1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br> 2. 구매계약이 체결된 재화 또는
									용역의 배송<br> 3. 기타 "브로콜리"가 정하는 업무<br> ② "브로콜리"는 재화 또는
									용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을
									변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의
									내용을 게시한 곳에 즉시 공지합니다.<br> ③ "브로콜리"가 제공하기로 이용자와 계약을 체결한 서비스의
									내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한
									주소로 즉시 통지합니다.<br> ④ 전항의 경우 "브로콜리"는 이로 인하여 이용자가 입은 손해를
									배상합니다. 다만, "브로콜리"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
									<br>

									<!--5조-->
									제5조(서비스의 중단)<br> ① "브로콜리"는 컴퓨터 등 정보통신설비의 보수점검/교체 및 고장, 통신의
									두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br> ②
									"브로콜리"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에
									대하여 배상합니다. 단, "브로콜리"가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
									③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는
									"브로콜리"는 제8조에 정한 방법으로 이용자에게 통지하고 당초 "브로콜리"에서 제시한 조건에 따라 소비자에게
									보상합니다. 다만, "브로콜리"가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을
									"브로콜리"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
								</div>
								<div class="txt_view">
									<!--6조-->
									제6조(회원가입) <br> ① 이용자는 "브로콜리"가 정한 가입 양식에 따라 회원정보를 기입한 후 이
									약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br> ② "브로콜리"는 제1항과 같이
									회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br> 1.
									가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한
									회원자격 상실 후 3년이 경과한 자로서 "브로콜리"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
									2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br> 3. 기타 회원으로 등록하는 것이
									"브로콜리"의 기술상 현저히 지장이 있다고 판단되는 경우<br> 4. 회원가입 및 전자상거래상의 계약에
									관한 서비스는 만 14세 이상인자에 한함<br> ③ 회원가입계약의 성립 시기는 "브로콜리"의 승낙이
									회원에게 도달한 시점으로 합니다.<br> ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한
									기간 이내에 "브로콜리"에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br> <br>

									<!--7조-->
									제7조(회원 탈퇴 및 자격 상실 등) <br> ① 회원은 "브로콜리"에 언제든지 탈퇴를 요청할 수 있으며
									"브로콜리"는 회원의 요청을 받았을 경우 사이트를 통하여 "브로콜리"가 고지한 방법에 따라 신속하게 회원탈퇴를
									처리합니다<br> ② 회원이 다음 각 호의 사유에 해당하는 경우, "브로콜리"는 회원자격을 제한 및
									정지시킬 수 있습니다.<br> 1. 가입 신청 시에 타인의 정보 또는 허위의 정보를 입력하거나 가입
									내용에 정보의 누락, 오기가 있는 경우<br> 2. "브로콜리"를 이용하여 구입한 재화 등의 대금, 기타
									"브로콜리"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br> 3. 다른 사람의
									"브로콜리" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br> 4.
									"브로콜리"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br> 5.
									기타 다음과 같은 행위 등으로 "브로콜리"의 건전한 운영을 해하거나 "브로콜리"의 업무를 방해하는 경우<br>
									가. "브로콜리"의 운영과 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 "브로콜리"의 명예를
									실추시키거나 "브로콜리"의 신뢰성을 해하는 경우<br> 나. "브로콜리"의 이용과정에서 직원에게 폭언,
									협박 또는 음란한 언행, 이에 준하는 행동 등으로 "브로콜리"의 운영을 방해하는 경우<br> 다.
									"브로콜리"를 통하여 재화 등을 구매한 후 정당한 이유 없이 상습 또는 반복적으로 취소·반품하여 "브로콜리"의
									업무를 방해하는 경우<br> 라. "브로콜리"를 통해 구입한 상품 또는 용역에 특별한 하자가 없는데도
									불구하고 일부 사용 후 상습적인 취소·전부 또는 일부 반품, 이의 제기 등으로 회사의 업무를 방해하는 경우<br>
									마. "브로콜리"가 본인 확인 절차를 실시할 경우 본인 확인이 되지 않거나 본인이 아님이 확인된 경우<br>
									바. 이미 가입된 "브로콜리"의 회원의 개인정보(이름, 전화번호, 주소 등)와 동일한 경우<br> 사.
									부정한 용도 또는 영리를 추구할 목적으로 서비스를 이용하는 경우<br> 아. 동일/유사한 아이디,
									전화번호, 주소 등의 회원정보를 통하여 부정한 사용을 하는 것으로 의심되는 경우<br> 자.
									"브로콜리"로부터 서비스 제한, 회원 자격 정지 조치 등을 받은 회원이 그 조치기간 중에 이용계약을 임의해지하고
									재이용신청을 하는 경우<br> 차. 무단으로 "브로콜리"의 재화, 용역, 정보를 수집하거나 외부에 제출,
									게시, 이용하여 "브로콜리"의 저작권, 상표권 등 지식재산권을 침해하는 경우<br> 카. 이름, 주소,
									전화번호 등 회원정보를 종합하여 실질적으로 동일인으로 인정되는 기존 회원이 다른 ID로 회원가입 또는 중복가입한
									경우<br> ③ 회원이 제2항에 해당하는 경우, "브로콜리"는 회원에게 제공한 혜택(적립금, 쿠폰 등)을
									회수하거나 서비스 이용 제한(배송 취소 등)의 조치를 취할 수 있습니다.<br> ④ 재판매 목적 등으로
									"브로콜리"에서 재화 등을 중복 구매하는 등 "브로콜리"의 거래질서를 방해하는 경우 "브로콜리"는 당해 회원의
									회원자격을 상실시킬 수 있습니다.<br> ⑤ "브로콜리"가 회원 자격을 제한/정지 시킨 후, 동일한
									행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "브로콜리"는 회원자격을 상실시킬 수
									있습니다.<br> ⑥ "브로콜리"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우
									회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br>
									<br>

									<!--8조-->
									제8조(회원에 대한 통지)<br> ① "브로콜리"가 회원에 대한 통지를 하는 경우, 회원이 "브로콜리"와
									미리 약정하여 지정한 전자우편(또는 우편), 문자, 전화, 팩스 등의 방법으로 할 수 있습니다.<br>
									② "브로콜리"는 불특정다수 회원에 대한 통지의 경우 1주일이상 "브로콜리" 게시판에 게시함으로서 개별 통지에
									갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
								</div>
								<div class="txt_view">
									<!--9조-->
									제9조(구매신청) <br> ① "브로콜리"이용자는 "브로콜리"상에서 다음 또는 이와 유사한 방법에 의하여
									구매를 신청하며, "브로콜리"는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br>
									1. 재화 등의 검색 및 선택<br> 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는
									이동전화번호) 등의 입력<br> 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료 등의 비용부담과
									관련한 내용에 대한 확인<br> 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는
									표시(예, 마우스 클릭)<br> 5. 재화등의 구매신청 및 이에 관한 확인 또는 "브로콜리"의 확인에
									대한 동의<br> 6. 결제방법의 선택<br> ② "브로콜리"가 제3자에게 구매자 개인정보를
									제공/위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를
									받지 않습니다. 이 때 "브로콜리"는 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및
									보유/이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」
									제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br>
									<br>

									<!--10조-->
									제10조 (계약의 성립)<br> ① "브로콜리"는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면
									승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자
									본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br> 1. 신청 내용에
									허위, 기재누락, 오기가 있는 경우<br> 2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화
									및 용역을 구매하는 경우<br> 3. 기타 구매신청에 승낙하는 것이 "브로콜리" 기술상 현저히 지장이
									있다고 판단하는 경우<br> 4. 구매신청 고객이 제7조에 따른 회원 자격이 제한·정지 또는 상실된
									회원으로 확인되었을 경우<br> ② "브로콜리"의 승낙이 제14조제1항의 수신확인통지형태로 이용자에게
									도달한 시점에 계약이 성립한 것으로 봅니다.<br> ③ "브로콜리"의 승낙의 의사표시에는 이용자의 구매
									신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br>
									<br>

									<!--11조-->
									제11조(지급방법)<br> "브로콜리"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의
									방법중 가용한 방법으로 할 수 있습니다. 단, "브로콜리"는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한
									명목의 수수료도 추가하여 징수할 수 없습니다.<br> ① 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종
									계좌이체<br> ② 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br> ③
									온라인무통장입금<br> ④ 전자화폐에 의한 결제<br> ⑤ 수령 시 대금지급<br> ⑥
									마일리지 등 "브로콜리"가 지급한 적립금에 의한 결제<br> ⑦ "브로콜리"와 계약을 맺었거나
									"브로콜리"가 인정한 상품권에 의한 결제<br> ⑧ 기타 전자적 지급 방법에 의한 대금 지급 등<br>
									<br>

									<!--12조-->
									제12조(적립금)<br> ① "브로콜리"는 회원의 구매활동, 이벤트 참여 등에 따라 회원에게 일정한
									적립금을 부여할 수 있습니다.<br> ② 회원은 적립금을 "브로콜리"에서 상품 등의 구매 시 결제
									수단으로 사용할 수 있으며, "브로콜리"는 적립금의 적립기준, 사용방법, 사용기간 및 제한에 대한 사항을 사이트에
									별도로 게시하거나 통지합니다. 적립금의 사용조건에 관한 사항은 "브로콜리"의 정책에 따라 달라질 수 있습니다.<br>
									③ 적립금은 현금으로 환급될 수 없습니다.<br> ④ 회원은 적립금을 제3자에게 또는 다른 아이디로
									양도할 수 없으며, 유상으로 거래하거나 현금으로 전환할 수 없습니다.<br> ⑤ "브로콜리"는 회원이
									"브로콜리"가 승인하지 않은 방법 또는 허위 정보 제공 등의 부정한 방법으로 적립금을 획득하거나 부정한 목적이나
									용도로 적립금을 사용하는 경우 적립금의 사용을 제한하거나 적립금을 사용한 구매신청을 취소하거나 회원 자격을 정지할
									수 있습니다.<br> ⑥ 회원 탈퇴시 미사용한 적립금은 즉시 소멸되며, 탈퇴 후 재가입하더라도 소멸된
									적립금은 복구되지 아니합니다.<br> ⑦ 회원이 구매 또는 이벤트 등으로 받은 적립금을 사용한 후 해당
									적립 원인이 취소(반품)되는 경우 이를 "브로콜리"에 반환하여야 하며 적립금 잔여분이 있는 경우 자동으로 차감
									되거나 또는 적립되는 즉시 해당 적립금이 충족 될 때까지 자동으로 차감됩니다.<br> ⑧ 적립금의
									유효기간은 고지된 바에 따라 특정되며, 유효기간 내에 사용되지 않은 적립금은 해당 유효기간 만료 시 즉시
									소멸됩니다.<br> ⑨ "브로콜리"의 적립금 정책은 제2조의 모든 ‘회원’에게 동일하게 적용됩니다. 단,
									휴면회원의 경우 관계법령에 따라 고지, 처리 등이 제한 될 수 있습니다.<br> <br>

									<!--13조-->
									제13조(할인쿠폰)<br> ① 할인쿠폰은 회원에게 무상으로 발행되는 것으로 "브로콜리"는 회원이
									할인쿠폰을 사이트에서 상품 구매 시 적용할 수 있도록 그 사용대상, 사용방법, 사용기간, 구매가 할인액 등을 정할
									수 있습니다. 할인쿠폰의 종류 또는 내용은 "브로콜리"의 정책에 따라 달라질 수 있습니다.<br> ②
									"브로콜리"는 할인쿠폰의 사용대상, 사용방법, 사용기간, 할인금액 등을 사이트에 별도로 표시하거나 통지합니다.<br>
									③ 할인쿠폰은 현금으로 환급될 수 없으며, 할인쿠폰의 사용기간이 만료되거나 구매 취소 시 또는 이용계약이 종료되면
									소멸됩니다.<br> ④ 회원은 할인쿠폰을 제3자에게 또는 다른 아이디로 양도할 수 없으며, 유상으로
									거래하거나 현금으로 전환할 수 없습니다.<br> ⑤ "브로콜리"는 회원이 "브로콜리"가 승인하지 않은
									방법으로 할인쿠폰을 획득하거나 부정한 목적이나 용도로 할인쿠폰을 사용하는 경우 할인쿠폰의 사용을 제한하거나
									할인쿠폰을 사용한 구매신청을 취소하거나 회원 자격을 정지할 수 있습니다.<br> ⑥ 회원 탈퇴 시
									"브로콜리"로부터 발급받은 할인쿠폰 중 미사용한 할인쿠폰은 즉시 소멸되며, 탈퇴 후 재가입하더라도 소멸된
									할인쿠폰은 복구되지 아니합니다.<br> <br>

									<!--14조-->
									제14조(수신확인통지/구매신청 변경 및 취소)<br> ① "브로콜리"는 이용자의 구매신청이 있는 경우
									이용자에게 수신확인통지를 합니다.<br> ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는
									경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "브로콜리"는 배송 전에 이용자의
									요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제17조의
									청약철회 등에 관한 규정에 따릅니다.<br> <br>

									<!--15조-->
									제15조(재화 등의 공급)<br> ① "브로콜리"는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이
									없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한
									조치를 취합니다. 다만, "브로콜리"가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는
									일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 "브로콜리"는 이용자가 재화 등의 공급 절차 및 진행
									사항을 확인할 수 있도록 적절한 조치를 합니다.<br> ② "브로콜리"는 이용자가 구매한 재화에 대해
									배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "브로콜리"가 약정 배송기간을 초과한
									경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 "브로콜리"가 고의/과실이 없음을 입증한 경우에는
									그러하지 아니합니다.<br> <br>

									<!--16조-->
									제16조(환급)<br> "브로콜리"는 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을
									할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은
									날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br> <br>

									<!--17조-->
									제17조(청약철회 등)<br> ① "브로콜리"와 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래
									등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다
									재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일
									이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에
									달리 정함이 있는 경우에는 동 법 규정에 따릅니다.<br> ② 이용자는 재화 등을 배송 받은 경우 다음
									각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br> 1. 이용자에게 책임 있는
									사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는
									청약철회를 할 수 있습니다)<br> 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히
									감소한 경우<br> 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br>
									4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>
									③ 제2항제2호 내지 제4호의 경우에 "브로콜리"가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수
									있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br>
									④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시/광고 내용과 다르거나 계약내용과 다르게
									이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일
									이내에 청약철회 등을 할 수 있습니다.<br> <br>

									<!--18조-->
									제18조(청약철회 등의 효과)<br> ① "브로콜리"는 이용자로부터 재화 등을 반환받은 경우 3영업일
									이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 "브로콜리"가 이용자에게 재화등의 환급을 지연한때에는
									그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을
									곱하여 산정한 지연이자를 지급합니다.<br> ② "브로콜리"는 위 대금을 환급함에 있어서 이용자가
									신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한
									사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br> ③ 청약철회 등의 경우
									공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. "브로콜리"는 이용자에게 청약철회 등을 이유로
									위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시/광고 내용과 다르거나 계약내용과 다르게
									이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 "브로콜리"가 부담합니다.<br> ④
									이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 "브로콜리"는 청약철회 시 그 비용을 누가 부담하는지를
									이용자가 알기 쉽도록 명확하게 표시합니다.
								</div>
								<div class="txt_view">
									<!--19조-->
									제19조(개인정보보호)<br> ① "브로콜리"는 이용자의 개인정보 수집시 서비스제공을 위하여 필요한
									범위에서 최소한의 개인정보를 수집합니다.<br> ② "브로콜리"는 회원가입시 구매계약이행에 필요한 정보를
									미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의
									특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br> ③ "브로콜리"는 이용자의 개인정보를
									수집/이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.<br> ④ "브로콜리"는
									수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는
									경우에는 이용/제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이
									있는 경우에는 예외로 합니다.<br> ⑤ "브로콜리"가 제2항과 제3항에 의해 이용자의 동의를 받아야
									하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적,
									제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및
									정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이
									동의를 철회할 수 있습니다.<br> ⑥ 이용자는 언제든지 "브로콜리"가 가지고 있는 자신의 개인정보에
									대해 열람 및 오류정정을 요구할 수 있으며 "브로콜리"는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다.
									이용자가 오류의 정정을 요구한 경우에는 "브로콜리"는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>
									⑦ "브로콜리"는 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드,
									은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의
									손해에 대하여 모든 책임을 집니다.<br> ⑧ "브로콜리" 또는 그로부터 개인정보를 제공받은 제3자는
									개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br> ⑨
									"브로콜리"는 개인정보의 수집/이용/제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의
									수집/이용/제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의
									수집/이용/제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br>
									<br>

									<!--20조-->
									제20조("브로콜리"의 의무)<br> ① "브로콜리"는 법령과 이 약관이 금지하거나 공서양속에 반하는
									행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화/용역을 제공하는데 최선을 다하여야
									합니다.<br> ② "브로콜리"는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의
									개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br> ③ "브로콜리"가 상품이나
									용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시/광고행위를 함으로써 이용자가 손해를
									입은 때에는 이를 배상할 책임을 집니다.<br> ④ "브로콜리"는 이용자가 원하지 않는 영리목적의 광고성
									전자우편을 발송하지 않습니다.<br> <br>

									<!--21조-->
									제21조(회원의 ID 및 비밀번호에 대한 의무)<br> ① 제19조의 경우를 제외한 ID와 비밀번호에
									관한 관리책임은 회원에게 있습니다.<br> ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게
									해서는 안됩니다.<br> ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을
									인지한 경우에는 바로 "브로콜리"에 통보하고 "브로콜리"의 안내가 있는 경우에는 그에 따라야 합니다.
								</div>
								<div class="txt_view">
									<!--22조-->
									제22조(이용자의 의무)<br> 이용자는 다음 행위를 하여서는 안 됩니다.<br> 1. 신청
									또는 변경시 허위 내용의 등록<br> 2. 타인의 정보 도용<br> 3. "브로콜리"에 게시된
									정보의 변경<br> 4. "브로콜리"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
									5. "브로콜리" 기타 제3자의 저작권 등 지적재산권에 대한 침해<br> 6. "브로콜리" 기타 제3자의
									명예를 손상시키거나 업무를 방해하는 행위<br> 7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타
									공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br> <br>

									<!--23조-->
									제23조(저작권의 귀속 및 이용제한)<br> ① "브로콜리"가 작성한 저작물에 대한 저작권 기타
									지적재산권은 "브로콜리"에 귀속합니다.<br> ② 이용자는 "브로콜리"를 이용함으로써 얻은 정보 중
									"브로콜리"에게 지적재산권이 귀속된 정보를 "브로콜리"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타
									방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br> ③ "브로콜리"는
									약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br> <br>

									<!--24조-->
									제24조(면책조항)<br> ① "브로콜리"는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를
									제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br> ② "브로콜리"는 회원의
									귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br> ③ "브로콜리"는 회원이
									서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그 밖의 서비스를 통하여 얻은 자료로
									인한 손해에 관하여 책임을 지지 않습니다.<br> ④ "브로콜리"는 회원이 게재한 정보, 자료, 사실의
									신뢰도, 정확성 등 내용에 관해서는 책임을 지지 않습니다.<br> ⑤ "브로콜리"는 회원 간 또는 회원과
									제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임을 지지 않습니다.<br> <br>

									<!--25조-->
									제25조(분쟁해결)<br> ① "브로콜리"는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를
									보상처리하기 위하여 피해보상처리기구를 설치/운영합니다.<br> ② "브로콜리"는 이용자로부터 제출되는
									불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와
									처리일정을 즉시 통보해 드립니다.<br> ③ "브로콜리"와 이용자 간에 발생한 전자상거래 분쟁과 관련하여
									이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시/도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수
									있습니다.<br> <br>

									<!--26조-->
									제26조(재판권 및 준거법)<br> ① "브로콜리"와 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은
									제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만,
									제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>
									② "브로콜리"와 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br> <br>

									<!--부칙-->
									* 부칙<br> 1. 이 약관은 2020년 03월 11일부터 시행됩니다.<br> 2. 2019년
									8월 14일부터 시행되던 종전의 약관은 이 약관으로 대체됩니다.
								</div>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">개인정보수집 이용 동의(필수)</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<div class="box_tbl">
								<table cellpadding="0" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th scope="row">수집 목적</th>
											<th scope="row">수집 항목</th>
											<th scope="row">보유 기간</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>이용자 식별 및 본인여부</td>
											<td rowspan="4">이름, 아이디, 비밀번호, 휴대폰번호, 이메일, 주소</td>
											<td rowspan="4" class="emph">회원 탈퇴 <br>즉시 파기 <br>
												<br>부정이용 방지를 위하여 30일 동안 보관 (아이디, 휴대폰 번호) 후 파기
											</td>
										</tr>
										<tr>
											<td>거점 기반 서비스 제공</td>
										</tr>
										<tr>
											<td>계약 이행 및 약관변경 등의 고지를 위한 연락, 본인의사 확인 및 민원 등의 고객 고충 처리</td>
										</tr>
										<tr>
											<td>부정 이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal3" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">개인정보수집 이용 동의(선택)</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div class="box_tbl">
							<table cellpadding="0" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th scope="row">수집 목적</th>
										<th scope="row">수집 항목</th>
										<th scope="row">보유 기간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>맞춤형 회원 서비스 제공</td>
										<td>성별, 생년월일</td>
										<td class="emph">회원 탈퇴<br> 즉시 파기
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>