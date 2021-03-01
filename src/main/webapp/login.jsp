<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
<style type="text/css">
.form-signin{
	width: 100%;
    max-width: 330px;
    padding: 15px;
    margin: auto;
    }
</style>
</head>
<body class="text-center">
<jsp:include page="menu.jsp"/>
<main class="form-signin">
  	<form action="login.do" method="post">
  	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	    <img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" width="80" height="80" alt="애플사전예약 사이트 로고">
	    <h1 class="display-6">Please sign in</h1>
	    <p class="lead">관리자 전용 로그인 페이지 입니다.</p>
    </div>
	<%
		String error = request.getParameter("error");
		if (error != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("아이디와 비밀번호를 확인해 주세요");
			out.println("</div>");
		}
	%>
    <label for="inputID" class="visually-hidden">ID</label>
    <input type="text" name="id" value="${userVO.id }" class="form-control" placeholder="ID" required autofocus>
    <label for="inputPassword" class="visually-hidden">Password</label>
    <input type="password" name="password" value="${userVO.password }" class="form-control" placeholder="Password" required>
    <div class="checkbox mb-3">
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
  	</form>
</main>
</body>
</html>