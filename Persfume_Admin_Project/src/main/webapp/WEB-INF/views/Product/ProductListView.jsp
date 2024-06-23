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
                    <h1 class="h3 mb-2 text-gray-800">전제 상품 조회</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">전제 상품  리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>상품 번호</th>
                                            <th>이름</th>
                                            <th>상품 설명</th>
                                            <th>가격</th>
                                            <th>재고</th>
                                            <th>상품 추가일</th>
                                            <th>할인율</th>
                                            <th>카테고리</th>
                                            <th>성별</th>
                                            <th>탑노트</th>
                                            <th>미들노트</th>
                                            <th>베이스노트</th>
                                            <th>판매중</th>
                                            <th>상품 수정</th>
                                            <th>상품 삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th colspan="15">
                                            	<div id="sb-btn">
	                                            	<a href="enrollForm.oc" class="btn btn-primary btn-sm btn-icon-split">
				                                        <span class="icon text-white-50">
				                                            <i class="fas fa-flag"></i>
				                                        </span>
				                                        <span class="text">상품 등록</span>
				                                    </a>
			                                    </div>
                                            </th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="item" items="${list}">
             		                             <tr>
             		                             	<td>${item.productNo}</td>
		                                            <td>${item.productName}</td>
		                                            <td>${item.productExplain}</td>
		                                            <td>${item.productPrice}</td>
		                                            <td>${item.productStock}</td>
		                                            <td>${item.registDate}</td>
		                                            <td>${item.discount}</td>
		                                            <td>${item.category}</td>
		                                            <td>${item.gender}</td>
		                                            <td>${item.topNote}</td>
		                                            <td>${item.middleNote}</td>
		                                            <td>${item.baseNote}</td>
		                                            <td>${item.productStatus}</td>
                                                    <td>
		                                            	<a href="update.pr?productNo=${item.productNo}"+ class="btn btn-info btn-sm btn-icon-split">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-info-circle"></i>
					                                        </span>
					                                        <span class="text">상품 수정</span>
					                                    </a>
		                                            </td>
		                                            <td>
			                                            <a class="btn btn-danger btn-sm btn-icon-split delete-parking" data-toggle="modal" data-target="#delete-check">
					                                        <span class="icon text-white-50">
					                                            <i class="fas fa-trash"></i>
					                                        </span>
					                                        <span class="text">상품 삭제</span>
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
			        <h4 class="modal-title">상품 관리</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="delete.pr" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body">
			      <input type="hidden" name="productNo" class="carNo">
                   		정말 
                   		 상품을 삭제 하시겠습니까?
			      	
			      </div>

			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-danger">삭제</button>
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
    $(function() {
    $(".delete-parking").click(function() {
        // 부모 요소에서 두 번 이전의 형제 요소의 텍스트를 가져옴
        let productNo = $(this).closest("tr").children("td:first").text().trim();

        // memNo 값을 콘솔에 출력
        console.log(productNo);

        // 모달의 input 요소에 memNo 값을 설정
        $(".modal-body .carNo").val(productNo);
    });
    });

    function updateGO() {
			
			console.log("updateGO 실행 돼?");
			
			$("#updateProductForm").submit();

		}
    </script>

</body>

</html>