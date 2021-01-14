<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${id }는 사용 가능<br><br>
<input type="button" value="사용하기" onclick="checkIdClose('${id }')">

<script>
function checkIdClose(id){
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}
</script>
</body>
</html>