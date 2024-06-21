<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Persfume Admin - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
           	
    <!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>
   

    

</head>
<body id="page-top">
	
	<div id="wrapper">
	
		<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Persfume Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

			<!-- 새로운 네비게이션 바 (Toggle X version)를 추가하고 싶다면 여기서부터 선택  -->

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                      	회원 관리
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="adList.me">
                    <i class="fas fa-fw fa-laugh-beam"></i>
                    <span>회원 관리</span>
                </a>
            </li>
            <!-- 새로운 네비게이션 바 (Toggle X version)를 추가하고 싶다면 여기까지 선택  -->



			<!-- 새로운 네비게이션 바 (Toggle O version)를 추가하고 싶다면 여기서부터 선택  -->
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                공지사항
            </div>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>공지사항 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="<%= request.getContextPath()%>/adList.no">공지사항 목록</a>
                        <a class="collapse-item" href="<%= request.getContextPath()%>/adEnrollForm.no">공지사항 작성</a>
                    </div>
                </div>
            </li>
            
            <!-- 새로운 네비게이션 바 (Toggle O version)를 추가하고 싶다면 여기까지 선택  -->

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                상품관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%= request.getContextPath() %>/proList.pr" 
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-hashtag"></i>
                    <span>상품 목록</span>
                </a>
            </li>

             <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="<%= request.getContextPath() %>/proEnroll.pr" 
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-hashtag"></i>
                    <span>상품 추가</span>
                </a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                시설 관리
            </div>

             <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#MF-ad-menu"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-chart-bar"></i>
                    <span>관리비 관리</span>
                </a>
                <div id="MF-ad-menu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리비 기능 : </h6>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/adList.ma">관리비 조회</a>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/adInsertForm.ma">관리비 추가</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#event-ad-menu"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-chart-bar"></i>
                    <span>이벤트 관리</span>
                </a>
                <div id="event-ad-menu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">관리비 기능 : </h6>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/list.ev">이벤트 목록 조회</a>
                        <a class="collapse-item" href="<%= request.getContextPath() %>/adInsertForm.ev">이벤트 추가</a>
                    </div>
                </div>
            </li>

             <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#oneClass-ad-menu"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-car-side"></i>
                    
                    <span>원데이 클래스 관리</span>
                </a>
                <div id="oneClass-ad-menu" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">원데이 클래스 관리 기능 :</h6>
                        <a class="collapse-item" href="list.oc">원데이 클래스 조회</a>
                        <a class="collapse-item" href="registList.oc">예약 현황 조회</a>
                        <a class="collapse-item" href="teacherList.oc">클래스 후기 조회</a>
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            
            

        </ul>
        <!-- End of Sidebar -->
	
	</div>
	

    
    


</body>
</html>