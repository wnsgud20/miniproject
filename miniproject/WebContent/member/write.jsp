<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<script>
	if("${su}"=="1")
		alert("회원가입 성공!!");
	else
		alert("회원가입 실패!!");
	
	location.href = "../main/index.do";
</script>










