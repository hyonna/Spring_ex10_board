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
		
		var count = ${dto.files.size()};
		
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
			
			
			
			
			//파일을 DB에서 삭제 ajax(비동기방식)
			$('.fdel').click(function() {
				var check = confirm("삭제 하시겠습니까? 복구 불가능");
				var id = $(this).attr('id');
				var title = $(this).attr('title'); //fname
				var select = $(this);
				//check가 true 일때
				if(check) {
					//$.get(url, callBack)
					//$.post(url, {}, callBack)
					//$.ajax({});
					$.ajax({
						url: "../ajax/fileDelete",
						type: "POST",
						data: {
							fnum:id,
							fname:title,
							board:'${board}'
						},
						success: function(data) {
							data=data.trim();
							if(data=='1'){
								select.parent().remove();
								count--;
							} else {
								alert("FileDelete Fail");
							}
						}
					});
				}
			});
			
			/////////////////////////////////////////summernote
			
			$("#contents").summernote('code', '${dto.contents}')

			
			$("#update").click(function() {
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

.glyphicon-remove {

margin-left: 15px;
color: red;
cursor: pointer;

}


.note-editable {

height: 300px;

}
</style>
</head>
<body>
	<div class="container">
	<h1>${board}Update</h1>
	<br>
	<form id="frm" action="./${board}Update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${dto.num}">
		<div class="form-group">
		  <label for="title">Title:</label>
 		 <input class="form-control" type="text" id="title" name="title" value="${dto.title}">
		</div>
		<div class="form-group">
		  <label for="writer">Writer:</label>
 		 <input class="form-control" type="text" id="writer" name="writer" value="${dto.writer}" readonly>
		</div>
		<div class="form-group">
		  <label for="contents">Contents:</label>
 		 <textarea class="form-control" rows="5" id="contents" name="contents"></textarea>
		</div>
		<div>
				<c:forEach items="${dto.files}" var="fdto">
					<p>${fdto.oname}<span id="${fdto.fnum}" title="${fdto.fname}" class="glyphicon glyphicon-remove fdel"></span></p>
				</c:forEach>
		</div>
		<div class="form-group" id="box">
			<input type="button" id="add" value="ADD FILE" class="btn btn-primary">
			<div id="files"></div>
		</div>
		<div>
			<input id="update" type="button" class="btn btn-primary" value="Update">
		</div>
	</form>
</div>
</body>
</html>