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
    <link rel="icon" href="resources/vendor/fontawesome-free/svgs/solid/cogs.svg">

    <title>Persfume Admin - Dashboard</title>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 api 라이브러리 연동 (cdn) -->
    

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="common/adminNav.jsp"/>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <jsp:include page="common/adminTop.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">

 

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4 insert-count">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            	일일 판매 건 수 
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 today-insert-cnt" id="dailySales"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4 mf-cal">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            	총 판매 액
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 sum-of-mf" id="totalSales"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-won-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 일 접속자 수 -->
                        <div class="col-xl-3 col-md-6 mb-4 todayView">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                일일 접속자 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 count"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-laugh-squint fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 전체 접속자 수 -->
                        <div class="col-xl-3 col-md-6 mb-4 totalView">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                총 회원 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 count" id="totalMember"></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-laugh-squint fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-xl-8 col-lg-7">

                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">최근 일주일 접속자 추이</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="visitor-chart-area"></canvas>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">최근 일주일 매출 추이</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <canvas id="sales-chart-area"></canvas>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-12 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">총 게시글 수</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold boardBar">소통 마당 <span
                                            class="float-right">20%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold shareBar">무료 나눔 <span
                                            class="float-right">40%</span></h4>
                                    <div class="progress mb-4">    
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold noticeBar">공지 사항 <span
                                            class="float-right">60%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 60%"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>

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
                        <span>Copyright &copy; Your Website 2021</span>
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

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/chart-area-demo.js"></script>
    <script src="resources/js/demo/chart-pie-demo.js"></script>
	
	<!-- -----------------차-----------트-------------- -->
	<script>
		$.ajax({
			url : "totalMember",
			type : "post",
			success : function (result) {
				$("#totalMember").text(result);
			} ,
			error : function () {
				
			} 
		});
		
		$.ajax({
			url : "totalSales",
			type : "post",
			success : function (result) {
				$("#totalSales").text(result);
			} ,
			error : function () {
				
			} 
		});
		
		$.ajax({
			url : "dailySales",
			type : "post",
			success : function (result) {
				$("#dailySales").text(result);
			} ,
			error : function () {
				
			} 
		});
		
		var visitorList = [];
		var salesList = [];
		
		$.ajax({
			url : "weekAccess",
			type : "post",
			success : function (list) {
				for(let i in list){    	
					visitorList.push(list[i]);
					
				}
				let TODAY = list[6].visitCount;
				let one = list[5].visitCount;
				let two = list[4].visitCount;
				let three = list[3].visitCount;
				let four = list[2].visitCount;
				let five = list[1].visitCount;
				let six = list[0].visitCount;
				drawChart(six, five, four, three, two, one ,TODAY);
			} ,
			error : function () {
				
			} 
		});
		
		$.ajax({
			url : "weekSales",
			type : "post",
			success : function (list) {
				for(let i in list){    	
					salesList.push(list[i]);
				}
				let TODAY = list[6].totalPrice;
				let one = list[5].totalPrice;
				let two = list[4].totalPrice;
				let three = list[3].totalPrice;
				let four = list[2].totalPrice;
				let five = list[1].totalPrice;
				let six = list[0].totalPrice;
				drawSalesChart(six, five, four, three, two, one ,TODAY);
			} ,
			error : function () {
				
			} 
		});
		
		
    	function drawChart(six, five, four, three, two, one ,TODAY) { 
    		
    		
    		/* 접속자 추이 그래프 템플릿 */
        	var areactx = document.getElementById("visitor-chart-area");
    		var myLineChart = new Chart(areactx, {
    	    	  type: 'line',
    	    	  data: {
    	    	    labels: ["-6","-5","-4","-3", "-2", "-1", "TODAY"],
    	    	    datasets: [{
    	    	      label: "Visitor",
    	    	      lineTension: 0.3,
    	    	      backgroundColor: "rgba(78, 115, 223, 0.05)",
    	    	      borderColor: "rgba(78, 115, 223, 1)",
    	    	      pointRadius: 3,
    	    	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
    	    	      pointBorderColor: "rgba(78, 115, 223, 1)",
    	    	      pointHoverRadius: 3,
    	    	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
    	    	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
    	    	      pointHitRadius: 10,
    	    	      pointBorderWidth: 2,
    	    	      data: [six, five, four, three, two, one ,TODAY]
    	    	    }],
    	    	  },
    	    	  options: {
    	    	    maintainAspectRatio: false,
    	    	    layout: {
    	    	      padding: {
    	    	        left: 10,
    	    	        right: 25,
    	    	        top: 25,
    	    	        bottom: 0
    	    	      }
    	    	    },
    	    	    scales: {
    	    	      xAxes: [{
    	    	        time: {
    	    	          unit: 'date'
    	    	        },
    	    	        gridLines: {
    	    	          display: false,
    	    	          drawBorder: false
    	    	        },
    	    	        ticks: {
    	    	          maxTicksLimit: 7
    	    	        }
    	    	      }],
    	    	      yAxes: [{
    	    	        ticks: {
    	    	          maxTicksLimit: 2,
    	    	          padding: 10,
    	    	          // Include a dollar sign in the ticks
    	    	          callback: function(value, index, values) {
    	    	            return number_format(value);
    	    	          }
    	    	        },
    	    	        gridLines: {
    	    	          color: "rgb(234, 236, 244)",
    	    	          zeroLineColor: "rgb(234, 236, 244)",
    	    	          drawBorder: false,
    	    	          borderDash: [2],
    	    	          zeroLineBorderDash: [2]
    	    	        }
    	    	      }],
    	    	    },
    	    	    legend: {
    	    	      display: false
    	    	    },
    	    	    tooltips: {
    	    	      backgroundColor: "rgb(255,255,255)",
    	    	      bodyFontColor: "#858796",
    	    	      titleMarginBottom: 10,
    	    	      titleFontColor: '#6e707e',
    	    	      titleFontSize: 14,
    	    	      borderColor: '#dddfeb',
    	    	      borderWidth: 1,
    	    	      xPadding: 15,
    	    	      yPadding: 15,
    	    	      displayColors: false,
    	    	      intersect: false,
    	    	      mode: 'index',
    	    	      caretPadding: 10,
    	    	      callbacks: {
    	    	        label: function(tooltipItem, chart) {
    	    	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
    	    	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + "명";
    	    	        }
    	    	      }
    	    	    }
    	    	  }
    	    	});
    		
			
		}
    	
