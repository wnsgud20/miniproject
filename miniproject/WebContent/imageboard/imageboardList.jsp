<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
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

<form name="imageboardListForm" method="get" action="imageboardDelete.do">
<c:if test="${list != null }">
<table border="1" frame="hsides" rules="rows">
 <tr>
  	<th width="100"><input type="checkbox" id="all" onclick="checkAll()">번호</th>
 	<th width="150">이미지</th>
 	<th width="150">상품명</th>
 	<th width="100">단가</th>
 	<th width="100">개수</th>
 	<th width="100">합계</th>
 </tr>
 
 <c:forEach var="imageboardDTO" items="${requestScope.list }">
 	<tr>
 	 <td align="center">
 	  <input type="checkbox" name="check" value="${imageboardDTO.seq }">${imageboardDTO.seq }
 	 </td>
 	 <td align="center">
 	  <a href="imageboardView.do?seq=${imageboardDTO.seq }&pg=${pg }">
 	  	<img src="http://localhost:8080/miniproject/storage/${imageboardDTO.image1 }" width="50" height="50">
 	  </a>
 	 </td>
 	 <td align="center">${imageboardDTO.imageName }</td>
 	 <td align="center">
 	  <fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice }" />
 	 </td>
 	 <td align="center">${imageboardDTO.imageQty }</td>
 	 <td align="center">
 	  <fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" /></td>
 	</tr> 
 </c:forEach>
</table>

<div style="float: left;">
<input type="button" value="선택삭제" onclick="choiceDelete()">
</div>

<div style="float: left; width: 600px; text-align: center;">
	${imageboardPaging.pagingHTML }
</div>
</c:if>
</form>

<script>
function imageboardPaging(pg){
	location.href="imageboardList.do?pg="+pg;
}

function checkAll(){
	//alert(document.getElementsByName("check").length); //3
	//alert(document.getElementById("all").checked) // true/false
	
	let check = document.getElementsByName("check");
	if(document.getElementById("all").checked){ //선택
		for(var i=0; i<check.length; i++){
			check[i].checked = true;
		}//for
		
	}else{ //해제
		for(var i=0; i<check.length; i++){
			check[i].checked = false;
		}//for
	}
}

function choiceDelete(){
	let check = document.getElementsByName("check");
	let count = 0;
	
	for(var i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}//for
	
	console.log("count = " + count);
	
	if(count==0)
		alert("삭제 할 항목을 선택하세요");
	else
		if(confirm("정말로 삭제하시겠습니까?"))
			 document.imageboardListForm.submit();
}
</script>













