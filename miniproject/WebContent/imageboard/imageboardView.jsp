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
<input type="hidden" name="seq" value="${seq }">
<input type="hidden" name="pg" value="${pg }">

<table cellpadding="5" frame="hsides" rules="rows">
    <tr>
        <td rowspan="4">
            <img src="../storage/${imageboardDTO.image1 }" width="200" height="200">
        </td>
        <td width = "250">
                        상품명: ${imageboardDTO.imageName }
        </td>
    <tr> 
        <td width="250">
                        단가 : <fmt:formatNumber type="number" value="${imageboardDTO.imagePrice }" pattern="#,###원"/>
        </td>
    </tr>
    <tr>
        <td width="250">
                         개수 : <fmt:formatNumber type="number" value="${imageboardDTO.imageQty }" pattern="#,###개"/> 
        </td>
    </tr>
    <tr>
        <td width="250">
                         합계 : <fmt:formatNumber type="number" value="${imageboardDTO.imagePrice*imageboardDTO.imageQty }" pattern="#,###원"/>
        </td>
    </tr>
    <tr>
        <td colspan="3" height="200" valign="top">
            <pre class="contents">${imageboardDTO.imageContent }</pre>
        </td>
    </tr>
</table>
<input type="button" value="목록" onclick="location.href='imageboardList.do?pg=${pg }'">
</form>

