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
		

	$('#checkAll').click(function() {
		var c = $(this).prop('checked');
		if(c==true) {
			$('.check').prop('checked', c);
		} else {
			$('.check').prop('checked', false);
		}
	});
	
	$('.check').click(function() {
			var c2 = true;
		$('.check').each(function() {
			if(!$(this).prop('checked')) {
				c2 = false;
			}
		});
		$('#checkAll').prop('checked', c2);
	});
		
	
		//form으로 보내는 방식
		/* $('#delete').click(function() {
			$('#frm').submit();
		}); */
		
		
		//ajax로 보내는 방식
		$('#delete').click(function() {
			var ids = [];
			$('.check').each(function() {
				if($(this).prop('checked')) {
					ids.push($(this).val());
				}
			});
		//ajax로 배열을 전송할때 추가해야되는 코드
		jQuery.ajaxSettings.traditional = true;
		
			$.ajax({
				url:"./memberAdmin",
				type:"POST",
				data: {id:ids}, 
				success:function(data) {
					console.log(data);
					location.reload();
				}, 
				error: function() {
					console.log('error');
				}
				
			});
		});
		
		
	});
	

</script>
<style type="text/css">

table td {

text-align: center;

}


</style>
</head>
<body>
	<!-- 회원들의 정보 -->
	<!-- ID, Email, Grade -->
<div class="container">
	<div style="margin: 30px auto;">
		<h1 style="display: inline-block;">Member Admin Page</h1>
		<a href="../" style="float: right; margin-top: 20px;"><button class="btn btn-danger">Home</button></a>
	</div>
	
	<div style="margin: 15px 0;">
		<input type="button" value="Delete" class="btn btn-danger" id="delete">
	</div>
	<p style="letter-spacing: -1px;">총 회원 수 : <span style="font-weight: 700;">${totalCount}</span>명</p>
	<form action="./memberAdmin" method="post" id="frm">
	<table class="table table-hover">
		<tr>
			<td><input type="checkbox" id="checkAll"></td>
			<td style="width: 100px;">GRADE</td>
			<td style="width: 250px;">ID</td>
			<td>NAME</td>
			<td>EMAIL</td>
			<td>PROFILE</td>
		</tr>
		
		<c:forEach items="${list}" var="dto">
		<tr>
			<td><input type="checkbox" class="check" value="${dto.id}" name="id"></td>
			<td>${dto.grade}</td>
			<td>
			<a href="./memberSelect?id=${dto.id}">${dto.id}</a>
			</td>
			<td>${dto.name}</td>
			<td>${dto.email}</td>
			<td><a href="../resources/memberFile/${dto.memberFileDTO.fname}">${dto.memberFileDTO.oname}</a></td>
		</tr>
		</c:forEach>
	</table>
	</form>
	<div style="margin: 20px auto; overflow: hidden;">
	<form class="form-inline" action="./memberAdmin">
		
		<div class="form-group col-xs-1" style="margin-right: -5px; padding-left: 0;">
			<select name="kind" class="form-control">
				<option class="k" value="1">id</option>
				<option class="k"  value="2">name</option>
				<option class="k"  value="3">email</option>
				<option class="k"  value="4">grade</option>
			</select>
		</div>
	
		<div class="form-group col-xs-2" style="margin-right: 10px; padding-left: 0;">
		  <input type="text" class="form-control" value="${pager.search}" name="search">
		</div>
		<div class="form-group col-xs-1" style=" padding-left: 0;">
		  <button class="btn btn-primary">Search</button>
		  </div>
	</form>
	
	</div>
	
	<div style="margin: 0 auto; overflow: hidden; text-align: center;">
	<ul class="pagination">
	<c:if test="${pager.curBlock > 1}">
		<li><a href="./memberAdmin?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">[이전]</a></li>
	</c:if>
	
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./memberAdmin?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>
	
	<c:if test="${pager.curBlock < pager.totalBlock}">
		<li><a href="./memberAdmin?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">[다음]</a></li>
	</c:if>
	</ul>
	</div>
	
</div>

</body>
</html>