function drawSalesChart(six, five, four, three, two, one ,TODAY) { 
    		
    		
    		/* 매출 추이 템플릿 */
        	var areactx = document.getElementById("sales-chart-area");
    		var myLineChart = new Chart(areactx, {
    	    	  type: 'line',
    	    	  data: {
    	    	    labels: ["-6","-5","-4","-3", "-2", "-1", "TODAY"],
    	    	    datasets: [{
    	    	      label: "Visitor",
    	    	      lineTension: 0.3,
    	    	      backgroundColor: "rgba(78, 115, 223, 0.05)",
    	    	      borderColor: "rgba(78, 115, 223, 1)",
    	    	      pointRadius: 3,
    	    	      pointBackgroundColor: "rgba(78, 115, 223, 1)",
    	    	      pointBorderColor: "rgba(78, 115, 223, 1)",
    	    	      pointHoverRadius: 3,
    	    	      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
    	    	      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
    	    	      pointHitRadius: 10,
    	    	      pointBorderWidth: 2,
    	    	      data: [six, five, four, three, two, one ,TODAY]
    	    	    }],
    	    	  },
    	    	  options: {
    	    	    maintainAspectRatio: false,
    	    	    layout: {
    	    	      padding: {
    	    	        left: 10,
    	    	        right: 25,
    	    	        top: 25,
    	    	        bottom: 0
    	    	      }
    	    	    },
    	    	    scales: {
    	    	      xAxes: [{
    	    	        time: {
    	    	          unit: 'date'
    	    	        },
    	    	        gridLines: {
    	    	          display: false,
    	    	          drawBorder: false
    	    	        },
    	    	        ticks: {
    	    	          maxTicksLimit: 7
    	    	        }
    	    	      }],
    	    	      yAxes: [{
    	    	        ticks: {
    	    	          maxTicksLimit: 2,
    	    	          padding: 10,
    	    	          // Include a dollar sign in the ticks
    	    	          callback: function(value, index, values) {
    	    	            return number_format(value);
    	    	          }
    	    	        },
    	    	        gridLines: {
    	    	          color: "rgb(234, 236, 244)",
    	    	          zeroLineColor: "rgb(234, 236, 244)",
    	    	          drawBorder: false,
    	    	          borderDash: [2],
    	    	          zeroLineBorderDash: [2]
    	    	        }
    	    	      }],
    	    	    },
    	    	    legend: {
    	    	      display: false
    	    	    },
    	    	    tooltips: {
    	    	      backgroundColor: "rgb(255,255,255)",
    	    	      bodyFontColor: "#858796",
    	    	      titleMarginBottom: 10,
    	    	      titleFontColor: '#6e707e',
    	    	      titleFontSize: 14,
    	    	      borderColor: '#dddfeb',
    	    	      borderWidth: 1,
    	    	      xPadding: 15,
    	    	      yPadding: 15,
    	    	      displayColors: false,
    	    	      intersect: false,
    	    	      mode: 'index',
    	    	      caretPadding: 10,
    	    	      callbacks: {
    	    	        label: function(tooltipItem, chart) {
    	    	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
    	    	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + "명";
    	    	        }
    	    	      }
    	    	    }
    	    	  }
    	    	});
			
		}
    	
	</script>
	
	
	
</body>

</html>

