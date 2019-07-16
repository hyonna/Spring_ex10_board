<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/summernote.jsp" />
<script type="text/javascript" src="../resources/js/summernote.js"></script>
<link href="../resources/css/productSelect.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
			$.ajax({
				
				url:"../productQna/productQnaList",
				type:"GET",
				data:{
					
					pid:'T1562925026034'
				},
				success:function(data) {
					
					//받아온 데이터(문자열)를 json 형태로 바꿈
					//JSON.stringify(data); -> json을 문자열로 바꿔주는 코드
					var r = '<table class="table table-hover">'
					$(data).each(function() {
						
						r=r+"<tr>";
						r=r+"<td>내용:"+this.contents+"</td>";
						r=r+"<td>작성자:"+this.writer+"</td>";
						r=r+"</tr>";
						
					});
					
					r=r+"</table>";
					$('#result').html(r);
				}
			});
		
		
			/* $('#select').click(function() {
				$.ajax({
					url:"../productQna/productQnaSelect",
					type:"GET",
					data:{
						
						num:47
					},
					success:function(data) {
						
						//받아온 데이터(문자열)를 json 형태로 바꿈
						data = JSON.parse(data);
						//JSON.stringify(data); -> json을 문자열로 바꿔주는 코드
						alert(data.writer);
						alert(data.title);
						alert(data.pid);
						alert(data.writer);
						
					}
				});
			}); */
		
			$("#qnaWrite").click(function() {
				
				var writer = $('#writer').val();
				var title = $('#title').val();
				var contents = $('#contents2').summernote('code');
				var pid = $('#pid').val();
				
				$.ajax({
					
					url: "../productQna/productQnaWrite",
					type: "POST",
					data: {
						
						pid:pid,
						title:title,
						writer:writer,
						contents:contents
						
					},
					success:function(data) {
						
						if(data=='1') {
							
							alert('등록성공');
							location.reload();
						} else {
							alert('등록실패');
						}
					}
					
				});
				
			});
			
		});
</script>
<style type="text/css">

.note-editable {

height: 150px;

}
</style>
</head>
<body>
<div class="container">
	<div>
		<h1 style="display: inline-block;">Product Select</h1>
		<a href="../" style="float: right; margin-top: 20px;"><button class="btn btn-danger">Home</button></a>
	</div>
	
	
	<div id="list_box">
	
	
	
		<div id="img_box">
			<div id="i_box">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				    <!-- 처리중 -->
				   <c:forEach items="${product.nailVOs}" var="images" varStatus="i">
				 	  <c:choose>
						    <c:when test="${i.index eq 0}">
						    	 <li data-target="#myCarousel" data-slide-to="${i.index}" class="active"></li>
						    </c:when>
						     <c:otherwise>
					     		 <li data-target="#myCarousel" data-slide-to="${i.index}"></li>
						    </c:otherwise>
					 </c:choose>
				   </c:forEach>
				    </ol>
				
				    <!-- Wrapper for slides -->
				   <div class="carousel-inner">
				      <!-- 처리중 -->
				      <c:forEach items="${product.nailVOs}" var="images" varStatus="i">
					      <c:choose>
					      	<c:when test="${i.index eq 0}">
					      		<div class="item active">
					      	</c:when>
					      	<c:otherwise>
					      		 <div class="item">
					      	</c:otherwise>
					      </c:choose>
			     			   <img src="../resources/product/${images.oname}" style="width:100%;">
			     	</c:forEach>
					      </div>
				     </div>
				
				    <!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
 				 </div>
			</div>
	
	
	
	
	
	
	
	</div>
		<div id="product_box">
			
			<div id="p_box">
				<ul>
					<li>제품명 : ${product.title}</li>
					<li>재고 : ${product.amount}</li>
					<li>가격 : ${product.price}</li>
					<li> 
					<form>
					<input type="hidden" id="pid" name="pid" value="${product.pid}">
					<select name="opitions" id="options">
						<c:forEach items="${product.optionsVOs}" var="optionsVO">
							<option value="${optionsVO.num}">${optionsVO.contents}</option>
						</c:forEach>
					</select>
					<input type="number" min="0" name="amount" id="amount">
					</form>
					</li>
				</ul>
			</div>
					<div id="button">
						<input type="button" value="장바구니" id="addCart">
						<input type="button" value="바로구매" id="buy">
					</div>
		</div>
		
		<div id="contents_box">
			<div id="main_box">
					${product.maincontents}
			</div>
		</div>
		
	
</div>

	<div class="container" style="margin-bottom: 20px;">
	<h3>Producct Qna Write</h3>
	<br>
		<div class="form-group">
		  <label for="title">Title:</label>
 		 <input class="form-control" type="text" id="title" name="title">
		</div>
		<div class="form-group">
		  <label for="writer">Writer:</label>
 		 <input class="form-control" type="text" id="writer" name="writer" value="${member.id}" readonly>
		</div>
		<div class="form-group">
		  <label for="contents">Contents:</label>
 		 <textarea class="form-control" rows="5" cols="15" id="contents2" name="contents"></textarea>
		</div>
		<div>
			<input id="qnaWrite" type="button" class="btn btn-primary" value="Write">
		</div>
</div>

		<div class="container" style="margin-bottom: 20px;">
			<button id="select" class="btn btn-danger">SELECT</button>
			<div id="result">
				
			</div>
		</div>

	<script type="text/javascript">
		$("#addCart").click(function() {
			var pid = $("#pid").val();
			var options = $("#options").val();
			var amount = $("#amount").val();
			var id = '${member.id}';
			console.log(options);
			
			$.ajax({
				url:"../cart/cartWrite",
				type:"POST",
				data:{
					pid:pid,
					options:options,
					amount:amount,
					id:id
				},
				success:function(data){
					//data : 0 이면 실패, 1 이면 성공
					if(data.trim() == '1'){
					var result = confirm("장바구니 이동?");
						if(result){
							location.href="../cart/cartList";
						}
					}else {
						alert('장바구니 등록 실패');
					}
				}
			});
			
		});
	
	</script>
</body>
</html>