<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp" />
<script type="text/javascript">
	
	$(function() {
	
		$(".down").click(function() {
			
			var fname = $(this).attr('title');
			var oname = $(this).val();

			$('#fname').val(fname);
			$('#oname').val(oname);

			$('#downForm').submit();
			
		});
		
	});
	

</script>
</head>
<body>
<div class="container">
	<h1>${board}Select</h1>
	<table class="table table-hover">
		<tr>
			<td>NO</td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>DATE</td>
			<td>HIT</td>
		</tr>
		<tr>
			<td>${dto.num}</td>
			<td>${dto.title}</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
		</tr>
		<tr>
			<td colspan="5">${dto.contents}</td>
		</tr>
		<c:forEach items="${dto.files}" var="fdto">
		<tr>
			<td><input type="button" title="${fdto.fname}" class="btn btn-danger down" value="${fdto.oname}"></td>	
		</tr>
		</c:forEach>
	</table>
	<c:if test="${board=='qna'}">
	<div style="margin-bottom: 10px;">
		<a href="./${board}Reply?num=${dto.num}"><button class="btn btn-primary">답글달기</button></a>
	</div>
	</c:if>
	<div style="float: right;">
		<a href="./${board}Update?num=${dto.num}"><button class="btn btn-primary">Update</button></a>
		<a href="./${board}Delete?num=${dto.num}"><button class="btn btn-danger">Delete</button></a>
	</div>
	<div style="float: left;">
		<a href="./${board}List"><button class="btn btn-default">List</button></a>
	</div>
	<div style="display: none;">
		<form id="downForm" action="../ajax/fileDownload" method="post">
			<input type="text" name="fname" id="fname">
			<input type="text" name="oname" id="oname">
			<input type="text" name="board" value="${board}">
		</form>
	</div>
</div>
</body>
</html>