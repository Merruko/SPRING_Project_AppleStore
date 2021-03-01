<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<style>
	.carousel-inner img {
		width: 100%;
		height: 100%;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
//파일 다운로드
$(function() {
	clickFnc();
	function clickFnc(){
		$.ajax ({
	    	url : 'clock.do',
	        cache : false,
	        success : function (data) {
	        $("#tBox").text(data);
	        },
	        error:function(request,status){
	            console.log(request+"/ "+status);
	        }
	
	    });
	}
	
	timer = setInterval( function () {
		clickFnc();
	}, 1000);
});
</script>
</head>
<body>
	<%@ include file="menu.jsp"%> 
	<%!String greeting = "애플스토어 사전예약 사이트에 오신 것을 환영합니다";%>
	
	<div id="demo" class="carousel slide" data-ride="carousel">

	  <!-- Indicators -->
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  
	  <!-- The slideshow -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="resources/images/main/iPhone 12.jpeg" alt="iPhone 12" width="1100" height="300">
	    </div>
	    <div class="carousel-item">
	      <img src="resources/images/main/iPhone 12 Pro.jpeg" alt="iPhone 12 Pro" width="1100" height="300">
	    </div>
	    <div class="carousel-item">
	      <img src="resources/images/main/MacBookAir.jpeg" alt="MacBookAir" width="1100" height="300">
	    </div>
	  </div>
  
	  <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	  </div>
		<div class="container">
			<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	   			 <h3 class="display-8"><%=greeting%></h3>
				<div class="text-center" id="tBox"></div>
				<br><br>
    		</div>
		</div>
</body>
</html>