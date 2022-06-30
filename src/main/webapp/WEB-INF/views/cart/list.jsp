<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %> 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <script type="text/javascript">
     function read(contentsno){
       var url = "./contents/detail";
       url += "?contentsno="+contentsno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url; 
     }     
     function change(check){
         if(check.checked){
        	aa = document.querySelectorAll("#ch");
        	for(let i=0; i<aa.length; i++){
        		aa[i].setAttribute("checked",'checked');
        	}
         }else{
        	aa = document.querySelectorAll("#ch")
        	for(let i=0; i<aa.length; i++){
        		aa[i].removeAttribute("checked");
        	}
         }
        }  
  </script> 
</head>
<body>
<div class="container"> 
  <h2><img src="/svg/cart4.svg" style='width:30px'> 장바구니</h2> 
  <table class="table table-striped">
   <thead>
    <tr>
    <th><input type='checkbox' onchange="change(this)"></th>
    <th>상품이미지</th>
    <th>상품명</th>
    <th>수량</th>
    <th>가격</th>
    <th>삭제</th>
    </tr>
   </thead>
   <tbody>
<c:choose>   
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 상품이 없습니다.</td>
</c:when>
	<c:otherwise>
		<c:set var='tot' value='${0}' />
		<c:forEach var="dto" items="${list}">
		<c:set var='tot' value='${tot + (dto.cdto.price * dto.count)}' />
			<tr>
				<td><input type='checkbox' id='ch'></td>
				<td><img src="/contents/storage/${dto.cdto.filename}" class="img-rounded" width="100px" height="100px"></td>
				<td><a href="javascript:read('1')">${dto.cdto.pname} (size :<span id='size'>${dto.size}</span>)
				</a></td>
				<td><input type='number' value="${dto.count}" min="1" max="10" id="qty"></td>
				<td>${dto.cdto.price}</td>
				<td><a href="javascript:deleteM('${dto.cartno}')"> <span class="glyphicon glyphicon-trash"></span>
				</a></td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
   </tbody>
   <tfoot>
   <tr style="background-color:beige;font-size:large">
   <th colspan="6" style="padding:30px;">
    주문금액 ${tot}원 + 배송비 3,000원 = 합계 ${tot + 3000}원
    <a href="/order/create">
   	<img src="/svg/bag-heart-fill.svg" title="주문하기" style='width:30px;margin-left:30px'></a>
   	<a href="/contents/mainlist/1">
   	<img src="/svg/box2-heart.svg" title="쇼핑계속" style='width:30px;margin-left:30px'></a>
   </th>
   </tr>
   </tfoot>
  </table>
</div>
</body> 
</html> 