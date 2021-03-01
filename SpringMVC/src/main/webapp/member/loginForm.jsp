<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="loginForm" method="post" action="login">
<h3>로그인</h3>
<hr>
<table border="1" cellpadding="3" cellspacing="0">
<tr>
	<td align="center">아이디</td>
	<td>
		<input type="text" name="id" id="loginId" size="25">
		<div id="loginIdDiv"></div>
	</td>
</tr>

<tr>
	<td align="center">비밀번호</td>
	<td>
		<input type="password" name="pwd" id="loginPwd" size="30">
		<div id="loginPwdDiv"></div>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
	<input type="button" id="loginBtn" value="로그인"> 
	<input type="button" value="회원가입" 	onclick="location.href='/spring/member/writeForm'">
</tr>
</table>
</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
</body>
</html>











