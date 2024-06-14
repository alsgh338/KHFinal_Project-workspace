<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
window.onload = function(){
	 document.getElementById('cart').submit();
}
</script>

</head>
 <body>
  <form id="cart" action="CartForm" method="post">
  <input type="hidden" name="mno" value="${requestScope.mno}">
 <button type="submit"></button>
  </form>

</body>
</html>