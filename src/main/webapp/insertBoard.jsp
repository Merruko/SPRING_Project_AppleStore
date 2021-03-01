<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<meta charset="UTF-8">
<title>이벤트 등록</title>
<style>
.form-board{
	width: 100%;
    max-width: 800px;
    padding: 15px;
    margin: auto;
    }
</style>
<script type="text/javascript">
function button_newEvent(){
	if(confirm("새로운 이벤트를 등록하시겠습니까?") == true){
		alert("이벤트가 게시완료!");
		document.board.submit();
	}else{
		return;
	}
}
</script>
</head>
<body class="text-center">
<jsp:include page="menu.jsp"/>
<main class="form-board">
    <h1 class="h3 mb-3 fw-normal">EVENT</h1>
	<div class="form-group">
		<div class="text-center">
			<form name="board" action="insertBoard.do" method="post" enctype="multipart/form-data">
				<table class="table table-bordered">
				<tr>
					<td bgcolor="#e6e6e6" width="100">제목</td>
					<td align="left"><input name="title" type="text" size="80" /></td>
				</tr>
				<tr>
					<td bgcolor="#e6e6e6">작성자</td>
					<td align="left"><input name="writer" type="text" size="80"/></td>
				</tr>
			
				<tr>
					<td bgcolor="#e6e6e6" style="padding-top: 100px;">내용</td>
					<td align="left"><textarea name="content" cols="80" rows="10"></textarea></td>
				</tr>
				<tr>
					<td bgcolor="#e6e6e6">파일첨부</td>
			    	<td align="left"><input type="file" class="form-control-file border" name="file"></td>
				</tr>
				</table>
				<div class="text-right">
					<input class="btn btn-default btn-primary" type="submit" onclick="button_newEvent();" value="이벤트 등록">
					<input class="btn btn-default btn-primary" type="reset" value="다시쓰기">
					<a class="btn btn-default btn-primary" href="getBoardList.do">이벤트 목록</a>
				</div>
			</form>
		</div>
	</div>
</main>
</body>
</html>