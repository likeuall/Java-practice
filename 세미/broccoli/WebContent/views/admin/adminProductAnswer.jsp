<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.product.model.vo.*" %>    
<%
	ProductQna pq = (ProductQna)request.getAttribute("pq");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>상품문의답변달기</title>
  <!-- 대쉬보드에서 쓸 공통 css -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <!-- 엔딩 :  대쉬보드에서 쓸 공통 css --> 
  <style>
    .outer{
        width: 1200px;
        margin: auto;
      }
      #pAnswerForm{text-align: center;}
  </style>           
</head>
<body>
    
    <!--  대쉬보드 추가 -->
	<%@ include file="adminNav.jsp" %>
    
    <div class="outer" style="margin-left: 300px; margin-top: 50px;">
        <button onclick="history.back();">&lt; 이전 화면</button>
        <h3>상품 문의 답변 달기</h3>

        <form action="" method="POST">

            <table id="pAnswerForm" border="1">
                <tr>
                    <td>번호</td>
                    <td> 문의번호</td>
                    <td>상품번호</td>
                    <td><%= pq.getpNo() %></td>
                </tr>
                <tr>
                    <td>업체명</td>
                    <td>**식품</td>
                    <td>작성자</td>
                    <td><%= pq.getMemNo() %></td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td><%= pq.getpName() %></td>
                    <td>작성일</td>
                    <td><%= pq.getQnaDate() %></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td colspan="3"><%= pq.getQnaTitle() %></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="5">
                       <%= pq.getQnaDetail() %>
                    </td> 
                </tr>
                <tr>
                    <td>이미지</td>
                    <td></td>
                    <td>첨부파일</td>
                    <td></td>
                </tr>
                <tr>
                    <td>답변</td>
                    <td colspan="5"><textarea id="pAnswer" cols="50" rows="10" style="resize: none;"><%= pq.getQnaAnswer() %></textarea></td>
                </tr>
            </table>
            <br>
            <button type="reset" class="btn btn-danger btn-sm" style="margin-left: 100px;">취소</button>
            <button type="submit" class="btn btn-primary btn-sm" style="margin-left: 50px;">완료</button>
         </form>
    </div>
</body>
</html>