<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div id="box" style="padding: 5% 35%; overflow: hidden;">
<h1><spring:message code="test" text="DefaultMessage"></spring:message> Login</h1>
<hr>
<form:form id="frm" action="./memberLogin" method="post" commandName="memberDTO">
  <div class="form-group">
    <label for="id">ID : </label>
    <form:input path="id" cssClass="form-control" id="id"/>
  </div>
  
  <div class="form-group">
    <label for="pw">Password : </label>
    <form:password path="pw" cssClass="form-control" id="pw"/>
  </div>
  
  <button type="submit" class="btn btn-primary">Login</button>
  </form:form>
</div>
</div>
</body>
</html>