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
                    <h1 class="h3 mb-2 text-gray-800">전체 클래스 리스트</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">원데이 클래스 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>클래스 번호</th>
                                            <th>클래스 명</th>
                                            <th>강사명</th>
                                            <th>최대 수강 인원</th>
                                            <th>현재 강의 신청 인원</th>
                                            <th>가격</th>
                                            <th>시작시간</th>
                                            <th>종료시간</th>
                                            <th>개강일자</th>
                                            <th>등록일</th>
                                            <th>폐강여부</th>
                                            <th>정보 수정</th>
                                            <th>클래스 제거</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th colspan="13">
                                            	<div id="sb-btn">
	                                            	<a href="enrollForm.oc" class="btn btn-primary btn-sm btn-icon-split">
				                                        <span class="icon text-white-50">
				                                            <i class="fas fa-flag"></i>
				                                        </span>
				                                        <span class="text">신규 클래스 등록</span>
				                                    </a>
			                                    </div>
                                            </th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="item" items="${list}">
             		                             <tr>
		                                            <td>${item.classNo}</td>
		                                            <td>${item.className}</td>
		                                            <td>${item.classTeacher}</td>
		                                            <td>${item.studentMaxNo}</td>
		                                            <td>${item.currentStudent}</td>
		                                            <td>${item.price}</td>
		                                            <td>${item.startTime}</td>
		                                            <td>${item.endTime}</td>
		                                            <td>${item.startDate}</td>
		                                            <td>${item.enrollDate}</td>
		                                            <td>${item.status}</td>
		                                            <td>
		                                            	<a href="detail.oc?ocno=${item.classNo}"+ class="btn btn-info btn-sm btn-icon-split">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-info-circle"></i>
					                                        </span>
					                                        <span class="text">수정</span>
					                                    </a>
		                                            </td>
		                                            <td>
			                                            <a class="btn btn-danger btn-sm btn-icon-split delete-parking" data-toggle="modal" data-target="#delete-check">
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
			<div class="modal" id="delete-check">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">클래스 삭제</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="adDelete.pk" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body">
			      <input type="hidden" name="carNo" class="carNo">

			        정말 해당 클래스를 삭제하시겠습니까?
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
    	$(function(){
    		$(".delete-parking").click(function () {
    			let carNo = $(this).parent().prev().prev().children().text().trim();
    			$(".modal-body>.carNo").attr("value", carNo);
				
			});
    		
    	});
    </script>

</body>

</html>