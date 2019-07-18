<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="./notice/noticeList">Go Notice</a>
<a href="./qna/qnaList">Go QnA</a>
<a href="./mall/productWrite">Add Product</a>
<a href="./mall/productList">Go Product</a>

<c:choose>
	<c:when test="${not empty member}">
		<c:if test="${member.grade eq '0'}">
		<a href="./member/memberAdmin">Admin Page</a>
		<a href="./member/memberLogout">Member Logout</a>
		</c:if>
		<c:if test="${member.grade != '0'}">
		<h3><spring:message code="login.message" arguments="${member.id},my home" argumentSeparator=","></spring:message></h3>
		<a href="./member/memberPage">My Page</a>
		<a href="./member/memberLogout">Member Logout</a>
		<a href="./cart/cartList">My Cart</a>
		</c:if>
	</c:when>
	<c:otherwise>
		<a href="./member/memberJoin">Member Join</a>
		<a href="./member/memberLogin">Member Login</a>
	</c:otherwise>
</c:choose>
</body>
</html>
