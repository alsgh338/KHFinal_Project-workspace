<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료 리다이렉트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
window.onload = function(){
	 document.getElementById('order').submit();
}
</script>

</head>
 <body>
  <form id="order" action="orderComplete" method="post">
  <input type="hidden" name="ono" value="${requestScope.ono}" />
 <button type="submit"></button>
  </form>

</body>
</html>