<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}

#header {
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid lightgray;
}

#container {
	width: 100%;
	height: 500px;
	border: 1px solid lightgray;
}

#nav {
	width: 20%;
	height: 100%;
	float: left;
	border: 1px solid red;
}

#section {
	width: 79%;
	height: 100%;
	float: left;
	border: 1px solid blue;
}

#footer {
	width: 100%;
	height: 10%;
	border: 1px solid lightgray;	
}
</style>
</head>
<body>
<div id="header">
	<h1><img src="../image/tube.gif" width="50" height="50"
	onclick="location.href='../main/index.do'" style="cursor: pointer;"> MVC 기반의 미니 프로젝트</h1>
</div>

<div id="container">
	<div id="nav">
		<jsp:include page="menu.jsp" />
	</div>
	
	<div id="section">
		<jsp:include page="${display }" />
	</div>
</div>

<div id="footer">
	<p>비트캠프</p>
</div>
</body>
</html>












