<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="com.apple.biz.book.BookVO"%>
<%
	BookVO book = (BookVO)session.getAttribute("book");
%> 
<html>
<head>
<title>사전예약 상세보기</title>
<style type="text/css">
/* #subContentWrap {
    padding: 30px 0 100px !important;
    width: 1140px;
    display: flex;
    padding-top: 100px;
    margin: 0 auto;
} */
form{
margin-left: 300px;
margin-right: 300px;
margin-bottom: 300px;
text-align: left;
}
</style>
<script type="text/javascript">
function button_editBook(){
	if(confirm("예약정보를 수정하시겠습니까?") == true){
		alert("예약정보를 수정하였습니다!");
		document.edit.submit();
	}else{
		return;
	}
}

function button_deleteBook(){
	if(confirm("예약정보를 삭제하시겠습니까?") == true){
		alert("예약정보를 삭제하였습니다!");
		location.href = "deleteBook.do?name=${book.name }"; 
	}else{
		return;
	}
}
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h3 class="headingTitle">사전예약 상세보기</h3>
	</div>
	<form name="edit" action="updateBook.do" method="post">
		<hr width="100%">
		<input type="hidden" class="form-control" name="seq" value="${book.seq }">
		<div class="mb-3">
		  <label class="form-label">신청자</label>
		  <input type="text" class="form-control" name="name" value="${book.name }" disabled>
		</div>
	  	<div class="mb-3">
	   		<label class="form-label">제품</label>
	   		<select class="form-control" name="goods">
	    		<option value="${book.goods }">${book.goods }</option>
	    		<option value="iPad">iPad</option>
	    		<option value="Apple Watch Series 6">Apple Watch Series 6</option>
	    		<option value="MacBook Air">MacBook Air</option>
	    		<option value="	AirPods Pro">AirPods Pro</option>
	    		<option value="iPhone12">iPhone12</option>
	    	</select>	
	  	</div>
	  	<div class="mb-3">
	   		<label class="form-label">수량</label>	
	    	<input type="text" class="form-control" name="quantity" value="${book.quantity }">
	  	</div>
		<div class="mb-3">
		  <label class="form-label">연락처</label>
		  <input type="text" class="form-control" name="contact" value="${book.contact }">
		</div>
		<div class="mb-3">
		  <label class="form-label">Email</label>
		  <input type="text" class="form-control" name="email" value="${book.email }">
		</div>
		<div class="mb-3">
		  <label class="form-label">신청일</label>
		  <input type="text" class="form-control" name="regDate" value="${book.regDate }" disabled>
		</div>
		<hr class="my-4">
		<input class="btn btn-default btn-primary" type="button" value="예약정보 수정" onclick="button_editBook();">&nbsp;&nbsp;&nbsp;
		<a class="btn btn-default btn-primary" onclick="button_deleteBook();">예약정보 삭제</a>&nbsp;&nbsp;&nbsp;
		<a class="btn btn-default btn-primary" href="getBookList.do">사전예약 목록</a>
		</form>
	</div>
	</div>
</div>
</body>
</html>