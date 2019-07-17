<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
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
		
		$('#add').click(function() {
			if(count < 5) {
				var result = '<input type="file" name="f1" class="form-control f1"><span style="cursor:pointer;" class="del">X</span>';
				$('#files').append(result);
				count++;
			} else {
				alert('첨부파일은 최대 5개까지만 가능합니다.');
			}
		});	
		
			$('#files').on('click', '.del', function() {
				$(this).prev().remove();
				$(this).remove();
				count--;
			});
			
			
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

input[type=file] {

display: inline-block;
}


.f1 {

width: 90%;
margin-right: 10px;
margin-bottom: 10px;

}

.del {

	font-size: 1.2em;
	font-weight: 700;
	color: red;

}


.note-editable {

height: 300px;

}
</style>
</head>
<body>
	<div class="container">
		<h1>${board} Write Form</h1>
		
		<form:form commandName="boardDTO" id="frm" enctype="multipart/form-data">
		    
		    <div class="form-group">
		      <label for="title">Title:</label>
		      <form:input placeholder="Enter title" cssClass="form-control" path="title" id="title"/>
		      <form:errors path="title"></form:errors>
		    </div>
		    
			<div class="form-group">
		      <label for="writer">Writer:</label>
		      <form:input cssClass="form-control" path="writer" id="writer"/>
		      <form:errors path="writer"></form:errors>
		    </div>
			
			<div class="form-group">
		      <label for="contents">Contents:</label>
			<form:textarea cssClass="form-control" path="contents" id="contents"/>
			<form:errors path="contents"></form:errors>
			</div>
			
			 <div>
		    	<input type="button"  class="btn btn-info" id="add" value="ADD FILE">
		    	<div id="files"></div>
		    </div>
		    
		    <input type="button" id="write" class="btn btn-default" value="Write">
		    
		</form:form>

</div>
</body>
</html>