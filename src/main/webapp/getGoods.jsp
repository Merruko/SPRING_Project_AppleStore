<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.apple.biz.goods.GoodsVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.apple.biz.goods.GoodsVO"%>
<%@page import="com.apple.biz.goods.impl.GoodsDAO"%>
<%-- <%
	GoodsVO goods = (GoodsVO) session.getAttribute("goods");
%> --%>
<%
	String gid = request.getParameter("gId");
	
	GoodsVO vo = new GoodsVO();
	vo.setgId(gid);
	
	GoodsDAO goodsDAO = new GoodsDAO();
	GoodsVO goods = goodsDAO.getGoods(vo);
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>상품 상세페이지</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/product/<%=goods.getgId() %>.jpeg" style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=goods.getgName() %></h3>
				<p><%=goods.getInfo() %>
				<p><b>상품 코드 : </b><%=goods.getgId() %>
				<p><b>분류 : </b><%=goods.getCategory() %>
				<h4><%=formatter.format(goods.getPrice()) %>원  </h4>
				<p><form action="/insertGoods.do?gId=<%=goods.getgId() %>" method="post">
					<a href="insertBook.jsp" class="btn btn-info"> 사전 예약 &raquo;</a>
					<c:choose>
						<c:when test="${userName eq '관리자'}">
 						<a class="btn btn-primary btn" href="<c:url value="editGoods.jsp"/>">상품 수정 &raquo;</a>
  						</c:when>
  					</c:choose>
					<a href="getGoodsList.do" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>