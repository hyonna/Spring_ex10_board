<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
		
/////////////////////////////////////////summernote
		$("#reply").click(function() {
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

.note-editable {

height: 300px;

}

</style>
</head>
<body>
	<div class="container">
	<h1>${board}Reply</h1>
	<br>
	<form id="frm" action="./${board}Reply" method="post">
		<input type="hidden" name="num" value="${num}">
		<div class="form-group">
		  <label for="title">Title:</label>
 		 <input class="form-control" type="text" id="title" name="title">
		</div>
		<div class="form-group">
		  <label for="writer">Writer:</label>
 		 <input class="form-control" type="text" id="writer" name="writer">
		</div>
		<div class="form-group">
		  <label for="contents">Contents:</label>
 		 <textarea class="form-control" rows="5" id="contents" name="contents"></textarea>
		</div>
		<div>
			<input id="reply" type="button" class="btn btn-primary" value="Reply">
		</div>
	</form>
</div>
</body>
</html>