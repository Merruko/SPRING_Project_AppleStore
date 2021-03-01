<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="com.apple.biz.board.BoardVO"%>

<%
	List<BoardVO> boardList = (List)session.getAttribute("boardList");
%>

<html>
<head>
<title>이벤트</title>
</head>
<style>
.form-board{
	width: 100%;
    max-width: 800px;
    margin: auto;
    }
 tr ,th{
 	text-align: center;
 }
</style>
<body class="text-center">
<jsp:include page="/menu.jsp"/>
<main class="form-board">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	    <img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" alt="logo" width="80" height="80">
	    <h1 class="display-5">이벤트</h1>
	    <p class="lead">추첨과 선착순 예약을 통해 다양한 혜택을 경험하세요.</p>
    </div>
	<div class="form-group">
		<table class="table table-bordered">
			<tr>
				<th bgcolor="#e6e6e6" width="80">번호</th>
				<th bgcolor="#e6e6e6" width="300">제목</th>
				<th bgcolor="#e6e6e6" width="150">작성자</th>
				<th bgcolor="#e6e6e6" width="150">작성일</th>
			</tr>
			
			<c:forEach items="${boardList }" var="board">
			<tr>
				<td>${board.seq }</td>
				<td align="left"><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
				<td>${board.writer }</td>
				<td>${board.regDate }</td>
			</tr>
			</c:forEach>

		</table>
		<br>
		<c:choose>
		<c:when test="${userName eq '관리자'}">
		<div class="text-right">
		<a class="btn btn-default btn-primary" href="insertBoard.jsp">이벤트 등록</a>
		</div>
		</c:when>
		</c:choose>
	</div>
</main>
</body>
</html>