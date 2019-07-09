<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="./notice/noticeList">Go Notice</a>
<a href="./qna/qnaList">Go QnA</a>

<c:choose>
	<c:when test="${not empty member}">
		<a href="./member/memberPage">My Page</a>
		<a href="./member/memberLogout">Member Logout</a>
	</c:when>
	<c:otherwise>
		<a href="./member/memberJoin">Member Join</a>
		<a href="./member/memberLogin">Member Login</a>
	</c:otherwise>
</c:choose>
</body>
</html>
