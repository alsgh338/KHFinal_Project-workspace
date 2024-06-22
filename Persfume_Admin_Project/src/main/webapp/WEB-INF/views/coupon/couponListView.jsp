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
    <title>Persfume Admin - Coupon List</title>
    <link rel="icon" href="resources/vendor/fontawesome-free/svgs/solid/cogs.svg">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        #sb-btn {
            display: flex;
            justify-content: end;
        }
    </style>
</head>
<body id="page-top">
    <div id="wrapper">
        <jsp:include page="../common/adminNav.jsp" />
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <jsp:include page="../common/adminTop.jsp" />
                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">쿠폰 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>쿠폰 번호</th>
                                            <th>쿠폰 이름</th>
                                            <th>보유자 수</th>
                                            <th>명단보기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <c:forEach var="c" items="${couponList}">
                                            <tr>
                                                <td>${c.couponNo}</td>
                                                <td>${c.couponName}</td>
                                                <td>${c.memCouponCount}</td>
                                                 <td>
                                                     <a href="detail.co?cno=${c.couponNo}" class="btn btn-info btn-sm btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-info-circle"></i>
                                                        </span>
                                                        <span class="text">명단조회</span>
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
                            <h4 class="modal-title">쿠폰 삭제</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <form action="deleteCouponServlet" method="post">
                            <!-- Modal body -->
                            <div class="modal-body">
                                <input type="hidden" name="couponNo" class="couponNo">
                                해당 쿠폰을 삭제하시겠습니까?
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
            <!-- End of Modal -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
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
</body>
</html>
