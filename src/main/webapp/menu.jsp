<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<body>
<header class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
	<p class="h5 my-0 me-md-auto fw-normal">APPLE STORE 사전예약</p>
	<nav class="my-2 my-md-0 me-md-3">
		<a class="p-2 text-dark" href="welcome.jsp">HOME</a>
		<a class="p-2 text-dark" href="getGoodsList.do">상품소개</a>
		<a class="p-2 text-dark" href="bookConfirm.jsp">사전예약</a>
 		<a class="p-2 text-dark" href="getBoardList.do">이벤트</a>
	<c:choose>
		<c:when test="${empty userName}">
 			<a class="btn btn-outline-primary" href="<c:url value="login.jsp"/>">Admin</a>
  		</c:when>
  		<c:when test="${userName eq '관리자'}">
  			<a class="p-2 text-dark" href="<c:url value="getBookList.do"/>">Admin Page</a>
  			<a class="btn btn-outline-primary" href="<c:url value="logout.do"/>">Sign out</a>
  		</c:when>
  	</c:choose>
	</nav>
</header>
<%@ include file="footer.jsp"%>
</body>
</html>
