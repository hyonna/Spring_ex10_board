<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp" />
<title>Insert title here</title>
<script type="text/javascript">

	$(function() {
	
		var kind = '${pager.kind}';
		$('.k').each(function() {
			if($(this).val() == kind) {
				$(this).prop("selected", true);
			}
		});
		
		var message = '${message}';
		
		if(message != '') {
			alert(message);
		}		
	});
	

</script>
</head>
<body>
<div class="container">
	<div>
		<h1 style="display: inline-block;">${board}List</h1>
		<a href="../" style="float: right; margin-top: 20px;"><button class="btn btn-danger">Home</button></a>
	</div>
	<table class="table table-hover">
		<tr>
			<td>NO</td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>DATE</td>
			<td>HIT</td>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.num}</td>
			<td>
			<c:if test="${board=='qna'}">
			<c:forEach begin="1" end="${dto.depth}">
			<img width="20px" src="../resources/images/reply.png" style="transform: rotate(-180deg);">
			</c:forEach>
				<a href="./${board}Select?num=${dto.num}">${dto.title}</a>
			</c:if>
			<c:if test="${board=='notice'}">
				<a href="./${board}Select?num=${dto.num}">${dto.title}</a>
			</c:if>
				</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
		</tr>
		</c:forEach>
	</table>
	<div style="margin: 20px auto; overflow: hidden;">
	<form class="form-inline" action="./${board}List">
		
		<div class="form-group col-xs-1" style="margin-right: 10px; padding-left: 0;">
			<select name="kind" class="form-control">
				<option class="k" value="1">title</option>
				<option class="k"  value="2">writer</option>
				<option class="k"  value="3">contents</option>
			</select>
		</div>
	
		<div class="form-group col-xs-2" style="margin-right: 10px; padding-left: 0;">
		  <input type="text" class="form-control" value="${pager.search}" name="search">
		</div>
		<div class="form-group col-xs-1" style=" padding-left: 0;">
		  <button class="btn btn-primary">Search</button>
		  </div>
	</form>
	
	<div class="b_div" style="float: right;">
		<a href="./${board}Write"><button class="btn btn-primary">Write</button></a>
	</div>
	
	</div>
	
	<div style="margin: 0 auto; overflow: hidden; text-align: center;">
	<ul class="pagination">
	<c:if test="${pager.curBlock > 1}">
		<li><a href="./${board}List?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a></li>
	</c:if>
	
	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		<li><a href="./${board}List?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
	</c:forEach>
	
	<c:if test="${pager.curBlock < pager.totalBlock}">
		<li><a href="./${board}List?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a></li>
	</c:if>
	</ul>
	</div>
	
</div>
</body>
</html>