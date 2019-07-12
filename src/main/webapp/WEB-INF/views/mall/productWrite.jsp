<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/summernote.jsp" />
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<script type="text/javascript">
	$(function() {
		
		var count = 0;
		var option_count=0;
		
		
		//파일 추가
		$('#add').click(function() {
			if(count < 5) {
				var result = '<input type="file" name="f1" class="form-control f1"><span style="cursor:pointer;" class="del">X</span>';
				$('#thumbnail').append(result);
				count++;
			} else {
				alert('첨부파일은 최대 5개까지만 가능합니다.');
			}
		});	
		
			$('#thumbnail').on('click', '.del', function() {
				$(this).prev().remove();
				$(this).remove();
				count--;
			});
		
			
		//옵션 추가
		/* $('#option_add').click(function() {
				var result = '<input type="file" name="f1" class="form-control f1"><span style="cursor:pointer;" class="del1">X</span>';
				$('#options').append(result);
				option_count++;
		});	 */
			
		
		$('#options').on('click', '.del1', function() {
			$(this).prev().remove();
			$(this).remove();
			option_count--;
		});
		
		
		
		//form검증	
		$("#write").click(function() {
			//다른 input들 검증
			if($('#contents').summernote('isEmpty')) {
				alert('Empty');
			} else {
				$('#frm').submit();				
			}
		});
			
			
		});
</script>
<style type="text/css">

#box {

width: 100%;
overflow: hidden;

}

#add {

margin-bottom: 10px;

}

#option_box {

width: 100%;
overflow: hidden;

}

#option_add {

margin: 10px 0;

}

input[type=file] {

display: inline-block;
}



.f1 {

width: 90%;
margin-right: 10px;
margin-bottom: 10px;

}


.option1 {

width: 50%;
margin-right: 10px;
margin-bottom: 10px;
display: inline-block;

}

.del {

	font-size: 1.2em;
	font-weight: 700;
	color: red;

}


.del1 {

	font-size: 1.2em;
	font-weight: 700;
	color: red;

}

.note-editable {

height: 300px;

}

label {

letter-spacing: -1px;
font-weight: 900;
font-size: 1.1em;
padding: 5px 0;

}


#write {

margin-bottom: 100px;

}
</style>
</head>
<body>
	<div class="container">
	<h1>Product Write Page</h1>
	<br>
	
	<!-- method default가 post -->
	<!-- action 주소를 안쓰면 url 주소가 됨 -->
	<!-- commandName = Model의 key -->
	<form:form id="frm" action="./productAdd" method="post" enctype="multipart/form-data" commandName="productVO">
	
	
		<div class="form-group" style="width: 20%;">
		<label for="category">카테고리 </label>
		<form:select path="category" cssClass="form-control">
			<option> --- 선택 --- </option>
			<form:options items="${list}"/>
		</form:select>
		</div>
		<div class="form-group" style="width: 20%;">
		  <label for="title">제품명 </label>
		  <!-- path = name(파라미터) -->
		<form:input path="title" cssClass="form-control" id="title"/>
		</div>
		<div class="form-group" style="width: 20%;">
		  <label for="amount">수량</label>
 		 <form:input path="amount" cssClass="form-control" id="amount"/>
		</div>
		<div class="form-group" style="width: 20%;">
		  <label for="price">가격</label>
 		 <form:input path="price" cssClass="form-control" id="price"/>
		</div>
		<div class="form-group">
		  <label for="subcontents">간략한 제품 설명</label>
 		<form:textarea path="subcontents" cssClass="form-control" id="subcontents"/>
		</div>
		<!-- <div class="form-group" id="option_box">
			<input type="button" id="option_add" value="옵션추가" class="btn btn-primary">
			<div id="options"></div>
		</div> -->
		<div class="form-group">
		  <label for="maincontents">상세 내용</label>
		  <form:textarea path="maincontents" cssClass="form-control" id="contents" rows="5"/>
		</div>
		<div class="form-group" id="box">
			<input type="button" id="add" value="ADD FILE" class="btn btn-primary">
			<div id="thumbnail"></div>
		</div>
		<div>
			<input id="write" type="button" class="btn btn-primary" value="Write">
		</div>
	
	</form:form>
	
		
</div>
</body>
</html>