<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>Member Join</h1>
<hr>
<form:form id="frm" action="./memberJoin" method="post" commandName="memberDTO" enctype="multipart/form-data">
  <div class="form-group">
    <label for="id">ID : </label>
    <form:input path="id" cssClass="form-control" id="id"/>
    <form:errors path="id"></form:errors>
  </div>
  
  <div class="form-group">
    <label for="pw">Password : </label>
    <form:password path="pw" cssClass="form-control" id="pw"/>
  </div>
  
  <div class="form-group">
    <label for="pw2">Password : </label>
    <form:password path="pw2" cssClass="form-control" id="pw2"/>
    <form:errors path="pw2"></form:errors>
  </div>
  
  <div class="form-group">
    <label for="name">Name : </label>
   <form:input path="name" cssClass="form-control" id="name"/>
    <form:errors path="name"></form:errors>
  </div>
  
  <div class="form-group">
    <label for="email">Email : </label>
    <form:input path="email" cssClass="form-control" id="email"/>
    <form:errors path="email"></form:errors>
  </div>
  
  <div class="form-group">
    <label for="file">Profile : </label>
    <input type="file" class="form-control" id="file" name="photo">
  </div>
  
  <button type="submit" class="btn btn-primary">Join</button>

</form:form>
</div>
</div>
</body>
</html>