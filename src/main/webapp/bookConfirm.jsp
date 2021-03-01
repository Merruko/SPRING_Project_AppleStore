<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>사전예약</title>
<style type="text/css">
.form-signin{
	width: 100%;
    max-width: 330px;
    margin: auto;
    }
</style>
</head>
<body class="text-center">
<jsp:include page="menu.jsp"/>
<main class="form-signin">
  	<form action="confirm.do" method="post">
  	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	    <img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" width="80" height="80" alt="logo">
	    <h1 class="display-5">사전예약</h1>
	    <p class="lead">예약하신 정보를 입력해주세요.</p>
    </div>
    <label for="inputName" class="visually-hidden">Name</label>
    <input type="text" name="name" class="form-control" placeholder="홍길동" required autofocus>
    <label for="inputEmail" class="visually-hidden">Password</label>
    <input type="text" name="email" class="form-control" placeholder="you@example.com" required>
    <div class="checkbox mb-3">
    </div>
    <a href="insertBook.jsp">아직 사전예약을 하지 않으셨다면 클릭!</a>
    <button class="w-100 btn btn-lg btn-primary" type="submit">나의 예약확인</button>
  	</form>
</main>
</body>
</html>