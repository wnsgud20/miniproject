<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="boardModifyForm" method="post" action="boardModify.do">

<input type="hidden" name="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" value="${pg }">

<h3>글수정</h3>
<hr>
<table border="1" cellpadding="3" cellspacing="0">
<tr>
<td align="center" width="60px">제   목</td>
<td>
 <input size="70" type="text" name="subject" id="subject" value="${boardDTO.subject }">
 <div id="subjectDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
</td>
</tr>
<tr>
<td align="center">내   용</td>
<td>
 <textArea name="content" id="content" rows="20" cols="70">${boardDTO.content }</textArea>
 <div id="contentDiv" style="color: red; font-size:8pt; font-weigth:bold;"></div>
</td>
</tr>
<tr>
<td align="center" colspan="2">
 <input type="button" value="글수정" onclick="checkBoardModify()">
 <input type="reset" value="다시작성">
</td>
</tr>
</table>
</form>

<script type="text/javascript">
function checkBoardModify() {
	document.getElementById("subjectDiv").innerText = "";
	document.getElementById("contentDiv").innerText = "";
	
	if(document.getElementById("subject").value == "") {
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요";
	}
	else if(document.getElementById("content").value == ""){
		document.getElementById("contentDiv").innerText = "내용을 입력하세요";
	}
	else{
		document.boardModifyForm.submit();
	}
		
}
</script>











