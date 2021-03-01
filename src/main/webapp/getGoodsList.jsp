<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.apple.biz.goods.GoodsVO"%>
<%@page import="com.apple.biz.goods.impl.GoodsDAO"%>

<%-- <%
	List<GoodsVO> goodsList = (List)session.getAttribute("goodsList");
	DecimalFormat formatter = new DecimalFormat("###,###");
%> --%>

<%
	GoodsVO vo = new GoodsVO();
	GoodsDAO goodsDAO = new GoodsDAO();
	List<GoodsVO> goodsList = goodsDAO.getGoodsList(vo);
	DecimalFormat formatter = new DecimalFormat("###,###");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    	<img class="d-block mx-auto mb-4" src="resources/images/logo/apple_logo.png" alt="" width="80" height="80" alt="애플사전예약 사이트 로고">
    	<h1 class="display-5">상품소개</h1>
	    <p class="lead">새로운 디자인으로 더욱 강력해진 애플의 NEW LINE 입니다.</p>
	</div>
	<div class="container">
		<div class="row" align="center">
		<% for(GoodsVO goods : goodsList) {%>
		<%-- <c:forEach items="${goodsList }" var="goods"> --%>
			<div class="col-md-4">
				<img src="resources/images/product/<%=goods.getgId() %>.jpeg" style="width: 80%; height: 300px">
				<h3><%= goods.getgName() %></h3>
				<p><%=goods.getInfo() %>
				<p><%=formatter.format(goods.getPrice()) %>원  
				<%-- <%= formatter.format(2000) %> --%>
				<p><a href="getGoods.do?gId=<%=goods.getgId() %>" class="w-100 btn btn-lg btn-primary" role="button">상세 정보 &raquo;</a>
			</div>
		<%-- </c:forEach> --%>
		<% }  %>
		</div>
	</div>
</body>
</html>