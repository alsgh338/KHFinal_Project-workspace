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


	<style>

		.note-area{
			position: relative;
		}

		.notes{
			position: absolute;
			top: 9px;
			right: 20px;
		}

	</style>
    

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
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                일일 접속자 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800 count" id="todayView">1</div>
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

					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-4 col-lg-7">

							<!-- Area Chart -->
							<div class="card shadow mb-4">
								<div class="card-header py-3" id="note-area">
									<h6 class="m-0 font-weight-bold text-primary">향 별 매출 현황 (click)</h6>
								</div>
								<div class="card-body">
									<div class="btn btn-sm btn-primary notes" onclick="changeNote(this);">TOP</div>
									<div class="chart-area">
										<canvas id="ScentSalePieChart"></canvas>
									</div>
								</div>
							</div>


						</div>

						<!-- Donut Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">재고 부족 상품 TOP 5</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4">
										<canvas id="StockLessChart"></canvas>
									</div>
									<hr>
								</div>
							</div>
						</div>

						<!-- Donut Chart -->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">이번 달 환불 요청 현황</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-pie pt-4">
										<canvas id="monthRefundChart"></canvas>
									</div>
									<hr>
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

		let scentList = [];
		let scentSale = [];
		
		
		let stockProductList = [];
		let productStock = [];
		let MonthRefund = [];

		function changeNote(element){
			scentList = [];
			scentSale = [];
			let note = '';

			if($(element).text() == 'TOP'){
				note = 'MIDDLE';
				$(element).text('MIDDLE');
			} else if($(element).text() == 'MIDDLE'){
				note = 'BASE';
				$(element).text('BASE');
			} else{
				note = 'TOP';
				$(element).text('TOP');
			}

			console.log(note);

			/* 향 별 매출 현황 Ajax*/
			$.ajax({
				url : "scentSale",
				type : "post",
				data : {
					note : note
				},
				success : function (list) {
					for(let i in list){    	
						scentList.push(list[i].scent);
						scentSale.push(list[i].saleCount);
						drawChart();
					}
				} ,
				error : function () {
					
				} 
			});

		}

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
				
				
				let TODAY = list[6].visitCount;
				let one = list[5].visitCount;
				let two = list[4].visitCount;
				let three = list[3].visitCount;
				let four = list[2].visitCount;
				let five = list[1].visitCount;
				let six = list[0].visitCount;
				
				console.log(list[6].visitCount);

				
				drawVisitorChart(six, five, four, three, two, one ,TODAY);
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

		
		
		
    	function drawVisitorChart(six, five, four, three, two, one ,TODAY) { 
    		
    		console.log("뭐");
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
    	    	      label: "Sale",
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
    	    	          return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + "원";
    	    	        }
    	    	      }
    	    	    }
    	    	  }
    	    	});
			
			}
		

		// 아래 세 개 그래프 관련 drawChart
		function drawChart() { 
		
			// 향 별 매출 건수 파이 차트
			var piectx = document.getElementById("ScentSalePieChart");
    		var myPieChart = new Chart(piectx, {
    		  type: 'doughnut',
    		  data: {
    		    labels: ["Board", "Share"],
    		    datasets: [{
    		      data: scentSale,
    		      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
    		      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
    		      hoverBorderColor: "rgba(234, 236, 244, 1)",
    		    }],
    		  },
    		  options: {
    		    maintainAspectRatio: false,
    		    tooltips: {
    		      backgroundColor: "rgb(255,255,255)",
    		      bodyFontColor: "#858796",
    		      borderColor: '#dddfeb',
    		      borderWidth: 1,
    		      xPadding: 15,
    		      yPadding: 15,
    		      displayColors: false,
    		      caretPadding: 10,
    		    },
    		    legend: {
    		      display: false
    		    },
    		    cutoutPercentage: 80,
    		  },
    		});


			// 재고 부족 상품 TOP 5
			var stockctx = document.getElementById("StockLessChart");
    		var myPieChart = new Chart(stockctx, {
    		  type: 'bar',
    		  data: {
    		    labels: stockProductList,
    		    datasets: [{
    		      data: productStock,
    		      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
    		      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
    		      hoverBorderColor: "rgba(234, 236, 244, 1)",
    		    }],
    		  },
    		  options: {
    		    maintainAspectRatio: false,
    		    tooltips: {
    		      backgroundColor: "rgb(255,255,255)",
    		      bodyFontColor: "#858796",
    		      borderColor: '#dddfeb',
    		      borderWidth: 1,
    		      xPadding: 15,
    		      yPadding: 15,
    		      displayColors: false,
    		      caretPadding: 10,
    		    },
    		    legend: {
    		      display: false
    		    },
    		    cutoutPercentage: 80,
    		    scales: {
    	            yAxes: [{
    	                ticks: {
    	                    min: 0 // 최소 값을 0으로 설정
    	                }
    	            }]
    	        }
    		  },
    		});


			// 이번 달 환불 요청 현황
			var refundctx = document.getElementById("monthRefundChart");
    		var myPieChart = new Chart(refundctx, {
    		  type: 'doughnut',
    		  data: {
    		    labels: ["클래스 환불", "제품 환불"],
    		    datasets: [{
    		      data: MonthRefund,
    		      backgroundColor: ['#4e73df', '#1cc88a'],
    		      hoverBackgroundColor: ['#2e59d9', '#17a673'],
    		      hoverBorderColor: "rgba(234, 236, 244, 1)",
    		    }],
    		  },
    		  options: {
    		    maintainAspectRatio: false,
    		    tooltips: {
    		      backgroundColor: "rgb(255,255,255)",
    		      bodyFontColor: "#858796",
    		      borderColor: '#dddfeb',
    		      borderWidth: 1,
    		      xPadding: 15,
    		      yPadding: 15,
    		      displayColors: false,
    		      caretPadding: 10,
    		    },
    		    legend: {
    		      display: false
    		    },
    		    cutoutPercentage: 80,
    		  },
    		});
		
		}

    	$(function(){
    		
        	/* 일일 접속자 수 관련 AJAX */
        	$.ajax({
        		url : "visitCnt.cm",
        		type : "post",
        		success : function (result) {
        			$("#todayView").text(result);
    			} ,
        		error : function () {
    				
    			} 
        	});

			/* 재고 부족 상품 TOP 5 Ajax*/
			$.ajax({
				url : "productStock",
				type : "post",
				success : function (list) {
					for(let i in list){
						stockProductList.push(list[i].productName);
						productStock.push(list[i].stock);
						drawChart();
					}
				} ,
				error : function () {
					
				} 
			});
			/* 이번 달 환불 현황 Ajax*/
			$.ajax({
				url : "MonthRefund",
				type : "post",
				success : function (list) {
					for(let i in list){
						console.log(list);
						MonthRefund.push(list[i]);
						drawChart();
					}
				} ,
				error : function () {
					
				} 
			});


			/* 향 별 매출 현황 Ajax*/
			$.ajax({
				url : "scentSale",
				type : "post",
				data : {
					note : "TOP"
				},
				success : function (list) {
					for(let i in list){    	
						scentList.push(list[i].scent);
						scentSale.push(list[i].saleCount);
						drawChart();
					}
				} ,
				error : function () {
				} 
			});
    		
    		
    	})
    
    </script>

</body>

</html>

