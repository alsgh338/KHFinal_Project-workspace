<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <jsp:include page="../common/adminNav.jsp"/>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
        	
        	<!-- Main Content -->
            <div id="content">

           	<jsp:include page="../common/adminTop.jsp"/>
           		
           	

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">전체 이벤트 리스트</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">이벤트 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이벤트 번호</th>
                                            <th>이벤트 명</th>
                                            <th>조회수</th>
                                            <th>시작일</th>
                                            <th>종료일</th>
                                            <th>작성일</th>
                                            <th>노출여부</th>
                                            <th>수정</th>
                                            <th>Toggle</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="item" items="${list}">
             		                             <tr>
		                                            <td id="eno">${item.eventNo}</td>
		                                            <td>${item.eventTitle}</td>
		                                            <td>${item.eventCount}</td>
		                                            <td>${item.startDate}</td>
		                                            <td>${item.dewDate}</td>
		                                            <td>${item.createDate}</td>
		                                            <td>
			                                            <c:choose>
			                                            	<c:when test="${item.status eq 'Y'}">
			                                            		정상
			                                            	</c:when>
			                                            	<c:otherwise>
			                                            		삭제됨
			                                            	</c:otherwise>
			                                            </c:choose>
		                                            </td>
		                                            <td>
		                                            	<a href="detail.ev?eno=${item.eventNo}" class="btn btn-info btn-sm btn-icon-split">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-info-circle"></i>
					                                        </span>
					                                        <span class="text">수정</span>
					                                    </a>
		                                            </td>
		                                            
		                                            
		                                            
		                                            <c:choose>
		                                            	<c:when test="${ item.status eq 'Y' }">
		                                            		<td>
					                                            <a class="btn btn-danger btn-sm btn-icon-split delete-event" data-toggle="modal" data-target="#delete-check" onclick="deleteEvent(this);">
							                                        <span class="icon text-white-50">
							                                            <i class="fas fa-trash"></i>
							                                        </span>
							                                        <span>삭제</span>
							                                    </a>
		                                           	 		</td>
		                                            	</c:when>
		                                            	<c:otherwise>
		                                            		<td>
					                                            <a class="btn btn-success btn-sm btn-icon-split restore-event" data-toggle="modal" data-target="#restore-check" onclick="restoreEvent(this);">
							                                        <span class="icon text-white-50">
							                                            <i class="fas fa-redo"></i>
							                                        </span>
							                                        <span>복구</span>
							                                    </a>
		                                           	 		</td>
		                                            	</c:otherwise>
		                                            </c:choose>
	                                            </tr>
		                    		    </c:forEach>
                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; DongNet Since 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
            
            <!-- The Modal -->
			<div class="modal" id="delete-check">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">클래스 삭제</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="delete.ev" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body">
			      	<input type="hidden" name="eno" class="eventNo">

			        	정말 해당 클래스를 삭제하시겠습니까?
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-danger deleteEvent">네</button>
			        <button type="button" class="btn btn-light" data-dismiss="modal">아니오</button>
			      </div>
				</form>
			    </div>
			  </div>
			</div>
			<!-- End of Modal-->
			
			<!-- The Modal -->
			<div class="modal" id="restore-check">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">클래스 삭제</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="restore.ev" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body">
			      	<input type="hidden" name="eno" class="eventNo">

			        	정말 해당 클래스를 복구하시겠습니까?
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-danger restoreEvent">네</button>
			        <button type="button" class="btn btn-light" data-dismiss="modal">아니오</button>
			      </div>
				</form>
			    </div>
			  </div>
			</div>
			<!-- End of Modal-->
			
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    
    <script>
	    function deleteEvent(element) {
			let eno = $(element).parent().siblings().eq(0).text().trim();
			$("#delete-check .modal-body>.eventNo").attr("value", eno);
		}
		
		function restoreEvent(element) {
			let eno = $(element).parent().siblings().eq(0).text().trim();
			$("#restore-check .modal-body>.eventNo").attr("value", eno);
		}
    </script>

</body>
</html>