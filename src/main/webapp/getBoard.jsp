<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.apple.biz.board.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardVO board = (BoardVO) session.getAttribute("board");
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>이벤트</title>
<style type="text/css">
.form-board{
	width: 100%;
    max-width: 900px;
    padding: 10px;
    margin: 100px auto ;
    }
</style>
<script type="text/javascript">
function button_editEvent(){
	if(confirm("이벤트를 수정하시겠습니까?") == true){
		alert("이벤트를 수정하였습니다!");
		document.edit.submit();
	}else{
		return;
	}
}

function button_deleteEvent(){
	if(confirm("이벤트를 삭제하시겠습니까?") == true){
		alert("이벤트를 삭제하였습니다!");
		location.href = "deleteBoard.do?seq=${board.seq }"; 
	}else{
		return;
	}
}
</script>
</head>
<body class="text-center">
<jsp:include page="/menu.jsp"/>
<main class="form-board">
	<img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" alt="logo" width="80" height="80">
	<h1 class="display-8">이벤트</h1>
	    <p class="lead"> [ ${board.title } ]</p>
		<div class="form-group">
			<div class="text-center">
		<c:choose>
		<c:when test="${userName eq '관리자'}">
		<form name="edit" action="updateBoard.do" method="post">
		<input name="seq" type="hidden" value="${board.seq}"/>
			<table class="table table-bordered">
				<tr>
					<td bgcolor=" #e6e6e6" width="120">제목</td>
					<td colspan="3"><input name="title" type="text" value="${board.title }"/></td>
				</tr>
				<tr>
					<td bgcolor=" #e6e6e6">작성자</td>
					<td width="180">${board.writer }</td>
					<td bgcolor=" #e6e6e6" width="120">작성일</td>
					<td width="180">${board.regDate }</td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea name="content" cols="70" rows="10">${board.content }</textarea><br>
					<img src="resources/images/event/${board.fileName}" width="800"/>
					</td>
				</tr>
		</table>
		<input class="btn btn-default btn-primary" type="button" value="이벤트 수정" onclick="button_editEvent();">&nbsp;&nbsp;&nbsp;
		<a class="btn btn-default btn-primary" onclick="button_deleteEvent();">이벤트 삭제</a>&nbsp;&nbsp;&nbsp;
		<a class="btn btn-default btn-primary" href="getBoardList.do">이벤트 목록</a>
		</form>
		</c:when>
		<c:otherwise>
			<table class="table table-bordered">
				<tr>
					<td bgcolor=" #e6e6e6">작성자</td>
					<td width="180">${board.writer }</td>
					<td bgcolor=" #e6e6e6" width="120">작성일</td>
					<td width="180">${board.regDate }</td>
				</tr>
				<tr>
					<td colspan="4" align="center" height="400">${board.content }<br>
					<br><img src="resources/images/event/${board.fileName}" width="800"/>
					<br>
					</td>
				</tr>
		</table>
		<a class="btn btn-default btn-primary" href="getBoardList.do">이벤트 목록</a>
		</c:otherwise>
		</c:choose>
</div>
</div>
</main>
</body>
</html>