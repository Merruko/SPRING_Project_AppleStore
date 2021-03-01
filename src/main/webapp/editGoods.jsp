<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.apple.biz.goods.GoodsVO"%>
<%
	GoodsVO goods = (GoodsVO) session.getAttribute("goods");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<title>상품수정 페이지</title>
<script type="text/javascript">
function button_editGoods(){
	if(confirm("상품정보를 수정하시겠습니까?") == true){
		alert("상품정보를 수정하였습니다!");
		document.edit.submit();
	}else{
		return;
	}
}

function button_deleteGoods(){
	if(confirm("상품정보를 삭제하시겠습니까?") == true){
		alert("상품정보를 삭제하였습니다!");
		location.href = "deleteGoods.do?gId=${goods.gId }"; 
	}else{
		return;
	}
}
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<div class="container">
		<form name="edit" action="updateGoods.do" class="form-horizontal" method="post" enctype ="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-1">상품 코드</label>
				<div class="col-sm-4">
					<input type="text" id ="productId" name="gId" class="form-control" value="${goods.gId }" disabled>
				</div>
			</div>
			<p><div class="form-group row">
				<label class="col-sm-1">상품명</label>
				<div class="col-sm-4">
					<input type="text" id ="name" name="gName" class="form-control" value="${goods.gName }">
				</div>
			</div>
			<p><div class="form-group row">
				<label class="col-sm-1">가격</label>
				<div class="col-sm-4">
					<input type="text" id ="unitPrice" name="price" class="form-control" value="${goods.price }">
				</div>
			</div>
			<p><div class="form-group row">
				<label class="col-sm-1">분류</label>
				<div class="col-sm-4">
					<input type="text" name="category" class="form-control" value="${goods.category }" >
				</div>
			</div>
			<p><div class="form-group row">
				<label class="col-sm-1">상세 정보</label>
				<div class="col-sm-4">
					<textarea name="info" cols="50" rows="2"
						class="form-control">${goods.info }</textarea>
				</div>
			</div>
			<br>
			<div>
			<input type="button" class="btn btn-primary btn" value="수정하기 &raquo;" onclick="button_editGoods();">&nbsp;
			<a class="btn btn-info" onclick="button_deleteGoods();">삭제하기 &raquo;</a>
			<a href="getGoodsList.do" class="btn btn-secondary"> 상품 목록 &raquo;</a>
			</div>
		</form>
	</div>
</body>
</html>