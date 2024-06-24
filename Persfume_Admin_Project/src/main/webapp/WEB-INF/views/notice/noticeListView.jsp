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

    <title>Persfume Admin - Notice</title>
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
                    <h1 class="h3 mb-2 text-gray-800">전체 공지글 리스트</h1>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">공지글 리스트</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>공지글 번호</th>
                                            <th>첨부파일</th>
                                            <th>제목</th>                                          
                                            <th>내용</th>
                                            <th>등록일</th>
                                            <th>조회수</th>
                                            <th>정보 수정</th>
                                            <th>글 삭제</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th colspan="8">
                                                <div id="sb-btn">
                                                    <a href="adEnrollForm.no" class="btn btn-primary btn-sm btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-flag"></i>
                                                        </span>
                                                        <span class="text">공지글 작성</span>
                                                    </a>
                                                </div>
                                            </th>
                                        </tr>
                                    </tfoot>
                                                           <tbody>
                                        <c:forEach var="n" items="${requestScope.list}">
                                            <tr>
                                                <td>${n.noticeNo}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${empty n.noticeImgOrigin}">
                                                            첨부파일이 없습니다
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="${n.noticeImgChange}" download="${n.noticeImgOrigin}">${n.noticeImgOrigin}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                  

                                                </td>
                                                <td>${n.noticeTitle}</td>
                                                <td>${n.noticeContent}</td>
                                                <td>${n.createDate}</td>
                                                <td>${n.count}</td>
                                                <td>
                                                    <a href="detail.no?nno=${n.noticeNo}" class="btn btn-info btn-sm btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-info-circle"></i>
                                                        </span>
                                                        <span class="text">수정</span>
                                                    </a>
                                                </td>
                                                <td>
                                             <a href="javascript:void(0);" class="btn btn-danger btn-sm btn-icon-split delete-notice"
											    data-toggle="modal" data-target="#delete-check" data-notice-no="${n.noticeNo}" data-file-path="${n.noticeImgChange}">
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
<!--                   <script>
                    <c:if test="${not empty sessionScope.alertMsg}">
                        alert("${sessionScope.alertMsg}");
                        <c:remove var="alertMsg" scope="session" />
                    </c:if>
                </script> -->
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
                            <h4 class="modal-title">공지글 삭제</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                       <form action="adDelete.no" method="post">
				    <!-- Modal body -->
				    <div class="modal-body">
				        <input type="hidden" name="noticeNo" class="noticeNo">
				        <input type="hidden" name="filePath" class="filePath">
				        정말 해당 공지글을 삭제하시겠습니까?
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    $(document).ready(function() {
        $(".delete-notice").click(function() {
            let noticeNo = $(this).data('notice-no');
            let filePath = $(this).data('file-path'); // 추가
            $(".modal-body>.noticeNo").val(noticeNo);
            $(".modal-body>.filePath").val(filePath); // 추가
        });
    });
</script>

</body>

</html>
