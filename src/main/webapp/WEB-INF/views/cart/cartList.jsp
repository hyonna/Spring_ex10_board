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
<style type="text/css">
table td {

text-align: center;


}


</style>
</head>
<body>
<div class="container">
	<div>
		<h1 style="display: inline-block;">Cart List</h1>
		<a href="../" style="float: right; margin-top: 20px;"><button class="btn btn-danger">Home</button></a>
	</div>
	<table class="table table-hover">
		<tr>
			<td>전체선택<br><input type="checkbox" style="margin-top: 10px;"></td>
			<td>TITLE</td>
			<td>OPTION</td>
			<td>AMOUNT</td>
			<td>PRICE</td>
			<td>TOTAL PRICE</td>
		</tr>
		<c:forEach items="${cartList}" var="cart" varStatus="i">
		<tr class="tr">
			<td><input type="checkbox" title="${cart.num}" class="check"></td>
			<td>${cart.title}</td>
			<td>${cart.contents}</td>
			<td><input id="amount${i.index}" class="amount" type="number" value="${cart.amount}">
			<input data-num="${cart.num}" title="amount${i.index}" type="button" value="수정" class="updateBtn"></td>
			<td>${cart.price}</td>
			<td>${cart.amount*cart.price}</td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<button id="delete" class="btn btn-danger">Delete</button>
	</div>
	
</div>
<script type="text/javascript">


	
	$('.check').click(function() {
		var c2 = true;
		$('.check').each(function() {
			if(!$(this).prop('checked')) {
				c2 = false;
			}
		});
	});
	
	$('#delete').click(function() {
		var ids=[];
		$('.check').each(function() {
			if($(this).prop('checked')) {
				ids.push($(this).val());
			}
		});
		
		//ajax로 배열을 전송할때 추가해야되는 코드
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			
			url: "./cartDelete",
			type: "POST",
			data: {
				
				num:ids
				
			},
			success: function(data) {
				if(data=='1') {
					
					console.log(data);
					
					/* var result = confirm('정말삭제하시겠습니까?');
					if(result) {
						
						location.reload();
					} */
					
				} else {
					
					alert('삭제실패');
				}
			}
		});
		
	});
	
	
	


	$('.updateBtn').click(function() {
		
		
		/* var id = $(this).attr('title');
		var amount = $('#'+id).val(); */
		
		var id = $(this).attr('title');
		var amount = $(this).prev().val();
		var num = $(this).attr('data-num');
		
		$.ajax({
			
			url:"./cartUpdate",
			type:"POST",
			data:{
				
				amount:amount,
				num:num
				
			},
			success: function(data) {
				
				if(data=='1') {
					location.reload();
				}
				
			}
			
		});
		
	});
	
	</script>

</body>
</html>