<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.contents {
    white-space: pre-line;
    word-break: break-all;
    width: 450px;
}
</style>

<form name="imageboardViewForm">
<table cellpadding="5" frame="hsides" rules="rows">
    <tr>
        <td rowspan="4">
            <img id="image1" width="200" height="200">
        </td>
        <td width = "250">
                        상품명: <span id="imageNameSpan"></span>
        </td>
    <tr> 
        <td width="250">
                        단가 : <span id="imagePriceSpan"></span>
        </td>
    </tr>
    <tr>
        <td width="250">
                         개수 : <span id="imageQtySpan"></span> 
        </td>
    </tr>
    <tr>
        <td width="250">
                         합계 : <span id="totalSpan"></span>
        </td>
    </tr>
    <tr>
        <td colspan="3" height="200" valign="top">
            <pre class="contents"><span id="imageContentSpan"></span></pre>
        </td>
    </tr>
</table>
<input type="button" value="목록" onclick="location.href='imageboardList?pg=${pg }'">
</form>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/spring/imageboard/getImageboardView',
		data: 'seq=${seq}',
		dataType: 'json',
		success : function(data){
			console.log(data);
			
			let total = data.imageboardDTO.imagePrice * data.imageboardDTO.imageQty;
			
			$('#image1').attr('src', '../storage/'+data.imageboardDTO.image1);
			$('#imageNameSpan').text(data.imageboardDTO.imageName);
			$('#imagePriceSpan').text(data.imageboardDTO.imagePrice.toLocaleString());
			$('#imageQtySpan').text(data.imageboardDTO.imageQty);
			$('#totalSpan').text(total.toLocaleString());
			$('#imageContentSpan').text(data.imageboardDTO.imageContent);
		},
		error: function(err){
			console.log(err);
		}
	});
});
</script>











