<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp" />
<link href="../resources/css/productList.css" rel="stylesheet">
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
		<h1 style="display: inline-block;">Product List</h1>
		<a href="../" style="float: right; margin-top: 20px;"><button class="btn btn-danger">Home</button></a>
	</div>
	<!-- 리스트에 뿌릴 것 : title, subtitle, price, category -->
	
	
	<div style="margin: 20px auto; overflow: hidden;">
	<form class="form-inline" action="./productList">
		
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
		<a href="./productWrite"><button class="btn btn-primary">Write</button></a>
	</div>
	
	</div>
	
	
	<!-- 리스트 뿌려줄곳 -->
	
	<div id="list_box">
	
		<div class="p_list">
		
		<c:forEach items="${list}" var="dto">
			<div class="p_list_box">
				<ul>
				<c:forEach items="${dto.nailVOs}" var="tdto">
					<li class="list_img"><img alt="" src="../resources/product/${tdto.fname}"></li>
				</c:forEach>
					<li class="title">${dto.title}</li>
					<li class="subtitle">${dto.subcontents}</li>
					<li class="price">가격 : ${dto.price} 원</li>
				</ul>
			</div>
		</c:forEach>
			
		</div>
		
	
	
	</div>
	
	
	<div style="margin: 0 auto; overflow: hidden; text-align: center;">
	<ul class="pagination">
	<c:if test="${pager.curBlock > 1}">
		<li><a href="./productList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a></li>
	</c:if>
	
	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		<li><a href="./productList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
	</c:forEach>
	
	<c:if test="${pager.curBlock < pager.totalBlock}">
		<li><a href="./productList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a></li>
	</c:if>
	</ul>
	</div> 
	
	
</div>
</body>
</html>