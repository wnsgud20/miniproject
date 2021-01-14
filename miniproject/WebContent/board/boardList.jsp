<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#subjectA:link {color: black; text-decoration: none;}
#subjectA:visited {color: black; text-decoration: none;} 
#subjectA:hover {color: green; text-decoration: underline;} 
#subjectA:active {color: black; text-decoration: none;}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}
#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<table border="1" cellpadding="3" cellspacing="0" frame="hsides" rules="rows">
<c:if test="${list != null }">
<tr>
	<th width = "180">글번호</th> <!-- 테이블 헤더 / 가운데, 굵게 -->
	<th width = "500">제목</th>
	<th width = "180">작성자</th>
	<th width = "100">조회수</th>
	<th width = "180">작성일</th>
</tr>

<c:forEach var="boardDTO" items="${list }"> 
	<tr>
	<td align="center">${boardDTO.seq }</td>
	<td>
		<c:forEach var="i" begin="1" end="${boardDTO.lev }" step="1">
			&emsp;
		</c:forEach>
		<c:if test="${boardDTO.pseq != 0 }">
			<img src="../image/reply.gif">
		</c:if>
		<a id="subjectA" href="#" onclick="isLogin('${memId }', ${boardDTO.seq }, ${pg })">
			${boardDTO.subject }
		</a>
	</td>
	<td align="center">${boardDTO.id }</td>
	<td align="center">${boardDTO.hit }</td>
	<td align="center">
		<fmt:formatDate pattern="YYYY.MM.dd" value="${boardDTO.logtime }"/> 
	</td>
	</tr>
</c:forEach>
</c:if>
</table>

<div class="paging" align="center">${boardPaging.pagingHTML }</div>

<br><br>
<form name="boardListSearchForm" method="post" action="boardSearch.do">
<input type="hidden" name="pg" value="1">

<div style="text-align: center;">
	<select name="searchType" style="width: 100px;">
		<option value="subject" selected>제목</option>
		<option value="id">아이디</option>
	</select>
	<%-- <input type="search" name="keyword" id="keyword" value="${keyword }"> --%>
	<input type="search" name="keyword" id="keyword">
	<input type="submit" value="검 색">
</div>
</form>

<script type="text/javascript">
function isLogin(id, seq, pg) {
	if(id == ""){
		alert("먼저 로그인하세요");
		location.href="../member/loginForm.do"
	}else{
		location.href="boardView.do?seq="+seq+"&pg="+pg;
	}
}

function boardPaging(pg){
	//let keyword = document.boardListSearchForm.keyword.value;
	//let keyword = document.getElementById("keyword").value;
	
	if("${keyword}" == ""){
		location.href="boardList.do?pg="+pg;
	}else{
		location.href="boardSearch.do?pg="+pg+"&searchType=${requestScope.searchType}&keyword=${keyword}";
	}
}
</script>















