<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <form id="imageboardWriteForm" method="post" enctype="multipart/form-data" action="imageboardWrite"> -->
<form id="imageboardWriteForm">
	<h3>상품 등록</h3>
	<hr>
	<table border="1">
		<tr>
			<td align="center" width="70">상품코드</td>
			<td><input type="text" id="imageId" name="imageId" value="img_"
				size="30" placeholder="상품코드 입력">
				<div id="imageIdDiv"></div></td>
		</tr>
		<tr>
			<td align="center" width="70">상품명</td>
			<td><input type="text" id="imageName" name="imageName" size="30"
				placeholder="상품명 입력">
				<div id="imageNameDiv"></div></td>
		</tr>
		<tr>
			<td align="center" width="70">단가</td>
			<td><input type="text" id="imagePrice" name="imagePrice"
				size="30" placeholder="단가 입력">
				<div id="imagePriceDiv"></div></td>
		</tr>
		<tr>
			<td align="center" width="70">개수</td>
			<td><input type="text" id="imageQty" name="imageQty" size="30"
				placeholder="개수 입력">
				<div id="imageQtyDiv"></div></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><textarea rows="10" cols="50" id="imageContent"
					name="imageContent" placeholder="내용입력"></textarea>
				<div id="imageContentDiv"></div></td>
		</tr>

		<tr>
			<td colspan="2"><input type="file" id="image3" name="img[]"
				size="50" onchange="setThumbnail(event)" multiple>
				<div id="image_container"></div></td>
		</tr>

		<tr>
			<td colspan="2" align="center"><input type="button"
				value="이미지 등록" id="imageboardWriteBtn"> <input type="reset"
				value="다시작성"></td>
		</tr>
	</table>
</form>

<script type="text/javascript">
function setThumbnail(event) {
	for (var image of event.target.files) {
		var reader = new FileReader(); reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("div#image_container").appendChild(img); 
			}; 
			console.log(image); reader.readAsDataURL(image); 
			} 
	}

</script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/imageboard.js"></script>
















