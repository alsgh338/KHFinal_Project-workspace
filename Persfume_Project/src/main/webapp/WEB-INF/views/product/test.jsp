   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
        
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
   <%
    Set<String> productNoSet = new HashSet<>();
    request.setAttribute("productNoSet", productNoSet);
%>
  
  <div class="content-right"> 
               <div class="content-sort" style="display: block;" >
           
                    <p>
                        <a href="list.po">신상순</a>
                        <a href="poplist.po">판매순</a>
                        <a href="desclist.po">고가순</a>
                        <a href="asclist.po">저가순</a>
                    </p>
              </div>

           
        
               <c:if test="${ requestScope.list == null }"> <div>검색결과가 없습니다.</div> </c:if>
		<c:forEach var="p" items="${ requestScope.list }" varStatus="status">
		
            <div class="oneday-class" name="${p.productNo}">
                <div class="class-img">
                    <img src="../persfumeAdmin/${ilist[status.index].productImgPath}" alt="상품이미지">
                </div>

                <div class="class-data">
                    <div class="class-teacher"> 
                      ${p.productName}
                    </div>
                      <div class="wishlist-badge">LIKE: <span>${falist[status.index]}</span></div>
                </div>
                
                <div class="class-title">  ${p.productExplain}
                </div>
                <div class="class-data">
                    <div class="class-location"><s> <fmt:formatNumber value="${p.productPrice}" type="number" />원</s></div>
                    <div class="class-discount">${p.discount}%</div>
                    <div class="class-price"><fmt:formatNumber value="${p.productPrice * (100-(p.discount))/100}" type="number" />원</div>
                </div>
            </div>
                   </c:forEach>   
        
        

          
            </div>
                 
                   <script>
	$(function() {
		
		$(".oneday-class").click(function() {
		
			let pno = $(this).attr('name');
			
			console.log(pno);
			
			location.href = "/persfume/detail.po?pno=" + pno;
		});
	});
</script>
   <script>
        $(function(){
            $(".oneday-class").hover(function(){
                $(this).toggleClass("onHover");
            });

        });

    </script>
        

          
    