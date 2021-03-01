<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>사전예약</title>
<style type="text/css">
form{
margin-left: 300px;
margin-right: 300px;
margin-bottom: 300px;
}
</style>
<script type="text/javascript">
function button_book(){
	if(confirm("사전예약을 신청하시겠습니까?") == true){
		alert("감사합니다. 사전예약이 완료되었습니다:)");
		document.book.submit();
	}else{
		return;
	}
}
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<main class="bg-light" >
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	    <img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" alt="logo" width="80" height="80">
	    <h1 class="display-5">사전예약</h1>
	    <p class="lead">사은품 제공 및 이벤트 혜택이 있으므로 이벤트 게시판을 통해 많은 참여부탁드립니다.</p>
    </div>
		<form name="book" action="insertBook.do" method="post">
		<input type="hidden" name="id" value="${userId }">
	  	<div class="mb-3">
	   		<label for="InputGoods" class="form-label">사전예약 제품</label>	
	    	<select class="form-control" name="goods">
	    		<option value="">원하시는 제품을 선택하세요.</option>
	    		<option value="iPad">iPad</option>
	    		<option value="Apple Watch Series 6">Apple Watch Series 6	</option>
	    		<option value="MacBook Air">MacBook Air</option>
	    		<option value="	AirPods Pro">AirPods Pro</option>
	    		<option value="iPhone12">iPhone12</option>
	    	</select>
	  	</div>
	  	<div class="mb-3">
	   		<label for="InputQuantity" class="form-label">수량</label>	
	    	<input type="text" class="form-control" name="quantity" placeholder="숫자만 입력하세요">
	  	</div>
	  	
		<div class="mb-3">
		  <label for="name" class="form-label">신청자</label>
		  <input type="text" class="form-control" name="name" placeholder="홍길동">
		</div>
		<div class="mb-3">
		  <label for="name" class="form-label">연락처</label>
		  <input type="text" class="form-control" name="contact" placeholder="'-'을 포함하여 입력하세요">
		</div>
		<div class="mb-3">
		  <label for="email" class="form-label">Email</label>
		  <input type="text" class="form-control" name="email" placeholder="you@example.com">
		</div>
		<hr class="my-4">
		<input class="w-100 btn btn-primary btn-lg" type="button" value="사전예약 신청하기" onclick="button_book();">
		</form>
</main>
</body>
</html>