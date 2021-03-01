<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="com.apple.biz.book.BookVO"%>
<%
	List<BookVO> bookList = (List)session.getAttribute("bookList");
%> 
<html>
<head>
<title>사전예약 관리</title>
<style type="text/css">
#subContentWrap {
    padding: 20px 0 100px !important;
    width: 1140px;
    display: flex;
    padding-top: 50px;
    margin: 0 auto;
}
</style>
</head>
<body class="text-center">
<jsp:include page="menu.jsp"/>
<div id="subContentWrap">
	<div class="subContArea">
	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	    <img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" alt="" width="80" height="80" alt="애플사전예약 사이트 로고">
	    <h1 class="display-4">사전예약 현황</h1>
    </div>
	<hr>
	<div class="tabContents">
	<table class="table table-bordered">
			<tr align="center">
				<th bgcolor="#e6e6e6" width="80">no.</th>
				<th bgcolor="#e6e6e6" width="100">신청자</th>
				<th bgcolor="#e6e6e6" width="350">제품</th>
				<th bgcolor="#e6e6e6" width="80">수량</th>
				<th bgcolor="#e6e6e6" width="200">연락처</th>
				<th bgcolor="#e6e6e6" width="250">Email</th>
				<th bgcolor="#e6e6e6" width="200">신청일</th>
			</tr>
			<c:forEach items="${bookList }" var="book">
			<tr align="center">
				<td>${book.seq }</td>
				<td><a href="getBook.do?name=${book.name }">${book.name }</a></td>
				<td align="left">${book.goods }</td>
				<td>${book.quantity }</td>
				<td>${book.contact }</td>
				<td align="left">${book.email }</td>
				<td>${book.regDate }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</div>
</div>
</body>
</html>