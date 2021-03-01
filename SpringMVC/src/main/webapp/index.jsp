<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100%;
	background-color: #f8f8f8;
}

#header {
	width: 100%;
	height: 10%;
	text-align: left;
	border-bottom: 2px #f0f0f0 solid;
}

#container {
	width: 100%;
	height: 500px;
}

#nav {
	background-color: #dfdfdf;
	width: 10%;
	height: 100%;
	float: left;
}

#section {
	width: 79%;
	height: 100%;
	float: left;
}

#footer {
	width: 100%;
	height: 5%;
}
</style>
</head>
<body>
<div id="header">
	<h1><a 	onclick="location.href='/spring/index.jsp'" style="cursor: pointer;">게시판</a></h1>
</div>

<div id="container">
	<div id="nav">
		<jsp:include page="menu.jsp" />
	</div>
	
	<div id="section">
		<c:if test="${not empty display }">
			<jsp:include page="${display }" />
		</c:if>
		<c:if test="${empty display }">
		<h3>SPRING 기반의 게시판 사이트 <br>
		    
		</h3><!-- 
			<img alt="망상토끼" src="/spring/image/망상토끼.png">
 -->		</c:if>
	</div>
</div>

<div id="footer">
	<p>비트캠프</p>
</div>
</body>
</html>












