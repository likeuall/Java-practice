<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>브로콜리 관리자 대쉬보드 메뉴바</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 대쉬보드에서 쓸 공통 css -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<!-- 엔딩 :  대쉬보드에서 쓸 공통 css --> 

  <!-- 사이드바 css -->
  <link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">


  <style>
  
/* 전체구조 */
  .all{width:1000px; height:800px; box-sizing: border-box;}
  .all div{width:100%;}
  .header{height:15%;}
  .neck{height:10%}
  .nav{height:5%}
  .body{height:60%; background-color:#f2f2f2;}
  .footer{height:10%}

/* 컨텐츠구조 */
  .header > #searchA{width:30%; float:left;}
  .header > #searchB{width:40%; float: right;}
  .nav > div{padding:5px; text-align: center;}
  .nav > #orderNo{width:25%; float: left;}
  .nav > #mem_Id{width:25%; float: left;}
  .nav > #payDay{width:25%; float:left;}
  .nav > #shipping{width:25%; float: left;}
  .nav > h4{margin: 10px;}
  .nav > tr {width:100%;}
  .body> tr {width:100%;}
  


/* 폼 버튼(submit) */
  form button{
    color:green;
    margin: auto;
  }
  .list-area{
    background-color:#f2f2f2;
    width:100%;
    height:70%;
  }
  .list-area thead tr th{
    padding:10px;
    text-align: center;
  }
  tbody tr td{
    text-align: center;
    padding:10px;
  }
  tbody tr #title:hover{
      background-color: honeydew;
      cursor: pointer;
  }

  </style>
</head>
<body>

    
    <%@ include file="adminNav.jsp" %>


    <br>

    <form action="paymentManage.admin" method="POST">

    <div class=all style="margin-left: 300px;">

    <div class="outer1">
      <h3 id="titleText" style="float: left;">구매 및 결제내역관리 </h3>        

    </div>

    
      <select name="select" id="option" style="float: right; margin-top: 25px;" > 
          <option><a href="paymentManage.admin">전체조회</a></option>
          <option><a href="paymentDetail.admin">상세조회</a></option>
      </select>  
    <br><br>
    <hr>
     
    <br>
    
    
    <div class="header" >

      <!-- 조회기간 및 검색기능 -->
      <div id="searchA">
         조회기간 : <input type="text" value="결제일" style="text-align: right;" disabled> 
        </div>
        <div id="searchB">
          <input type="date" name="startDate"> ~ <input type="date" name="endDate">
      </div>
      <br>
      <p style="text-align: right; font-size: x-small;">*최근 1년이내에 조회할 수 있습니다.</p>    
    </div>
    
    <div class="neck">
      상세조건 : <select name="condition">
        <option value="select.*">전체</option>
        <option value="mem_Id">구매자ID</option>
        <option value="order_No">주문번호</option>
      </select>
      <button type="submit" class="btn btn-success btn-sm">검색</button>
    <br>


    </div>
    <table class="list-area">
      <thead>
          <tr>
              <th width="100">글번호</th>
              <th width="400">제목</th>
              <th width="200">작성자</th>
              <th width="100">조회수</th>
              <th width="150">작성일</th>
              <th width="200">처리일시</th>
              <th width="100">ID</th>
          </tr>
      </thead>
       <tbody>



          <!--2. 조회결과가 있을 경우 -->

          <tr>
              <td >2</td>
              <td id="title">공지사항제목입니다.</td>
              <td>admin</td>
              <td>37</td>
              <td>2020-10-20</td>
              <td>2020-09-01</td>
              <td>user01</td>
          </tr>
          <tr >
              <td>1</td>
              <td id="title">사이트 열었어요.</td>
              <td>admin</td>
              <td>1523</td>
              <td>2020-01-01</td>
              <td>2020-09-01</td>
              <td>user01</td>
          </tr>
          <tr>
            <td>1</td>
            <td id="title">사이트 열었어요.</td>
            <td>admin</td>
            <td>1523</td>
            <td>2020-01-01</td>
            <td>2020-09-01</td>
            <td>user01</td>
          </tr>
          <tr>
            <td>1</td>
            <td id="title">사이트 열었어요.</td>
            <td>admin</td>
            <td>1523</td>
            <td>2020-01-01</td>
            <td>2020-09-01</td>
            <td>user01</td>
        </tr>
        <tr>
            <td>1</td>
            <td id="title">사이트 열었어요.</td>
            <td>admin</td>
            <td>1523</td>
            <td>2020-01-01</td>
            <td>2020-09-01</td>
            <td>user01</td>
        </tr>
        <tr>
            <td>1</td>
            <td id="title">사이트 열었어요.</td>
            <td>admin</td>
            <td>1523</td>
            <td>2020-01-01</td>
            <td>2020-09-01</td>
            <td>user01</td>
        </tr>
      </tbody>
  </table>
      
     
    
    
  </div>
    

</form>
</body>
</html>