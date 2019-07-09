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
<h1>Member Page</h1>
<hr>
  <div class="form-group">
  <h3>ID : ${member.id}</h3>
  </div>
  
  <div class="form-group">
  <h3>NAME :${member.name}</h3>
  </div>
  
   <div class="form-group">
   <h3>EMAIL :${member.email}</h3>
  </div>
  
   <div class="form-group">
   <h3>GRADE : ${member.grade}</h3>
  </div>
  
   <div class="form-group">
   <h3>PROFILE : <img alt="${member.memberFileDTO.oname}" src="../resources/memberFile/${member.memberFileDTO.fname}"></h3>
  </div>
  
  <div style="float: right;">
		<a href=""><button class="btn btn-primary">Update</button></a>
		<a href=""><button class="btn btn-danger">Delete</button></a>
	</div>
	<div style="float: left;">
		<a href="../"><button class="btn btn-default">Home</button></a>
	</div>
  
  
</div>
</div>
</body>
</html>