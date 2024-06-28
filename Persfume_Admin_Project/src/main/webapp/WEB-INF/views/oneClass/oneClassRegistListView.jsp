<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Persfume Admin - OneClass</title>
	<link rel="icon" href="resources/vendor/fontawesome-free/svgs/solid/cogs.svg">
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

	<style>
    	#sb-btn{
    		display: flex;
    		justify-content: end;
    	}

    </style>

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
                    <h1 class="h3 mb-2 text-gray-800">전체 클래스 예약 현황</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">원데이 클래스 예약 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>신청 번호</th>
                                            <th>클래스 명</th>
                                            <th>신청자 명</th>
                                            <th>결제 번호</th>
                                            <th>결제 가격</th>
                                            <th>신청 인원</th>
                                            <th>신청일</th>
                                            <th>취소일</th>
                                            <th>상태</th>
                                            <th>예약 취소</th>
                                            
                                        </tr>
                                    </thead>

                                    <tbody>
                                    	<c:forEach var="item" items="${list}">
             		                             <tr>
		                                            <td>${item.registNo }</td>
		                                            <td>${item.classNo }</td>
		                                            <td>${item.memNo }</td>
		                                            <td>${item.registPaycode }</td>
		                                            <td>${item.registPrice }</td>
		                                            <td>${item.registPersonNo }</td>
		                                            <td>${item.registDate}</td>
		                                            <c:choose>
		                                            	<c:when test="${ not empty item.registCancleDate}">
		                                            		<td>${item.registCancleDate }</td>
		                                            	</c:when>
		                                            	<c:otherwise>
		                                            		<td>----</td>
		                                            	</c:otherwise>
		                                            </c:choose>
		                                            <td>${item.status }</td>
		                                            <td>
			                                            <a class="btn btn-danger btn-sm btn-icon-split delete-parking" data-toggle="modal" data-target="#delete-regist" onclick="deleteRegist(this);">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-trash"></i>
					                                        </span>
					                                        <span class="text">삭제</span>
					                                    </a>
		                                            </td>
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
			<div class="modal" id="delete-regist">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">예약 취소</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="deleteRegist.oc" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body" align="center">
			      <input type="hidden" name="ocrno" class="classRegistNo">
			      <input type="hidden" name="memNo" class="classRegistMemNo">
			        <h3>정말 예약을 취소하시겠습니까?</h1><br>
			       	<input type="text" name=refundMsg placeholder="취소 사유 "> 
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-danger">네</button>
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
    
    	function deleteRegist(element) {
    		let ocrno = $(element).parent().siblings().eq(0).text().trim();
    		let memNo = $(element).parent().siblings().eq(2).text().trim();
    		console.log(ocrno);
			$(".modal-body>.classRegistNo").attr("value", ocrno);
			$(".modal-body>.classRegistMemNo").attr("value", memNo);
		}
    </script>

</body>

</html>