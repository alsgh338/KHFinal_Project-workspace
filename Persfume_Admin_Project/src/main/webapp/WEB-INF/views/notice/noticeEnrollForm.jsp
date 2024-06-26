<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
       #sb-btn{
          display: flex;
          justify-content: end;
       }
       
       td img{
          position : relative;
          width: 100%;
          height: 100%;
          object-fit: cover;
            background-color: transparent;
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
                    <h1 class="h3 mb-4 text-gray-800">공지사항 </h1>

               <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">공지글 작성</h6>
                                </div>
                                <div class="card-body">
                           <form id="enrollForm" method="post" action="insert.no" enctype="multipart/form-data">
                                  <table class="table">
                                      <tr>
                                          <th><label for="title">제목</label></th>
                                          <td colspan="4"><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
                                      </tr>
                                      
                                      <tr>
                                          <th><label for="upfile">첨부 파일</label></th>
                                          <td colspan="4">
                                          <input type="file" accept="image/png, image/jpeg" id="upfile" class="form-control-file" name="upfile" ></td>
                                      </tr>
                                      
                                      <tr>
                                          <th><label for="content">내용</label></th>
                                          <td colspan="4"><textarea id="content" class="form-control" rows="10" style="resize:none;" name="noticeContent" ></textarea></td>
                                      </tr>
                                  </table>
                  
                                  <div class="text-center">
                                      <button type="submit" class="btn btn-primary">등록하기</button>
                                      <a class="btn btn-secondary" href="adList.no">목록으로</a>
                                  </div>
                              </form>
                                </div>
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



</body>

</html>
