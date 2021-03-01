<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.apple.biz.book.BookVO"%>
<%
	BookVO book = (BookVO) session.getAttribute("book");
%>
<html>
<head>
<title>나의 예약정보</title>
<style type="text/css">
#subContentWrap {
    padding: 50 100px !important;
    width: 1140px;
    display: flex;
    margin: 0 auto;
}
#subContentWrap .subContArea {
    width: 900px;
    vertical-align: top;
}
</style>
</head>
<body class="text-center">
<jsp:include page="menu.jsp"/>
<div id="subContentWrap">
	<div class="subContArea">
	<div class="headingTitleArea">
		<img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" alt="" width="80" height="80" alt="애플사전예약 사이트 로고">
    	<h1 class="display-8">나의 예약정보</h1>
	</div>
	<hr>
	<div class="tabContents">
		<div class="form-group  row">
			<div class="form-group  row">
				<label class="col-sm-2">예약자명</label>
				<div class="col-sm-3">
					<p>${name }
				</div>
			</div>
				<label class="col-sm-2 ">제품</label>
				<div class="col-sm-3">
					<p>${goods }
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">수량</label>
				<div class="col-sm-3">
					<p>${quantity }
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">연락처</label>
				<div class="col-sm-3">
					<p>${contact }
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">Email</label>
				<div class="col-sm-3">
					<p>${email }
				</div>
			</div>
	</div>
	</div>
</div>
</body>
</html>