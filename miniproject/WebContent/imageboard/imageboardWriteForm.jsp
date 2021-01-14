<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="imageboardWrireForm" method="post" enctype="multipart/form-data" action="imageboardWrite.do">
<h3>상품 등록</h3>
<hr>
<table border="1">
<tr>
   <td align="center" width="70" >상품코드</td>
   <td>
      <input type="text" id="imageId" name="imageId" value="img_" size="30" placeholder="상품코드 입력">
   </td>
</tr>
<tr>
   <td align="center" width="70">상품명</td>
   <td>
      <input type="text" id="imageName" name="imageName" size="30" placeholder="상품명 입력">
      <div id="imageNameDiv" style="color: red; font-size: 8pt; font-weight: bold;"></div>	
   </td>
</tr>
<tr>
   <td align="center" width="70">단가</td>
   <td>
      <input type="text" id="imagePrice" name="imagePrice" size="30" placeholder="단가 입력">
      <div id="imagePriceDiv" style="color: red; font-size: 8pt; font-weight: bold;"></div>	
   </td>
</tr>
<tr>
   <td align="center" width="70">개수</td>
   <td>
      <input type="text" id="imageQty" name="imageQty" size="30" placeholder="개수 입력">
      <div id="imageQtyDiv" style="color: red; font-size: 8pt; font-weight: bold;"></div>	
   </td>
</tr>
<tr>
   <td align="center">내용</td>
   <td>
      <textarea rows="10" cols="50" id="imageContent" name="imageContent" placeholder="내용입력"></textarea>
   </td>
</tr>
<tr>
   <td colspan="2">
      <input type="file" id="image1" name="image1" size="50">
      <div id="image1Div" style="color: red; font-size: 8pt; font-weight: bold;"></div>	
   </td>
</tr>

<tr>
   <td colspan="2" align="center">
      <input type="button" value="이미지 등록" onclick="javascript:checkImageboardWrite()">
      <input type="reset" value="다시작성">
   </td>
</tr>
</table>
</form>

<script type="text/javascript">
function checkImageboardWrite(){
	document.getElementById("imageNameDiv").innerText="";
	document.getElementById("imagePriceDiv").innerText="";
	document.getElementById("imageQtyDiv").innerText="";
	document.getElementById("image1Div").innerText="";
	
	if(document.getElementById("imageName").value =="")
		document.getElementById("imageNameDiv").innerText= "상품명을 입력하세요";
		
	else if(document.getElementById("imagePrice").value =="")
		document.getElementById("imagePriceDiv").innerText= "단가를 입력하세요";
		
	else if(document.getElementById("imageQty").value =="")
		document.getElementById("imageQtyDiv").innerText= "개수를 입력하세요";
		
	else if(document.getElementById("image1").value =="")
		document.getElementById("image1Div").innerText= "이미지를 등록하세요";
	else 
		document.imageboardWrireForm.submit();
}
</script>
















