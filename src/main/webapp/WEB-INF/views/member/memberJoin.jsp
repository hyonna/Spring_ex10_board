<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="./memberJoin" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="id">ID : </label>
    <input type="text" class="form-control" id="id" name="id">
  </div>
  
  <div class="form-group">
    <label for="pw">Password : </label>
    <input type="password" class="form-control" id="pw" name="pw">
  </div>
  
  <div class="form-group">
    <label for="name">Name : </label>
    <input type="text" class="form-control" id="name" name="name">
  </div>
  
  <div class="form-group">
    <label for="email">Email : </label>
    <input type="email" class="form-control" id="email" name="email">
  </div>
  
  <div class="form-group">
    <label for="file">Profile : </label>
    <input type="file" class="form-control" id="file" name="photo">
  </div>
  
  <button type="submit" class="btn btn-primary">Join</button>
</form>
</div>
</div>
</body>
</html>