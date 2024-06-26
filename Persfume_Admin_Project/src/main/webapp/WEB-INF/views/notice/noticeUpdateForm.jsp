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
       
       td>div{
          position : relative;
          width:100%;
          height: 400px;
          border-radius: 10px;
          border: 3px dashed gray;
          display: flex;
          justify-content: center;
          align-items: center;
       }
       
       td img{
          position : relative;
          width: 100%;
          height: 100%;
          object-fit: cover;
            background-color: transparent;
       }
       
       td>div>div{
            background-color: transparent;
            margin : 0;
            padding : 0;
          border : none;
          border-radius : 50%;
          width: 30px;
          height: 30px;
          position : absolute;
          right: 0;
          top: 0;
          z-index: 999;
       }
       
       td>div>div:hover{
          background-color:lightgray;
       }
       
         .uploadImg>img{
            width: 60px;
            height: 60px;
            background-color: transparent;
            border-radius: 50px;
            border: none;
        }
        
        .uploadImg:hover{
           background-color: lightgray;
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
                    <h1 class="h3 mb-4 text-gray-800">공지사항 수정</h1>

               <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-12 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">공지글 수정</h6>
                                </div>
                                <div class="card-body">
                                   <form name="adUpdateForm"  action= "adUpdate.no" method="post" enctype="multipart/form-data">
                                      <input type="hidden" name="noticeNo" value="${ requestScope.n.noticeNo }">

                                      <table class="table">
                                         <tr>
                                            <th>제목</th>
                                            <td colspan="3">
                                               <input type="text" id="title" class="form-control form-control-user" name="noticeTitle" value="${requestScope.n.noticeTitle }" name="noticeTitle" required >
                                              </td>
                                              
                                              <th>조회수</th>
                                            <td>
                                               ${requestScope.n.count}
                                              </td>
                                           </tr>   
                                         <tr>
                                               
                                                            <th>파일</th>
                                                            <td colspan="4">
                                                                  <a class="form-control" name="upfile" required  style="resize: none;" href="${n.noticeImgChange}">${n.noticeImgOrigin} </a>
                                            </td>
                                            <td>
                                               <input type="file" accept="image/png, image/jpeg"  required id="reupfile" class="form-control-file" name="reupfile" >
                                              </td>
                                                        </tr>
                                         
                                      
                                         <tr>
                                            <th colspan="1"> 내용</th>
                                            <td colspan="11">
                                               <textarea class="form-control" rows="20" name="noticeContent" style="resize: none;">${requestScope.n.noticeContent}</textarea>
                                              </td>
                                         </tr>
                                         
                                         
                                      </table>
                                       
                                       <hr>
                                       <div id="sb-btn">
                                         <button type="submit" class="btn btn-sm btn-primary">수정하기</button>

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