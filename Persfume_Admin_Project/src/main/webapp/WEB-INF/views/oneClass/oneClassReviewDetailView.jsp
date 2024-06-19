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
    		justify-content: center;
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
                    <h1 class="h3 mb-2 text-gray-800">강사 리뷰 리스트</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">${requestScope.octc} 강사 리뷰 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
	                                        <th>리뷰 등록 번호</th>
                                            <th>클래스 명</th>
                                            <th>강의 일자</th>
                                            <th>리뷰 내용</th>
                                            <th>작성자</th>
                                            <th width="120">리뷰 삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="item" items="${list}">
             		                             <tr>
             		                             	<td>${item.classReviewNo}</td>
		                                            <td>${item.className}</td>
		                                            <td>${item.startDate}</td>
		                                            <td>${item.classReviewContent}</td>
		                                            <td>${item.reviewWriter}</td>
		                                            <td>
		                                            	<a class="btn btn-danger btn-sm btn-icon-split delete-class" data-toggle="modal" data-target="#delete-review" onclick="deleteReview(this);">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-trash"></i>
					                                        </span>
					                                        <span class="text">삭제</span>
					                                    </a>
		                                            </td>
	                                            </tr>
				                    		   
		                    		    </c:forEach>
                                     
                                    </tbody>
                                    
                                    <tfoot>
                                        <tr>
                                            <th colspan="13">
                                            	<div id="sb-btn">
	                                            	<a href="teacherList.oc" class="btn btn-primary btn-sm btn-icon-split">
				                                        <span class="icon text-white-50">
				                                            <i class="fas fa-redo"></i>
				                                        </span>
				                                        <span class="text">강사 목록 돌아가기</span>
				                                    </a>
			                                    </div>
                                            </th>
                                            
                                        </tr>
                                    </tfoot>
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
			<div class="modal" id="delete-review">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">리뷰 삭제</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="deleteReview.oc" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body">
			      <input type="hidden" name="ocrno" class="classReviewNo">

			        정말 해당 리뷰를 삭제하시겠습니까?
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
    	function deleteReview(element) {
    		let ocrno = $(element).parent().siblings().eq(0).text().trim();
    		console.log(ocrno);
			$("#delete-review .modal-body>.classReviewNo").attr("value", ocrno);
		}
    </script>

</body>

</html>